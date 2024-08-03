// use compute-sanitizer <executable name> to get more info
//bc of driver and nvcc version incompat, use nvcc -arch=sm_75 -gencode=arch=compute_75,code=sm_75 -o hello hello.cu to compile to to specific platform (titan)
#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>

__global__ void hello(){  
  printf("Hello from block: %u, thread: %u\n", blockIdx.x, threadIdx.x);
}

int main(){

  hello<<<2, 2>>>(); // num threads divided by block size, block size
  cudaDeviceSynchronize();
  return 0;
}

