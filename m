Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C276C8C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400259; cv=none; b=Z1AAPaKkZiEqrHGvuUkfqTjfMdfrjkDHnmfEAl/cUbHeppWg8DIsua0SjYkyJQh3ySuRnDD4VxirexgWL7nxcNjSxyLSG207Oab8z8Gt/VuMSzlPqNEs8DpnaDQTso/g5AiDcRVblmsCssKZB7tF7qnpS+867Pq3MgVj2uEAT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400259; c=relaxed/simple;
	bh=1ZMGRL2bdDrzE8jpO2TRP5Gv5JmPakVuDy7jd5uzp9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVDl1l3bVJdM8ew85qkxgahWsjwonf0c7KN5SlInHSGIdpr/DbJTxDWdf2588DAmrNdynJakG11F0I27oDWldZ5+HHk78qVC/lnH+h7KGAO/5tHLwOwB3/HwBzFnGmy9cZWrcPnxkHwPPmyJPt2Def5AxGF1+iVwvMNGZKg26K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hvMXUvZt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvMXUvZt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33929364bdaso1195427f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400254; x=1708005054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YEBZ5QgPmZi1uvEzjonJi8xfKR7wdfW/zkTSEaERIc=;
        b=hvMXUvZtA3Pg7j29jByKAIQFUWuHAeUUDwvE83Sd+kNZ5aJ94RJs5JLIFFadNvmk8y
         f/V9YEofeJPlLKgOswc0MdcDA6NLU5j0khABvPOlcv0xTbKZn1Xxd7z9bWkEjsRqSBFo
         kRPDIAqHfqJkQ61w7P0dZSFT85IKbAKgds7eaIct22m6D+IIfllDzkFtO+5AhlffjujC
         UE/rp+/AQ4VI5sLup0KCnu5RJeJOCQG0gv8NNK/IK+zh7lORyKOVUJFmmwhoFK0XCHSd
         ql/hK/A0jlD5+qznzYW/C8iqXwX+hVA9XEDDSW68xkGjOGJ20tHlZpecMxgRlF84JEyR
         nZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400254; x=1708005054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YEBZ5QgPmZi1uvEzjonJi8xfKR7wdfW/zkTSEaERIc=;
        b=iiF+VMZHJ+zB4lcqe30M5Qmg0b/XxaN8uarhPvguVKgWYD/hoiVDYSzREu8YDMy7GJ
         0tEd8wH2eHYizevGYjq+cBZbkHU+sxUZQmEyzWm+mLpsegepUFJgVrxQIRPoIWSZ3YJp
         QO6GFxlrWVGF4iooRTtDjcnQ0vSSE/23I8vV8OY0il5vjSo1Ywo/JOCM8i6ueKdHdhPO
         p4Zv9J2TycFN6wQzAmtEKGVu6Nd79uHYJBgsNnm+qVh/FrCvuwB584CB+V6PBIwYwJlH
         8VfNDDROOoBhoKJ3vw4YuAMmEAbfQ1r0HEywowLGAumu7sPtvA07lksguXx8sd+xpmF5
         kkhg==
X-Forwarded-Encrypted: i=1; AJvYcCXYjRo4WTIqD+JhI+/lX/CwWU7ejXivYTYvntcPIX4oUU19mvrvVrKK2nVhAMZqKAYf4Jj12xCOZqzVLMPHd66VT6oYEqYvdHIspUQpIzitfJM=
X-Gm-Message-State: AOJu0YzCeZnDt3yLNLkS4wodBh9M+FfIWMEoKSMq4emu8S7PWesOMJD3
	G446myuhqpyVUMcv9nXPK94S7Njo/LIRgAKR09DBJXGovAjuQTpTjFVuwxzHKZw=
X-Google-Smtp-Source: AGHT+IHMgA2PTpx02GbHwGXGddiAvWoJzshxLH+HMllwzXkC4uJls4f1ViCTp3LyfivnFk4bDUdHLg==
X-Received: by 2002:a5d:5f83:0:b0:33b:4b0f:b98c with SMTP id dr3-20020a5d5f83000000b0033b4b0fb98cmr5840144wrb.32.1707400254314;
        Thu, 08 Feb 2024 05:50:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXy77dutz1VU6xXuTIxj2tJMswynamJg1ebyd6+aEfyN3Htz/4BEuJbOklPxKtkH+TL1v4D9CFF1xqdvHVvJ7s1WjkIKm7LEx42cs5D4R+4yFcx9Z6qY4EhxtRGzTXWlTD9XsTq0TiJz+zHPVjb+GCA3kv0CIVcWeJMmifrH5AYh5OiL76n4y+8Knh7jp6oDnocil9wU9AkH+2ljgNeKLv4IX2mWCuF7z8jIP0cnrzHBlVNjTjkhoEDfYh1e5We+KeVPg6SGJRxKPIsS+QhQIeu/oCEakE+3g+6dkUGg0bz+Y7ekszXCqbxodOjEq2T7mgxpRbOMTpkfji6LSAWIRWIP1CcHWiDsfNWshKCEcV0ihmjwqMmPDqtEitAr55TD2+05dXzC2JqL4oFIpQX4k7Tw/Q93qKJF6JWncHiX9eaPnbj3qTlzHIKUUK9hhHaYiwSQMu1GJTfGxFTWiGFCgTMQLdbkROf+LUt891vGtqAL0VrhqghQZQPeCdbk2GBh8bxvNOQ+FwhEeBW+rkTxLtovQSKf7fkgDtpg+S4xNd9FO1BPYoM7vrumm3fhtjg88d7KcSep3aPL238vlRalFk0OPm828tgj+QC0a6DTQ==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0033b43a5f53csm3618820wrh.103.2024.02.08.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:50:53 -0800 (PST)
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
Subject: [PATCH 02/12] spi: s3c64xx: define a magic value
Date: Thu,  8 Feb 2024 13:50:35 +0000
Message-ID: <20240208135045.3728927-3-tudor.ambarus@linaro.org>
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

Define a magic value, it will be used in the next patch as well.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 6f29dca68491..6ff3b25b6feb 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -78,6 +78,7 @@
 #define S3C64XX_SPI_INT_RX_FIFORDY_EN		(1<<1)
 #define S3C64XX_SPI_INT_TX_FIFORDY_EN		(1<<0)
 
+#define S3C64XX_SPI_ST_TX_FIFO_LVL_SHIFT	6
 #define S3C64XX_SPI_ST_RX_OVERRUN_ERR		(1<<5)
 #define S3C64XX_SPI_ST_RX_UNDERRUN_ERR		(1<<4)
 #define S3C64XX_SPI_ST_TX_OVERRUN_ERR		(1<<3)
@@ -108,7 +109,8 @@
 #define FIFO_LVL_MASK(i) ((i)->port_conf->fifo_lvl_mask[i->port_id])
 #define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & \
 				(1 << (i)->port_conf->tx_st_done)) ? 1 : 0)
-#define TX_FIFO_LVL(v, i) (((v) >> 6) & FIFO_LVL_MASK(i))
+#define TX_FIFO_LVL(v, i) (((v) >> S3C64XX_SPI_ST_TX_FIFO_LVL_SHIFT) &	\
+			   FIFO_LVL_MASK(i))
 #define RX_FIFO_LVL(v, i) (((v) >> (i)->port_conf->rx_lvl_offset) & \
 					FIFO_LVL_MASK(i))
 #define FIFO_DEPTH(i) ((FIFO_LVL_MASK(i) >> 1) + 1)
-- 
2.43.0.687.g38aa6559b0-goog

