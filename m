Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41BD4652D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390400; cv=none; b=uJGGwUxGSeFq0w7whueFyZEFUIXtmjdRX901mFhBZtm/mRl6BI+tj8aN2oKIseyvn4mA/R8BT4SQwGCY1asOYyaDqkObWTBYfbVcMKk7W3J0VQCAfkI465jujBfHsu95lGFtLBBYkA8pK8/+JXiXKhSKzlO2gZ0kx6wjHXKCGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390400; c=relaxed/simple;
	bh=qjQ+LYbUEfrBtu3ymflLP9dmO9tQ6/Bs/eoY36v4nPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEI7ELG9OXJcEgDQ9PH1eVb89Kq6M+LWcSp4aO9DWzu/XCqaUbLBvDAanfWgtSh5xYMQ7DndIsr+pzwILVfhqjkN7arG2kOonxcAcay8xRynAUki9iID0Ei5qEcPS7vRqMb9248fjX+AcddnyJ8J0qTszpY+JEFUIIA+5QQM094=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aRUD4h14; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aRUD4h14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jF+95jMp/45NMjGYJKM23B9xKBucPH4GAO56Jky3844=; b=aRUD4h
	14HkB1S+ge4YmGYHgC6e8z1QFZnIGEwb7VW6Wjs/dhS7SsCqi0J0cylMLueUjaEq
	AzQQSTtE2ukCCPvolzhDzwOet/OsyfJOcsP25SvVacjNnIPJWbyZdsFy8AWWXQjE
	JEN7NjXU5WZUMCKOJpmTB6Ol2U6ck+VZnD04dRml5NzTEEhWiHVaybCPCekVY0SX
	wmEad53AvSdMQtbMvJigWFQ9xmNYNoXjBHokUg6x7Y2SfWGm5GOz3V0j/rPqtQTq
	M79guIWLd/tJTTBZ5+/FF3GuhfhySodEF9CpOXSgD15S6MjKwX9XSsEl/ppis9Hs
	eSMz0D9XYsDRI+AQ==
Received: (qmail 2281021 invoked from network); 29 Apr 2024 13:33:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Apr 2024 13:33:16 +0200
X-UD-Smtp-Session: l3s3148p1@fvOInjoXqG5tKPB4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-iio@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] iio: adc: exynos_adc: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon, 29 Apr 2024 13:33:05 +0200
Message-ID: <20240429113313.68359-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
References: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/iio/adc/exynos_adc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 614de9644800..78fada4b7b1c 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -538,7 +538,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 				long mask)
 {
 	struct exynos_adc *info = iio_priv(indio_dev);
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	if (mask == IIO_CHAN_INFO_SCALE) {
@@ -562,9 +562,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 	if (info->data->start_conv)
 		info->data->start_conv(info, chan->address);
 
-	timeout = wait_for_completion_timeout(&info->completion,
-					      EXYNOS_ADC_TIMEOUT);
-	if (timeout == 0) {
+	time_left = wait_for_completion_timeout(&info->completion,
+						EXYNOS_ADC_TIMEOUT);
+	if (time_left == 0) {
 		dev_warn(&indio_dev->dev, "Conversion timed out! Resetting\n");
 		if (info->data->init_hw)
 			info->data->init_hw(info);
@@ -583,7 +583,7 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 static int exynos_read_s3c64xx_ts(struct iio_dev *indio_dev, int *x, int *y)
 {
 	struct exynos_adc *info = iio_priv(indio_dev);
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	mutex_lock(&info->lock);
@@ -597,9 +597,9 @@ static int exynos_read_s3c64xx_ts(struct iio_dev *indio_dev, int *x, int *y)
 	/* Select the ts channel to be used and Trigger conversion */
 	info->data->start_conv(info, ADC_S3C2410_MUX_TS);
 
-	timeout = wait_for_completion_timeout(&info->completion,
-					      EXYNOS_ADC_TIMEOUT);
-	if (timeout == 0) {
+	time_left = wait_for_completion_timeout(&info->completion,
+						EXYNOS_ADC_TIMEOUT);
+	if (time_left == 0) {
 		dev_warn(&indio_dev->dev, "Conversion timed out! Resetting\n");
 		if (info->data->init_hw)
 			info->data->init_hw(info);
-- 
2.43.0

