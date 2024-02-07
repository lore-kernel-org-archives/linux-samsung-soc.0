Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34759B7A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307486; cv=none; b=IeXApN/08akZ17G49focc3ZY4tyh7j+GAyjIjlfF8n1Btvf2a0uvxTmHEkLIMVui06alYYygnvdyMEJnd/ytVOLgpDGWpcg+M5H2MBC01iMg4CaYzAziAK1Ep9UI3iBSXGqY9v7blxqfAi5ub6txfWUvSiCsFL9NCdnNRvvPEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307486; c=relaxed/simple;
	bh=OAR+jflIcBL2EHFTipuv3y92m5gNFedEiIr1Hts137I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2pbOdSX9TrdYYmLXYxakyC67WLbhWC1UameNsQOW8UDS1mR9ZWcqoACNdmeS7jR2plkCsEJuFU4f8YMhHaouriLRX52dXnlPJ97rYqKRZops96t3bJDV6Fhrw4a4VfikpVV3xRkU68CR3KK9WdTXlPoARRrWiKfb3T8o7RH5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Thho7Im7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Thho7Im7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33b4e06c239so421043f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307480; x=1707912280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKeYZPmRarVNrSgEJ2RA2bfdFMbY5j4/f0z54RK04Ro=;
        b=Thho7Im7CV0D5HeaNOtLVl6Msqh1VKkHacS+mDqfYO/Or/kCGh9TYlR3DAQl/w7QUZ
         3pD+0M710NDNtmQ6bwvgVb8Zjw8ueG61lR7zGmKM2Cxd+NkxBPGxsYY+1ASbPqIK/fZL
         TE9wpkd0FxGf1E2RShTJuCfCPfCaq1t1GLAJyzQUqOV4M9yX+ydQPbOmUr0SZcOxFJKA
         hYAdNpS7sd2SU9auiuMbXpIUyP9IA3cx1k/RfEPRGtpoliN3Mj6TjraHZxmWiJeQx7Gd
         8U8vRVXHQR/aCy266xtWMuY5bF5vribM3x8zIKxvMit4pyRoGTBTeD+wjXNhi/MVdi3p
         kcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307480; x=1707912280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKeYZPmRarVNrSgEJ2RA2bfdFMbY5j4/f0z54RK04Ro=;
        b=nDT6JJkJqDjs7zNNwWI2jUlFlTKkxd1onPAoTo0TaJL8ZsPqfo2le+2rFLWgfNFk5V
         rokf/hflR9DkfCCUra5Am+uasqW11MwPebbjlmfJQkGVac1xEdTnOh0D6xHhNCD881b6
         TzK1/u/bdbcZuVQ6SbPvMKKiY5Fuc9f1Por9uUgjXRAi1Lol3o3kf5Dluki9wz+R30oB
         AHAAEGVS+Gwz1jMf4zGC5VzWwzdRPdTX10Xc5jhZFZ27udGo2m9NkNi3TjE9ziqgRpa2
         I0Amz1GxTwVayCFALNWKT9vbCjFLKpyOrVc3NZ96tRI3vGNC9z4k2uiFdTmg3t2OBAtv
         UreA==
X-Gm-Message-State: AOJu0Yw4pgOaP6DpOiE+zX7sfsw5ZWZS2OlktGGJwBFGjBWv/c4g+PzN
	g6c9aUJMSuSN63wTuIzu9TEuhR3ixZatjmHvETZKuf0LUO+jUnGJQNWoIiMx4lc=
X-Google-Smtp-Source: AGHT+IG16uBtP/M/WcNTRS4NKYzE2Pqd80TW+6h6PqJHRZbcdctP+Xdid+Q2vkXyjtwIFRC0HIeXWw==
X-Received: by 2002:a5d:4e85:0:b0:33b:21f9:cd9a with SMTP id e5-20020a5d4e85000000b0033b21f9cd9amr4166717wru.19.1707307479786;
        Wed, 07 Feb 2024 04:04:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJZLqXZGprlWHssMRP5fdnmrfhy0M3YUKVltJCl9cXKPIU9OH+nkcpmuG08whVcjYfQ44PPKJAvTP8e+z3Yfas0wMg/pZWw2jt9F0DI1xNx4m1TV6VZp9pUzsU33UB1xX90TYpm3d5vaqja8oBWLprftGrR346L09q1s+DXi7RZ0UkD/cYVQTdgrMSZRYap048Tr8yqGKW2xY9rg/tWivX5UY4wS39DFTBeYCyl2anxhZ2SIEd8GOAw5lmj47RbUrPWaNBO00RZiGhoUJwI5pAeWXvWufKfTLeRAgqG7ces6Xna0W3ASwxZ34KILqu8swr8N3OE9AqcVOnjM/9JpJf6YI2oReXixhyeOBUMPnqY+LhglZrz6RsoKKCUUhiJkCLW1Q0lnRDjcQo+QMR0u1F+UvVe7PejgtSgaVrxhctqUqPH8kbwQvoXOZ0sqex/PLXYcY0lM6QhMBVA+1Yt5Xj9J211Olk05G+O5K+JDfR1msfhlCZD7q/+W4YXg==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:38 -0800 (PST)
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
Subject: [PATCH v5 03/17] spi: s3c64xx: explicitly include <linux/bits.h>
Date: Wed,  7 Feb 2024 12:04:17 +0000
Message-ID: <20240207120431.2766269-4-tudor.ambarus@linaro.org>
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

The driver uses GENMASK() but does not include <linux/bits.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 9882eb0f4bea..b1564a447a6e 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2009 Samsung Electronics Co., Ltd.
 //      Jaswinder Singh <jassi.brar@samsung.com>
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
-- 
2.43.0.687.g38aa6559b0-goog

