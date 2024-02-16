Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39331B7F2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067173; cv=none; b=DurvSy4jEZws4wZ/B8RtRjvJMDlcim6keKh5h/b0PHfw5pKNq+Z+Hd8Af4uhIGguHKhJr+kWG8JzcEoJg8iLMP9yGimYfhf9eBJO+IrpscK9htVHIR3P7j02gHPavBVf6aPuWcB0Fmgk1xF73uj8HVdmnJVHnoEtVv1QkSFz3wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067173; c=relaxed/simple;
	bh=mG+75mZLgRp2agc33t7IrmsrcHEZ055Yeb5TSZ4C1wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krkiKD9QAl7kxiIbGIm4KW5UCLdNlS7ZPr1Y0lrpaYKbzLpifaVF8KNfHlAnchlJb9BCJLjULWmXa0CoByAL8c2gYnvIAsySFDqc+6oNVEZOjboyOK1Up3igM41K+rXBpJEHTdRKg//QdqYtFsMYiUCm8DFVCsnWTx8QtmjTcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2iFqbvO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2iFqbvO"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d090c83d45so22063551fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067167; x=1708671967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp4R5FqMMv454plXIhV7qJWhdTsbC/ksc+0K6w+UCm0=;
        b=i2iFqbvOeKwQD5zMQJ9oYr25OJbv7aAv3D7fTaCHNudCbgUVaafnzztbD275XrJZ5j
         vyiRtH5HMafClu5mZJeZWU/5wDXabk7Umq/6HaTif8tKBZ5JnXfm2TYk18Vn+uc8gKRd
         eug8Wj4iyjIco3PGdOnLG4eKc37gs+Amj5h3Yty7mqLt1YmwaM+VTslJse93iMml5eRI
         UqSECjEXO9F9EpUdOSmwhJKUrCJqe9ZsiwB6gV3plUq1p/3ciA7nzaOkLQOO8ToHp1k/
         usU4LzPGQl//zaflzeZ1hL4O/L7tqiWa5sRws4jPKYKz1PGWdsJNCEifKhIBoW+3J1Xz
         4QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067167; x=1708671967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hp4R5FqMMv454plXIhV7qJWhdTsbC/ksc+0K6w+UCm0=;
        b=mc/q9W7rkg1W2P1JGXZQlUkSAXzXyP8HNat3laneYvm5hV1XyeVZHSSxCiMuD5vxMx
         w64gPrYubgQPJYLoORPlCh3UOjw9RXDjwmWwnM8qymAoTVhmUdLOoxjkbWO5cDawasOC
         +IGeGmu1zeYsDRIcWbJlwselUziAOECq4MaSlNtSImEeNH4ddNqHntI7z0p++26L2LRu
         poOpFWm8xPC7Dk/WboQlmBU1LX2ERtzcBy6H79nRa9nQuIO2nna98tFCJd46+QK2iTn/
         MRFvacD1S/qh0hM8Z8b3U8VrNj3MweR10HncmqrLyoesIhq1Is517m3cfq5V7W/yyx+e
         oK9A==
X-Forwarded-Encrypted: i=1; AJvYcCUvO2nQ+8tsYbou14B5XePpTnA6YUxLGTxNetKqyBZaSihxZ/fTBOLbMOkmidxVG1gsqTrMPr4qMrryIPeZdmuEFYIzLdSznEFE9v6GvPgQCkw=
X-Gm-Message-State: AOJu0YyGSdZOjNafkffjJCthV5/zvPlHTAoq+gBRUE0AbYx+UvOngWnM
	wXv4YskAAuKcI0MVrLguwmIYEPw77KxFamsCf1ABRGfuZ+iVg1NzRrtZuC1QrzU=
X-Google-Smtp-Source: AGHT+IEIfJLwnjTBPzZlAN6MdmD15Q2SiURRcXeLTvWrYKudV8i77tM6zGBzeDiBhkG+NoQXNoJ5AA==
X-Received: by 2002:a2e:889a:0:b0:2d2:ccc:ac28 with SMTP id k26-20020a2e889a000000b002d20cccac28mr2399275lji.38.1708067166715;
        Thu, 15 Feb 2024 23:06:06 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:06:05 -0800 (PST)
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
Subject: [PATCH v3 06/12] spi: s3c64xx: allow FIFO depth to be determined from the compatible
Date: Fri, 16 Feb 2024 07:05:49 +0000
Message-ID: <20240216070555.2483977-7-tudor.ambarus@linaro.org>
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

There are SoCs that use the same FIFO depth for all the instances of the
SPI IP. See the fifo_lvl_mask defined for gs101 for example:
    .fifo_lvl_mask  = { 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f,
                        0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f},

Instead of specifying the FIFO depth with the same value for all 16
nodes in this case, allow such SoCs to infer the FIFO depth from the
compatible. There are other SoCs than can benefit of this, see:
{gs101, fsd, exynos850, s3c641, s3c2443}_spi_port_config.

The FIFO depth inferred from the compatible has a higher precedence than
the one that might be specified via device tree, the driver shall know
better.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index b1c63f75021d..68f95c04d092 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -137,6 +137,7 @@ struct s3c64xx_spi_dma_data {
  * struct s3c64xx_spi_port_config - SPI Controller hardware info
  * @fifo_lvl_mask: Bit-mask for {TX|RX}_FIFO_LVL bits in SPI_STATUS register.
  * @rx_lvl_offset: Bit offset of RX_FIFO_LVL bits in SPI_STATUS regiter.
+ * @fifo_depth: depth of the FIFO.
  * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the field's
  *               length and position.
  * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the field's
@@ -159,6 +160,7 @@ struct s3c64xx_spi_dma_data {
 struct s3c64xx_spi_port_config {
 	int	fifo_lvl_mask[MAX_SPI_PORTS];
 	int	rx_lvl_offset;
+	unsigned int fifo_depth;
 	u32	rx_fifomask;
 	u32	tx_fifomask;
 	int	tx_st_done;
@@ -1263,8 +1265,10 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		sdd->port_id = pdev->id;
 	}
 
-	if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
-				 &sdd->fifo_depth))
+	if (sdd->port_conf->fifo_depth)
+		sdd->fifo_depth = sdd->port_conf->fifo_depth;
+	else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
+				      &sdd->fifo_depth))
 		sdd->fifo_depth = FIFO_DEPTH(sdd);
 
 	s3c64xx_spi_set_fifomask(sdd);
-- 
2.44.0.rc0.258.g7320e95886-goog

