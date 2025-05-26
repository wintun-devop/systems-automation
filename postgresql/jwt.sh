#!/bin/bash
set -e
TEST_JWT_SECRET='test_secret_that_is_at_least_32_characters_long'
_base64 () { openssl base64 -e -A | tr '+/' '-_' | tr -d '='; }
header=$(echo -n '{"alg":"HS256","typ":"JWT"}' | _base64)
exp=$(( EPOCHSECONDS + 60*60 ))  # 1 hour
payload=$(echo -n "{\"role\":\"test_role\",\"exp\":$exp}" | _base64)
signature=$(echo -n "$header.$payload" | openssl dgst -sha256 -hmac "$TEST_JWT_SECRET" -binary | _base64)
echo -n "$header.$payload.$signature"
