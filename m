Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34A61F37C8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502667; cv=none; b=HRWABp+mY3DMVZls8kRrnSJHXadYccmNcxAK7U79mDIQb+EG110fc+4XZu8WXl+Gvl4fHQLFVPyY6gFG83lRCLaYToOGkgRGVAZfgSzesAbzISt+ul7/WSzA9vs0Dz6NVVlTmPSnhNyOCKLVUjILBRyUp/8pf/jJGbhzs64vBzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502667; c=relaxed/simple;
	bh=kjL8CHF2jTNzGFGAJHP0ju9sbOFLoVxrk7RH0N2gvDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJ9fLVYPkIum9X5v4rvPJcLr1BjVkxgPOAWHBbGVHxp8HKlSC8of5fB/3xR/1Y/m0C8tM7KcBDJQF+Ve54CnkX7S2ccv9WPOQzRhrsPGJBl6RZxsnIbN54KFy0jW6EIDC3yO2JuaNIfJ5g2uUIm9CrGDH5R4D28JzDSX4WFv+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQHoedMm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQHoedMm"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e1f12c82so1954441f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502664; x=1734107464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=YQHoedMmgvRiuh2hSU3mf7YXj1WMAJ4acMQ/kCoRrXuIjpDZ1d/yQozbXOM7w56GXj
         QFcbDpuy6ijuBq0RVFwIlXHE51sw1muHV+KU5UxYDQodnLizsSxC6k0U/wTj5eN36KXf
         sQvAkGE8st9KDbwATW0vmaTZKpK7NNxCvyarf+8/LwKo1VA6+1cKd8LjP+x6wfOTWn7C
         dLoTf1eeOCs7WhAh/GTG+lz9yjaS2eEfNBKAXgrf9fc1GYDKH77Gr7kBkRPR0Yw9LWie
         GYVzfxdSVMfTr5/gdmmflnCCMSVkQdBJHYfyx/qztREv3n8cMHuFpVlmYi0SZ1zk4U3D
         2F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502664; x=1734107464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=qQbQPfwk+4UNwiQ/swAzAIP08IXDC5PVoQf53HYtFMUSbR1A6QvS7Z2+MJmko1Si5j
         Iy0Ar3kl6+Hk/qlFEFkZCXZkGgG7OBFq/d6XGx2cKl1OecZKOEDZOwHFD05P0Q0x5MaK
         AlRUCHtU7cl0jnSJugRji5a3FoiCl3afvFTWVdvuqcibUzlgeMWp3thCVXHfI0JOkU+d
         FBOzGfm6PHSbreVq0br20583SHfBM9Y+3cCeJ1GhBYSdWQVGVWrRKvzcBvf+XFVXvIKA
         8l2SJGa5FnD14UUsb6C8mzPGooRaEhOHbBagdWfGP2QyhVfgzLpaxL2s76PXYPBwdofl
         +cWg==
X-Forwarded-Encrypted: i=1; AJvYcCU2vhzVu97UsPIsUIEZIxwLmj8utwNr8UttMMiSXXAwHWmYPp52yO/GCg4BVWXMoMTt/uWfBMnfTwGEhuhoiTkXpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL7AQc5UzNbbfADDCPJvtSDCXc3gT0y02VseLX6JhY/RSUBlMM
	1HHIijJpFjU4DtVn4WZNyzo/O8vbb4B2jsKUIIx3cnZYcW0wLWVaugwDz6/UP2M=
X-Gm-Gg: ASbGnctCdOcMrcUXnawRKuXKmMHs51vtl1Od3ZEnlaNHtWEoydF/BnRWjwZ3Q1MO81M
	g2qcFl6/bW2XnNIjBb6ZlqjS3LPBu6mbouWvQd/VdVi5xDdHpsV+GIZazj5lwfg1mEsAtspuBIN
	yartxj/+SGYXWJYu2xfmNbj8Sxr+A2WPmgtUn9cxYJyQLMDw6//62VKThNqhVcjXMPHfMT4oDOS
	YGPwpBjvEnzP+wTyHe4xEtoJDCr6dRziN8Qg5E7A+VGdkPSbL9KhMU6rP4BOnBmt5Eqf+sqoi2M
	GbVD9gHBjPGMuQeAC1SCBuD+BZqhQc3KmQ==
X-Google-Smtp-Source: AGHT+IG1rlIGyO/nnPLuP1Na7RwgQmQmvS86new+NKYuNxLnewiatbb2kxtQ1hikVy0uIxEBRnzdMw==
X-Received: by 2002:a05:6000:1865:b0:385:ed1e:20fe with SMTP id ffacd0b85a97d-3862b3e649amr3139459f8f.59.1733502663773;
        Fri, 06 Dec 2024 08:31:03 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:04 +0000
Subject: [PATCH v4 4/7] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
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

