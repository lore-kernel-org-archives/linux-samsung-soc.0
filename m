Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A8617BD4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067169; cv=none; b=p+GZTmf87QT0PhdDWWto9NK5K3ddA3kJ+7RV9kN/3Rdy+ZUJAL1ste/5EMK4k9hQggt8kScwoOqjHf2SfXyB/s9K9aSbPMJxDPrgKHDEZE2bkVsqTKizhz0bD61hNto9BLKF0yGdD31ZIgOwGy1BZ7z0rIpZKk6sHwaXcdtK8JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067169; c=relaxed/simple;
	bh=A6brHfiw3JDp5JkUp4QyeFF8EuAKOKzvuHfjCHdzjtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjFj36Srs6R4j5H/50rH2vhSId/g95NtKqZzehkBnpcQC/fs9+eNcAhhSz224cv0YD/i8sA5copnc4HSn4rTSqWaOVu5mRNXXbUHd34UpbegTtR1gI2FtXgDDy9NmqvJxLNRVVdApdzewNH4fRtWdyM9dXCi3nN6QHe7fH/TqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhhqgbgK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhhqgbgK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-410c804e933so12136255e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067165; x=1708671965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs676vE1oPrjFgO93552CvPBZ3kPEUhKELlxqPQ87Xc=;
        b=hhhqgbgKwqAfvCySjHTt9sGCLKlL2A7CJ7SmC9fZhG44dNv78FIP1zSPAgIxtTA7lg
         7TbCAjWLj9IggIjOVZAB6yFrYoFKizKXbLkoALr7kI1E/5+b9RVmyZkaLdrIvNdE+qqw
         Fdb5mSuh0vmqXWfHiVgcH3qUMrP9ym2Asy8lDED9iBNQPi4JECOGoMAg4OhE390NEDcn
         R4W23LxdZsZFw71UHTF9/A4RKRf8eiBv6eZF7M4yIj3oxT/Gb9I70e0Q7VaZJfEm+T7Q
         LC6c8d6lcg+b7RNXrZ0PaBScUN5EMIzouSAmI2TMsP8TvtjWfWEPMD2yNSnnYOkMczaS
         5wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067165; x=1708671965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hs676vE1oPrjFgO93552CvPBZ3kPEUhKELlxqPQ87Xc=;
        b=I+jJbMrWCz/O85DwZMWnQK+eWBV4xXefeVxel/zSTUnM5V1sF6RfhlchvFyCQVzIGH
         5QqQ3loVFcFXPuENAsf1UH+iVtRM196ELzEZiMeooA0WNauoG2tUgheObrXSkpIZ3XxW
         OQO14ZA2H8qfXtWr4di6chjM71a+ffAhQoxRwo6vWgLdM4QHqO6c177n7E2aiZC9ITtG
         j0Zur3efaWEhP4jLMzmegimUbFrbcpJr97uJQJpgl5lFKNDq8FNtn1luEes9OGVbwBPz
         z/PGM6sjISdVMKmOR67ph+m7gAOEsLo44i13tIk563SMd3BZM2R8ZXNuY9TgH+bvqLhl
         nXdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1PFPyLOy0QKg7dUv78yVFfx6BGuWKBYlyR+1j/3+Co41dEc2TNv44Y/dmjGOW0iFU/7Q5w8DJmuq37i7iP+QLRhYt6tclcK/muk/JxBabJP8=
X-Gm-Message-State: AOJu0YxHqK3JK+J+NgKJ4rNAHImVVRYAtv9wVj9CCdGn4/2ci5HWjHiE
	ATw4ynWljFTOLlfWqe8AKnhITLH4ag+J8ZpNTRNq9g+AzaLPq+QlzXvmgZhhPi8=
X-Google-Smtp-Source: AGHT+IEX/hwRNYuZKtcSXuowtu9eyX6oqcbcAj35MgfKoCBlzipRM+KMcdgRqx7r5x1whfKYCDnT4g==
X-Received: by 2002:adf:a446:0:b0:33d:4fa:5e0 with SMTP id e6-20020adfa446000000b0033d04fa05e0mr2453175wra.66.1708067165166;
        Thu, 15 Feb 2024 23:06:05 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:06:04 -0800 (PST)
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
Subject: [PATCH v3 05/12] spi: s3c64xx: retrieve the FIFO depth from the device tree
Date: Fri, 16 Feb 2024 07:05:48 +0000
Message-ID: <20240216070555.2483977-6-tudor.ambarus@linaro.org>
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

There are SoCs that configure different FIFO depths for their instances
of the SPI IP. See the fifo_lvl_mask defined for exynos4_spi_port_config
for example:
        .fifo_lvl_mask  = { 0x1ff, 0x7F, 0x7F },
The first instance of the IP is configured with 256 bytes FIFOs, whereas
the last two are configured with 64 bytes FIFOs.

Instead of mangling with the .fifo_lvl_mask and its dependency of the DT
alias ID, allow such SoCs to determine the FIFO depth via the
``fifo-depth`` DT property.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 72572e23cde5..b1c63f75021d 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1263,7 +1263,9 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		sdd->port_id = pdev->id;
 	}
 
-	sdd->fifo_depth = FIFO_DEPTH(sdd);
+	if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
+				 &sdd->fifo_depth))
+		sdd->fifo_depth = FIFO_DEPTH(sdd);
 
 	s3c64xx_spi_set_fifomask(sdd);
 
-- 
2.44.0.rc0.258.g7320e95886-goog

