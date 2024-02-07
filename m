Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4F2557F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304525; cv=none; b=C4humr5IneBr2ow2ebC3v7K8azDD9thA5/vuyRXuyGMGv3MYnfivbP8eqDP+mTD3URgAin9MisY9uSzxeJGc8o7U0ja1ccKa8MzIcZ5PL9bNKYW9hQTSfC0Q1HBkhxegkn2UoW/7jk8QC43/waU3HxYt9Vfv/espFd1EgO0oesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304525; c=relaxed/simple;
	bh=o/wJjcmifG6yfUSs1dsSi2RQKEeeRraIOWfqCZABqdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbELtiSZ+GwH+HSfHjIxRkwDf61qT3ME+FUis96pfeti+oS+Xl8Wmabi3muob7J0J/TIAzTemz+yqQNDn2D9qf5lrVAKynNnACnAJjg9PnxKnIlGlfST04gdKGudPaH0lmfLZAEaKPeMHZ5jkm/6rQY/uiyPSfnnn/DABcj5yXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJvdKYd8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJvdKYd8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40f033c2e30so4194515e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707304521; x=1707909321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8XcmWMrPCGgSQiW78AbqKZG3dzV30LWYZrn5ta2nWk=;
        b=wJvdKYd862kgDIb5wwSwyvlA2dP2aQPB0fx3OOj8Sj0GcI565V8Vm6TMrSfPlpXDX5
         1Kc9B5yRXt9pwli3fDHE37MGT41R8/uTAoIyYFW+vn7IARCzDBM81XCAPRsNifwgpWvW
         6VYpScGxgifxftYCUU8Macz/mxCAUBzlOtBi4xpOPTKkIfy7x6sgg881rOqenrquYXOD
         uc5RfkiBAX45T2OjjlVj7pDjeWOouBoY+JBBkymWHeTOsMd23H8gdYzdjXmvfzlnMklq
         d+IJPWAZV+cNuEVVunK0YzNkiZBEPnp1RKoP0anxFWxEUArhvq7JOn9zvzdeGVYC/HeE
         8DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707304521; x=1707909321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8XcmWMrPCGgSQiW78AbqKZG3dzV30LWYZrn5ta2nWk=;
        b=mBfvbCLe/JRlOx7doZp0vK8chDsvEvV4yZkawYdSmjBDCPM97HDr2FZCH1PC5uCEQD
         IatQD6FxMLLHLXjwS7CHq9owZBPI6/n7Yj4xvrTRIzngUC7lAlWWV/Ye+mhZtTcPdUoy
         DjFP8iPEpDwOS6kJwNzOp9AEEauLY2JTX5KMs54WRv2ol2I3zUkLBBZOxRooxWNExzfQ
         /5przTgQ/jMZaPAMbdQM+VcnmsySp55XY9uIwk1/WFLKW+SwlnGdu6jZFENWH0Qz04vz
         c2yPm83FZTsrcMjTNWDjGznQXLLVmtAm2B09x1TxKnpL2rz9q7o6tfNpmsxe2rbok2Uq
         aQDw==
X-Gm-Message-State: AOJu0YzLuqvV2GjUFwY8YlR1t3TAy3WF3LQtpK29Tkp0e9WJMO/0qBgB
	0/jj1E4uyyljhFCrf+U/DOfJIPD1Nbj9GJneZ5CcTfWAMfHocL8p6TIlu9htzss=
