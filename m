Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276B1E5B64
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769581; cv=none; b=Y3XndgKnBrpRPh6KIRhgwE61ZOWJ13s13VSf+QmnIagcnPZSn/OSX1y8y0UbP+ngiJWMQJ+awpTzBkCA/FWQO+iP3JZGGYa4p3D2VO3k0PkHbGrJwRjIhHL+NsgNr9+zamgcS09wBanS8en6IHbJRYtWhs+C0vkTfgMPJzvD+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769581; c=relaxed/simple;
	bh=rN1LIX+ASOSby+v7Y66ac8wfq2CyeekWp2iiMY3xYgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FK+qN2/oNguQQ1kNtGStk+qBOjAqzlWXzWxHzl/5ejx8mcfjqtjSOYZU258P0TyYpCNX2OG4voxACfKWl+8SB4HpKyWSQ3jCRbPdX+xEuSW+RenPklJnkikQinodUscUAy6m2nPpdoWIdWFc0EypSo+e+6BkSui1uLE4BiU2PBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgmFqBRf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgmFqBRf"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so805164166b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=wgmFqBRfZvGB3Wv2rdRMjAEYNdQIlob4VQBDT7YTLkRCOvKLvGlCZhggNK6fEXiXQy
         oOwf9mrRljMud8DglpoJOI+TCbW3SJ33FiwKrcoR1oIUNAgmSLaiV6bJbtQTZBnJahMB
         n893wqqDkBtBBlOJf6QB40NSrtVjjB614QhL0JUE9hlgmEXZYkJjt6mLtAQ2raSLF/N7
         u9ZcAE/V83DG4G3RGUCJ7Jc7P+LbxdmiTtMDukadyzBX+V6o/SJ4oHwiyXmPukuHvPWW
         ls35cq63wRxNS+6hbTZ+CJgsz9nISF5+VbaH1LDdCDbBWD/A8FQlVUcxnJc8BWCqRxI9
         euKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=uwZZk4QA73O9N1iP5Q6HccAg+6eke0WB2DTRpfGBQPN86qc+Ci0/M883WmJMDifO+e
         myq4Ed2fbTDXfJpBB0CLc8752UMAHJ6tCFDsQUr5BNr3rOx0JxcL6TwGwNNagRnQFmx3
         B0eOps3n2n3sswHWq0KqHWKozYZ4Bjz4IDI0XDAMp+g7ftTBVhvyDiw86wKkAOFOVR1P
         bjlREUgSDAPsNOJKtezXn2NRTllr0IeK3gc5F5IKqtmtWiBIgQb3BpVHPnZjgEnz2dHw
         Jpfv2JDxG7Y5xyaRA0zFDkomfoACVLfqk1x3BvuxXVR62ybQRYy1BF/h0FUHQxlbElQA
         mqRg==
X-Forwarded-Encrypted: i=1; AJvYcCXzREtXCsJk7BR8zVKgYtJMNtPMDmunnwf4IqqzPJ71tDqEHwelCvaAwKynamtJJvZfZOn6p7ne8bLzVQIgtsoycQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybNAOMjcg1iZ8g9Pj2UbYFT9L1NGhG6yaspFA9LH0G1zEPE0Ui
	Q7qnMMJnwTIu/qsnklrQZcz/U8tVWeHk24DW0QxcA/4/rekzWsYsjZyliGwb9u/UkG/mGYWp3Gf
	jqOA=
X-Gm-Gg: ASbGncsabALbqpvDH0rJPNRdWbnGNmqhSrDPnGsg9zf4746IA8syuouJ2A2Gz1BAWKq
	AUOpGmsvYim1zbYrDV5DZDGx0uXWHx2vpw4a/my3c2R8D9/pY/FritCmgYW9FD0jqxaNx15q29A
	H7N+EdCArDwvLwWlybgVi66SffYN5pVKHIojqwNU55JRra6M1PurOXWJsfLhNrN2r8aenKbpPaT
	FLlQFIeKE1VK350qb2HBmApqCtK+xz4+3E2AV9iKLg/ADPf17vKYU6DMwybuz0U0iRNvVNyKSct
	jHW8nXUyNFJE6mPxORaUrG1c1QxKsuVj76IgI2y1xJSYxJgrjm3xXh6xOem0UT3MJTaesUcSRV4
	IjZovmnBr+ohMxyMu0go5g4ZcsisP
X-Google-Smtp-Source: AGHT+IGbu/jFjtqa9LSXFqPCJsAn/xbvTSf/7H1OcPEes32L8sKOj1rM+QLBV82JKfVyHX96sb/teQ==
X-Received: by 2002:a17:907:1b0d:b0:ac2:7a97:87fb with SMTP id a640c23a62f3a-ac3f229dcb7mr1140111466b.33.1742769574302;
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:34 +0000
Subject: [PATCH 18/34] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-18-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index d05c8b66c35f2a1356d7c641484404628870ed42..dc5560a0c496917e847a40295c53e3f762b60998 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -453,16 +453,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -493,6 +489,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.395.g12beb8f557-goog

