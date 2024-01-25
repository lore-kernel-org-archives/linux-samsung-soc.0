Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAF6EB7B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194220; cv=none; b=KOhd8hV43OPdjL87bwzMPm4HK+wXo7W6EGRNT3khwMfgpZ7m47J287TKj1Cm2QQFJ2axE1ZDZc3sj9sIo+XtsSxryswHBFtE2JRwVCa6CGdxm4KmO+mnThJDczkxnnQciOQQSExuC2F79UZraRxfVpodrXA8meTpSiN2RL5yEQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194220; c=relaxed/simple;
	bh=wja4sjDZUzyEJmTYDZeNeJO4ez4z4bixbTFjT7SJ0h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlhGcdGLSeST2H7RdwPaVuW/UQ9Uco6vuvl5w8xQ0Q/9uMx0N2YBV6Z+SoznqXhGEYdQSueV/lHKwysbcB/MQnLS+f4Xo0s7eUoU9moVduN+XZIoLRVlJ1ThOYs+1hX4JcBbvmvhiVbf/Kz3+fwfTZKzcykAwmhETEVlG31D/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBTOpaF7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBTOpaF7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so74513345e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194216; x=1706799016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2zGHL3l4HfFHILf65OAbwjVhYLd59O+yJnAHxlD6UM=;
        b=NBTOpaF7eeh0TPXlKqetNLy4En7VUv01JEA7geLtjIlbJ5KIpDYfy59qRgp2uedpLj
         V4SlkiZkPENc/uyHDmbAiBv5w85hniRZp2ysZS+d4U0go2g760lXxETKdNCfcIvDZJq7
         XUjDf/MPVb125HZ6beZyonNQ2LrA/MAtj9HlzX/Hh9SIpoXacLsKKEsWa/YWBQqDc/Eh
         m/ChNf1OFOFvI7aClLQ3agVREUk7CRO+8r+uVRdtjBjqplYv4rIaMUCgG5GknWk0mUHV
         CRNmVHs13Kc9Fzbi+BGuwqsz7LOTk53n0ikZjQuJOJ70/8+N0DjInJ4qBuCm0Lqf6hWA
         WGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194216; x=1706799016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2zGHL3l4HfFHILf65OAbwjVhYLd59O+yJnAHxlD6UM=;
        b=YyBXSQDELYBRSR8uuwN2NTy1vFRfWE80NAAGFBXOi1vsgAiPiEq038h5gbOcKALRjx
         ESl4ozgj+AMPwYH806gnEfqSw0N76mesuAL2O/DYMLJmQS5dR6eLmOSsBY4DjtWI+hgW
         UMr6FSX0wIZFoZSwyJel+J1WuJGkkNxVWrg6AzFMvD8PmPkalEltSDZ5Qsn5/ArJHMA5
         M4JheKbWwuHXdj0WBOjtdvmynqovF3vTyL8aZq/ISsrsY4hWlCk8vD2myhTFWEXjB/j/
         GyE+9vjjWkSrLDJym6i5O94dz9sdKUhrVxwDszGV6nbMKno7trbcFklgcq3xHt4dszbY
         YoyQ==
X-Gm-Message-State: AOJu0YxIyGJMhA6KlQa50+khMefo0DIKBhgGoe+cTrDRzCD5cC3AVEVz
	QqSAlOdVE0MMP67G7FyrllGr7rGptL2v+RWd/pW6bDC9sa30CPP9C2/9nNYRX7E=
X-Google-Smtp-Source: AGHT+IEJ1CIdTrTRD4BA8d8gYFgNBWkIAgKqFXH8Q364GdBqOQzM962Dg8TpAX/PiqTFyXyRbfeI3Q==
X-Received: by 2002:a05:600c:17d0:b0:40e:5562:bcda with SMTP id y16-20020a05600c17d000b0040e5562bcdamr513612wmo.155.1706194215945;
        Thu, 25 Jan 2024 06:50:15 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:15 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 06/28] spi: s3c64xx: sort headers alphabetically
Date: Thu, 25 Jan 2024 14:49:44 +0000
Message-ID: <20240125145007.748295-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125145007.748295-1-tudor.ambarus@linaro.org>
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorting headers alphabetically helps locating duplicates,
and makes it easier to figure out where to insert new headers.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index c3176a510643..230fda2b3417 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -4,20 +4,19 @@
 //      Jaswinder Singh <jassi.brar@samsung.com>
 
 #include <linux/bits.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/delay.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_data/spi-s3c64xx.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
-#include <linux/of.h>
-
-#include <linux/platform_data/spi-s3c64xx.h>
 
 #define MAX_SPI_PORTS		12
 #define S3C64XX_SPI_QUIRK_CS_AUTO	(1 << 1)
-- 
2.43.0.429.g432eaa2c6b-goog

