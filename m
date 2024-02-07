Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B345A10B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307494; cv=none; b=JK38JWwV/LdYfBXzEpuWWMytZWdcBGAmgthLOyYoVS2tIIwKL1YAEk/DWsw4dv0dfqZ16neMtJbsgpHj/hoMTTtr5zLPA8u3nNAiUCkWp7FKszhv5G69xVsARuQCjS+oGx6iHXwbR7gmVoNGilnh/lu3Cu2NK5HwJU45K9ZJQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307494; c=relaxed/simple;
	bh=UUTdIh3Xj1RnoDrVpRDf7wnRZi1N2KMZYs/hAqRGeLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djDfTPGwyCYfoe65sM2Ep/uaoooVGBh3xUwElQssl113rBYWz760+QjtJM6zDmgOGeVLi/i7s37rChCzf/O08lUq6AsHOSc1vHtTPW3JSssV9tDv5EdmtUsIEb/riwB1AaYIWjlfn2bz8xkivstRlMvQp/qI7cjSD/LvFVTRrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHC9BZ2V; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHC9BZ2V"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b130f605eso380728f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307489; x=1707912289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyB/rIEWzg0qFsjqRP7XGwF0lM74d/iwYjphW748AMs=;
        b=zHC9BZ2VYIAuvCjT7sGQrvpL5XP0IlBLVfn+E3qKoNvV0C0ItjsMO1huR7mlFp4AWM
         xKhR7vsFeoVDOo5Sq6VVE/YAPtl6mwcQ+SiJ6HEbh1np9Cody/ChjoygE7mKI0CUfKvL
         DWjBbhSuZS1ywJJH1UwWerJEd89cWx5JtZ9wmJ20Sh/D+UOfLcIi5IEoFazw1ydR8zea
         1v6QZYGrU6LnH2lOBJLJz1Cx+FQmruUAhvzgLTIFbWhLl4vESbbyEzkIkeKv6BvLA5ny
         lJMtOGzWSWZjd2gGlUlFZv71ttPkcWnb2G9JtWjVcE/Rspq/w1sc6Ora+w7z+0BpXqwD
         tRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307489; x=1707912289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyB/rIEWzg0qFsjqRP7XGwF0lM74d/iwYjphW748AMs=;
        b=XOUqx/hN506Oz+HJJ6GGm24k46unzuM8V/zws6c0qEgAd/+DhsUQ2PbFuK0vGYRFdo
         nhhwxMp7iAkp5LEjuwS2HKwskqFBkKDr59BS3jjSkJKUvfFk9bw26kbmrq08weLu5HmM
         ddJKTCCDzb1x0ejZXkuqEkkihOqopR/bf9kUfcEYNGMLN4uLOtRUs3T+f7L43hKjUH0w
         62gPnIMB8SDmhJx8jk+DN14/CHL4LqyVmGZSdYFuS0zc/2xJDBxmAh+Fb6zPVOcqetIv
         xMTdWYpZzIF33uMI5kew1EyTnSzRFzDsg4tZn7QwxDpqNo/zK4jH2EvKBCtPz5AlFeAX
         +gSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV26b9JDQFYBDJ9BxRGlBeivLsJjArxtnJzDisNIj5CJPExSOsIbhq5lARC147//Gcj61lga6MT2GM9pyRPJYskuqez62jdRfV7uqKUN/7eO/8=
X-Gm-Message-State: AOJu0YyZlSidMYnwPckDtwpP0lgxVJD7pKi04nY4W9enLqGZB6dGrG4+
	ovlphtYFlH4l4Fy2RUYMSC861dZk4G4RXFJ0dXaZ9E22pNNuvtXa7vrV6/sIt4A=
X-Google-Smtp-Source: AGHT+IHLdYTOpuM6YVl5VQ8KSmozpR6YZJf1vCyR7Jm7pldciiKf3Zxcsp8BxcHt6HVkzpmmahJfLA==
X-Received: by 2002:a5d:6989:0:b0:33b:1ae4:10be with SMTP id g9-20020a5d6989000000b0033b1ae410bemr3112553wru.46.1707307488917;
        Wed, 07 Feb 2024 04:04:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPoi9waljrhcc9Du9f7ChdJiFb7bX6DdMzhB6TZiVx1S6gG/nPe729BwNqPKcVyZuuPdA0jWoPjSZwBlPwgoGv4/+7VcutaOWWT7HZ/3E8KzjuD0LOtpjL0KJJBvdcnNnl7DjKH9MgkFM+oOQxMagBpYbUSNp+A0jDqH8NN2oxDXjkv9Czp7X62NXW5WDOIraHpUkXlQrhFTumVMhvNi2/fuvQOmrhzuwXTN5b0Xg+BD8zux/iMilXXTbwuTHqAP03e4h0gtwf0TXw8YZnH5aDaUAcLltEVIOw3dI8iuambt30B7iLPUkTQcl5whcPC6+OBnzA0glExTxAon0OgcvfTnCNygZplHw+HOEJkdkfLPNEFmao4a8VIZQiPLVaARwFsy4ppTJHvaD9+xssFBf4zYZUcC60X4vqjIWfKWGON6SA6CBFPOQg56CTSps8XueWb71vVnuDitaohl0PNzBRtFUQfoQZtyrmFl5+hfaKawwtkHi2Hh19s739xw==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:47 -0800 (PST)
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
Subject: [PATCH v5 11/17] spi: s3c64xx: propagate the dma_submit_error() error code
Date: Wed,  7 Feb 2024 12:04:25 +0000
Message-ID: <20240207120431.2766269-12-tudor.ambarus@linaro.org>
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

DMA submit should just add the dma descriptor to a queue, without firing
it. EIO is misleading and hides what happens in DMA. Propagate the
dma_submit_error() error code, don't overwrite it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 1f7356f6e5d2..ba17c5a04eef 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -324,7 +324,7 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 	ret = dma_submit_error(dma->cookie);
 	if (ret) {
 		dev_err(&sdd->pdev->dev, "DMA submission failed");
-		return -EIO;
+		return ret;
 	}
 
 	dma_async_issue_pending(dma->ch);
-- 
2.43.0.687.g38aa6559b0-goog

