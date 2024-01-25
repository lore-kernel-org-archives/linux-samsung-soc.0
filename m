Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EB86ADF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194233; cv=none; b=XlqlN2ZiGwRB6KZSC+8jqo2jPTLJQGZ9D6wwsfyAaaXivn/zUmNHxwn/jlFj5nUsui9GDK9C2pLM34cqCq0ma1oVKCb2t//vzIFaPIszAcQcp4ly38/vMYrlxD8RB+50Dcg7e2luLCow/RM/0PEttKp7nk92ok+Rzo+qSRIY39o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194233; c=relaxed/simple;
	bh=ky++lUpjV2xM2yr5R8NgpgcPYQ2XfXR8n2IS4sf5ezM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBJtWUr62CaY9vWiV/KLb6l+2tv3Ov2+NXTwBUxYrkp8FjCbgllDS3ZhMjgk9uSN2yU9JKtXUnUhFxV9WnEd2cSoMBgw/e4pZ9T/DXAaOfWI8FwrvOdFe6ToLAKU47+gNwiJUT9vQCOGMnr0v627zABEwE8Hk/Hs+El2zegJrr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TmiF/IpX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TmiF/IpX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so50900455e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194227; x=1706799027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCsZDfh5Q5K/DwuAunrdWzuUCnvHISTW4ss32NHF9x0=;
        b=TmiF/IpX82/+fZtReS65al6nyoIPbF+9gOTJy/uf03WRKAwroyl+mHFPkd/bcZElIU
         vq1eurdLj7biNPfJyDPcFk0LkZjHSmDaQUOQdWqjx//IkDIkv7dHghniA5wI3XotMKpM
         SP/cOW6ABt91oyFYWYl/zABPiIHMvUEx4OAzT90oSz0QzZ+tSybNi25VtbG0vhBGUdT3
         KyDe7QDzHNdS13owh9M39+nRsY6EdsOQ0HnWaB+3gJDvxJ7T8GtjpIQXiv+9I9UoDmUC
         7gw20vQi2Z46I8a08zYcf2aR52zuFsUvaiBBNFfLPWJn81oKVbY+bIUIymjaJVDXI/1O
         YZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194227; x=1706799027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCsZDfh5Q5K/DwuAunrdWzuUCnvHISTW4ss32NHF9x0=;
        b=aVlRj0eUvq7E4CuR8jcDjdEd7/6QwnruaI1ulFtNzMxg8ESMOA7XR1LpxrZEPMG+M1
         uudXyZNoxxA7E9ILV1oKW4ZSBX05KHC1o1jQK2h0ZdVe19GJZCsLcU70Iab4sjLSU02k
         DPJgXOhOuPCs7QgeZAc/1GEBZhBuNNeiehQ8osTc2FGZrfowOvi8kmttbvth7P6DZ+xT
         izPIBB3MHyVTFMaj8nUPbD1JTcqKJJbgJXdQ51oDv1W8I9RDij+wygHfyFVa0g7YjkDt
         w793WzkdvxVw7+Xmo2idjZ7lqE55aGplOz1HcI4EiIEMmWvXaJaKzN8eZWaRTlTXCEnl
         cyYA==
X-Gm-Message-State: AOJu0YzSHEx7OIfwtvz/aH/MV+dnVcUZKmS6wAfTcQRHoNWkRjUMD0Fp
	kHFPnSw29LiPlSHysZ4NahSl6slYFZ+4SyM4g9txbNIgHc9rv5Jmp9+d9q/nmAi0Tp0OXgRzOT7
	zhvc=
X-Google-Smtp-Source: AGHT+IGh12BcHV/dAPX9rARaa3uM3thpkF0/DbdSBRI+KmJZrJjj10wwGpQaaYX5IgM25eGiIJcLTg==
X-Received: by 2002:a05:600c:418a:b0:40e:4ac1:8609 with SMTP id p10-20020a05600c418a00b0040e4ac18609mr575275wmh.86.1706194227540;
        Thu, 25 Jan 2024 06:50:27 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:26 -0800 (PST)
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
Subject: [PATCH v2 19/28] spi: s3c64xx: downgrade dev_warn to dev_dbg for optional dt props
Date: Thu, 25 Jan 2024 14:49:57 +0000
Message-ID: <20240125145007.748295-20-tudor.ambarus@linaro.org>
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

"samsung,spi-src-clk" and "num-cs" are optional dt properties. Downgrade
the message from warning to debug message.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 692ccb7828f8..fc5fffc019e0 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1071,14 +1071,14 @@ static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	if (of_property_read_u32(dev->of_node, "samsung,spi-src-clk", &temp)) {
-		dev_warn(dev, "spi bus clock parent not specified, using clock at index 0 as parent\n");
+		dev_dbg(dev, "spi bus clock parent not specified, using clock at index 0 as parent\n");
 		sci->src_clk_nr = 0;
 	} else {
 		sci->src_clk_nr = temp;
 	}
 
 	if (of_property_read_u32(dev->of_node, "num-cs", &temp)) {
-		dev_warn(dev, "number of chip select lines not specified, assuming 1 chip select line\n");
+		dev_dbg(dev, "number of chip select lines not specified, assuming 1 chip select line\n");
 		sci->num_cs = 1;
 	} else {
 		sci->num_cs = temp;
-- 
2.43.0.429.g432eaa2c6b-goog

