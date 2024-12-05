Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B8D1B85C0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383999; cv=none; b=swqe/4sW1Jv/I2OD82Q4Ljycj3sOrdP9FamVbmfayB8/VPKs82SjVnGXh0+SEr3vINS7wBn2GXQGiFT5aKSzhHP5cqcLGXOMvKkkhkD+tzGsrQqz2OutyfpkPdT4S/wIn4mO0rX50X2oFRrG1CH3zUv0x9xVlXKeqbE2bgJa2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383999; c=relaxed/simple;
	bh=kjL8CHF2jTNzGFGAJHP0ju9sbOFLoVxrk7RH0N2gvDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIdlY0NeUFkl+XpWPoz72BQ9+VaG/Z0yzSO61iJNg9U4McvEHfj+r3uZiv+cBKUOGmdgt4eQlcPsv4iL9+EvhhmqRuY9VWXb62ugQVF9uvCYvqoR2vIuS4T2e1WajR3b9S/LozWRfk0aMnzAtYbabZhEEwp9a8GYOxWHlzi0WCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uoWM11E7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uoWM11E7"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so110878566b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383995; x=1733988795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=uoWM11E7/U8RpE1L8G4I7wfk5bojKhIWnB6k+eBrRGKLoF59RYKuP9R/pIL84j46+5
         l98GN2wMPvTts/0J43fDO2xdApr62/uxi0VBr/Qq2hQPzWQTq4NuWDGUA4GRFGC6yWgA
         iO14+UW6Gf6dtXDeQwHi76038kQbcgUc5/4i4it+yuottwjWLKavZwcy6cISV8unRflb
         JPXOx3ZdTuDizLMxHXKhLU6HayWcjo2jU3enxp6z7I7m974GuNXQVXqwKotwqYgeYDsa
         6PHjxCi+oNAh2UpSAoF+TXhQbGUmA2LO30Lyo//mqVjaG7HWrbu3OsW/j723Shg42+Fn
         K6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383995; x=1733988795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=IHTMSJMU+06rLGtIYKEYYw6wgt12pKux2YYvN1KwtL/+8R0+NudcZLJga2VCRBb9iY
         8cIlBlkEO6uksTjzC70YIDh5LD6q0OJtPhvE3ngVWy5nzYtt8CBsLvN0KSRNjTLhU5+n
         d8gbfMriLS1sBw5ZtGxc0Pq+UuxODtmNUTfyi/T5k2ovpS2GnqCqEqXYHZ40eyDp7JSc
         NgOEyQWtwAfWTJF30OYbxkWjyRZLUYiAzCw1NgdfsMIRIWxmMGp1qpECoZMkZMDj/Ye9
         5PVcaZ3CsWSvtfq10Nzcgj14ZsS2R12uUvxxo5DxcJU8Kh3r81G4Qfq7kVA2M7WA/vUm
         gcAw==
X-Forwarded-Encrypted: i=1; AJvYcCX+TAECbIfS4hhQ/b1BbuTSedLM4Ml0fIaSGxjnXaS72eMoE2hVhHLyl41vQnL318a229jeXWW0Desq3i0hfKPtuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ509JW4emMTFVCclFqbRrVlmVxavZ6hRbttfTFZmUaYUHZH+E
	8uI/Lv/wOcu0z7kRurI5LmNinqfK6NeG2bCt27wyCGT8QpR4mJHF0LxviBxy0+8=
X-Gm-Gg: ASbGnctlUGTN5sebZUotopZfJcIXXLZ57oOh5PTRIrLR+y5D45iNPq5V8mR+gYG4p7Y
	kdVtOy8B9HaE14uXN+YNjrjYQiQ6htJrAuT0GiXI70k+VkjZkBTqwHhi22eNMgiL2HWaHDnry/Q
	fn08Vh5VLE8hhl4LCMWRXnpJTlyM+vjxLAkgxqwuTuShqayRU3RNxNo4aBopUS92gdmo43Y5pJ1
	Wp1Jz56fK0gz9PylzTh9tCG3ZVTEqx7LRMjaK2zMK5559rfyB0Jz/9y/R3EkMWPhmY2q/uKWi2Q
	4JbrDD77Hgu01lqf7dqIgfZ1DUdokT8IFw==
X-Google-Smtp-Source: AGHT+IFgMUVAtmrSp5P0iX/M3Y79q6BO4G1fv1/OVbYNaTflw37THP1LL7lHyOBI+yL2Eg8TsZ7fqQ==
X-Received: by 2002:a17:906:3d31:b0:aa4:9ab1:1985 with SMTP id a640c23a62f3a-aa60191ef15mr658488966b.51.1733383995541;
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:15 +0000
Subject: [PATCH v3 4/8] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-4-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ceae4b47cece..2a724d362c2d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),

-- 
2.47.0.338.g60cca15819-goog

