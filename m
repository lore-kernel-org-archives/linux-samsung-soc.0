Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E51C6BE
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137126; cv=none; b=gptgn0WIwmpz51j+XnM49/fIOJfc3j32tVqs9IOnoguwEb3tgsYCW4XPdFu1T8/QjLiLmxPvflkKSVRe/+WJMIb0CMtdBjsSenp3cCu5Mu8U3VeIvHA8Tp9Mbn9RFYCxstR52dLoWkCDTU9+eAZEZ61g5Shxqa133++5a74BAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137126; c=relaxed/simple;
	bh=uN4pmSgYbRXI2jvqo6UzvAcRTx54tWVkaWx0En1evXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2ggiS2HX+TMh2mqiqz6xodW5y/PcgDVSyqXHNJyDbCWJmqdoJpb7uJ0QUBFNUO16dmNloCiqz7N88oMWCxZY0OeDzja3wxSNDyx/xf8JYELF986/6rNz3AQlPjuPsMqU9TqgTYVziPGPzFNFV7SDpIy6Uz7SaiQIPud/nNlKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZaqNWtV+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZaqNWtV+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b2960ff60so1123470f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 04:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137122; x=1707741922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR8F8TtLujJzML+VHbYFd966gNYU8tLxVBTCD/Qpmho=;
        b=ZaqNWtV+PIeH/DoZrTyOqgIBIeqcDVuC4BIb2sMNv0aCfubHXOnvNnQPgv7zN/XlTc
         isjlKtovaCOc1y7IvXjFdhlmFML8ixdb8KpW86oNP6+brY+OSeclBO1kqV3DuLOMH4kB
         TKazF5fvChRPJnO12Ut2Mijz+zgfKjyDC2WNLKIf/jXDppc13MVHIRDy/+lhngDBNjU8
         XVTpPhk7VPK/8z2S81xA1z9BfBBsZA28clzNko+zQFBL4+xOlSrXvZV7lkVMekLX+TVd
         x9WSTzRZtjjOG9RPYptKMyW36ZMnfzIEEuhZedD3B4VqJLKsEtN2c2KZBbSHsak1XNVW
         nU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137122; x=1707741922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR8F8TtLujJzML+VHbYFd966gNYU8tLxVBTCD/Qpmho=;
        b=kBUSEOGeaEwESpjH5hYFEYKROhe4ZxTFLnXR0pERgZvyjSJ+OPry3XBg3uko62jG2q
         g/J7AvrIsHrOKMWURdCRX+UNTBX/xk3qPoHvdxWexH+zo0X72oHb/6IMpD/ULve210qQ
         xGvHo4Y2+ssHNAaSmbmVy5MqYZ/9QxTar2230FE9dcqFrOcfMdzUECRl/sxYcZ7JDuly
         cxqcfpDhAHOdlqcP4egpBYiWx91V+Dm7g4WLn5Jy8iSQkHIiW4c077R5Tl9CfYgpBUWI
         NJYmBCpajLeDt+8o9KWi+ls8Bo1s5iQYpYimCcaJQZ3AroEucjlpuu5HpNaRRYyZlYiO
         mk+g==
X-Gm-Message-State: AOJu0Ywdj4zC7DgdH2FU+yEr9RFDSDtalpxsiNBP8/uzwj7wuIYZCr+I
	URHiyChMpVDpd1EaMED3ZY8nPftb+M8Z1HfJOiqF40B+8qWOe8KC1v2sC/8ZqA8=
X-Google-Smtp-Source: AGHT+IHCuUmi+aZgBfk65jmiz0AIwSuZ9vOXcT90pjJQzz+4Bn7QZ2XAsQmQC/0j7e9WxwoFjwSkYg==
X-Received: by 2002:a5d:400c:0:b0:33a:ebf1:2bf9 with SMTP id n12-20020a5d400c000000b0033aebf12bf9mr3498784wrp.21.1707137122511;
        Mon, 05 Feb 2024 04:45:22 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXl4yO1d8qcT/Zxvb0lobqGRNH7mNE0zJaKCteLlrfEU+JyL5wm+nZfgc3HDif717jZhnK8AwmpbghCtGct+2Q4SODKEIqEnCEHt/sPiym8+bPgxcAfnqA02Ugtre04fhpiMpg0MNX1JE1IVOgtRrWroBjq7Qj5MjMpKpu5CcWwA592/JgYX3AAxwL9HXrQ/3vuohqfTyORMqCNSlS0EaxsQ0ciJKjXwAhR/1GhvyYKmmlVixm8B+MAFM43NEvIKPIHWZmO41pvSnas7pfGoocPlN2I1qUWwExsUfHAvRR3ae9tSP2+VDIAMWLD8UycDNRRe+qlsnzfMctaHdmcWLQzk+hkQuyveQHQiTQyRRNIXNFSquM7JhAeKRy5pezKZ5tuTkkvn8PAUinD4LHmMOmyuqwkknpYtNubu5rdUBAV7N3zU8BHQ6rn9wvXbctFHxNjvS3V2tmvud97IGGFNigC4qmZmRx+bda4Rdt3ZZrAKj0K3XNHhA3/liOBog==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id n9-20020adff089000000b0033b35da384fsm3650812wro.33.2024.02.05.04.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:45:21 -0800 (PST)
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
Subject: [PATCH v4 06/16] spi: s3c64xx: remove unneeded (void *) casts in of_match_table
Date: Mon,  5 Feb 2024 12:45:03 +0000
Message-ID: <20240205124513.447875-7-tudor.ambarus@linaro.org>
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

of_device_id::data is an opaque pointer. No explicit cast is needed.
Remove unneeded (void *) casts in of_match_table.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index ccb700312d64..807270ec3c8a 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1512,31 +1512,31 @@ static const struct platform_device_id s3c64xx_spi_driver_ids[] = {
 
 static const struct of_device_id s3c64xx_spi_dt_match[] = {
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
2.43.0.594.gd9cf4e227d-goog

