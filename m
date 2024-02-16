Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E50175BC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067167; cv=none; b=jLbostqRaMi3+56B5wQBuJjGRBJabAGmb+oLuea9jR+y46LpvBMNs2skV6cjeOeq2eMhb8PULmULzI3P5IIBy8BHYDRznFBxvgH26HtQ4iZGg9S7k31yUQaj2Z+cpIgBWesnEjRX1TkN9TVS0BAFeNjk9t47Tnsbl1BpUlv40Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067167; c=relaxed/simple;
	bh=8t7TvcXjledIlXbQAS3fYZ9PNzzW7TMHpIjpdc6lyjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHKnHTRNp6aoKEEHXrLghMrqQsyet0KQ71R/M9/5CyaE/+hTaVz3nFi8NwmcCfOL+CGLIuQJ2kcjyJnUTvmErpW3t+HWyZHr6OLMaeHUSjsgvNet5+93CaRMOXLSQanXF/HADqZiDkPB8svgKBXE7K+J1NVpRrw88n+tZHh86Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdX/MzSG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdX/MzSG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d066f8239so702549f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067164; x=1708671964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5dQGEaVcg4JepfFOKvtsOuZxWCp+j5PzKY/bMFyTSc=;
        b=YdX/MzSGSJX63OWGVhJf54HkKqpl3Hme8ynTu8qD8V9IHuriW11q9eixjFD5eBa+1J
         m0Uno/5sE/VRq+z++PMTkJn684ItxX92V/5uNAFZAzwvgcpG50vc+1rEym3vBXW7tHfc
         RnhV8nrdY47vmF1/Q2egiRvRC5aIv4A3hYl3HuIoecF/OdjWUQSyhlrmP1GbtvdYssNB
         Iphsoy2kt5zlBPcBTGnwMeXkyrI9aGG0RJViGWso48y0WgugEHPfn9o8G+lId36PzcbT
         rV73PFhuzdEW0+oVhRFAawx6UbX0jlbMBM3PO5bRhMLKgHLYMA8xyGjNR0Bk/QUjnN7E
         MQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067164; x=1708671964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5dQGEaVcg4JepfFOKvtsOuZxWCp+j5PzKY/bMFyTSc=;
        b=dr4sRAyTj5mB49dDhf/y0/8eyK3ZJZzzkETQWlFgQm6+qtZvbmzQPkqexH2Lg5PuFF
         hyY9dQNxg5LhapKXzm5hnW/VW3n/gn+hKVZjKFoDlU7Uxc1mHTGQ/SdDvE6MdNQHtCaM
         FGMhxNESQ4WiIKzSjGsuAvY6Ib5soUac+0c3kmounX/wB/tf9excF6DMxDvG3ec2r7py
         1e29AeCzNkrCscPHbOQH7vz26E7aTM+aW5BBB8cherAlaNH6HKMhTN5D7/gEQ+zqH/c9
         YZn7pKROouk58KzIXl0Ko1xdqUFo3OZGSHH1Pfj4OWWYisiYltpmeQ9StxWiqbAuBIjQ
         ytlg==
X-Forwarded-Encrypted: i=1; AJvYcCURvkUDGSjPa6i/Adr6MQ/ZKiLfKz6zdH94eZ3Kp4PzVDYzpaBVGWzbrrSVMac7KCxWgdu2RhqmCF90Is6l3EApYWpnz/VR09U0YkUy0Z7FbMg=
X-Gm-Message-State: AOJu0Yx4IQn8MhYOhsLf9rmBtBJvJgQks+iyOkE+AYuPnClePNaKMRQc
	k71EOZz3TLZazHWgo9ejA4BOQiGCW40otVwZDiLg1YMYo/W3ZNDEVVo+FghqxG4=
