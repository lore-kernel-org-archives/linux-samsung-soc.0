Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DB22EE5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289370; cv=none; b=gaatlFPASKVmiRda6U+LPb7dXV1md4MEkgP7VTkIjOMF6TD8EefbiVvvSL22q6QkeyhmPC3EfZ1C7V+fG0wieefx/iP1apsvZHyIsjmPkCbuuXYdDhOd3JosazukzIBGRnFlo2+7sajfPuqBasoGhEfpcWZ5fgmWWI1xDRd9JwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289370; c=relaxed/simple;
	bh=bGD0Z5hPEY/4y19pgklQ92T/GvTwYYstRxsthohCGMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPpojwKfwDpyTg27wz6vInmL+Bg0Fs2nfsB60T8CUT654L3ah9QjWaZ1Fxyl595GohtbDvAvuSXJDqr3Gblu2YoKsiT9GZBnXXpZiOhlJ0t2bHuhQ/xAtiduPYSPuofRgB0yon963Molm+TYHRUoKyv8fUlRNaQ8qaO7dhuh/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sz0euFSo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sz0euFSo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40eac352733so12302755e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289367; x=1706894167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVq9gzGN+1aHFWyNtJAgoaKp9sfSAHeIW/0R0QyQQkg=;
        b=sz0euFSo1tA8ZuAwZ/qaaVEGDTR64Vio/AYZqgMBmSC0W7AYL7EVcWDCfzQ0/KlPJE
         d8EFOoE+WAbi+rvAk50257HRG/0LkPfIXMQ49LwnVdc8kiC7jCYtB2aa44rs/D1YK8wA
         GMy1sRvc3BfPrBkea883hS2QFpGl4mDk5gX5jHpsru964GVM8y1WhdEQqzdH8vJujPTO
         QuKWF5y79TqpGVSFRn8KD7OE9mgBzTjokb4OLkFRcJn2oX7Zt+zi8x33zFBrOGy6Vxx6
         cS6/JGDo2YzPeFGXyeitJdCVAVgSFf81+hdF3OI5gcqQTCBEUuvMkX1g8XLJ/iElpe7Y
         067A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289367; x=1706894167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVq9gzGN+1aHFWyNtJAgoaKp9sfSAHeIW/0R0QyQQkg=;
        b=oqFjFL5mUrYGF+vLOhphghw3DajUrYrWLAzblagSUzthcsdvp6m6KyLymcpgqfD/EX
         gxGN4N49EZyZt5UXE7YlA26I7aeYGA0JNga7rCRIgXanREJ+4JElVFhSmMEjltALqjjC
         NlPL1B0XNRnDB7L6cZoGSqZqG1l2My8H5jGrxVjqg4Tnnmsz4ZwjJjcjNXaR7yRQdpQQ
         c+4+cytUhwMyPQl8nvmVI8QqmD1thSL83NAfPYCpg2mJnTP/rReuzV4XTM+TYokUs0BQ
         cmGvlgR78v4su438IrYp3H52j4AuqjvJlWH3H6K533WeHdPfjXZLr+qibC6cOaMu1l9Q
         7MYw==
X-Gm-Message-State: AOJu0YzDb0G7+jCtS7Rq8UqgBBnZmWeDnrKNnuRXqW9mGcCmGPl/l+Th
	4SDiRzlQNnuBt9MQiokTJC1Bll8LfTVTLkejO0pETrB2d8L+0vtSWaeBV9XHEIs=
X-Google-Smtp-Source: AGHT+IFVRdh+nTto07hFuQ0RqYhrZMrRuBlmG3jqU+FgxzdxqJtLZQQ0bXMJzggiSnO7a4H5ktlVvA==
X-Received: by 2002:a05:600c:2146:b0:40e:e241:9347 with SMTP id v6-20020a05600c214600b0040ee2419347mr87421wml.85.1706289367150;
        Fri, 26 Jan 2024 09:16:07 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:16:06 -0800 (PST)
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
Subject: [PATCH v3 15/17] spi: s3c64xx: remove duplicated definition
Date: Fri, 26 Jan 2024 17:15:43 +0000
Message-ID: <20240126171546.1233172-16-tudor.ambarus@linaro.org>
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

S3C64XX_SPI_TRAILCNT brings no benefit in terms of name over
S3C64XX_SPI_MAX_TRAILCNT. Remove the duplicated definition.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index dc779d5305a5..e9344fe71e56 100644
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
2.43.0.429.g432eaa2c6b-goog

