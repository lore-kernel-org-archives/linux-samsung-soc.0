Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9C26FA5A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916571; cv=none; b=JYwu2I8DunXa7SvJnaUsD4Cclqvh2TXcrbu1BFO8OHT4TelJeM814Fui5xK6CNw+58rQkjujzuy3rJfDqgARWw4FOrkFuRI2AjRD4F2xSw2bF67GFZ2rUGA9qIBcu1WF15XQ6WYw0nNMBwm4JDS4xFS9LEDqmqsXwEg8yhFDZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916571; c=relaxed/simple;
	bh=N+d25lIyuA4+uDCjeJ4M6c3noZAy7mbvqBUm6F3f99U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFyg6lZEnK1gLfEFtUny6De2yL0JCG5iFYWlQCBAF1x3oG+9tB7wSBsyPCv49AKPt/Dum7kgDHTCjWrCRUx7UpM0lQnYK6WgLHbXlcBnB9mPzWVObtYWusdTkT7Mke8Jqi6Kh/KNujaUhyaPfNQDI6bBCnF/ZovkxZCA+YyP2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEyG4YEg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEyG4YEg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso7040686a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916568; x=1746521368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=;
        b=NEyG4YEgDPNvvJIt7SwQydrWAwvUCtG2Lr4u7JOvp3gZFZw+oLFJsQB/9nCQEi4TtY
         EDEopsQMAVLYGNMWhej03JWDTun3phkNRlQi6PhGQQN8tnK8ie9BvelaShBJ8/+ej14H
         wMrf/jAkBlZCZL1bqH+kF5RUiDO+MEoGAJpoikhTnIAbsgMv5YBCvq11zlmBeBaKZf8T
         QVF2rWZKrSjaIZDimlYt6HECAFTvSUTbuSGDZJcLVMyU44soXsDHDjbYahdgnrPbKcsr
         jS+Fp64GIv+14twh04SESA9pPs6IJGWAoixDmGrc/H06B4oKseOK4jowysAAg9HCGIv3
         7PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916568; x=1746521368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOHk0EcvHS1m6pI1CWGPH0pDdJT4Hc9pp689arLCCW0=;
        b=IaHWYPu4rsbJc5IL/A4eTna9GM9h+x47t8PeJgj0B8hX3TclBCRMPNGJ67bIpZcoRE
         VwwKf2YMonMgrj8DhoPb+o8mQeARYyafVB7pTq85B4PkFCwHpMYDeEi16CyA7mABwZd2
         R+oOOtzw/OeINBdW5J7pveUHFCvYspu5PraHTYuaAHo1Gq1vDaHQkcbxp6UEYJKI0xm1
         ugyNEONCzYzM89rBqrpBU9+eQiRvxbYKGlwgvxlby8T7Vs557uwp3GTkunMBqaNA7wce
         YMdvHJw/60TZrCAJNnxi6mwDicOPAPLi/kpqaomzXSGH0Z6+FwduzxB0sPkTLQUTPZRv
         TZug==
X-Forwarded-Encrypted: i=1; AJvYcCUIu34P68ZHBOIohn/RpATrbXJ/kVNvT11tfnkVn69CP++oJe3femYYuMtqpqk56wBdYNOmo/xfYsKA9o8Qp1EmxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAxY7mNB6BjJStNy+EYM+ojPAJyahk6eJOAm7e1pTmeIRMfVu
	sk0ufWyV3psbQLOa/aDYHrGNmof6/YyfYDwpQRDRQgLz70zWh7dRBbLe+EyAtWM=
X-Gm-Gg: ASbGnctFWqniHyRqUCZNipnQ80t+GXWFAVpvdzPhbfDLve1qEfBlOeaD4pewQPwC8xB
	8w6NhENGxl1jZnLwf8XOtnmdYFkQICZlS3q3vwpgxl1N81ECOXjSiwBx4qkFY4ndEsIoxsbh5z3
	7wlSSDahMvSA8Fv/Pu46cxpPGsXAE1O2z1eJNzJJSy47T6xRYdKNGPKqMrEMequABRi7hZgESsp
	Q61DFX5MYn23wmaLBKwcPC6EVm2PN1+hUKIizUHEhwO4DmdKsgE2B1ld3l8Ebid7EMz8lGSlI6X
	AK1fNbI+dlU1Bd5D+A0wEMIZHgZVNR88BmxJyj5QnuRmAw4j5fF9lFYZ+izzCj1kmBtOZ+46UdD
	6ZcoOi38NM/V5wUL+jljucTH3L6P8amAEo30=
X-Google-Smtp-Source: AGHT+IHXapYhYNQRO/RaBffrKQEMjGSVNPTmRkoaa654MIwJC23akNlWVNoXM5sb6eltRo6RavJmhA==
X-Received: by 2002:a05:6402:51ca:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5f839b22e1cmr1914271a12.15.1745916567896;
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:49:24 +0100
Subject: [PATCH 1/2] phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on
 exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-exynos5-phy-field-prep-v1-1-39eb279a3e0e@linaro.org>
References: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
In-Reply-To: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The code here is trying to set the FLADJ field to 0x20, so it should
clear any previous value in that field before or'ing-in the new value.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 634c4310c660a50e5d0869645506ab1b64fffd4b..4ea1fabd4d6f9c9fe412f17d4d26be07724b6361 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1186,6 +1186,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
 	reg |= LINKSYSTEM_XHCI_VERSION_CONTROL;
+	reg &= ~LINKSYSTEM_FLADJ;
 	reg |= FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
 	/* Set VBUSVALID signal as the VBUS pad is not used */
 	reg |= LINKSYSTEM_FORCE_BVALID;

-- 
2.49.0.901.g37484f566f-goog

