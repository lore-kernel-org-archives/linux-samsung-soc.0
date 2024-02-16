Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE9F1C29C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067176; cv=none; b=Rgjdvb2FYHJX2hoV7lLIzL+SVctGjewNEZi3oWiZJmvMqvFFYKPOObVIlfMvcAjfpXf9Amb8QQsOHGbGYBghHqSChThbLO8zEcrK9GulS7sYUCYP5huz76mx30mD6OIhs9p/bnIlpCF1xpitF6Lu56mxc9FIAbfKNJ8uSOwf/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067176; c=relaxed/simple;
	bh=3EdBwoR+7Nrfa5x/e89kDaaHLZR+YpN08+2w1Oy4K+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlWWAdL2K4JOUYZwlAx2V+vjhryiFREp5FRyL0XaVvsJOncUjGZktUb3Kf4jwgPQZbD2DQireTuMlf5yHCXrkeo1YYmTD05xWUh8X7/xt7is1+8OwEVRd0Edo5amMvicrFf/DRlegSMSlYNzKcI683J27aB8HvOp4axPnxcUZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pc07qB4x; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pc07qB4x"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33cf6374e58so188059f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067173; x=1708671973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQRRPX+blWzvEopmbMKDola2GW+hMdPUAJuHhbzX5L4=;
        b=Pc07qB4xLVBKV7eAuOLhy5kL5+1CG9FFs9ZO0ie9BRw7LiFVFq64nc1MEjW0QE9bZA
         TY4cEfAexk1ZaONfNY8HJpOZb4cRiIjQRZHowYkxYvPJUsiQ+wjmNgOEm5q77fkNAnkA
         Bn6r+UtyN5BwHrDN5mGKG0D7XERbG01FcxyMC2H7AoDGGXPn7D17c+8xQyx9jvSFNNkm
         wCWrYMt5+E5JzNIziZEopBAUNJd+4OgWWLdXcEpUytwQf3rg13dEnCUesvx27pMsiYDU
         jUc2kHEAUUO1bCHKGvupk14F/UnVL0vB6hcsJNbMnM9kiX+WjZUEZZ5HmyES4M208aR5
         /4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067173; x=1708671973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQRRPX+blWzvEopmbMKDola2GW+hMdPUAJuHhbzX5L4=;
        b=ddYVc/R/F9897w1IjDfl+zy8X6bkrNQUusI8ZLrEFIQh5/oI7d2+ixuu0Ul0gt0UJJ
         NnifbW5FukI4bGc93a46al8EX+wrK46L0J56n+u7/+myq4VacZ/ppbdMfoPgQ7ext8nJ
         CXK8AWAjx+NcPNtR8KjCjTBrLMooxozwtaj6EqiZp9/kfCVodMKVtyFAgwRBsZsKIsim
         q4SLE16u9Atz2nCUDicI0ZCJUmS0dtdTrwMC0KqeVWA4FGblzME39jSIFYgCXqUexrFC
         MSvr8Sb+Jk0g8CkYe4ftAsBvd9DsOmpuSKjJjr6kgTAZNQ390hRHqMWsknSDjUAU+1RF
         5qhw==
X-Forwarded-Encrypted: i=1; AJvYcCXz4ufilrnAZe8VkuNVRy7Oo2oXmvNHbNIyIdtkHOCWh5nR+arIR3FjUrjwvqwXx5+1cuJQ8yMfdtd53gkSzGPga1unQ4sZ3PEuJs7h315evh4=
X-Gm-Message-State: AOJu0YxstfDPRPDj7e/i3TifGlheNAjqcpLfi0NY6vRNYFVeQu9WzQLO
	VFhO8LUThF+6TRNkKSUBplG320LajQmDlMGYytAMOVzMVBKWzQteJjvltDvpQg7kVpH4k7+09q+
	fIZk=
X-Google-Smtp-Source: AGHT+IErqstmVJ3gg7nFuUbDeEkjVZQK9cB6BlztDErH2tYUhPqM2cCZ8/9WxbIirM2WMTjujF6W/w==
X-Received: by 2002:a5d:508c:0:b0:33d:1f42:ea37 with SMTP id a12-20020a5d508c000000b0033d1f42ea37mr361534wrt.15.1708067173486;
        Thu, 15 Feb 2024 23:06:13 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:06:12 -0800 (PST)
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
Subject: [PATCH v3 12/12] spi: s3c64xx: switch exynos850 to new port config data
Date: Fri, 16 Feb 2024 07:05:55 +0000
Message-ID: <20240216070555.2483977-13-tudor.ambarus@linaro.org>
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

Exynos850 has the same version of USI SPI (v2.1) as GS101.
Drop the fifo_lvl_mask and rx_lvl_offset and switch to the new port
config data.

Backward compatibility with DT is not broken because when alises are
set:
- the SPI core will set the bus number according to the alias ID
- the FIFO depth is always the same size for exynos850 (64 bytes) no
  matter the alias ID number.

Advantages of the change:
- drop dependency on the OF alias ID.
- FIFO depth is inferred from the compatible. Exynos850 integrates 3 SPI
  IPs, all with 64 bytes FIFO depths.
- use full mask for SPI_STATUS.{RX, TX}_FIFO_LVL fields. Using partial
  masks is misleading and can hide problems of the driver logic.

Just compiled tested.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 784786407d2e..9fcbe040cb2f 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1576,10 +1576,9 @@ static const struct s3c64xx_spi_port_config exynos5433_spi_port_config = {
 };
 
 static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
-	/* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
-	.fifo_lvl_mask	= { 0x7f, 0x7f, 0x7f },
-	/* rx_lvl_offset is deprecated. Use {rx, tx}_fifomask instead. */
-	.rx_lvl_offset	= 15,
+	.fifo_depth	= 64,
+	.rx_fifomask	= S3C64XX_SPI_ST_RX_FIFO_RDY_V2,
+	.tx_fifomask	= S3C64XX_SPI_ST_TX_FIFO_RDY_V2,
 	.tx_st_done	= 25,
 	.clk_div	= 4,
 	.high_speed	= true,
-- 
2.44.0.rc0.258.g7320e95886-goog

