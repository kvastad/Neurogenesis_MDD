function a = AICc(SSE,K,n)

a = n*log(SSE/n)+2*K+2*K*(K+1)/(n-K-1);
