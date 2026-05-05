docker run -d \
   -e CX_APIKEY="$CX_APIKEY" \
  -v $(pwd)/test_config.yaml:/app/test_config.yaml \
  -v $(pwd)/testfire_auth.js:/app/testfire_auth.js \
  -v $(pwd)/output:/output \
  checkmarx/dast:latest scan \
  --base-url=https://ind.ast.checkmarx.net \
  --environment-id=fc8832b1-8029-41f7-8849-b5e0939681c6 \
  --config=/app/test_config.yaml \
  --output=/output \
  --timeout=86400 \
  --update-interval=30 \
  --jvm-properties=-Xmx3G \
  --log-level=debug \
  --verbose \
  --retry=3 \
  --retry-delay=20 2>&1 | tee DAST_dockerimage.log