Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6515573F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739518381; cv=none; b=nnKMps/SbwIwEtAzhEUMYn6H6ZsbjYODg9M0CCdZ1sFjdIB5Ljrzt/EpRUevRTUG7acnuAVzhPL56frWedj++d6N4ccoHsQ0V44RfC6H3D7aqoTCaVwWw8o1iUVkkejQJOVS7W0gGdb9odbvnbuXhN70keYVYcu4gbNfoThFu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739518381; c=relaxed/simple;
	bh=qroXXeauOVL+Iovn6a2A4yrahP1v9fykcfW2iddMnS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bZAMGKC6fnx1kRdiPPrtamaQtV023OcWFw42oa1f92Pf+gDSrV8DLDZ66CXI06+Mr8mrRo4Vn2Ur9Byr6KZByCMIZ4JBsZoxGTK83+nGeelPnNPAzJfuJJXyGMgy8M//3CcDaWPF0hFeMTDpiDA+HQ/I6aodT/jaXZq5oCE1LDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHZ4IOu1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHZ4IOu1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a39e659cso12090555e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 23:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739518378; x=1740123178; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shBU7AF8cc3Gg0wYtL5qbOpWyX+VBS6JrNAtiNUzXh4=;
        b=YHZ4IOu1XRgQ4UbWIpLBcs5tLQ6S8O5Jae2W75YjqI/t9P2PcfurXhs4GCD5TPCNed
         S0MX/SqaTYZ4JIEBvC+Z8VOlrZPKA8UorEAhpfGAYLotg63zB/ThPnBAynCkLGs/WvJH
         g1G3fAO+MPb80tXRDwNfULztgYXengQHi5KdMtMLAbteqri9hx621GXJsa5SO1cfpGmC
         xVX1ChvY0Qkp00vRYqaaStpvZXoe6huXX8zZImOnUb1reLGNcd1gpZXJUU9sT0xPpvMK
         AJDEx6lcMeJk7Bbw44oU86RSxVQ2vkToQABRUu3kuzjsomrdunSz50qMVNY/hPQ0FbsM
         8/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739518378; x=1740123178;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shBU7AF8cc3Gg0wYtL5qbOpWyX+VBS6JrNAtiNUzXh4=;
        b=cxPZHLGn5FU51BxMWkABkeD5HpPaWbHzM0B+0ecWOVAPAFwbs86gP4awKZKLGI9IJ3
         z2NTn3XoKeSvQVuez0pacIBy6tLraEM1wG7cwCQnsasVyt+cLYZRRbyhW6MoZu4eRKD9
         A5dtnuNL0/pvWFNl5fzIZe59MENnNgLM/7C0nDLXkNWsLFxcFI57AWy9VYF3KCFR8Qbd
         0rOVC2GDrOkC2wPjTWNrY8ZtS5bnB+mVgxjXiYeNk2a7A1hzXqxpc7fI0VqPoT5lQCch
         UYJ8PeDxKXlBPduVmzvoNF1ldX9agHVZIxpxIQ/z8mpxYFUAMTZzaNdCGf5yBglOveFM
         hKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXQQD1+LpqEnj819g+YvWmiTwOnkG08ZWgu1GDbosLemt+T7bAFYjxSIjjwV94UNKYwdgq7bKtjvJKpUbG/gi3kIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX0QwJzyrRfFrpKhQdo37U9xYccyaU108itRaC1cRtK2oZVIvN
	BQ4P6Jux073gfQdoxFgJ6K2fZWd++8j4TxAPmeNdBHIJyGxXyr1hvrY4OMRMXU3waHMXbqtsUuh
	0+lo=
X-Gm-Gg: ASbGnctXUQVuBUWOa3B41dI4uD97dXur/syeE0yZ0xjNq35Nvsi30RMHzeNQg+gl2Y4
	t0jNhwOkXj76e7qtRY0rVPBiOaK77NDHWk6PwPV522sF6WRqIVSznYeSzbcOiCiZ1Jp8LFuQY9w
	6tOlZeoc0IfHD5tvHlVK50X1DIo2VYeaunSEmsN7g4ENrPyr1o+lPHKo7r63L23PR5lnLVq1GFs
	UOd7oMCt6Gqze6BUFiNboGEfLx0bLdTQ94eVgy7bw6p/DK2PIpsiueXeKjFC8nmI9mr9mIEEwR8
	8iM6P/3aY7NwJ5lj+W8aXNgulHb3679zQE+OY6c/8mRiCYoM4azAU3BUnAi+xnh9qmsyA3k=
X-Google-Smtp-Source: AGHT+IFuIc7UiGCJhgZrFsDUkrGq451Woe/uSGjG7ifl7lmj2MKi1SN0qMavFWZVChA7j+uVL+MrSQ==
X-Received: by 2002:a05:600c:a00e:b0:439:688c:c5d7 with SMTP id 5b1f17b1804b1-439688ccb9cmr14257345e9.14.1739518377759;
        Thu, 13 Feb 2025 23:32:57 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617da779sm37914255e9.7.2025.02.13.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 23:32:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 14 Feb 2025 07:32:51 +0000
Subject: [PATCH] spi: s3c64xx: extend description of compatible's
 fifo_depth
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKLxrmcC/x3MQQqAIBBA0avErBtQK5OuEi0qx5pNiRMhRHdPW
 r7F/w8IJSaBoXog0c3C51Gg6wrWfT42QvbFYJTplNEtSmSUZrVtzhg4nOgpXjva3vVBK7eQa6D
 EMVHg/I/H6X0/Nv6BHGgAAAA=
To: Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, linux-spi@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739518376; l=1528;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qroXXeauOVL+Iovn6a2A4yrahP1v9fykcfW2iddMnS4=;
 b=pC0wnwQmYJD4VRMIu0mEU35gRvOsR5+nV7P0t6kj2Mi0FELhmNG6Z28A98l1CakNjcGIhYM9U
 cVx5nVDITq7CFuVM5o68gNDX3iuVdvCxa9gdRYs8H2LLzjPOiRybBHF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The FIFO depth specified with the compatibles's data is used where all
the instances of the IP define the same FIFO depth. It naturally has
higher precedence than the FIFO depth specified via DT. Specifying FIFO
depth in DT becomes superfluous in this case. Extend comment about
compatible's FIFO depth.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 389275dbc003..9c47f5741c5f 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -139,7 +139,9 @@ struct s3c64xx_spi_dma_data {
  * struct s3c64xx_spi_port_config - SPI Controller hardware info
  * @fifo_lvl_mask: [DEPRECATED] use @{rx, tx}_fifomask instead.
  * @rx_lvl_offset: [DEPRECATED] use @{rx,tx}_fifomask instead.
- * @fifo_depth: depth of the FIFO.
+ * @fifo_depth: depth of the FIFOs. Used by compatibles where all the instances
+ *              of the IP define the same FIFO depth. It has higher precedence
+ *              than the FIFO depth specified via DT.
  * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the field's
  *               length and position.
  * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the field's

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250214-spi-s3c64xx-fifo-depth-6787f108be83

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

