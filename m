Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102559B64
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307491; cv=none; b=dozwrjH5+BqywKrZUwAJMS5ZuciDTnqmiPslabO2MetHBMIK4fS3KkPSLoGjSAPXEBe7BMwPNJKpp1E8G8Ceyo3+krFM6aqCIC8S4sqRQZSIfnMYsn61zObPyafaFZTLYpHqYtgtKexr3mn2CtPMgKJhsLQvvFc57MUxqpkciP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307491; c=relaxed/simple;
	bh=MCBLaiXFLZ7M+NK59Ukh3NrRPGTmDqv8CpxlLWx/SgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opCN6N0Ziypd3ABuN84xjfmbHAHekQ8uav6E+9GNeFXyOUZ8jlCvTl7kynlPA36HzFb5Zr/5DsRNSlLa0f2DfeI4aJHS8BQH1xFb5TIjdwfJ7An3uguJ+Z55u3/3jsDm6INI3LoQb8Ksv6lQLcuNhxdonVWXudeNN9cOmeCFNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5vAc+8I; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5vAc+8I"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40fc6343bd2so4518465e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307484; x=1707912284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo986RUHJCgw8tyGE74Q2IatMWC+g/lf4ayZlSvDSkw=;
        b=E5vAc+8I7HYhWe66VPk274J9seOEBt0grY4LrDI1Fggiqf+t8DhgVIz2H61skjsC9y
         zzYrvWUYqllJfCakLVyCfe7c8OYcB7FoaZSst5Kwd4y0LNr5UX12giTvuhlRJXMsv83X
         XCag3IEvZB1+VJYVq8VckmmQ5cQ/SASdj3hgNn3MUqV4UspXSelUfuVVRDL1B7lIf2Wf
         hmbg1BPqX1bG5trOQ9e7zpthOddLQrltLrI3aQe5VL9EnZF7yFxGwK9AWuJjeMl+Lk3C
         5JTGMqZTMkcHByTDvnE7S0ze1Xj/IlCaa8Tu0c+7B83EdeA/67O6hB4xSaN2Lo6pknZh
         rHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307484; x=1707912284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo986RUHJCgw8tyGE74Q2IatMWC+g/lf4ayZlSvDSkw=;
        b=LbY1eoje7VfItO6ji3xP3rndx3IpVp+MZhsG0mbgEGpkomfmqc+4wnzCSrNLefv6fx
         bjOWgL6Xg6JlTcPtFWXf52aIKjMKpKQ79Us4WcuvFpUiqeWZDsF0uZPgfIo9bIj3rtc4
         qRwSDCQmE54dGfPl+H5yeZy8wsAjsWZ2me/VTRAizSkDJy0hoGgdUxI+bf28UnIvc0YP
         XxRc0zN5VWvNPq/zWmAJpqiykyWD0KKJcZogSwN9bQtsccF8NbikPZceJB+iOWHo4/xS
         LcbXMCpqyjd/VGiOhoUcC0Xa/E9g5stJbHLFQnPKQefxio3zRKyJSAZFtbQlHqq+Av6m
         s5Uw==
X-Gm-Message-State: AOJu0Yyjgd7SPkPxyxa3IpfetwludzUGqnR5VZOXOuX34XKjbY4S4KwS
	cobmMOs4gbHZ0iXvrOUJwFiN58VeLKmsh37WV3H02L8iXG8ioYZXOXbF8vO5ATg=
X-Google-Smtp-Source: AGHT+IGWSum8JjV4ymxYiYXXEAM7kyACzbsi6K6VdwjjNADXGPscXXjdSHj+++738Z8/fcUVjpYPgA==
X-Received: by 2002:adf:ea85:0:b0:33b:525a:8e11 with SMTP id s5-20020adfea85000000b0033b525a8e11mr130793wrm.5.1707307483927;
        Wed, 07 Feb 2024 04:04:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9QS2v6p0kI4fnIqq9lhLW9G9N37bMjCl+FN9zcjTiKvKr9xC1kZOr24JeZVOt+8dloUI7MyxZa0M1CKuZLHj/o3/ZzYP1yEoRlbwXUZ0tV8Kzaf+mWVhbIaOV2V4MoLHNSM4bNa9vC4v4nhEF4RfpYrFpPJFMljwPi/uFIrQ54Gx1GJIiovTyOMp2F83PA6myulA7+gxulYdvscrd40y/bZbno+UMBIWFoMECoRJMuP37h1Z5XwDuejjiBNqsvCGPQX29xEwOIsxSBYuEOC8MAFGSSZFZV089G2oWelE3q6c6gxSFLIi2pxitiDnU+fCTxbBYFPtiLESIaaStNnm8WjZ0HlcZsS+Wc97kglcwv04vSR5X3gV8cKGaExSa9lI9zM6N7naWum9ufYVqNGcQPjp+o2s7uENXPgLs9aPUiVAXqV8daCAadneyMCI4uikqX0Tz5b48evSDNnuuQdLJOwo/PqBknRjvF3bR/tO2Y8HiN0UohR7fkVEI7A==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:43 -0800 (PST)
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
Subject: [PATCH v5 07/17] spi: s3c64xx: remove unneeded (void *) casts in of_match_table
Date: Wed,  7 Feb 2024 12:04:21 +0000
Message-ID: <20240207120431.2766269-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
References: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_device_id::data is an opaque pointer. No explicit cast is needed.
Remove unneeded (void *) casts in of_match_table.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 93d0e55e1249..e3e7d625f3fe 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1568,31 +1568,31 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
 			.data = &gs101_spi_port_config,
 	},
 	{ .compatible = "samsung,s3c2443-spi",
-			.data = (void *)&s3c2443_spi_port_config,
+			.data = &s3c2443_spi_port_config,
 	},
 	{ .compatible = "samsung,s3c6410-spi",
-			.data = (void *)&s3c6410_spi_port_config,
+			.data = &s3c6410_spi_port_config,
 	},
 	{ .compatible = "samsung,s5pv210-spi",
-			.data = (void *)&s5pv210_spi_port_config,
+			.data = &s5pv210_spi_port_config,
 	},
 	{ .compatible = "samsung,exynos4210-spi",
-			.data = (void *)&exynos4_spi_port_config,
+			.data = &exynos4_spi_port_config,
 	},
 	{ .compatible = "samsung,exynos7-spi",
-			.data = (void *)&exynos7_spi_port_config,
+			.data = &exynos7_spi_port_config,
 	},
 	{ .compatible = "samsung,exynos5433-spi",
-			.data = (void *)&exynos5433_spi_port_config,
+			.data = &exynos5433_spi_port_config,
 	},
 	{ .compatible = "samsung,exynos850-spi",
-			.data = (void *)&exynos850_spi_port_config,
+			.data = &exynos850_spi_port_config,
 	},
 	{ .compatible = "samsung,exynosautov9-spi",
-			.data = (void *)&exynosautov9_spi_port_config,
+			.data = &exynosautov9_spi_port_config,
 	},
 	{ .compatible = "tesla,fsd-spi",
-			.data = (void *)&fsd_spi_port_config,
+			.data = &fsd_spi_port_config,
 	},
 	{ },
 };
-- 
2.43.0.687.g38aa6559b0-goog

