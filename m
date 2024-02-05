Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9733CF6
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137135; cv=none; b=hfWZwdNYO8/49JYjsjheLZmoE12HcSBJn4Z+FKLhZT8opmOOg7pOi0PdjC45ri1Jw5wFkNq1y1ZzzUY4tZtphHkhtn7t4W04UaboMWfD05RuWCqbpvqsuuVD7SdcbAPaRFy0rV9vZc9emXq9C+EAmicxmoxSoreyttVzZLGGgbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137135; c=relaxed/simple;
	bh=nMWHTWDw4FSV8N1BenWt9bH//miQS2pEnl43CiMUQ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcPRegjHRWqVPeSjEoIAAVkbiiSsH58ZGJ0FpV+OpbI8xXsXr0uL7Q6L5/Z/eddElv40IR8J2/Vd0fMVytS4xPlLYMyFny1iLnN7Y2Xivi+OMuEChV4OhxKnvaf/Tj7r0nR/24YH3sBQpe2NqyrIAqFLHzaFrfGFw4ij9l3omz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LLBP+mGt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LLBP+mGt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fd280421aso15294245e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 04:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137132; x=1707741932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQXkAU+74DrdhIBCBHKX2MNDRgI/UgoC8DKW9ZMunl8=;
        b=LLBP+mGtvsPXlZTkgRDGKNLgTeM2KZMJxHpdMRNYmtF6WbF+/0lgpCwwvuK7tTdszg
         pajfrOsMFF63xL392rkiGXf3Txgl3B5WiKII87tqKqoTU+cAecTsnY8ORQW3gObU5I8e
         mymok+Ngh6X7OkGOsGs3grCjkN/0vdSDUBEI6BZ0liCqSu2ALpjRVMgK6HqZo3nnNI/P
         zPZgzjma99WPpmysSP+FZJSv6rv+IlDN3vtWsKCBZsdF/iCXwUC1kqNZtlaNQXL1UfS2
         rwXVaFBJItONKVJ8+9pcxOjI1uulUI+F2NmYZYXrQ7yRKbIEmQVP9+Maxj7GlXh5pg57
         fOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137132; x=1707741932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQXkAU+74DrdhIBCBHKX2MNDRgI/UgoC8DKW9ZMunl8=;
        b=FxIo75EVN8xQZEOwoKcdtfZ6fgeYANXlRjn1z4Eubd1cIXflsvo2rO6cYpz6ylboiF
         Lh0pPBAEsMdEr0U+sAbojd72+TGWzA62dqQcd0exokHISe3H9Q+4iklXGgse3l4AS01W
         MWJt97UJSC+QBeOVkpqW6vOh9LLzXGwvK9k+9CpVePWHO2My2Ymxncp48xhVu6ObaNkH
         pstE3TgDqBd1cASfGDAvUYke9/7eGAozLmSiNNeSeNLs2120N8IYVfaMg7IsC3I8H0NK
         bU2ZWynXErI8Kirsn9R27UrzC58aWt7wiYeI9w+Ug6AaQB1080yx/J2Q7POgGR2bS4YY
         2/Mg==
X-Gm-Message-State: AOJu0YwBQa22XSDh5HZ3n7ltCXZiIaOLVnGbDVbO6EtSNA1ug0gyiIKK
	yO254ZxNAA8/IwaTuLc8HNycGHA6DV1Ni11kP4x3DoYOGfXvsk8QloUZhyEkrSg=
X-Google-Smtp-Source: AGHT+IF7w0SrhbwiPOGLZfv8BIa8of6H+8D1PRONLjMNE0XBKdpEovxHCLmvEEYujDtqITnemVr/hw==
X-Received: by 2002:a05:6000:1ac8:b0:33b:376b:8127 with SMTP id i8-20020a0560001ac800b0033b376b8127mr3215935wry.54.1707137131953;
        Mon, 05 Feb 2024 04:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX2qttf9AlWRBYLbY1d8gb8YqqL+/qbSPDmU1x/m+yaCWDvy07L1ROL3wauST1rGVbRb66EjPIOtlB4n9urmuC6jc87wSzy520b53wDeu2QKN5XqjMaIu+PEGXEtn2PsEEzukAyU3GBbZ6Sh3d1fbai9c99q0GXpW16SJhUi83MA6NNr9cmF+rJT4XDUjW5qAFbK9R8q34VF+gfJsgg7eRJXfTPV1PUwy9A0lDg73R8jnORoZs/RgQ/isCVKdR5yhkorP8qgWX1fPZZns0wex1myEuPyXCjGY88FP1yYOXpvl61hB+5ajhvUFWloaH10FTY6sjpoBbeyXa9UIC1FFORmZLspdFVt5U5PcTM43LzYsuLRANG5F8KTV46cse58Gk5Es8sgGXJjzTw1u2dCU+r+KNu3FOyvQDYTy3HxeCFEIupExIgi3oKRP7Cb/h+ihjduDAV6bGa0+o0EHVLO9kjnYGia/OhRedv/6a3n4v0eIkr9EqK8B2OBiJUhQ==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id n9-20020adff089000000b0033b35da384fsm3650812wro.33.2024.02.05.04.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:45:31 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
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
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 15/16] spi: s3c64xx: remove duplicated definition
Date: Mon,  5 Feb 2024 12:45:12 +0000
Message-ID: <20240205124513.447875-16-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240205124513.447875-1-tudor.ambarus@linaro.org>
References: <20240205124513.447875-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

S3C64XX_SPI_TRAILCNT brings no benefit in terms of name over
S3C64XX_SPI_MAX_TRAILCNT. Remove the duplicated definition.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index a103d9e125b1..ed0b5cf8fb4d 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -115,8 +115,6 @@
 #define S3C64XX_SPI_MAX_TRAILCNT	0x3ff
 #define S3C64XX_SPI_TRAILCNT_OFF	19
 
-#define S3C64XX_SPI_TRAILCNT		S3C64XX_SPI_MAX_TRAILCNT
-
 #define S3C64XX_SPI_POLLING_SIZE	32
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
@@ -1092,7 +1090,7 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_driver_data *sdd)
 	val = readl(regs + S3C64XX_SPI_MODE_CFG);
 	val &= ~S3C64XX_SPI_MODE_4BURST;
 	val &= ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
-	val |= (S3C64XX_SPI_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
+	val |= (S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
 	writel(val, regs + S3C64XX_SPI_MODE_CFG);
 
 	s3c64xx_flush_fifo(sdd);
-- 
2.43.0.594.gd9cf4e227d-goog

