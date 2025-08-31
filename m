Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC12594BE;
	Sun, 31 Aug 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642400; cv=none; b=oX3tU7rr59dIaX5TYOabhY/kJuYsKYWNE0dPUdEinSegVQv5g/7N1sIrX3FOl7EMMUeg7d0RTvNiY9JKtzyPLzwnNoitkJ8TLc6h5XRC/PMpFTWWhN4haFy3gOSXoNNlGeRynFpSizVkWvVGpmdQ4JDYM4Oam8z9auwfGbywFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642400; c=relaxed/simple;
	bh=m2f5QF1qzXsZs/+Ale6o6q2WrCrUbiw6HNuUXjNyWQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Is9XZhI1gice9AV6Ju2LbYOz0PS1gqnOG/K9nr5ClxFJ8dazom+1566SeFkr9I65enDmw1rfpeCbkZGBu48v2sXa1iFyGEnHxDJ1KVWNpby91fIFnRr3cC13KmpqIh7WiwcjQnQ8XC16kfoUpWBrI9FyE4ky7qxdnG4qMa63gQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaQLfK8o; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaQLfK8o"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e87061a6d5so355763685a.2;
        Sun, 31 Aug 2025 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642398; x=1757247198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlZ0v5UR+2xTEmMOu3usxKg9KggAdVQkFrID2DzE4oQ=;
        b=ZaQLfK8olCrrWhvh3mGHI9nR8/PxQEJVJctvs0LNWrQT/EvUoCgXHd0xMmwVFueNTv
         sXD/tQe1MPqBZ966Ey8q/HlsmoLXzVsDXSQSebUo+AWRgq1fEdVHTm5gBRKuPbQI24oT
         2QjCSBQs4HR9suHgE2TCIgiRXSzq8NOhc6amiQo5ePqMWE9J4crBPxfUXUQjq+rVgfJ5
         nVPE6N8HQg7X9VPMvxaoOzLHebgCzEtPHXfwIlUdp+0nP4sqe4FBRHAgsfBmErDTuoBg
         pDTlKz60QS8wSFYOZtMZ1JWJYiYPaUgZE/C9h1ejPl+0h/jtgLf6yll9UZs9s2W9pKIs
         xdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642398; x=1757247198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlZ0v5UR+2xTEmMOu3usxKg9KggAdVQkFrID2DzE4oQ=;
        b=plxM8yHt4LNyoPwUT0vbMj1YmH4t0A8mDw2dqkz/Vb5b3XYHoB1ahUEun9xudVaJgQ
         4MR6ilWswDOMTICySwIHibKR8BrVbOKop7Z1iIIB3S+aoCXCQbY+WhcOE5lP+bBrx1jJ
         hMrb2bhgFaM+JliAESvxv79R4xmyTj4Zqfa1HPCzqDmhg+GpHOTPoB+1Z6uMrHXq8Jj3
         /wqpMZPDtf2hRTO0CKuQOrmAPY4F9rD1YPFIQzwuJrdzHrRUc2y8tDCtiXQ1D3O4/M9x
         pvGDx3MzypaceFNpZSiElCRysbvTZkyvxrhC54TZJhXNRZuPQvnSr31rSasVWXcmXgBN
         gkBg==
X-Forwarded-Encrypted: i=1; AJvYcCUFqJdFsn64/Cd9kuP0aHWuiYblUge4oxDSAf2wXlwbHQxnqMZtQU7Ar9ijJg+MD8W4sE+JD1e0ig24@vger.kernel.org, AJvYcCV3SH8Di3Y2Xv9Zf6vV7KQ/aWRKMqOCUmB2cVLKk+9TC+ziVD42jc0gLfGaY2xbrbEPRCAP3MbQGTSv@vger.kernel.org, AJvYcCWf0jST3Gy/0vyXEedAcnGQQi/uWIvreeB7cfNp7ablRQcheVNFjjMC2Hd0ZVeZYAAgOBunHnNDV9BvRSB8@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6WfjtCTxPsiMSqFw4PKUiY3ay4Cz2me6WzyQUpWzQoPCbshJ
	ioTH5xc6EAOfOsxyTh842zuHabxXl6gAKTvumD4RuTxo4ksq6WV3PV9t
X-Gm-Gg: ASbGncsGsHxFfoYYsvBpiHjzDxNSOumGom0nOKB4j/ZdlnWD5G06HI40d4RjjSa96YE
	a8Bwn+C76v4qc/iWXTHbr3fBXI9bt/mW4wngszSEr9OWgAgDcZrdfQ21jU0TjEB+WxWGp/TcfRo
	By91Kv73af9FJBCID0JbIJTMDra91nx66nXpV/DjG5fKPFVZk8iwrJEPCliwms+WeQElDTLYtYG
	YCpHgEgLtszhz9oqdNtsLMWMDckAETqxiDp9JlGOrI8VL2fDbGliObzhOioxWPokWPDCMZ5qa8+
	qRndk84Nfq3NMSNWDQOxgYmYWQhUi/9qbITXT69szAT2cje9oLv5NCtykeYPjkfkoX5wWicke/f
	LH8nPpRsfM3ytX+otkwbkaQew6FXixUQCScO3MCeitlqORVk1+YiN
X-Google-Smtp-Source: AGHT+IGlRlomj28QsowpW+ggD3fSIRdZkTy4adIY1fcPCIHbaJRIzm6jBaXx0BhL2//vg7rIorOICA==
X-Received: by 2002:a05:620a:29d0:b0:7f9:44b0:8072 with SMTP id af79cd13be357-7ff26eaae2amr464092785a.4.1756642397911;
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 12:13:16 +0000
Subject: [PATCH v2 3/3] clk: samsung: exynos990: Add missing USB clock
 registers to HSI0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v2-3-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=1180;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=m2f5QF1qzXsZs/+Ale6o6q2WrCrUbiw6HNuUXjNyWQg=;
 b=jhPFbn1//YcT1nfRuEz6+shNgqxHkLrk/WjGXAUF7BRl9XYF/0woSJ0zRfBoxqiOCuHFgPHT5
 lzyoXOz3+rJBxN/8EkFeSdhevcTySRhTi5kPETQZXXWA/eiNYG2SjdE
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

These registers are required for proper USB operation and were omitted
in the initial clock controller setup.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 7884354d612c54039289fa9b80ad08f34b9b7029..47a1e0850c3020ab66931ae0c5ac4920f41496d0 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1224,6 +1224,8 @@ static const unsigned long hsi0_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSMMU_USB_IPCLKPORT_CLK_S2,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSREG_HSI0_IPCLKPORT_PCLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_ACLK_PHYCTRL,
+	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USB31DRD_REF_CLK_40,
+	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBDPPHY_REF_SOC_PLL,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBDPPHY_SCL_APB_PCLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBPCS_APB_CLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_BUS_CLK_EARLY,

-- 
2.50.1

