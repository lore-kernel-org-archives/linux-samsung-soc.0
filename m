Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEECE225DD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289371; cv=none; b=ZVJ6xJPngxJHErARVClCAWGbySEQ7f5J1oNEHlQz4i2YWsv/KA4ctXEQXiWJCW0ejuJoszCS25klaL39OkCwDUJM/sTmeuuHDzC5Lsn3oGW5TBFyzP0kBNOMkkYoLXnZsjvVKHKTV8Gs/YO1SpHUAKWrDNA+0s5K4r9KlB9XE0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289371; c=relaxed/simple;
	bh=Lda6uhylzUEwPqctZ/bYWn6dBNKjWS7g/L6QLlibWu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGmIosY1bcdt0LzgN6luwr5oTSDt/AzKxG4cLjyV0OtsOgu7mXXV983d2wtyH7udKvhNOmFm6fly7Sl3pDa0G8KLpY6Usa+Hxv18vnRNtbBq1d0eK8KMAZvFK1IQbWBgPTROsj+r+LqeJ3v07wwNMDLI92ao+OM+Fg4I7o0eqCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtJIxCz8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtJIxCz8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso785473f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289368; x=1706894168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWAxzMIZUJGbfnyG/OlNotr0pMDtQfjiFLXbcGRYeAQ=;
        b=qtJIxCz8OkSFzWLgDtIjstS8l0+8d/rbf/fgq+ilcKgyEzuOjb+oo8rx+UbeCE28nA
         sXCSI82Yalf9Mw5r4liqjeI5yp8v/DWV0YjW7UvOE8Eucbrl0Rw/5GVw7fSUDJxygVNK
         t6nnSW7mPLZg/4XnqIS8rwcKQul5f56j/4t8h/sb6P7cooZPSoVEI3SV1//qFUXL1Bc6
         6t1RMPPuY8+jpBW/3xLOnimhdwBxZ9/gKiv06NwwyvSTUwK26Yi+WJHwy6rrgWp7siRO
         fLO7TOZKi91PnLr2+24Shj5qpF2VVjNxnC4J0fPmUVvlw9OZrX00zVMdEOpTGgnVP6h2
         katw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289368; x=1706894168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWAxzMIZUJGbfnyG/OlNotr0pMDtQfjiFLXbcGRYeAQ=;
        b=cDCFIe8KRVEbbmkG1kxPN4ZC9mhleb9klO6z0BAGRxh8YCDE4ylS5rEMiMiKJJ+GWE
         /tIcMqPnUHWxrn32U3tdKx3OJG3JShDHSiYmwGCNcrIQ8Prn30YEYwtXKOmQ35RESUkm
         0h5UwlmnRpDACyYH9soTlRZJdByHl7PqBMecIjs03NjGX0tzfGWKB/bBizOIy8W4+LLU
         GzZ3E+1K29/rRqxHXj09QcHbP0EvjHnTA/3Sud8H+y1S2i+o+qHUjx8Apfg5DSHgq24A
         6jSj6qdTspS1SLmhwaN0YcE74eIVFL5uPJpodOazgfd7fGaaGwIjRjw/IAHbLl8d3MV3
         1T2Q==
X-Gm-Message-State: AOJu0YxBHth0EWEd2Xt/UH9GofbI6R9dMv/Z9crHb/yLu7spwS17UOEo
	V91WZDGONnx8GtwhMqQObtt7roM6f9Dhna9X/In/lykpEycFbWi0jqQPOf7RVS4=
X-Google-Smtp-Source: AGHT+IGsOiEDkiB2xffnZw17FMX/xnuVHZhIvhWnxlSn6346ayQ0rGAqxJqIWl1P8tDQMLFabx03FA==
X-Received: by 2002:a05:600c:ad0:b0:40d:5f48:d1ed with SMTP id c16-20020a05600c0ad000b0040d5f48d1edmr89438wmr.66.1706289368230;
        Fri, 26 Jan 2024 09:16:08 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:16:07 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	jassi.brar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 16/17] spi: s3c64xx: drop a superfluous bitwise NOT operation
Date: Fri, 26 Jan 2024 17:15:44 +0000
Message-ID: <20240126171546.1233172-17-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

val &= ~mask;
val |= mask;

is equivalent to:
val |= mask;

Drop the superfluous bitwise NOT operation.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index e9344fe71e56..43b888c8812e 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1089,7 +1089,6 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_driver_data *sdd)
 
 	val = readl(regs + S3C64XX_SPI_MODE_CFG);
 	val &= ~S3C64XX_SPI_MODE_4BURST;
-	val &= ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
 	val |= (S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
 	writel(val, regs + S3C64XX_SPI_MODE_CFG);
 
-- 
2.43.0.429.g432eaa2c6b-goog

