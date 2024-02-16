Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2317BCE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067172; cv=none; b=pBkwIhenk/5LfJAw7SXhXbHgSm0OjmXKvuYS5MxYN6cfYHf2JiCmdg6PJIY5thctOv346IRDJuGudziKFHGHFOFC2VXY0n0Qqc4fZSWDc9pb5yg0sDC9FWpFoujUVF0jDBZg19DWLyUzuPmpQjRlNkeq000jmGY37byPR5SmbEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067172; c=relaxed/simple;
	bh=Q12iQnFdG2iZ85QopCuTAOBD4Ofa9upNXT0gtIFtD/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHcsY2ky0pSWZQXc8ToiwqgXC7RJy/XG/hAMxxNk+sNvxVGJ0Ct+e5YXzu5yoHzSNqtwvEhSInRNNEU4OC1OHNTUvzOPa844L5zU94lqrpPr8C6++TtpqhT64EBPsA9qNXTp1dJ7Mns+QbSpezVwIG3JeGBRohl7xvyJB3ejjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RY078VYN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RY078VYN"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-337d05b8942so1091508f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067168; x=1708671968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6DI6oxyBGAOnmgH57nVgi2YtxfkZy7vqtRyT86aOak=;
        b=RY078VYNjo9FRPbhZpQFDaXaDRBwAJFC2FjTsr51EbNVwFbYxstosOhzie+rHs5zMu
         jQnfg7eeINjlEZP3DCKiaHtuqy432YeESeXiQrwH68fqileR+OnYPwHiF4OQRrjbv4n/
         x7oNG6x+5cqTIZ+j3tlfJuNb8Aa77noPULgvJzHu1Mgs1UsJXTJ4492psh4WK/g3meD0
         bc8R7yfG60wmUd1GfZ3C6wvQsY7uT6FVDf4eF51dzZ9Xvinme/RC7+hPDOAQ4JEWsVEw
         2uKzWwonKbH3OHoBksufj7bM5oKYhaWJP42q4OpuXCk+f2Tl/lOfUa7eh6FXCjOLY9we
         zzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067168; x=1708671968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6DI6oxyBGAOnmgH57nVgi2YtxfkZy7vqtRyT86aOak=;
        b=g+v7FeZ50XtY+ydtokU3yUGkOE7qPZeaUbwYnhD20ZQH/ZmDqdnz7e9S3AiCu3/qdv
         pb2xusqtOlyMQyj9kEISrqyO8isaqDB2aflbEijnL0DKe5W04aBg36Xa8X5JJOu0lcIw
         w4HgXodrbeLaY/Lnteu09BS1IyQYNsMAvqw5f6gWKnsbMh+rTnRcA5/n8m4TERGVrv0C
         r06UzoWLA/2fBOMBC/ohgV5u3b6nhenFJAmUBRp87nKg2VxCTCneFSiXRCP0ay4UZW0K
         Vpkrcr4ydaVHy5d56git8I8ckEpl2AIEOlb3pVcB+X+28l3QC47mI860lkPiMjnWwue8
         r8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfoshJJBPvOn6CC13KEQSjIOR/o8H/S4C2f/0jv9R+V+FXOuKprUzmMKe4x2ct0gfjBvUTAdPEtM/9gE2ajcUDSjLvuI5OglVH1iPIxB4M7xk=
X-Gm-Message-State: AOJu0Yz56p6SSVIXE3fQdUM7cmHdFRMviMUeasrXe6eAKfe5wbvmdK/J
	dgZKwCdsJYJ2UDpNcaNM7KK2L42ecwry1bvaAUbbkgJblsL9iqJDhHuYfqqsEmg=
X-Google-Smtp-Source: AGHT+IElxq2xk6aiqP+v7vVmB9Rn+o8tE/AamjN56/HIJFwjBwNBu23xznmMSINpOQWx94t5lmSSfA==
X-Received: by 2002:a5d:6190:0:b0:33c:f968:e243 with SMTP id j16-20020a5d6190000000b0033cf968e243mr2968421wru.43.1708067168666;
        Thu, 15 Feb 2024 23:06:08 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:06:07 -0800 (PST)
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
Subject: [PATCH v3 08/12] spi: s3c64xx: introduce s3c64xx_spi_set_port_id()
Date: Fri, 16 Feb 2024 07:05:51 +0000
Message-ID: <20240216070555.2483977-9-tudor.ambarus@linaro.org>
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

Prepare driver to get rid of the of alias ID dependency. Split the
port_id logic into a dedicated method.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index ac47755beb02..40de325bd094 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1200,6 +1200,27 @@ static inline const struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 	return (const struct s3c64xx_spi_port_config *)platform_get_device_id(pdev)->driver_data;
 }
 
+static int s3c64xx_spi_set_port_id(struct platform_device *pdev,
+				   struct s3c64xx_spi_driver_data *sdd)
+{
+	int ret;
+
+	if (pdev->dev.of_node) {
+		ret = of_alias_get_id(pdev->dev.of_node, "spi");
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to get alias id\n");
+		sdd->port_id = ret;
+	} else {
+		if (pdev->id < 0)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Negative platform ID is not allowed\n");
+		sdd->port_id = pdev->id;
+	}
+
+	return 0;
+}
+
 static void s3c64xx_spi_set_fifomask(struct s3c64xx_spi_driver_data *sdd)
 {
 	const struct s3c64xx_spi_port_config *port_conf = sdd->port_conf;
@@ -1252,18 +1273,10 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	sdd->host = host;
 	sdd->cntrlr_info = sci;
 	sdd->pdev = pdev;
-	if (pdev->dev.of_node) {
-		ret = of_alias_get_id(pdev->dev.of_node, "spi");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
-					     "Failed to get alias id\n");
-		sdd->port_id = ret;
-	} else {
-		if (pdev->id < 0)
-			return dev_err_probe(&pdev->dev, -EINVAL,
-					     "Negative platform ID is not allowed\n");
-		sdd->port_id = pdev->id;
-	}
+
+	ret = s3c64xx_spi_set_port_id(pdev, sdd);
+	if (ret)
+		return ret;
 
 	if (sdd->port_conf->fifo_depth)
 		sdd->fifo_depth = sdd->port_conf->fifo_depth;
-- 
2.44.0.rc0.258.g7320e95886-goog

