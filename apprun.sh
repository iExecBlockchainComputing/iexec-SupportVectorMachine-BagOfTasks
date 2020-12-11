#!/bin/sh
iexec app run 0x782f35D57c1a76B60d153A265A1591720e51560f \
      --chain goerli \
      --wallet-file user_wallet \
      --workerpool 0xEb6c3FA8522f2C342E94941C21d3947c099e6Da0 \
      --skip-request-check \
      --watch
