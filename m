Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7961C1272DC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194234; cv=none; b=TMrXrCr5/Y9IBvHm1h+PFxaIk4VtrivTGoXKr4zIITjUvEFRQZN5iR11x7RZQPpdkggh1igdL5Gy7Cqnx3qTfPIY+L6jsT32dOBh2WWCsOe/ehaa9eqthKMA2NgKHnTuA7NsCpIU15I1vRQurfmyhVfMrN+l//2ps8kbME/bDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194234; c=relaxed/simple;
	bh=7oC6aE7yrHI7Bg4DPsg4ndJWuSNI1iWWkA69lQkaI/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbN2hv0tGRS+ayXMVPuQddrxFHK0WAHZicOKNaZ+VdsIozXPpPPs15qQUejAdjxc/3vEl6NMQdKS3bF6PpJ1QygXSFdQ6Xv4Gpc088cmdZuCNX5BRAnpTWx6rhnVJDm1zWRl0+hMRaTLKdpvZX+UeTal0CdIBZnskDvm47ee3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xafGNeb9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xafGNeb9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51022133a84so155928e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194229; x=1706799029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/zPTXzuzucodd7Jc2j/c0UTTlvdcrp8MZ/snSSgH8c=;
        b=xafGNeb9g1N9BbZ+KZut6Dopm/J25MczWZHvv05s2HjviOwn26Y8VjEN/sxJ0OSVw8
         Bvg6gtBTlOxyeaa8e0t9w2nOcL8KAQtPZ+hTlurSC7iuIivbbdCzxQiTo4As6KDY3h4L
         8ywDD9DHeCiONQQa7Bn5ZIvP1gcgkoT8kc8vprFl7Y61juItgWMxLTJpqLNb3ZoeRY2V
         MHZKbGJlhNssO/k4JGdA78Tj4NB/CrbU9kDpHwQ2fsDJwxPOSL+E0XsObo/Ztl61CO28
         Xm+3KIuTH9Za6DtmVt0suOsfZVkHTQEjPAC2cu01/nNLoi36TnbiOVcOh5Pp7zwYg2jJ
         csVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194229; x=1706799029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/zPTXzuzucodd7Jc2j/c0UTTlvdcrp8MZ/snSSgH8c=;
        b=GVPFRNF3DRncthuWrm8VLGn7DXzB6pmvhT8J4aWM25FKSXZsfjppcLU3U07W0IXf40
         bz8uIK5htKnFxx/XkuwETg5VfehxfxSm7Pl6ha0ySgB7AgH/8+62ICylwMXkJjKWf7TK
         LrngTuoFGWw5IC0ruJclDcnO58M4y3Hcnq7iEszkUwlhw8XkXN8lsapuPBXXUnAEqg5H
         ARKpWlR/i+2qAqUk3M2iLFGeDKhYElethsAXDzXLJk5oiH7OAZVkoxUjwd26VdctRfIx
         VvByivZx3kLd6+BmF2QhzXO/ipzQpQK9yDEDpvA7awaugclezqSBdmw8Uvc2SCzcz36X
         mD7w==
X-Gm-Message-State: AOJu0YypuYmlI+LXFFiyV2uZY7mRJCZhbBQ0s8AM+fhcn6LApJaUA53m
	/kgACOHJbAgm1deFFovbW4WTAFGKaOoO/zuOUNJxLgkSuLrHE2mYhzHFy5kjyXo=
X-Google-Smtp-Source: AGHT+IEEJRoUMypCd5WxAINWuuyyAtoDoV7u9sVIAu6LKI6SWWX9FrZs5lQFbxcY+zk8kyfwTvqYyg==
X-Received: by 2002:a19:ad4c:0:b0:510:7e4:f2be with SMTP id s12-20020a19ad4c000000b0051007e4f2bemr790436lfd.48.1706194229248;
        Thu, 25 Jan 2024 06:50:29 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:28 -0800 (PST)
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
Subject: [PATCH v2 21/28] spi: s3c64xx: infer fifosize from the compatible
Date: Thu, 25 Jan 2024 14:49:59 +0000
Message-ID: <20240125145007.748295-22-tudor.ambarus@linaro.org>
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

Infer the FIFO size from the compatible, where all the instances of the
SPI IP have the same FIFO size. This way we no longer depend on the SPI
alias from the device tree to select the FIFO size, thus we remove the
dependency of the driver on the SPI alias.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 5a93ed4125b0..b86eb0a77b60 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1381,7 +1381,7 @@ static const struct dev_pm_ops s3c64xx_spi_pm = {
 };
 
 static const struct s3c64xx_spi_port_config s3c2443_spi_port_config = {
-	.fifo_lvl_mask	= { 0x7f },
+	.fifosize	= 64,
 	.rx_lvl_offset	= 13,
 	.tx_st_done	= 21,
 	.clk_div	= 2,
@@ -1389,7 +1389,7 @@ static const struct s3c64xx_spi_port_config s3c2443_spi_port_config = {
 };
 
 static const struct s3c64xx_spi_port_config s3c6410_spi_port_config = {
-	.fifo_lvl_mask	= { 0x7f, 0x7F },
+	.fifosize	= 64,
 	.rx_lvl_offset	= 13,
 	.tx_st_done	= 21,
 	.clk_div	= 2,
@@ -1435,7 +1435,7 @@ static const struct s3c64xx_spi_port_config exynos5433_spi_port_config = {
 };
 
 static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
-	.fifo_lvl_mask	= { 0x7f, 0x7f, 0x7f },
+	.fifosize	= 64,
 	.rx_lvl_offset	= 15,
 	.tx_st_done	= 25,
 	.clk_div	= 4,
@@ -1459,7 +1459,7 @@ static const struct s3c64xx_spi_port_config exynosautov9_spi_port_config = {
 };
 
 static const struct s3c64xx_spi_port_config fsd_spi_port_config = {
-	.fifo_lvl_mask	= { 0x7f, 0x7f, 0x7f, 0x7f, 0x7f},
+	.fifosize	= 64,
 	.rx_lvl_offset	= 15,
 	.tx_st_done	= 25,
 	.clk_div	= 2,
-- 
2.43.0.429.g432eaa2c6b-goog

