Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B95A7B8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307494; cv=none; b=s4T7Wm3Xl9p5uXNTWWMRu8jre9dQ9JD9y1avYpPXyXCXaRsAuHbxeHgN/VvibdUKIlNGZ0hKltx5f8TjBTAuxYERhkVXVull5C0FzGAOQOKFDuRoBLUZastHMGaxHqeFCP6Pw8c26apgoax8/diFHzgATSZafLWPnFBJ+YGUbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307494; c=relaxed/simple;
	bh=kdGbLF6iJyDmWdAvnXmpZOdcHLnnYqMOt0A/+Z5JkEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWwxpnzYnQenFfe4asWasmlLKPeZ4km//DfB8cPzA0qoTS6N2cj17TDpf7vdpIba3RIEc8IrgIPLGXfXJuj8+T/EpXOVrWaTAA8VNxvpfYqm+ukqP2ZuuGKJ2BQKOtoTvfX1qBw/Dkf/uCxKrAXTfM0Jbxjnn5TTCLcakfPo4JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvXK7X5o; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvXK7X5o"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33aeb088324so391016f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307490; x=1707912290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txkWFjXph9hZknSg86bxlVXLA+ATzTdcjT+xz3ha6R8=;
        b=PvXK7X5oAvFmPhMllHcYsSA3rb50BXRzON1PV+4Avv5jhHBKMhm0AgIOZTcyuPVi5E
         60YPXNRXq+ZEB7sOUeYLCfZaBlvCWBTnU8D7ykiIE7kfYyw/DWXNoyp9udaWMnHyM8Ll
         ogQW9Ke1Kb4bYlZxpLab8mgYQ5ZsLmA8B13wHBJZtxCsZ1IG8YF18Yvw65ycBu4GdikH
         mXpwsb49L/nlszOMY6BZkURjd8fEFUYwpjRuir1QXrTNcwVsTr7YQ79sFmyUBtU4hj4w
         yWlJXmhgNCEMdyYZ/VMckthroyea73QNGy+jxAgFGtJowYGJtmnTnvhvKKjT3Xh9Wkbw
         KsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307490; x=1707912290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txkWFjXph9hZknSg86bxlVXLA+ATzTdcjT+xz3ha6R8=;
        b=CU3YP0zMfnKSJB+jFQE7+eA9FhHbVj/Al0GKiyfRrnlwpoO+cmQ+fHl4hpF5ujQf4S
         +zuEna44IVZIOOsfbgh5nV/znSGTJwwDVRL+WbQmvhC1dEdYOeXgwXrZmRpmlqUg3VYN
         wBPt9aQ98m6qEc6Sy//Zy15nOXfSbD6wSziaYrnZfwkItE5mb5R37g2kxdTmlsGfc7zU
         XAa6uL3LGyzlhfUTfD1zNRypJp19AMKQ9CFywQm4ZexWE+ZEgIVAJz9wPpMB6Lsgpokx
         oX4h7gFi/z1oZFVqLxHZdRbHAXxWPBqA7pcLiEZDYCyuaxgXOe3CBOzJ1dPbaaI6+WiV
         JnNA==
X-Gm-Message-State: AOJu0YykBm+bv0QfahEdfD5JCel3MDSw99yH9qflYBmuLU1UrdFHFZow
	8u7Vho1YyjtlYau3Fbori38Pwjm/jcpMD7BYNPn73X3tr7nCHYDzHFDgh3DuzSo=
X-Google-Smtp-Source: AGHT+IFeTN6wfhaVpSblA8kzgrtFG9R6BE/gQX+sizE+n5nfcFk6BEFcG9gAge0rSlWZksqj6bg/EQ==
X-Received: by 2002:a5d:64eb:0:b0:33b:48f5:b5c7 with SMTP id g11-20020a5d64eb000000b0033b48f5b5c7mr4711508wri.11.1707307489970;
        Wed, 07 Feb 2024 04:04:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0S+0NvDpeYaqtK0kX4HKNTyeuKIoCbhT9JX2zrhoZtTAFLxzrio96HJOnqS/xPkTRnyrxxlaximNFjgK0d5eoLo/TAsq6pAG7RPkopLgXTje2TNr5s0Qw9K/1iblYAJT/Nvul/kMncvzBRAeefTXyGaFlIUO5dopvRxyBlxo5pgvA6JsaD8NxCdiBmhy8xvaNRnXyTG5Dcrw1iavjn2VLscWZyMN7rqJ9Vv6aT4vh5WW6kSGU2Ts3zR/ECU8/6/q93PRn3jfUWHTSJm71953zzYld/METrS5ApsxPuxK9cxWLP73dzADRtRj0mn39jBRG6B7q7NUVouU0KHPok7gYmFZL+9urqZ9yJDk13hMoqMJWowfTiiywP1o9m595/rLEHzbOPvZG82mkUt0JzdAyKicjJW4WJimVp6IyU1qTIDAj8UHkD37w1C89HdLmYMuL0L36Ik68Pp+7F3dp2h0HL6tGPs9Nt9J97KDtlMOg4kgcS3IRUFKXRm769Q==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:49 -0800 (PST)
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
Subject: [PATCH v5 12/17] spi: s3c64xx: rename prepare_dma() to s3c64xx_prepare_dma()
Date: Wed,  7 Feb 2024 12:04:26 +0000
Message-ID: <20240207120431.2766269-13-tudor.ambarus@linaro.org>
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

Don't monopolize the name. Prepend the driver prefix to the function
name.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index ba17c5a04eef..4cafec877931 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -281,8 +281,8 @@ static void s3c64xx_spi_dmacb(void *data)
 	spin_unlock_irqrestore(&sdd->lock, flags);
 }
 
-static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
-			struct sg_table *sgt)
+static int s3c64xx_prepare_dma(struct s3c64xx_spi_dma_data *dma,
+			       struct sg_table *sgt)
 {
 	struct s3c64xx_spi_driver_data *sdd;
 	struct dma_slave_config config;
@@ -497,7 +497,7 @@ static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 		chcfg |= S3C64XX_SPI_CH_TXCH_ON;
 		if (dma_mode) {
 			modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
-			ret = prepare_dma(&sdd->tx_dma, &xfer->tx_sg);
+			ret = s3c64xx_prepare_dma(&sdd->tx_dma, &xfer->tx_sg);
 		} else {
 			s3c64xx_iowrite_rep(sdd, xfer);
 		}
@@ -516,7 +516,7 @@ static int s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 			writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
 					| S3C64XX_SPI_PACKET_CNT_EN,
 					regs + S3C64XX_SPI_PACKET_CNT);
-			ret = prepare_dma(&sdd->rx_dma, &xfer->rx_sg);
+			ret = s3c64xx_prepare_dma(&sdd->rx_dma, &xfer->rx_sg);
 		}
 	}
 
-- 
2.43.0.687.g38aa6559b0-goog

