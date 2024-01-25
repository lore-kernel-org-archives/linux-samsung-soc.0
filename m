Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C682D6F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194230; cv=none; b=ZBT31Q2mSk7pQRlTcRHS875cs6PObM94I+aoxIpcFAWl64/dPKNxfUe+V4jCvipteccvRm1qgdFNarti759TXEHIZYrQ8vnjiiPZLk2Rlfopo/uVc+UOiaGbl3RFbs6Mduje8ciZ6WNUHAE8RaMzSfvoehiqmy0oyc3qKQFSDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194230; c=relaxed/simple;
	bh=PQ0DdMw7t2JvUMcjVibwWPTT4g6T5s8jNboS4tHNMMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQJGKO3bfK6RXIGUYHlb2IcM7z8Qu8sdputvQkx6iqmUeNM0jgFgEcq3YlcDlnzWqqJzebLx5mf8rBCP9D6xFVmQVNn8pBqN0eIYl3YJLmVUdL7nWqROOfeshRiLE2YO5iWJucQXQVnxWzkXVMpP5mmIABd3m8gurZzP9o5lMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGMK5KOf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGMK5KOf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40eb033c192so5238435e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194224; x=1706799024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZysQ9KAcWXka70FvugQOSV9RayYcqOy7xI0fMhicphA=;
        b=WGMK5KOfHP15eG+RGbqD6t0+Mz7XdSnAgBymAX512FbnV6Xg9XfRvOBHaxMtCRI7CR
         NJFTRzH/TLtQ3ZWFVNebuM296oh70FQVvp+nxNTYR3UOXsZiG5ZyAAVDpGzUd4Fiw/EM
         BEZ96vqKaghZauQR5jIcmSf8K2kNXlvlANlLGG6RhlNQY5HHLERL9rC5J+fCO73M7b4+
         amJdVNxv5PrBp7+NF1aufGlRiVGWNeC6yYw9yI+YhBm5bCVoVQ2aDK3GYVPqwARkeZxV
         PLhR6COGYrQtJCxep2sQ0zZMyKrcAbXhT1aTxBx287YKHRrJPNLFKsXEuV+PYR72R4ZF
         QaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194224; x=1706799024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZysQ9KAcWXka70FvugQOSV9RayYcqOy7xI0fMhicphA=;
        b=C8ZyTMz53sYPsGdLDFzzxIZZvBr3SrdpyuHwNpbAQ+dMtkUPxsWclnI+AsPNg8IVHF
         A76EOhaGIC2ANMmh7bxSXPj3wxj4al38d0GaVkKV3c4VxItJBTVM/XXOCyZSMRj/dOBg
         EP2LwHEQCsX7S/nY011CtDZ62qo6dm1/M7q6SUoC9PxxSukvp0EXs0T9bDvVlzHy6o+K
         V2vCKIGjfAXiZQ2pcjoOwEccV7L+xhldIrBXD28GhIKi69JZK+6KoLPeF/Qigm+lWDHR
         2XoSVP/eJmJOdU3EvE74CqWscLvHNe6kskbrebDpt/fcmRgCCs5+Mcw9PTdkRMfL6FGe
         QVOQ==
X-Gm-Message-State: AOJu0YxE+8vdSh2aKkqk9MhLorwS9L+f7qypub5xK89p4hkueC7mlFim
	oVwKTy7XR8KpahvnfqECDUIBG6ErxhJi4r55TI0tROVWFx8DC65ZJLbpbfdUiwQ=
X-Google-Smtp-Source: AGHT+IHA47uO5eGUVzRw3oWrfTT7jpzLSV0hy5JLYr5qdHeliYMcttvj7NVUZtCY33YjGqMtwHdT1Q==
X-Received: by 2002:a05:600c:3003:b0:40e:474f:94d8 with SMTP id j3-20020a05600c300300b0040e474f94d8mr577969wmh.177.1706194224662;
        Thu, 25 Jan 2024 06:50:24 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 16/28] spi: s3c64xx: simplify s3c64xx_wait_for_pio()
