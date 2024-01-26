Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430632137B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289361; cv=none; b=nY7XGEX/9+EOW/DjybIbsqLK8PskyP6gC4guX5r+Eu5sihooOuNEy8zoCriHYJgLBSCq1w74BzHIKYBZwamFSILfrznJ+0bAAzxz6d0Vqj2WOYCBOfRe6jgRiAkJ7+r2fp5pR04HoFL4eTctLnZh/NUSn+lGGE61ZOzNWzvZp6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289361; c=relaxed/simple;
	bh=y75/9iSo2GkpRcJq4gCYqWsRblkSJbNeMc1hgIQCUgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sffSvU9ob0Hv7I/s9qaSSdSfeyxbt2QGXJJBrzlCWzohzA1Y+mezmuqmzKUa7oCQq3UyP6umnqfK9Arb5j3922KE4gMGsHsNTfAqYrhwQmlffYPN86Lp76VhcvF+tKlxtv0oXJVSBUW1tuSFaznU+BGu2OJxr+C0Q3+BcAWtWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmT5LQtA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmT5LQtA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-337cf4ac600so705286f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289358; x=1706894158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PFQQe5L+S81TOMoMYxe1V5Ktq0fN4GeqljJCUbv5w0=;
        b=EmT5LQtAItRO7ZXqYBMW7rIn24QTq+SsoQPYpwRWmd+xFmG6h6tJsuA6YlpK0AlvUe
         vKwdnIpNse8PGM3q7gXB3PT0V02knPQfppEOuxPrrvwjFA7IK9KrYIagRFm7orOYhYs7
         9DB0q3d59jAvhjHYYbzvVrlFBcDCJ8txEz0YezTv9uCL4W9osrcTKWshoaHKqt44ccw/
         EXuQplMpKu68q/65diFVFTsw8PTrPF8sivLmrghVJv/IGUMdUKhgMBEZSovEHmIYSxJN
         dIhEix2B5nftI/59xoDrIvYWSrGA7xkAxiO5YZlPNyi5a/3PnHBq97V7qLGK+U5qxZdV
         TF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289358; x=1706894158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PFQQe5L+S81TOMoMYxe1V5Ktq0fN4GeqljJCUbv5w0=;
        b=Mw9cJnp10fCwFo4yFvbT2DG7RPextaW6FG1W1ftOsyWUjLZjPXimwn/4a0w+wynRqP
         EKqA64yVTazIZT5FftRxpgNNhpdPFbVqG9inFdYLynluIO3xHnYqIq4FHT5tv4Hmyl6r
         yZPivWeEWTF37tF3hOiK0Sixz6/OAchHq+nrioZtzO7K3ay9vqiUfrC/DuDKE0lsch97
         CbWnpgQKaY3otwQDWbbE4xEpeGtqVEYVa3EavGIoDFCshQe3cGkDO4+totyEqyOto5kQ
         jVloQ6OVKjYHj0/4VRHlvzYRwKpqdiqzWBmMVb62NI+Rs20PxNcCMFtuwFQtcJuNQICq
         wu8A==
X-Gm-Message-State: AOJu0YxsHp4QWxbzze8rUmMHw2luhPE9qnLEor7GLg70XgOtW51FiXN1
	KY/6+Hfz86+gHBe04+BV4qbEXUbto51aafQ9HBbAMbzgRHAmCfMyc6zkkli8b48=
X-Google-Smtp-Source: AGHT+IEdSfPk+mvqdxvejpoS55NReR4Yc3ryLjfI8k+oBOGs8er5l4B2FW/n7fLGQj8APyuuYj1CgQ==
X-Received: by 2002:a05:600c:1d1b:b0:40e:60c3:c327 with SMTP id l27-20020a05600c1d1b00b0040e60c3c327mr97121wms.1.1706289358674;
        Fri, 26 Jan 2024 09:15:58 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:15:58 -0800 (PST)
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
Subject: [PATCH v3 09/17] spi: s3c64xx: check return code of dmaengine_slave_config()
Date: Fri, 26 Jan 2024 17:15:37 +0000
Message-ID: <20240126171546.1233172-10-tudor.ambarus@linaro.org>
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

Check the return code of dmaengine_slave_config().

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index bbbc4795bcbf..6268790bbcff 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -302,7 +302,9 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 		config.dst_maxburst = 1;
 	}
 	config.direction = dma->direction;
-	dmaengine_slave_config(dma->ch, &config);
+	ret = dmaengine_slave_config(dma->ch, &config);
+	if (ret)
+		return ret;
 
 	desc = dmaengine_prep_slave_sg(dma->ch, sgt->sgl, sgt->nents,
 				       dma->direction, DMA_PREP_INTERRUPT);
-- 
2.43.0.429.g432eaa2c6b-goog

