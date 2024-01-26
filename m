Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5D21352
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289361; cv=none; b=Zs5hiH0yUfjX2qpiNlO8UFdfFbsFppLg2RsInAKjcP0PgYnnT3G6Yt+DpeF2Zq8HWk/LxibRCk2opaGC7SGaotZZ1SAOgI/6hvkf6J0a3LTo6ZUWRxbf9cuTRZ7cCj86OZmzeTl1F8lGNGE3ACrULW3vDLQiFq0wyaakafX8q7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289361; c=relaxed/simple;
	bh=sdxE7dtZ2UGuWO+rcbDjJI+aHitLSmW5QV5kKZjEQO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF1pGxxZbhRFkK0VW/MCtYlhXZ0+E4iUHkuUiHmpIdpVP0+puNTue4Tbcj/9ETlLVrYYIwdIif6Xmibd2WYC4t7goT6h6BT3DzjXreBqN44zulI2Erk08xwmLMiS9/PffJKihxFrk7U6M/dZyP7qtaKlNkm/lmbXsJufGWSIPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPl1UOu/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPl1UOu/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso12372725e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289357; x=1706894157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4xVKWwugYgGoHizGIdwlg/22zyZrS4EMqmySuw93Sc=;
        b=yPl1UOu/YtSB3RNckXuB/Bx+nE0HSlnqe4KTwgt8LWgo4R2UUyqQGPjJi781srZ9S8
         mHz+rERjEi07sBDhmfhslGYoj7BsFYoWWVx0q2LJD4+YQhPjUKGLF9vyqWc0kkL031fp
         nrN2ZfQdWywvjg1UzfuUEBa59JrNFFHu8t5hJ07M4+j3sC41WOBg0L7FC5dSUa51YPgA
         oBwW0x3V9zcVna3YHrtn5BOIMx9DGVOa+i3aGhWqbLqzDHFgdf/XPsT9XPI4N5e3F1CB
         NKcwjUfFtIXBsqqRBqY5ofIaYC5W8hRFbP1HTNS8K4vzjR0p1odGU5KQ5GBSbz3fHnmA
         WSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289357; x=1706894157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4xVKWwugYgGoHizGIdwlg/22zyZrS4EMqmySuw93Sc=;
        b=H24JfcnjsLmkwnYjSXOwZsOrDl18chARbh4M6o2a2z6hEcPPQNAY4ISQrwLZw1fMFT
         c6Wo1oKmMItieYgS86mPlBX2q4vTdXuncxOS4YUfUvnISibGuoZ1aUBmiHbhGk0NnU+f
         koWLVwJuTgluLKfrZyD8KoGIX4xEw4RSN+veARFDovOQ78c9TyZHvZkgnSvrMjv0vX8g
         GKzrocVFbeSElQUrW1gzLUTnrHeXsDMFTy8z6EyNIcR618GZRcI+wT7U07iDOV6NAP18
         kfF3pYOLvasFgqLb8el3WgF2zyMvD7IIyvb3uC4n8J4FGmmFwuHCF7Y4oh1gIjuZpYRX
         wnmw==
X-Gm-Message-State: AOJu0YyqSuMNgWni59DjnNAD1qcqC4x/EPm2qT/4xY3Bb8OOKqBuONBf
	Iv65ITsEUHC2lvcAQCWJImraC5spadoQ1gPqVbQcx2aPgoFk620lWcPF1IcmtGA=
X-Google-Smtp-Source: AGHT+IEXhDE4nufHz0/LUuTfSrWjuCL+iH1BoKlo3v9opQn+OxuMuntV4aZh2UJOeFdGIflbLzWWYQ==
X-Received: by 2002:a05:600c:3144:b0:40c:2417:3b51 with SMTP id h4-20020a05600c314400b0040c24173b51mr73223wmo.74.1706289357772;
        Fri, 26 Jan 2024 09:15:57 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:15:57 -0800 (PST)
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
Subject: [PATCH v3 08/17] spi: s3c64xx: move common code outside if else
Date: Fri, 26 Jan 2024 17:15:36 +0000
Message-ID: <20240126171546.1233172-9-tudor.ambarus@linaro.org>
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

Move common code outside if else to avoid code duplication.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index bd2ac875af59..bbbc4795bcbf 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -291,20 +291,18 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 	if (dma->direction == DMA_DEV_TO_MEM) {
 		sdd = container_of((void *)dma,
 			struct s3c64xx_spi_driver_data, rx_dma);
-		config.direction = dma->direction;
 		config.src_addr = sdd->sfr_start + S3C64XX_SPI_RX_DATA;
 		config.src_addr_width = sdd->cur_bpw / 8;
 		config.src_maxburst = 1;
-		dmaengine_slave_config(dma->ch, &config);
 	} else {
 		sdd = container_of((void *)dma,
 			struct s3c64xx_spi_driver_data, tx_dma);
-		config.direction = dma->direction;
 		config.dst_addr = sdd->sfr_start + S3C64XX_SPI_TX_DATA;
 		config.dst_addr_width = sdd->cur_bpw / 8;
 		config.dst_maxburst = 1;
-		dmaengine_slave_config(dma->ch, &config);
 	}
+	config.direction = dma->direction;
+	dmaengine_slave_config(dma->ch, &config);
 
 	desc = dmaengine_prep_slave_sg(dma->ch, sgt->sgl, sgt->nents,
 				       dma->direction, DMA_PREP_INTERRUPT);
-- 
2.43.0.429.g432eaa2c6b-goog

