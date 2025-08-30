Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B63DDC5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756573279; cv=none; b=lLRdn7ykmuv2jIYqc4RKDyAoGktp+LTIqRCxSXF6Js45Us16Ri1Rs3oTIzD5P/cb/Wi5OazhN3rvH9HGtxVfbqWCskMfc1iXsSfcdKeGnAEOclVRYxW3qZd+HJuY2c4/iiJbK+xpyUoEcFZyi/79tP6NIxGQvNEXdzlDJWJmfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756573279; c=relaxed/simple;
	bh=jRpxpUf4uEqnnfvpWME5IzFTj6kezYWwWNy6sI9Jnlc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RA1Oq60ju3aSks1zqQPXDfAhEi9rlCAOv/21Y5YsU14mCFmK4ygNTt9s/Rw/vffFpQP81Z8nYAV+i2/z46fWMkwLDqDsDGLPhCx893LIRDgE6ZbgvAgaoCxPhPTeb9sjtkTY0szetMWLf+9BfLsl4ubYnFvmD7KelRQS44Ux/L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFUOades; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFUOades"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so59325666b.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573276; x=1757178076; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=;
        b=bFUOadesqJvrfT9rN4mCvst4MGEcoRN2vIb9oo8BKXQwODoVkizsnF3zM5WBsDkWvJ
         hCKvqMk+Gt3JaznM1YIRv4zXdgvpDBGwY2NKGpN0N4lG3TTCrWRggO1OE0wGhRy8b0P6
         pB+abtveatuVQcfbZ37TwX9uzdyfFbhF13ZWwTJlLAQHoOmhUOPGKFsv5izkObFu3SMn
         zKvWXB3CK6jxnnI5xsqTpN6Lt9pSGHeP/pQkeL9vXAasqv/BJDyceSaZM4TM3tPROer0
         6lWeoBbGBSPOcf2JKtx1MUie9wIEnJgLuKnfeQSVdzpGGW4HwSKggLpAszVxpjk9iVSK
         FIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573276; x=1757178076;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=;
        b=HcIw4Pco1NBjT13cBp8PnBtsv/RR6XOpTBEvYcQT0orQl30/fQcl/DW7ufTzgSo3gP
         c+Laas/5JXHIqex3c+JS/sRK97t0s7Q2VWlhqfCexAm4uTuBiMecmTTi8NmjbLCmUd6Z
         JGN1UCNdzmZtIwumo4KRoX69qJC9UbNNgdxoLTXlChpE605dU8tIcOKdMR1usc8I4pFS
         LFz7WDZVFC3UnsJrrEzhHy0ieQbikKTjgh0FLR7nkaD1AmDmaGCkf7eTxv5bve99k0Qb
         /VoSZhTF782Qp/8ucVVEfML2XNlegwdfsLsgALlmruIGY4HC95MX6qNaIf6MFP3ITLF6
         WiCA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Q32YFoYiyHnBey/V6EKdf26hYkc9w07+0v3lr9q+xJHE7mSAnfw8OipTSBNp3GWMDiQ0HDOUTc836MzXiyyUyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/TDrV1GqxFmoSKViPBNoTcsTjFpIwLOqgVZSFHsT3rKZLUaC
	mk3FgjX6TAREBIQmhyFqRQ/68gJR6iwJYv7B3nK6E7azreHDmmpsg7ZXJiEH9k4TQ88=
X-Gm-Gg: ASbGncvq48FtFOUPUXEEx9f5tujrLU4RS1dOCDaMJ+d1OQ5oQQF7SeHNKIzXtRUbVbG
	TD2EpE3lcRYSNwOD18XyOFVJq1GmBzooIplcwU+fqlsYvfTz6conmJPlyMYuNnmrXGrHxcnl6uX
	4bPIsi1ew250aeGhso/cq2BWvfN+A1tLeZeXHPmYIz0KlT/oWmEyGCgHQiTSNBezu1+VNsqvRGp
	C4wOJn46xq7OzBKDHbhp6E1cBknu2z7HQCaZCvwskFd5bjNO7Y32i0rITSMePlDBI57CrUa8XRc
	hNI1nMajzJod1nIDB4PSnnE1bfjoUHd9YpA2Ndl4M1WhWVvChi1pQ8xKtbYvbtgfsCbfBG0r374
	jFevkitJWn/Ogr7JCDcm2DqbMH0H42QIByUfq1COUrzCkAlzsBA==
