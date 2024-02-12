Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF453F8DF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707746641; cv=none; b=l/q46HLAdKCwcgkX0+CgkRHvlsnKFeeJr4G6tNl7jjXXl9MyHaD4syAaK4cAWxexIONKH+L6H9fYFPm0FO2Rej6DnDMFHslh+yrkssn5Juzt06T37YWCour6/iCaEJeTJt83RS4zrb+ElQbbDpmVNuW7VBwvWMPrpfCdbT/2d9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707746641; c=relaxed/simple;
	bh=LEhcV/DRGuck7Ycrdv2oDV0m9G3uCaehI82ftyxYpr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZuHtfRmyqWq/OuF4iKb/R81xmtkOR1Zy5uylL4sJXdK8vH2Ajnsp0UxMoL0S67xHFGiZmxnuF/9Mpk5Ml81O3ZQMlo80nfHVz/5ANxS3wAr28OLt2bIuZ/g1gNiNngbuKAUt2Rjt8IXxXj7LNsmtk545YFyOGN9uxvWwBGvnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdlNehZG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdlNehZG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-411a5b8765bso1269125e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707746637; x=1708351437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbvKAanWHb5NHCc78DYWj3IudYbRJBQeeD4twXOiMjs=;
        b=kdlNehZGTbnZxB2Vq+6xJWvOGwEg62sHPVW1SrZOc9ZGLMl+QZGTsngMGSbtZMe4Z6
         QaE8W0EeyFzZxYySr2XLlJtyH/5GifBN6NjSQyagcn93828Osjxd+1CbzRDE1bsU9/ct
         VpPxVrMM9LnWz88To8v/ONcIJVXH1owV/2qN0xvry5vxA0jcKxeJfiB4iqSk1832M88O
         JX+4IosQr8wsJHthH6EK79p2wwPubv/xssVD031QPnoXcUiKuzsg1JD9xsyR1Qr+XqM3
         D5hA6kx4qidIXdEn73GwfQpVnGhm8dPEiUXoVTm87j5G0CTPSqUSN3d4RrGzXgaDdWl/
         qZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746637; x=1708351437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbvKAanWHb5NHCc78DYWj3IudYbRJBQeeD4twXOiMjs=;
        b=kqkI+lYR3+3Gbjw+lTRM9mXVL6n5d7ydTW7hHzr8HbWR6kUPjy/xgaw16UwDk+7WOx
         F8v7zOG6/SMjClGsNuBOxpSKHA6V8g3ggXFnS4uPUG9KtQ8nckLD94Fo7hnffwgbf+O7
         cg07a2e7gq6ysHwyltEUvZLJDX93lioGwCqFn0Oh1gPWkZb0DPREvgArsgzKTpJ4DXQU
         UzLj4AlcidSNoRWmE3i87jhPDO+yiHZBmRl05FgSm+vHbkw4KlOui+d0tmqI87/GWt/V
         QxwHQbRAhevWr0dMJevdC8U+6X0/gJ6Wo1yW4MiDTr9DsSx4Anq8iVByLBnUwh0uJyly
         15NQ==
X-Gm-Message-State: AOJu0Yy4ARUS5lzahZac37ISBUryqnHGAxY7CWhq9DdQZIHGLXt/Wg6o
	NPdcVS4SQxmaFDnthHpl2BlG791SwhsoNPvmA+IZcdt9lK7h7gWr8PGpdC5MFbw=
X-Google-Smtp-Source: AGHT+IEif4Fg7pSF6wN8emTX0pwbAdYoKZjFc03ubpGOGgiV2E/6mDETDnx3EoITL8YannPLkhJeQw==
X-Received: by 2002:a05:600c:602a:b0:410:9b48:9272 with SMTP id az42-20020a05600c602a00b004109b489272mr5049483wmb.8.1707746637405;
        Mon, 12 Feb 2024 06:03:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+EDbaisOa+6yIrGqWWJq40OpsatdFleMrj0aGtjiVtvx/JwCZfrfa1FjMCYZVt5AX0x7cAHzHT2sXjTjmA8F76rUdDvpoxl6vwfzYL9ytEofC5FsJksrbvTEChnZAjfUAyZ/A0quDuPRPwy/oJjkewzO5TBFmfdCoApBdCVS+tgqGlECF2Fy0/fheMtV/+WJMk5Ri68RYI3Jhp7NzOwM1TwtltB9NkXYLt7l2tRFd3MhrPsvsxa0UENb6w9qMwUdXDOChwP7wVOkWMbMnXh86vI95zN5uAkPpGVBi/HNfRElHDTCMLrohDEr0Zoxh4OuUAwMgBYTqW/ATCf96ZTbzFYrjLtA3DhE8vRKuwgL+gG5DCc3biGuMBoM4TGpvUOcXYFOwvRuSUkC6bc0KmeWdEDTJuvqHO8kKzW915R8ZtfKFZ1CctnwWPlGQz2VWvygY5M2EWvbWKxwE9sGY04c0umwYOjQRMMuW/NDN9RTr70AdmRnWDwSp7bLAdx8HPuybGXreVnzbvxDgIgzYJIBmJX2SoyOPZ3eAGViiU/h695HMB1A8HgH8MBdmJYfOnxa8i6DgnqytHWiktBqwNkUcX0tr9Vz/QkIlL2cdBXOCXxwpSRM=
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4b09000000b0033b843786e1sm2135356wrq.51.2024.02.12.06.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 06:03:56 -0800 (PST)
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
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 07/12] spi: s3c64xx: let the SPI core determine the bus number
Date: Mon, 12 Feb 2024 14:03:26 +0000
Message-ID: <20240212140331.915498-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240212140331.915498-1-tudor.ambarus@linaro.org>
References: <20240212140331.915498-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the core determine the bus number, either by getting the alias ID
(as the driver forces now), or by allocating a dynamic bus number when
the alias is absent. Prepare the driver to allow dt aliases to be
absent.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 68f95c04d092..ac47755beb02 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1279,7 +1279,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	sdd->rx_dma.direction = DMA_DEV_TO_MEM;
 
 	host->dev.of_node = pdev->dev.of_node;
-	host->bus_num = sdd->port_id;
+	host->bus_num = -1;
 	host->setup = s3c64xx_spi_setup;
 	host->cleanup = s3c64xx_spi_cleanup;
 	host->prepare_transfer_hardware = s3c64xx_spi_prepare_transfer;
@@ -1360,7 +1360,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	}
 
 	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d with %d Targets attached\n",
-					sdd->port_id, host->num_chipselect);
+		host->bus_num, host->num_chipselect);
 	dev_dbg(&pdev->dev, "\tIOmem=[%pR]\tFIFO %dbytes\n",
 		mem_res, sdd->fifo_depth);
 
-- 
2.43.0.687.g38aa6559b0-goog

