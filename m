Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDC7B3F1
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400268; cv=none; b=gNmVESzxkbGZNktB090hQxEjn3TvY8W7b3dL0hCReGyx63Q/BtJ4RWOpVQspUFI6gAODelk3GqTIozFDkZ6JL36CIZc3Sl7rm8RFyu0saUA+0YksItdFSdEBEtQbbOolnerd1p94V+Pyur3/L5fpP+zW27FyytE+kcK66kdS4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400268; c=relaxed/simple;
	bh=QDMQ1KkcYtiV6MjOl7LHm4vYVsmfWSXZLbn40VwBYc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfLADqidiIrewG4hIGPR2/SPisgaYezlsBgRCfaM7EacZ5baia5c3m/h11kYHu458nS+3xllsFY9E1TRhv/P46rXL0q2O1lB5JahbW2IbsolPD7buBjM8MaToO84gZwpGJ9SwXc2wkHLROLaeYcRQep2DIyMs/UThIHSGzZR1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfDQL3PU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfDQL3PU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33929364bdaso1195541f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400265; x=1708005065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzqxKaIV5lycuIt7a1okhuIIh6nU9oeZCJpLQ+HKFAg=;
        b=MfDQL3PUQaKxfMJmVH5Lu7nQMEdxejTo9BdsdN0SGShXXgCtgCk8RpNeO/C7PeSkAR
         hdo3mfmUdNY+HRbQU3+Sr+Fmolc9dN9gnKbJuOopFyHksLUBYh1ytrOI3P/ZOXcN5Cm6
         gptbT43sdpVXufKe51qwZwCADuvyiM/6yuc1m+30/G+VfUll4TOljgKUuFB/nvCE15xD
         aoUwxyXsiSXu2GS/C1A5tljTIrVZFLGCus9KVt4cmV0q8iMHgPGyhWc+CAIpu8xX/8Dl
         FhvpGfqqqKKQMU1Oex2cSLstzDrtvNk47LacbwLWEmf70JlZz3N2RScpKsjzHVwBNeUV
         rENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400265; x=1708005065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzqxKaIV5lycuIt7a1okhuIIh6nU9oeZCJpLQ+HKFAg=;
        b=ELptvhi2SF09q2cUuJJt9IIU0n0MY3BCfFufAtq2nGKPXern1p2sMo+2QOyAM9lUf+
         UkOPKELF4WhrRmG3IRPv8C9FVDXLxajVrWz13d+YBkpZ80/+ZQw5oZuh5w9p5yGjvqrV
         HgccKGqqIpPN8dn2twg2jqzcyiVLPTnz4dZHUGs/QkQIgfl2SOLPMxZSPgn/jQRFHMZT
         GrE9dgZQoP3ho5WMEOENMWZNsCypjFHRz6fpEfMhAkeFtIQRNZPFy8VYbod9WHqhSeHs
         4k+sUZLLdd8YIabP8oRBnXp3Vt5qYLaHRlTbqMW8C5B1zHYCEI0x2IKcSoxeZpLw7toi
         6blQ==
X-Gm-Message-State: AOJu0Yz28nFImVCfZGhR4feRMcVVvQc/SWduueT2SW7LXe8/RZkyxe1F
	e1VSNJKsQC4hhmoBqU1WvoFEUMrwP+Fky68aXuSGanqk4X0u0oImkom9ukdpw/g=
X-Google-Smtp-Source: AGHT+IHWIjXxPYN55agE12/MHmkqXhHPtF1gnuJNIC45a25qfLfhPZOuIq3uWHUK5ZgGJZLOtFpkJA==
X-Received: by 2002:a5d:5915:0:b0:33b:5955:80f0 with SMTP id v21-20020a5d5915000000b0033b595580f0mr1256423wrd.21.1707400265049;
        Thu, 08 Feb 2024 05:51:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0g5/QpwgVtEE+r/3+XY/sOhedUizACmG5fdHi6VpzcVaBsZdi6cByCvkvZEIO3ZlW0QNef4727PNWVfQtjQwvDhW1c7sA99vH/Z4wwTJfAGNmblZzzuSb5q1yC1jSXHQrao9emy/77l6oVWMPbvObQWFw5cIycpm/owUy/H/OLpkobNFWm1Tdp2UGNHkPIKuUfDBsyzu1q+V+h2Po6cxe5dQg6Ey9ZfwkbiPLWeGHwq790T9/hORNfXtVSgPg7xruKOfADvxxggItqPiohmyoRw2tD+at0PCxH3cDmNPoNFdtNVIztl6r6NNnfrPF9Y92iyFO45RpqCJnP29SiuJpMeDHDKEAbSvSS4AU3KpJIgxSXAJh1Tr+JElVQPaoy6dOKTzOK4pxZ4GVRbY8TZw/DGqD2AwryQvg03FXsJ/JJEvGj6gjeubnozOKzfLoMLQkMQyIg+pb6LKH1p8oOu8MqhFOj4OdBhwIrU9arwKijcC+edxb7O/eeQSqi4JZOXhe00lwMdT1ff2sGKJeafo8ZB7xqb87ZyxkBCNjSrnQj2qLYnNbWnlUQ+6Qn4R09EPNXTrnFq0pwZaYpt4WSS6DvZBxu/ey/S2MWvhLuQ==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0033b43a5f53csm3618820wrh.103.2024.02.08.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:51:04 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 12/12] spi: s3c64xx: switch exynos850 to new port config data
Date: Thu,  8 Feb 2024 13:50:45 +0000
Message-ID: <20240208135045.3728927-13-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
References: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
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
2.43.0.687.g38aa6559b0-goog

