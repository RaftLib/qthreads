#!/usr/bin/env bash

find $1 -name "*.c" -type f | parallel grep  --files-with-matches  'assert\(qthread_initialize\(' | parallel "sed -i.bak -E 's/assert[(]qthread_initialize[(][)] == 0[)];/const int ret_cond_var = qthread_initialize();  assert( ret_cond_var == QTHREAD_SUCCESS ); (void) ret_cond_var; /g' {}"

find $1 -name "*.c" -type f | parallel grep  --files-with-matches  'assert\(qthread_initialize\(' | parallel "sed -i.bak -E 's/assert[(]qthread_initialize[(][)] == PTHREAD_SUCCESS[)];/const int ret_cond_var = qthread_initialize();  assert( ret_cond_var == QTHREAD_SUCCESS ); (void) ret_cond_var; /g' {}"

find $1 -name "*.bak" -type f | parallel rm -f {1}
