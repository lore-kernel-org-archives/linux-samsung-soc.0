Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2C3EA6C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707746639; cv=none; b=N/DoK8Z+PbQF1B+VvhPG44hlVSwYpdSBw+D49HmU+s/yQpV9/eGvp40IZI3qrCqT0zOYb97GMTVTWtpz/eQGnA8VyysUR+/1hUjmSY80IC2zmMJkEyRWfwUo883QItHs4NmkoH01Tb35z//XCad26k+X7UYYHIQgwRpCrEmgWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707746639; c=relaxed/simple;
	bh=rx5UcKRqmBa2xMJwQBoCtiPbpkdNk/dwmf6spW1NzkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4vDRTv8Rbi9hev+48aipF6v1iIEzMgBEhpNWO9dtfeOh+a9IV5dsuPeeBYhR4oTTxMjfxcVNCxWfirRXFSyQGzY1n0q3cir5+NFQ0m/s1FxCgRTF0qQWRZXrx9ad5VKkl2pmWimQewxQBxLWzWajwMOaGc4oQCnoV53f/qV0w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egvck0U6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egvck0U6"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d0f1ec376bso15643761fa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707746635; x=1708351435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwyqOxCBKuWUKHqwJM3+S1e7+XETwlW6DJMJjNuYLS0=;
        b=egvck0U6f7ZQZlEf2AmBH0ddUqDxudpImgvb12zb3hep4w4jOjoRjXosvJw1mPFKK3
         +WgoiQXBb6r0I8ZNBAFAY7fxvxrybzbOBxiLDYZiXoTO3Fy3YdXv7Ltk9cZb4+NsGLGI
         yiAh2JYdByfOpuevQbR4syNsRLR1oCVN+dFJ8QpKwgWxwESyQSEAbeJhl4Vxr398X4bT
         V0SUh0za7RhDrNpv3qoYFRIR/20/eNig/h18rguzHjF+Nmge3ZkQ8o+tEtfWAryNMhY2
         8K0fp1wIDfh2wsVO3orVJi7QHmWmR3i6pVJJkgWlUD4OqrFqLrnUiispwaixOweQ1KtL
         kyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746635; x=1708351435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwyqOxCBKuWUKHqwJM3+S1e7+XETwlW6DJMJjNuYLS0=;
        b=urNZsUvM8jmIBI5qwW1syHLZVG4PdBiVzyiOI41jRvGzKpNWGy6S4pzp6D1fgqNRnk
         jWNyVt9gx5KPnDvm+BuKhOVQiskp/I7Khncx1jLZ8Bu9xXaFlb+1x+KTDe7G/ADqp3Nl
         17HTm+qTQ3nxnf6ceCHKkpZBYvJ1rtAzXO1q/qAenChgfaHXl0GKUdXLKdxT8DdSzQt8
         Y99LLNk58TJcWpSP3T4QSzpeW81GgGReJN0cHHkcWcTppO4zPps978ZJi/AVRVpVC14Z
         0uSBywyyPPt+pUsxGR8uNtzjiDCBvL0aU4EIzHuwTAzuLCCU1t5JdugR2Vdjqt1iZMGV
         TkBw==
X-Forwarded-Encrypted: i=1; AJvYcCVwqjiV8NZ6vGGfl6qBGLRFku7VnV5drPWTj4qOhr42aV11FNAbxb7ewZlz1cbgq3hfxhQ/k7YSofzheFWnv9DndLxtrZz66yl/mLwHAmhNHcI=
X-Gm-Message-State: AOJu0YxU9myw9Zz3qZhUrSsqriU2Z8eUtP84giPq6ge5dgsj1QqiYuza
	NoxtJJiGZQRMu3Ucxj5Y+NncjyBnoYN+ttsnwFiMUQ/xMhxjHMxAuphEv9/+O6M=
X-Google-Smtp-Source: AGHT+IFg3qLWNvNwUnn8P/BhJ5Ietz8B1yvexMNQAGrgiWUo0KCF6uBK6Sl80tvi0CllLESKTMuoaA==
X-Received: by 2002:a05:6512:47c:b0:511:8c4b:8f49 with SMTP id x28-20020a056512047c00b005118c4b8f49mr2517416lfd.25.1707746635085;
        Mon, 12 Feb 2024 06:03:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZE3PZkuKNAn2tR9aGo/I3vn3MVfSpp0JHsjBEZGcqPndunlQiZ8aegoxwuwC4jHefmlXyK02+DbV1HsXe+NnjulQIIx+vPoyuFOuDByU7sbr5Lb1oirG7j/LpWtOKn5nyYsscuflY7jQVf6iFmkkOCV5HqaybQWIwT9scB4ok11j2S1V06vgx8M1eu/V/2AvalKNEUwqko+NajGDMV/qcWF1RtwQ28cvCgqKg/5HUd1Rj2Y9zaxl1Yo9mrd41Su/ETC/2Il2poJ9360qNqvbLHQ9iWTvrdZEVwwII/F9jpuObPz5zcmJDDpZ8+k//jJMyLw8AYwW0oe8wNHFhR7FQnFZyscudTJNSsA6Oy2FA+30nnZ6opVKyU4yQOU9BE+5wbKOKLTnhcT3KIQtOneprgFBM2p7TDaCwbwkOO2/CtoezA4XVGC3qM0BRd/lXyrMIOLcrWdNIEp7jnhKJQMDeJ58snE1PM+xlRQRVJJepzG/bSul105iq7ZdqVZa6rVCvMRuG8sDSurqjtt5vTU+3uTKuTaGxh9ROkI79hj5T6XE3Tl1Ff8oQc5tXsL3HQbEMx5gmMQ5lFjM2K7N2v++SHsyq7OyIi0ABiqadyhEl/8vcreY=
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4b09000000b0033b843786e1sm2135356wrq.51.2024.02.12.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 06:03:54 -0800 (PST)
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
Subject: [PATCH v2 06/12] spi: s3c64xx: allow FIFO depth to be determined from the compatible
Date: Mon, 12 Feb 2024 14:03:25 +0000
Message-ID: <20240212140331.915498-7-tudor.ambarus@linaro.org>
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
2.43.0.687.g38aa6559b0-goog

