Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DCC248BD4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939454; cv=none; b=AgFxKwFa1hhdWauRIJ3aS9RPxNf38bXFn+TtEmoGZ9GpFqhKzcQUkuZ3SvXZPAiTUUlYJbDgUZd/2WuHogib5NSBsviFAQ90ETqW3vRvEHCG4dGOyaVN5vn+4unNb4DVQDX3kc/aCtbGRX4cS5w++df5vA40cJKUYCqopPg1cow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939454; c=relaxed/simple;
	bh=Dt8d1C/tljuHwCYE9rqB9mV99qR1IwA31kMWM8oW5ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FcRC/tnyKjj6UgieCt2ByG5erevJ7VZceKv5pCaN3f5YqUzn/bmaOjmESAm4tZpA57XSu0U/8p5OJsgwudnzDNef+2g0AOzH8IY1IPzjzUA5jGtPNX3m1IOlk+Z0/8suIJYA6ds9zZHugrUvsN0eOgvENJRViF+1xgTEPkjsi0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVltEGch; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVltEGch"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401be44b58so6626522e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939450; x=1737544250; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cPqL3pvjwpbD7K2B2dA/s4JEktG/HsuL2/Ywhworts=;
        b=xVltEGchHkuHxZ09uqJ7AYyeIX9Cvf/bloqvmE6NJuqsytdyyXEhxUiITpSMRK4H3m
         o5YVoDao9hO3Hdl3QiRbJNBU6f4Pd4h7OB1eIaS7bBfb6IQd4hBuGyD8Ns6rXRQWU9P/
         HwKu4S6gXwrOvY/ERnd/OeSd9f1NgDIuEYoFZokxXh4wSBaLyewunsVWvcdyDGp6mZj5
         HTtXMndbTG73qIHJ3g7/bBp6lkolXwFjF5Doupf8+Mxp6jYDhs+QvLpH1C8lrN2q7FgO
         eBOexHb88N/4K0J2/dYuSyDQF0cf1J4BxxRLhLi4YfuF+q/FPaGaHZIMBSuoTvtXzhv/
         u3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939450; x=1737544250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cPqL3pvjwpbD7K2B2dA/s4JEktG/HsuL2/Ywhworts=;
        b=E7MRUhqxHstv6Vmfq6piCgWKJfTdhaR8bzIgzEssYGBjKJBR66l8DqTXMoKvndO9To
         jjwJbcJ85dRTR+Rc9ZZwCSExx0hFopeyLsBy+gCLuIPEp1vLTLm7XSh7aC6Pl3pDOHYU
         VWupbbgUUPXGi+g2icP30L7iEkeFjpT0eKmYwiaIQ7gn6D3QqPPBAO+e9AUX1OH8itmD
         VRgF4pU2Eo9m+2t6cGMIMTI80I1KftsrUE2ojLxMWOzMvFi0MKbaNoAEUM8FTOnQIRS7
         5bIFuiV5ZPSDgnVAJmlsl2INUQie5YSM2UznI2DArdhhuf3xickJcvTRUk+JR1zt/qKP
         boJA==
X-Forwarded-Encrypted: i=1; AJvYcCWi7n6Bs9ikkV1P10Tv3+SwBZWf/nW3l9zKFZFx2MoFZeIVnAyyP0OHTb5ekIU9PYlqQSLRIqKCBEODbvfwQrv1dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6E5q4le9ADLSrMAMq4gKU9tP/uUtVnffSabxmB2WskVZE+qiv
	jfS4nrMlEZhYRwYIXxFF4H76QBF3C4cpBO9OtRbtDedxngv30hA6QRuGQzExQDw=
X-Gm-Gg: ASbGncs5QQ8BG0KDFKDHt8JsVqCG4eP4elbJ4YNUrL5tHwxe9eJn+Uc7+09JNPvNJpa
	cwIwtdr8HekL6FYwHihfz2rs84UBmtCA6MTFieuM1lwXJfho0nKPXW8Vpiwnj369g/NOuDFSn/7
	L5a68xohEEd7+Lx7zTyUDBk1FK+/k3oD4AwP43HKqW5T/7Bhim6itqZxaiw+we/MuHqEwXN9q94
	ERjlP8QelBNRtTyGR0u5coFyhOnNXDz0zx+5IUVgkBw5+I1lZfqziLHZ6pN1yZf
X-Google-Smtp-Source: AGHT+IG85kgXOk/y+PGUU9aSW1rfAywF6FZXYhKzLssLnSoDT+9VsjVq+V6QFAGhJAZqkiike4pUTA==
X-Received: by 2002:a05:6512:1081:b0:541:1c49:523 with SMTP id 2adb3069b0e04-54284816f73mr9507707e87.48.1736939450343;
        Wed, 15 Jan 2025 03:10:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49692sm2009084e87.16.2025.01.15.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:10:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Jan 2025 13:10:49 +0200
Subject: [PATCH] ARM: cacheinfo fix format field mask
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
X-B4-Tracking: v=1; b=H4sIALiXh2cC/x2MOwqAMBAFryJbu5CPKfQqYhHii25hIgmIIN7dY
 DkDMw9VFEGlqXuo4JIqOTXQfUdh92kDy9qYjDJOae3Yl4ODDzskxcxRbh4Ba6L1Dnag1p0FTf/
 PeXnfDxqi6kRjAAAA
X-Change-ID: 20250115-arm-cacheinfo-fix-9ee32f3a5e34
To: Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Dt8d1C/tljuHwCYE9rqB9mV99qR1IwA31kMWM8oW5ys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnh5e5bVtlXo43+ur9ZmjVXRM38owhcLp66/0P/
 3imQJL3v1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4eXuQAKCRCLPIo+Aiko
 1eGACACSCS9TEYuK7peyrjK8tniNVAB6t+KYUw+pzBOFimWNqyFNHEUbE2NyhIItTO3hUjmAa9A
 +aaL8HtMbRTwNf74A8MI1AGnEzYmc+chnIgDMO17jjAdpOqZrcoKqAahQC30eu7hkTgWyULad+O
 s9xmvRtr0Yd93LFs7pvflaqFcpBk0NmibgCh0DC211VjKq9ka5S1wFkrIhYdIEcMxp2GIZjJX2O
 f8Zhwfl5CHApOncr0wYBSMGx0BqLodP27M97P7W8Cs35CTbY+qnNMTphkzZjEwGkhQfu0hRswte
 X7xGLnxVgBocaKqQ35BM4T4yYK5BF/sstqu69VSR1sQJ6GIi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix C&P error left unnoticed during the reviews. The FORMAT field spans
over bits 29-31, not 24-27 of the CTR register.

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/kernel/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index a8eabcaa18d8941ce31ad267ce0d369b8d53886a..e1469b6417804d2802e847031950cb99b7b4e1d2 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -23,7 +23,7 @@
 
 #define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
 
-#define CTR_FORMAT_MASK	GENMASK(27, 24)
+#define CTR_FORMAT_MASK	GENMASK(31, 29)
 #define CTR_FORMAT_ARMV6 0
 #define CTR_FORMAT_ARMV7 4
 #define CTR_CWG_MASK	GENMASK(27, 24)

---
base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
change-id: 20250115-arm-cacheinfo-fix-9ee32f3a5e34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