X-Google-Smtp-Source: AGHT+IH6bFjx6yR3OvU6ZSmZOFBSxOePtQ+8XuRp+3vDK/eGrsS4HlTKbLEgx6BW8cjReGID82PX2A==
X-Received: by 2002:adf:979a:0:b0:33d:f4b:d484 with SMTP id s26-20020adf979a000000b0033d0f4bd484mr2368352wrb.16.1708067163870;
        Thu, 15 Feb 2024 23:06:03 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:06:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	krzysztof.kozlowski@linaro.org,
	semen.protsenko@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 04/12] spi: s3c64xx: determine the fifo depth only once
Date: Fri, 16 Feb 2024 07:05:47 +0000
Message-ID: <20240216070555.2483977-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216070555.2483977-1-tudor.ambarus@linaro.org>
References: <20240216070555.2483977-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Determine the FIFO depth only once, at probe time.
``sdd->fifo_depth`` can be set later on with the FIFO depth
specified in the device tree.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 338ca3f03ea5..72572e23cde5 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -191,6 +191,7 @@ struct s3c64xx_spi_port_config {
  * @tx_dma: Local transmit DMA data (e.g. chan and direction)
  * @port_conf: Local SPI port configuration data
  * @port_id: Port identification number
+ * @fifo_depth: depth of the FIFO.
  * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the field's
  *               length and position.
  * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the field's
@@ -214,6 +215,7 @@ struct s3c64xx_spi_driver_data {
 	struct s3c64xx_spi_dma_data	tx_dma;
 	const struct s3c64xx_spi_port_config	*port_conf;
 	unsigned int			port_id;
+	unsigned int			fifo_depth;
 	u32				rx_fifomask;
 	u32				tx_fifomask;
 };
@@ -424,7 +426,7 @@ static bool s3c64xx_spi_can_dma(struct spi_controller *host,
 	struct s3c64xx_spi_driver_data *sdd = spi_controller_get_devdata(host);
 
 	if (sdd->rx_dma.ch && sdd->tx_dma.ch)
-		return xfer->len > FIFO_DEPTH(sdd);
+		return xfer->len > sdd->fifo_depth;
 
 	return false;
 }
@@ -548,7 +550,7 @@ static u32 s3c64xx_spi_wait_for_timeout(struct s3c64xx_spi_driver_data *sdd,
 	void __iomem *regs = sdd->regs;
 	unsigned long val = 1;
 	u32 status;
-	u32 max_fifo = FIFO_DEPTH(sdd);
+	u32 max_fifo = sdd->fifo_depth;
 
 	if (timeout_ms)
 		val = msecs_to_loops(timeout_ms);
@@ -655,7 +657,7 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
 	 * For any size less than the fifo size the below code is
 	 * executed atleast once.
 	 */
-	loops = xfer->len / FIFO_DEPTH(sdd);
+	loops = xfer->len / sdd->fifo_depth;
 	buf = xfer->rx_buf;
 	do {
 		/* wait for data to be received in the fifo */
@@ -792,7 +794,7 @@ static int s3c64xx_spi_transfer_one(struct spi_controller *host,
 				    struct spi_transfer *xfer)
 {
 	struct s3c64xx_spi_driver_data *sdd = spi_controller_get_devdata(host);
-	const unsigned int fifo_len = FIFO_DEPTH(sdd);
+	const unsigned int fifo_len = sdd->fifo_depth;
 	const void *tx_buf = NULL;
 	void *rx_buf = NULL;
 	int target_len = 0, origin_len = 0;
@@ -1261,6 +1263,8 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		sdd->port_id = pdev->id;
 	}
 
+	sdd->fifo_depth = FIFO_DEPTH(sdd);
+
 	s3c64xx_spi_set_fifomask(sdd);
 
 	sdd->cur_bpw = 8;
@@ -1352,7 +1356,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d with %d Targets attached\n",
 					sdd->port_id, host->num_chipselect);
 	dev_dbg(&pdev->dev, "\tIOmem=[%pR]\tFIFO %dbytes\n",
-					mem_res, FIFO_DEPTH(sdd));
+		mem_res, sdd->fifo_depth);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
-- 
2.44.0.rc0.258.g7320e95886-goog