X-Google-Smtp-Source: AGHT+IHhAlzVOY3B/+bWhEASytG6LTCOy7YUe7jUKPq2qdZL6OMhfZ75BzgFAg2T1kUMNJ1cT9onwA==
X-Received: by 2002:a05:600c:46cf:b0:40e:a32c:988d with SMTP id q15-20020a05600c46cf00b0040ea32c988dmr4057504wmo.4.1707304521284;
        Wed, 07 Feb 2024 03:15:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1bYTpXyorkK/1JuK3jfVAVwjF4wHMZCtBydXAl+0AyUWFNFEHeU82TvRj8suDQdqEl8CC3VxUyRYgEDJEqvx4lxbIs5TKO31WgN1wnGWzGLNuPtv8Oo4DM62kh1pNiLfpBTfQAHnAzCM/d6/XtLPK5uPpJeTnDmeDcWjwT/tjqsqPAJsj/iCvUEvsrP3tGL/PjGt8eMenR0MeAtqArckdmLhUUCnr5Jb8sqJCgNa4+1co3amJwtXCWCfpVxI573zNN8Wg9m3moxZmDkvy1IJxj9oSjsZrI1FD+H2nwrDm60X6AYuh4rrt0QudF+prqaW0KABSzD9LuTffb1jGQc+dbOyu/h6/rwhB8/M9/njiVj7H/RPXlH5zcpEuIIW1gRk1gG4m4CJtOFRsKawKdCIKJ3MiC1pls5jxEVo0gQIlRXulBRYHkR1pYCbUmxojKwBgvfVSsIaqx+O0QoyezCfO1BUX5zq7+gl+q67aexyukL0AqRVvZFOgkO/sJSD2PI8pZ9Uut2mvzd9JSEhXCzT7eL+b56d/z97FjieGCYK+ECzzBfUvtcp7zw5dgT8U03KCJkoz3BGWYmv9M2HkzeQinQ==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b0040ec8330c8asm4983260wmq.39.2024.02.07.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 03:15:20 -0800 (PST)
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
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 3/4] spi: s3c64xx: add s3c64xx_iowrite{8,16}_32_rep accessors
Date: Wed,  7 Feb 2024 11:15:15 +0000
Message-ID: <20240207111516.2563218-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240207111516.2563218-1-tudor.ambarus@linaro.org>
References: <20240207111516.2563218-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow SoCs that require 32 bits register accesses to write data in
chunks of 8 or 16 bits. One SoC that requires 32 bit register accesses
is the google gs101. The operation is rare, thus open code it in the
driver rather than making it generic (through asm-generic/io.h).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index eb79c6e4f509..014fcc933c90 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -142,6 +142,7 @@ struct s3c64xx_spi_dma_data {
  *	prescaler unit.
  * @clk_ioclk: True if clock is present on this device
  * @has_loopback: True if loopback mode can be supported
+ * @use_32bit_io: True if the SoC allows only 32-bit register accesses.
  *
  * The Samsung s3c64xx SPI controller are used on various Samsung SoC's but
  * differ in some aspects such as the size of the fifo and spi bus clock
@@ -158,6 +159,7 @@ struct s3c64xx_spi_port_config {
 	bool	clk_from_cmu;
 	bool	clk_ioclk;
 	bool	has_loopback;
+	bool	use_32bit_io;
 };
 
 /**
@@ -414,6 +416,30 @@ static bool s3c64xx_spi_can_dma(struct spi_controller *host,
 
 }
 
+static void s3c64xx_iowrite8_32_rep(volatile void __iomem *addr,
+				    const void *buffer, unsigned int count)
+{
+	if (count) {
+		const u8 *buf = buffer;
+
+		do {
+			__raw_writel(*buf++, addr);
+		} while (--count);
+	}
+}
+
+static void s3c64xx_iowrite16_32_rep(volatile void __iomem *addr,
+				     const void *buffer, unsigned int count)
+{
+	if (count) {
+		const u16 *buf = buffer;
+
+		do {
+			__raw_writel(*buf++, addr);
+		} while (--count);
+	}
+}
+
 static void s3c64xx_iowrite_rep(const struct s3c64xx_spi_driver_data *sdd,
 				struct spi_transfer *xfer)
 {
@@ -426,10 +452,16 @@ static void s3c64xx_iowrite_rep(const struct s3c64xx_spi_driver_data *sdd,
 		iowrite32_rep(addr, buf, len / 4);
 		break;
 	case 16:
-		iowrite16_rep(addr, buf, len / 2);
+		if (sdd->port_conf->use_32bit_io)
+			s3c64xx_iowrite16_32_rep(addr, buf, len / 2);
+		else
+			iowrite16_rep(addr, buf, len / 2);
 		break;
 	default:
-		iowrite8_rep(addr, buf, len);
+		if (sdd->port_conf->use_32bit_io)
+			s3c64xx_iowrite8_32_rep(addr, buf, len);
+		else
+			iowrite8_rep(addr, buf, len);
 		break;
 	}
 }
-- 
2.43.0.687.g38aa6559b0-goog

