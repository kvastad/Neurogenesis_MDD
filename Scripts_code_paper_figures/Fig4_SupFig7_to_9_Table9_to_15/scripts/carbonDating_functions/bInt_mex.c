// BINT interpolation of atmospheric 14C levels
//   y=bInt(date,bombcurve) interpolates BOMBCURVE to return the 14C
//   level at date vector DATE. The BOMBCURVE is a two-column array with
//   dates in the first column and 14C levels in the second. bInt
//   extrapolates if DATE is outside the range
//   [min(BOMBCURVE(:,1),max(BOMBCURVE(:,1)].
//
//   Interpolation algorithm taken from:
//   mex function nakeinterp1.c
//   Dichotomy search of indices
//   Calling:
//   idx=nakeinterp1(x, y, xi);
//   where x, y and xi are double column vectors
//   x must be sorted in ascending order; x and y have the same length
//   Author: Bruno Luong
//   Original: 19/Feb/2009
//
// To compile:
// mex -O -v bInt_mex
//
// mandatory input arguments:
// date: column vector of doubles of length m
// bc: bombcurve 

#include "mex.h"
#include "matrix.h"

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void
mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{
    mwSize ninterp, ngrid;
    mwSize ncols_bc, nrows_date, ncols_date;
    mwSize dims[2];
    
    const double *date;
    const double *bc;

    // double dateRange[2] = {3000, 0};
    // double bcRange[2]= {3000, 0};
    mwIndex i, j;

    // interpolation temporary parameters
    size_t k, i1, i9, imid;
    double xik;
    
    mxArray *yinterp; // interpolated array
    double *yiptr; 
    const double *y, *xinterp, *xgrid; 
    
    date = mxGetPr(prhs[0]);       // assign the pointer to the 1D array
    nrows_date = mxGetM(prhs[0]);    // get its length
    ncols_date = mxGetN(prhs[0]);

    bc = mxGetPr(prhs[1]);
    ngrid = mxGetM(prhs[1]);
    ncols_bc = mxGetN(prhs[1]);
    
    // check for dimension consistency
    if (ncols_bc != 2)
    {    
        mexErrMsgTxt("BC should have two columns\n");
    }
    if (ncols_date > 1 & nrows_date == 1)
    {
        // mexPrintf("DATE has dimensions %dx%d\n",nrows_date,ncols_date);
        ninterp = ncols_date;        
        
    }
    if (ncols_date == 1 & nrows_date > 1)
    {
        ninterp = nrows_date;
    }
    if ( ncols_date > 1 & nrows_date > 1)
    {
        mexPrintf("DATE has dimensions %dx%d\n",nrows_date,ncols_date);
        for (i = 0; i<nrows_date; i++)
        {
            for (j = 0; j<ncols_date; j++)
            {
                mexPrintf("%f ",date[i+j*(nrows_date)]);
            }
            mexPrintf("\n");
        }
        mexErrMsgTxt("Error: DATE should be a column vector\n");
    }

    // create a nrows_datexncols_date matrix
    dims[0] = nrows_date;
    dims[1] = ncols_date;
    // mexPrintf("dims=[%d,%d]\n",dims[0],dims[1]);
    plhs[0] = yinterp = mxCreateNumericArray(2, dims, mxDOUBLE_CLASS, mxREAL);
    
    // Get pointers
    y = bc+ngrid;
    xgrid = bc;
    xinterp = date;
    yiptr = mxGetPr(yinterp);

    // Loop over the points
    for (k=ninterp; k--;) // Reverse of for (k=0; k<m; k++) {...}
    {
        // Get data value
        xik = xinterp[k];
        
        i1=0;
        i9=ngrid-1; 

        // if (xgrid[i9] < xik) 
        // {
        //     mexWarnMsgTxt("Warning: Extrapolating ");
        //     mexPrintf("xgrid[i9]=%f, xik=%f\n",xgrid[i9],xik);
        // }

        while (i9>i1+1) // Dichotomy search
        {
            imid = (i1+i9+1)/2;
            if (xgrid[imid]<xik) i1=imid;
            else i9=imid;
        } // of while loop


        if (i1==i9) // right on an existing point
            yiptr[k] = y[i1];
        else    // linear interpolation
            yiptr[k] = y[i1] + (y[i9]-y[i1])*(xik-xgrid[i1])/(xgrid[i9]-xgrid[i1]);
    } // for loop
        

    return;   
}
