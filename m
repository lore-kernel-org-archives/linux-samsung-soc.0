Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F7D217F23;
	Wed,  5 Feb 2025 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794339; cv=none; b=bLeWFjfoe8Flc20JFLBpKtT3ItXoV1sex6GnksAX3gxUYXt80o9UXJ+BYIC7ALw7DvCSOfaD0Hv6D2cKB7hrX0ThtAR7MvMmNX1DVwmtAPjzKgvkAXMsckGNpUKjF6wgLtWfMF9b+U8k7M1WY8jieQ+u6AYMJYfPw6HwiI1ztsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794339; c=relaxed/simple;
	bh=B+zIstPf6X8cEJbSXWtQ8BRRGFFrZQf530n05dm0HX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nHcx05zOLWJReKlgpPEMmHgnn8j5Z1HkHU1y8uqd0ntmK2gxWmOAE/Rq906O1xDurhtYS5rmcRjyIvKIBoJaYHnCqdLB0WPVMpS+SC22qXQxTb9RXHGO6QnQ7xIkz1xSLJ+yitZ4Jlc+1vPb4SrqZdKu5TCicZtqJz0jzizEvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9jO9kTw; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9jO9kTw"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-866f0d696e0so63442241.2;
        Wed, 05 Feb 2025 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794337; x=1739399137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5xkd5rT9wUgRW3DUsokQnKDvE7TCE8CtMzGLaY1JBw=;
        b=N9jO9kTw1PJevd1h24sWeAxeo3Ib48p34GBI+sHx7FjnmwJp3loU95ljay5YNw2af+
         Cpr7aB9tyExq+AXbDIW2fl/xmS0L2Pscz2cBB/uAZaXK5vs4QwyvEetRIth6+O+OMra8
         iDVx7NI4MLMUNG37U2RGQiWMBh610sIPRBBOjcCSZh7oFa4BjDuuf4ytJSdLnssjATMk
         4Khtp8mVhy90/JZLJMjnX4pLgCpF2PBXjsMA384WIH3ilSyOBGrD+v+cVwnnp6KHn3JD
         VCg9DBDEexkTSDoKX6RNsv76o4PsdFBKw6Parn3hbR3c1/ghqzQIdsCd5hYQX0T9lvj4
         gUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794337; x=1739399137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5xkd5rT9wUgRW3DUsokQnKDvE7TCE8CtMzGLaY1JBw=;
        b=AYzLLy2OW+CpEqJhaUxWHbOjC1zb7LOkkmKl1HRc4x5X5xHwOpGLtSnZ7nsgdg5wCc
         yx7h53WYNDv0sSUNoQXJDFSHaSNpns3etGoQxQ2yI2xAWVd9Ex/LPGkxIevsjhrq2y7r
         DL8ApKWpapSt4nb9OPYxIBKRdr+yeum6CQ2vyarclk4O1WZ9p5BprbEHbaG2Ya0m6b4Y
         0mCjj9Q42c6iq/gCqKeAnwl73+NhFXVLe6BBK0pc93tK1YnDtZ8QdN4xPgOPvlzniIZa
         kMTNSbuMDY/8BgIhoowGeCiFvG/U72iuTkPnJGl7SLlSXYN/CmCUwhWsWKsgdMuHPB2G
         KiWw==
X-Forwarded-Encrypted: i=1; AJvYcCXkxS6hYptZUTqodrpLHRjYoDe6RxoDWIfDm2XJSiWaSrzP8f18QRH2B5+L2GvcHT6XvjA1vBkv/O3fw8+6NCa2lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Tp6S14/oNvsFdn95yUTGGgLEwAPE+vZ2CkgVLRZ9jUQRn5PF
	sa3uUwdt11DjjMfttD/OS8lmdNfIgG7k5XJ0fSImke9lHXfOQWL4
X-Gm-Gg: ASbGncs7HJOYpVPdsQgvF5ly5nMkQOVvVyg6Xg6yCH7ls0ZSKeDtyz/1lP4QXW6R6Tr
	Vo9aGCTwr+X5gZsGNxZbXSxnEvJJZ1TVcg6mByWmryQ8V/Psc5Ww3ISnIFhVOwMAFRDQhueIwzy
	Ts5mv0q8uroIQCSXrRVWoFoCP7klunm+IPDVHjdT3NSfjWb/g2+K7CzHJoQxRnI2lkL/zvjwMfJ
	MBvu7gzxk03WCQr28jggykDerg9xlTqwMKdycD8GkQFEDU9MXlEi2/4t2miHABw5KUGtXnsbkdF
	AypXzeaVeyV+BBFBdvAWoLJN7kUFtSm6P+NwtbEsdIIfVcc/LfH5IlbdsbfanM1Jvzo508EPS1x
	yDw==
X-Google-Smtp-Source: AGHT+IGX27jCqcI1MnR7gOhw8BskvTBlBSzOqYsxe/kPSS2u9T2tZ7z6U3M/YmSUWd09bAr2G7LKUA==
X-Received: by 2002:a05:6102:418d:b0:4b2:7996:6ba4 with SMTP id ada2fe7eead31-4ba47ae4d3amr3246093137.25.1738794336852;
        Wed, 05 Feb 2025 14:25:36 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:36 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 8/9] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Wed,  5 Feb 2025 22:22:22 +0000
Message-Id: <20250205222223.613-9-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos990 has the same version of USI SPI (v2.1) as GS101.
Drop the fifo_lvl_mask and rx_lvl_offset and switch to the new port
config data.

Exynoos990 data for SPI:
- the FIFO depth is always the same size for exynos990
  (64 bytes and 256 bytes), sizes of 256 bytes will be put in DT.
- Exynos990 allows only accesses to 32-bit registers; otherwise, An
  error interrupt is generated. Perform write register accesses in
  32 bits.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 389275dbc..d4cbbaa9a 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1586,6 +1586,19 @@ static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
 	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
 };
 
+static const struct s3c64xx_spi_port_config exynos990_spi_port_config = {
+	.fifo_depth     = 64,
+	.rx_fifomask    = S3C64XX_SPI_ST_RX_FIFO_RDY_V2,
+	.tx_fifomask    = S3C64XX_SPI_ST_TX_FIFO_RDY_V2,
+	.tx_st_done     = 25,
+	.clk_div        = 4,
+	.high_speed     = true,
+	.clk_from_cmu   = true,
+	.has_loopback   = true,
+	.use_32bit_io   = true,
+	.quirks         = S3C64XX_SPI_QUIRK_CS_AUTO,
+};
+
 static const struct s3c64xx_spi_port_config exynosautov9_spi_port_config = {
 	/* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
 	.fifo_lvl_mask	= { 0x1ff, 0x1ff, 0x7f, 0x7f, 0x7f, 0x7f, 0x1ff, 0x7f,
@@ -1664,6 +1677,9 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
 	{ .compatible = "samsung,exynos850-spi",
 			.data = &exynos850_spi_port_config,
 	},
+	{ .compatible = "samsung,exynos990-spi",
+			.data = &exynos990_spi_port_config,
+	},
 	{ .compatible = "samsung,exynosautov9-spi",
 			.data = &exynosautov9_spi_port_config,
 	},
-- 
2.47.1