Date: Thu, 25 Jan 2024 14:49:54 +0000
Message-ID: <20240125145007.748295-17-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125145007.748295-1-tudor.ambarus@linaro.org>
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s3c64xx_spi_transfer_one() makes sure that for PIO the xfer->len is
always smaller than the fifo size. Since we can't receive more that the
FIFO size, droop the loop handling, the code becomes less misleading.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 75 +++++++++------------------------------
 1 file changed, 17 insertions(+), 58 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index d2dd28ff00c6..00a0878aeb80 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -485,26 +485,6 @@ static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 	return 0;
 }
 
-static u32 s3c64xx_spi_wait_for_timeout(struct s3c64xx_spi_driver_data *sdd,
-					int timeout_ms)
-{
-	void __iomem *regs = sdd->regs;
-	unsigned long val = 1;
-	u32 status;
-	u32 max_fifo = FIFO_DEPTH(sdd);
-
-	if (timeout_ms)
-		val = msecs_to_loops(timeout_ms);
-
-	do {
-		status = readl(regs + S3C64XX_SPI_STATUS);
-	} while (FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status) < max_fifo &&
-		 --val);
-
-	/* return the actual received data length */
-	return FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status);
-}
-
 static int s3c64xx_wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 				struct spi_transfer *xfer)
 {
@@ -553,13 +533,11 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
 				struct spi_transfer *xfer, bool use_irq)
 {
 	void __iomem *regs = sdd->regs;
+	u8 *buf = xfer->rx_buf;
+	unsigned long time_us;
 	unsigned long val;
-	u32 status;
-	int loops;
-	u32 cpy_len;
-	u8 *buf;
+	u32 status, len;
 	int ms;
-	unsigned long time_us;
 
 	/* microsecs to xfer 'len' bytes @ 'cur_speed' */
 	time_us = (xfer->len * 8 * 1000 * 1000) / sdd->cur_speed;
@@ -582,48 +560,29 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
 		status = readl(regs + S3C64XX_SPI_STATUS);
 	} while (FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status) < xfer->len &&
 		 --val);
-
 	if (!val)
 		return -EIO;
 
 	/* If it was only Tx */
-	if (!xfer->rx_buf) {
+	if (!buf) {
 		sdd->state &= ~TXBUSY;
 		return 0;
 	}
 
-	/*
-	 * If the receive length is bigger than the controller fifo
-	 * size, calculate the loops and read the fifo as many times.
-	 * loops = length / max fifo size (calculated by using the
-	 * fifo mask).
-	 * For any size less than the fifo size the below code is
-	 * executed atleast once.
-	 */
-	loops = xfer->len / FIFO_DEPTH(sdd);
-	buf = xfer->rx_buf;
-	do {
-		/* wait for data to be received in the fifo */
-		cpy_len = s3c64xx_spi_wait_for_timeout(sdd,
-						       (loops ? ms : 0));
-
-		switch (sdd->cur_bpw) {
-		case 32:
-			ioread32_rep(regs + S3C64XX_SPI_RX_DATA,
-				     buf, cpy_len / 4);
-			break;
-		case 16:
-			ioread16_rep(regs + S3C64XX_SPI_RX_DATA,
-				     buf, cpy_len / 2);
-			break;
-		default:
-			ioread8_rep(regs + S3C64XX_SPI_RX_DATA,
-				    buf, cpy_len);
-			break;
-		}
+	len = FIELD_GET(S3C64XX_SPI_ST_RX_FIFO_LVL, status);
+
+	switch (sdd->cur_bpw) {
+	case 32:
+		ioread32_rep(regs + S3C64XX_SPI_RX_DATA, buf, len / 4);
+		break;
+	case 16:
+		ioread16_rep(regs + S3C64XX_SPI_RX_DATA, buf, len / 2);
+		break;
+	default:
+		ioread8_rep(regs + S3C64XX_SPI_RX_DATA, buf, len);
+		break;
+	}
 
-		buf = buf + cpy_len;
-	} while (loops--);
 	sdd->state &= ~RXBUSY;
 
 	return 0;
-- 
2.43.0.429.g432eaa2c6b-goog

