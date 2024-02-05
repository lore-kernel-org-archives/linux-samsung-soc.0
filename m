Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03B24B2A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137130; cv=none; b=rInvnNaCBRIn0a8hvxPlj/GK/Y2ollBkGV0zIUc2BWx42z0tcUC26iYFXEvLdTWDHEuRqJc+l/hMe8Bw4a+X+pgWRWoq4jqUIFF3Bwcgj93a35YJ28RHLu/5CU5VhNLaeK1u6svYW/oyMnvq6A2+4gBRN3IzOXTy+/tVPeo9VY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137130; c=relaxed/simple;
	bh=bjmGyFjFxiqioAr4g1XSOAGWrQhhKSgwyKFYExhglLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGHVTi4MVVJKEv2czwopHFR/qrSzoQ6Y8UhTvwRFDV2pz/rBmALkQZQ6yRsMvRg9zQZoexJ3LAvKJWAxb+y1fZ1WNSYDu8530YR1CDcF7smQQEF8aeeATRJQZAV/W5y+2p88p3eAU2+7T4fv1TZniqKptLhPw2gUUW8U/0fKrqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpHrPGT5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpHrPGT5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40fc22f372cso33500785e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 04:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137127; x=1707741927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtonYnG1zvMSmP8RYe4qSrpkG7WWpwfs2mfkmLGPi30=;
        b=mpHrPGT5UJr0ovdh46vE30EcjQcYYa3XvWTOxkNGyHjPL7eDiaZmO03fDC0wBoBgC3
         YJB03qV/99kbTQxc36QqNypUXjXmNoKQAdPhW5k0c+mwbUU98ixUV6nkc4yDSJSQysbD
         CNZwg7tdkP1eolshfqIU9GrwsQOU+Wimqs79/a3gMdPw4XWQt+b+Lf1vIJshb1IbLTAs
         PwWWBgkfHTo1WkBn8IRnSq2R5HYnvdDJPAgxIgYw1PvJXCVi0CUImtnC/LqZEqaecXN2
         I/2h/c1JxSRDUDXRg8YUW54MqFYGxwkwXDV6CLDf/dMnij77NCcLt7SERVtNnCfFiSJd
         fCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137127; x=1707741927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtonYnG1zvMSmP8RYe4qSrpkG7WWpwfs2mfkmLGPi30=;
        b=Rj5n0A2o+DYbDNSnGfIBHoUbENwBZV1Ba1hXEeyIzbdMXY9uyXiJj/+hIUQwMYFQ4t
         GGwbFaM4LE9Jvuf+bXwtjXe8JUv0ZSAm70TySEShveg/5LWenDCJgUcThuYTMtUe43+b
         a/dJZCMltKcUlnJ+bNIv8snd7SZaTwtKwrz9dJB68rmjDyTC9Jbf+nEvM7xBWf3kUJO3
         yU0gAnnxYiuti1S/fCyo+qNQ2Z4QH8YdX4/dMivbSkvLx3Yh87FRFrmv+Qwweu1zv4PM
         L3qfamK3OUQX2ibciMxgLXxWam8uZ/vJJPSj5lLUp1IbydS5H7ixPoQs+MU3Cx8+CgWX
         hyHA==
X-Gm-Message-State: AOJu0Yzp9OVsdvDF4w0SpnLZg3s5ZVE1dXOb1Io7YccQaDKh38oiXRIo
	RGdWC+3Zign7bYXQt0GIYyzDT9XiVLCHmyWWT+iguNPOiwMh6mhYZSBl8Z/Xajw=
X-Google-Smtp-Source: AGHT+IGvOiXo7HPcAuCueUfCXl+hW1dHjHJs0oFybOPNePVj78Eq7mqkrITmY1dHKEpvtlR/onCLSA==
X-Received: by 2002:a5d:628e:0:b0:33b:1494:e4cd with SMTP id k14-20020a5d628e000000b0033b1494e4cdmr8738260wru.3.1707137126957;
        Mon, 05 Feb 2024 04:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUnB2TnwxP2m+P+k2osg80LUiFMk8AYW9KKJixyKCil1SFvymbNwDnyv5aGOLjkdFIIat4WmSO7a4JXLHXn3VISSvM+7RVQcg0Pc0Fb9CO2WjD9q2jAPVAk+Y81aHewTEE1IiAUbWO2KdsWTh+EVlqaA26G3INEN+MW5DD//ZHCIBgpkDe+Q1yXqKZwi7+TZV6oZgWxpLWtlnC/vbOnnxR5hsTMrwcDUDdAcOhChiLGv2Cy+Fee/HbCH/Faz0FVfeE/fIgfQU1IizkzZZUkIk8biLIW2rCUJFI6sj/09hijvYqXudHO+D77AWOHBK8Jgy5aZtvLBRys53v9c3/ru4AGJtK+iGd5tYVFx0GPzDwqTGRYDcIPSQkBIOWaeLWHB0eNBql9MhxloRoKEj+AwfvCosH7A5tKS0fuUekbdm/MbC19l3fiGQbqdyjkJ62nOFmMU5HkynyBAYQUxajpBYqcz0FL95kIBqlij49YqJmlZcSsEDOd9WIc6DBH3g==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id n9-20020adff089000000b0033b35da384fsm3650812wro.33.2024.02.05.04.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:45:26 -0800 (PST)
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
Subject: [PATCH v4 10/16] spi: s3c64xx: propagate the dma_submit_error() error code
Date: Mon,  5 Feb 2024 12:45:07 +0000
Message-ID: <20240205124513.447875-11-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240205124513.447875-1-tudor.ambarus@linaro.org>
References: <20240205124513.447875-1-tudor.ambarus@linaro.org>
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
index 43b9792988b6..7a37f5d0abd9 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -321,7 +321,7 @@ static int prepare_dma(struct s3c64xx_spi_dma_data *dma,
 	ret = dma_submit_error(dma->cookie);
 	if (ret) {
 		dev_err(&sdd->pdev->dev, "DMA submission failed");
-		return -EIO;
+		return ret;
 	}
 
 	dma_async_issue_pending(dma->ch);
-- 
2.43.0.594.gd9cf4e227d-goog

