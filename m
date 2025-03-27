Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019E579E1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080072; cv=none; b=fAA0SSVWesQ75KEZN/amxPyLvjGYvIEXR3x2SqD5ToLEkP0CnruQFGs7uONFqG6TrS3o8/4fkUQrWpqChqb6hbS9dz8Hz6t3teB2/col63a+MTiZLtFE2QCUKZzI+v7qaeCx8ZEhpIKrrNj/0M00LMrz5LuSckwAd0TQh2MbM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080072; c=relaxed/simple;
	bh=vc/k4SllpV6EN2gFtfaNPm/iTJqimHgfmutvogY4Y1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaAxsczluZ4rruTjAPm2zAhcXx7xyFW0moLe/CIlmEPdNbNMtlS7yv7UotgO9AHOjs23Nu4V6sYPClmfmBQwPVt56tOonD0kSiJvWZmMQHh3qO+tywFSXDO8X2nBx9hmBSYMuCCU2xi9xQyR2BI/tAXn+4y8dPprv9nmBRle46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pF2dRpih; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pF2dRpih"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso1728914a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080069; x=1743684869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Z/jDuhjhyd1JpWgs6WS+2WUmAmbmIAQ7hooBmpGTW8=;
        b=pF2dRpihip1aWR6YJtUyP7LzUnWTLxQwgSL8u9ZR35FUNpQ6Itj061zHO2h9eJuQxJ
         aUry/ExzTKXzEmMz/wR3i0LWaGVx5OGZmKTqwO7D9q7+QQIsEn82I/tjj5WbMgS3A27R
         K7O/JgumuoTGx9ZuRIaAVQbVYuohRdB0CojxrQGPvQRxHIKPXz1rxRKmkpF7nC/sR4rE
         AcvrqMGEGL1sgpXZxPJfYVzvGgAW+yDgTQyFVZj6yVHZKkDaeokpYrT2qAE0Wr465CYb
         9+UZ/SQmCiAmRiwJp5bXVgwVbArjv8t+bzD0+kXCo0R8NCJbbJt7W8c3KFJf56nPE+HP
         kAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080069; x=1743684869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Z/jDuhjhyd1JpWgs6WS+2WUmAmbmIAQ7hooBmpGTW8=;
        b=AMS856TzuErrH1IkOvqPiC3PPGYo0NMBZNcapkt9OjlAZUMjJRiQ/aSfQqzsUty5yI
         UBnBdI4xdB/N/slm+qhFeVENVnka84jHSnHamXU1tTkXp2NMHyhmg/JUc7c9sLOAnMaQ
         G+0BTbCEb8ujpqi+Ky7HuVj4ZX/lwSa0hDzQudVCjEuk1kisfZAac+Y69ERxisQchmvI
         5J42whqNslMBObwoycrTLxP0m3H/W31LTYuYcU1TBPKFTaRvwoLBG8VjLY0MUzrgViVd
         h14DEEaYKgm7RuIOizFl1vqopDQMnREo0/GXgrCrLhJqpaZC1v6/Hs2G77+Qp+oM2b2N
         AJlg==
X-Forwarded-Encrypted: i=1; AJvYcCX/IUeKetaHWfCL/DO8rUSq8M2EKcyAN/nnuhFimCM15nE3hQi6wjUnv2b03SSI1yAVB9xEWLiS3jnzgFkEs5KYjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbC6gOc+vObIl33BNlRk8VNoY3WFfUKWEYLn0FEXExhwG1P4Oi
	1RIz44YwmPFy895ytwdTUqAO6p8fcTnV9JT/EnRwKTijnY4au6kv8qxJyp6Fb1Q=
X-Gm-Gg: ASbGncs+kWyLMgWD9Nw4MsE+KOfUa1i8+AfqnFotfugCBqj3BscQtwCQo85HiWGr0jN
	Hs+q5nCIFVDXQfqYr62vtf83tsm+X0DxM1dpGt8YLUjmUp9nroROxyMBVg9ojy4klo1wXYqVdJ4
	6cj9cBPzRHsUilwyMQEyJ+vxwIAzhu3f5nTnMyARjTkFyZkCLhwZioFEqpbQuNya4IG6557TeXQ
	vVSoPj75gVBiTYL1v44XxNOSlf+Mef6rDTTd4fz0ij6iwP1QtN+Q3eXTw9YxzeLnwPue9lNMyuE
	U5zyaQX+1kKiUidzO90T3QYp0X7PudNh04F0Wv29ggnMzJFZG7nqmdnFa3m4zk3fAYcdXfMrUeP
	swpG+41l7ozxIQ3x1M8VBWyKYunon
X-Google-Smtp-Source: AGHT+IEXg6o4yUFie+ryQdY3mXcS5e/X89zhbbzwruTHODYlp1URcLQKOWy0BfUyFCsrxe3Lm/Qyhg==
X-Received: by 2002:a17:907:9446:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac6fb1444e7mr264757666b.48.1743080069187;
        Thu, 27 Mar 2025 05:54:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm1205410266b.167.2025.03.27.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:54:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 27 Mar 2025 12:54:27 +0000
Subject: [PATCH 1/2] firmware: exynos-acpm: populate devices from device
 tree data
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-acpm-children-v1-1-0afe15ee2ff7@linaro.org>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
In-Reply-To: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

From: Tudor Ambarus <tudor.ambarus@linaro.org>

ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
ACPM interface. Populate children platform_devices from device tree.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 04c73692383b17ace33e95ce9534101bc68f089e..7873cdda127e4f1b6b2febccd054ba27aeaf9b28 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -633,7 +633,7 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
-	return 0;
+	return devm_of_platform_populate(dev);
 }
 
 /**

-- 
2.49.0.472.ge94155a9ec-goog

