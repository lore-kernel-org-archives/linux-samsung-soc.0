Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A3342CA3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 12:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606079; cv=none; b=cVpjOfrGn9B7lRRXdIpzB+SEamYO+gedaQjCfUIhf8ORtsPyNAapI/f8ZpmsQ9FGNL/jJm0lxfqxGf68vfeYhbZEegcfdkhc/PLTynsNNq+gJEZuLZcwABBkgcjPZGBIHqmbHLfZ8H9UrqxEC0pOeUo307KciHSV75P1PuBmm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606079; c=relaxed/simple;
	bh=0Q9EBNgnuOCskljbtw+Vs3Xg9fPTIle3oM4oVNzAITE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XTbJBOyVpPX4J84SYdsJYcqEKwn2Eh4F8YAZw1DmR07ln2mBmgFxEjCwaX593rAAXwaGG+wM0CO/8BzQlW/rXfQqY3sjm2cuPPKtYDbApS4GGgIhP8GPIZJqQ11SLfMDtfKHE9KLBs4zeebuTXiuXhTK208d8iDHRPT0W2I9Op4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEAzAqhT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEAzAqhT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso3367580f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606076; x=1756210876; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rQW6TBzGK1G1eXbPBin0o7LZ+IJINQdyNxTLpbpWdo=;
        b=KEAzAqhTInXI0BZyE7IuciwAzlki5ce/kodxWfBHPtavTIGwvmUqz0aOM41gXmDk4c
         Q0eGO8cUzoTdfI0p9nYwKPQMiw/C6dVW4Oivsaee7oAfKztpz2FxnVsesCwqNan1BN0O
         gCc05FcEx9wYbuxQUSa6F66SH+siCGYZI2CiAY2op5YvHvKG/cAK7zW2MYfIDv9y9AU+
         OU5MZjmqxcDZ6lgK2a3FjXPd08HVhpj5CApiKBwI/6cOVbT00+VhNLvZYwXOonmpJD+9
         bEE9XwzeyTpwwLVMbHGS37pJ0ZwTA+8y45GCABw8kDi+n0xSVn9eX+yHrqbbji7/JEYb
         2ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606076; x=1756210876;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rQW6TBzGK1G1eXbPBin0o7LZ+IJINQdyNxTLpbpWdo=;
        b=XjaYmSMn1WzxBzVrfvevdo48kANLUpkjXgJKl2I+gvYRurGTCutgqJrwBEztFphj8p
         5zBGfOtbxjTw8IinvIE5Ta6ezpUdS7qNfJUnKfkq61arDuKPK9rJkdzBOQoijiki1rNA
         3EmulB7PntxOUQtuttml6EJXCOW/lalI3ZLP3y1+4KCn8nYUgzlm8xPD0xCqB22ZTEF+
         PHeh8qh4X/PuawAoBx1NCy4tCWiJAAwUMog/EN6CpezHjIV/FNwmegg0A/LkgHrKcdKg
         uQiicNqI2Lwc4zKI6fLu/iYd+h5HcZZJ0VZgJzlTltGmo7Gb7qfImB6C+Lb3bhotkkWx
         5W9A==
X-Forwarded-Encrypted: i=1; AJvYcCU7WWlRBoLQbrMQgY1Gt/G6jnMRL/ixU/OYvwtFTEjuovB79Kmd/nHy2lUsxVFMOe38g8oD8y97T0BR0BuAE16hpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww4LIMJ5Lwpck0SjK306GCt2MJVHPHYTUELSKq2NQupgvK9On4
	J7GVB8LMTnEytonteRUoF091WRAKgY+e/mShArOsYB9Y1JtiXlwIAOYyQwLgSTJ8Bwg=
X-Gm-Gg: ASbGncuaqjz/oOuANvwgE3i14LuhY3BrHQsG/+rIp0/ZKqdYV1XuUSMlCnEkKuh4xwu
	Rwfd7EO6/JX62A9CSk5KaNG+qKlmREwhEaq8sMSYbfVYAHkAQt8Z0D9Awb7qXIzJPJB0ZOC1NGA
	7kn7/pM9hAuc/H9fqbIWYK8n9xGElOfTWwMlbNEE/iny6UKa3H796k0nW54ehVTa5lH2djnHlhP
	OvuavEEaKWQWxwPC1TRbd0uZBJK8Kz9sy5Yg+JhZZdol6oYfRIshLdzTVNupsBDCDEmzizJeJyT
	CCT92t9YD/TPJFUTNqSChB+v3XPYr3NPBFDhgXwM/xFsPYZhaDQ7vd5Tu6buYeIRL7rdVzjxjXT
	22kj+hjxq88JAhLmK1B5UrPXPhsdN+ZdHF7KDP9tzb7JL5JT33DKM1iSw7SCz8Ll8iC572Z5L1U
	UU5g==
X-Google-Smtp-Source: AGHT+IGUZT2806D2Tn5scfUdkvETMFzU3Pnq507Z4qfJ65eJZCeuTeyx3S8c5HAi/cNBGb4vzb9RdQ==
X-Received: by 2002:a05:6000:18a7:b0:3b8:f318:dc61 with SMTP id ffacd0b85a97d-3c0ec660614mr2020703f8f.40.1755606075840;
        Tue, 19 Aug 2025 05:21:15 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1636sm3472701f8f.43.2025.08.19.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:21:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:21:13 +0000
Subject: [PATCH] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-defconfig-v1-1-70f5963ef90a@linaro.org>
X-B4-Tracking: v=1; b=H4sIADhspGgC/x3MTQqAIBBA4avIrBvQJPq5SrQwHWuoNBQiiO6et
 PwW7z2QKTFlGMQDiS7OHEOBqgTY1YSFkF0x1LJuZKd6NPY80O4bOvI2Bs8LqtlpT1q2bSehhGc
 iz/c/Haf3/QAri9t4ZAAAAA==
X-Change-ID: 20250819-acpm-clk-defconfig-1bd3fe307780
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755606075; l=1140;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0Q9EBNgnuOCskljbtw+Vs3Xg9fPTIle3oM4oVNzAITE=;
 b=1QpGIWzICtt4qBg5AUnoDnZH57zYNvQvtpTetSQcHjxBXDrf0iLiogSx2aqj6oMJ+G0EyagZK
 meoZ0SgJ3xtDnh+qdZB/uqt72AnEDttjSsN7AWiioZIDe9Y/SsHTj8Z
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
The patch should go through the Samsung SoC tree.

The driver is proposed at:
https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-defconfig-1bd3fe307780

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