X-Google-Smtp-Source: AGHT+IGwW7z6ZZeWMRWTPz9Z3XwH2Y3BmJLkP+pAxyiHYWItazh7A81qCVLqms2areFztK92EQUEqg==
X-Received: by 2002:a17:907:3c95:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-aff0e28a1demr277259966b.0.1756573276279;
        Sat, 30 Aug 2025 10:01:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] mtd: rawnand: s3c2410: Drop S3C2410 driver
Date: Sat, 30 Aug 2025 19:01:08 +0200
Message-Id: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQus2gC/x3MQQqAIBBA0avErBuwLJSuEi1MpxqIKZQiCO+et
 HyL/19IFJkSDNULkW5OfEhBU1fgNycrIYdiaFXbK6sVJu3R7+TkOlGcBAzWzL3tjAuNgpKdkRZ
 +/uU45fwBRz7XeWIAAAA=
X-Change-ID: 20250830-s3c-cleanup-nand-d87b5847ad10
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jRpxpUf4uEqnnfvpWME5IzFTj6kezYWwWNy6sI9Jnlc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5W+DzfByrBp7P1cypFBMFE0CLR2K5gNj6mx
 kR0wWKWBmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuVgAKCRDBN2bmhouD
 1+eVEACVF2Mpcy6HzBCklOTJZflAQhOnWjfatgC59+l3hDngiFdxrTn7vIaugnHzXzVlGfvQf/7
 YoKm5zM7h2AVnRUNma4I+mDGmOFCQBmEpvk3YU9YFUOfkmM+CoWu0/PsKsvyUVqKZytmEuwvple
 5GDHSCkUsQC1Xf1S/KkE/V9wdPBGRXIki5T6JOcJkDksc/dgq6DTHOxnwFV9p9i9Nj1ITA+2hDN
 O3TVyJsWAU3jHlmovAXZr9yNq9ilT+05by7sIJC3OpyAKJfED03j3E3m9kKV+A8ebjLS65C10mW
 W7+HYdMHQCIg1qkDMo4GSzcEEVo3y1DmPzCEuT4fy98aQH8ECV3znQbn1yah9NReptaFDbhCSDm
 nYzLQdCDeg4EZ6+LqUXhw9B/IYiVrxcSrDT3MtOkdwiAYsVPARpdHfbZLi3pahLHeGTG3maIG/d
 za1pf+vxR7Ar5Ik+5jBVDjg1izKKz3mglIBmkf17Np2ZAaQH19UuBSL58Tu2kfzTAaCT1RuH8aU
 FhRnF9FTDeVRibJHEFnfpbWP5DHd+Aymtfai6eFstznmLlqUnn/f/fr2uE/zMXUueJCOoUGoEQc
 8SLDl8E8GNekwLgKnVG/rmCBRbx4b5XbSyZVPQ9Zam7oAx1M7Xcd0wrdBrN3+YsxkrTDRm+tuRb
 kBY0supEFn1RWxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop S3C2410 NAND driver because its only two users were:
1. S3C2410 SoC: removed from kernel,
2. S3C64xx SoC: does not reference this driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      mtd: rawnand: s3c2410: Drop S3C2410 support
      dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
      mtd: rawnand: s3c2410: Drop driver (no actual S3C64xx user)
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

 .../devicetree/bindings/mtd/samsung-s3c2410.txt    |   56 -
 arch/arm/configs/s3c6400_defconfig                 |    1 -
 drivers/mtd/nand/raw/Kconfig                       |   26 -
 drivers/mtd/nand/raw/Makefile                      |    1 -
 drivers/mtd/nand/raw/s3c2410.c                     | 1230 --------------------
 include/linux/platform_data/mtd-nand-s3c2410.h     |   70 --
 6 files changed, 1384 deletions(-)
---
base-commit: 4e9ae4ca11b35e6a3e9a1175201d8c55406d9301
change-id: 20250830-s3c-cleanup-nand-d87b5847ad10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

