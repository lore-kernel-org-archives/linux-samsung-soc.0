Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE81E5707
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228037; cv=none; b=PtqaQ4lkNo3dqHyx6zOY7XcWl6Q1LfCcLJpzx0JSp1Be94nJNMi/ByrMU3C7dhkaWBNe1ENEeU+opFxmI9c/knQHMHiLAy21iUv0os9U7mhR7Gtyc0T6/cedb5/QPOD8prBDkDd0Y6JxsrBied9rcrdqyH+Nfgobxv+7HLvP0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228037; c=relaxed/simple;
	bh=kjL8CHF2jTNzGFGAJHP0ju9sbOFLoVxrk7RH0N2gvDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISW+wwaE1M0b6/71atPgKXAFk/RgnpIdaXe4C2n4IP2WBFuU2mjItpwvtPz+omffsOB+Q+XlYm2gd0EqSpJkymVwWj+IZoJfuIyUhdBLMWcXPpd2OPyPjBqQ+mDseM3iiMOPBck+tK+FjY3u/wvvFXxspfLL1q04q5JgQ1gtGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuoXPazS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuoXPazS"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so76359081fa.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228033; x=1733832833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=RuoXPazSHo8A1GjorIbjRRQfC8ftFZrVA/mRvfPY99IJ5up/ZvjLOjTifqvWimKYky
         ADifuFKGMsm+WWaZlujIoBHoo/dyvNesNLd7AYpD8c96Jc6jCOjfhS7SU2D2Qh9EapvX
         2s3aMxRW5ZmgtPU48uIhhrRvm2GHWOmlLebbGnKX89LupoEQaLaELzZqiSl0zGkCuRbP
         EagurIVR53DmyP4SrdSRypWM+q+p/WZjdK4ttubcoXWNMluOSlHMgzxrkwJzTrOlOplL
         Hd7ayYVw5aPPDF/Emul06Iax3jadYO2NOZkBq3gS/a4xyVGmYshswhQu6BvkYj5YxRXX
         99sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228033; x=1733832833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=s1QlN23N2MTwSYBII2KyymQ0FSEAb9AQF1+JyKYdTRFC5SovhX5o8C+7sOVVNRkl79
         c/KVQh/KJoe/N6Inp0+KmbcjmKPS2xiMDuVn6XmDJFC6wpZVA6/5AEhPX3iTHDvESylh
         XYXTmzZ0dgjm6xQwmnoId5FOzPiwGCWTTvJQ10ljCtFw6GpW4A2fBTOiDaZp1vFDMl26
         9mxiIZeUCTqhp/WecHpWRmpez9YgifoyqBGLSCtyZTCJqtqkxdtfP2zQNueSf91kxUw8
         +wbdD4kNW843LlMSbfcug7lwxyRAlzeUED8tcgIPaMjg20N8leuYxxjfRO3H4Ttl2zSX
         09jA==
X-Forwarded-Encrypted: i=1; AJvYcCW+OhTd9hbeHc+PVNPyXTU/0aeHrUonB/SR+kjA80ggfSjLjSm3CFC65N2kfmqin6R6hXmDc1IFFJizME+cH1CSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/65diXglhnrQVa/noJ6MfrKK5R9Bs39dSSCcdp4fi6AVn+lS
	sQMDZyTD+e1Uzxrkzm/op2TvirgtbP0ftf5xhyu9lE3ckRwGfe/sfcQiB184FbY=
X-Gm-Gg: ASbGncv+uB9fjaxjrI8OfrcYgYzUOlZYWg+cY0/nRtZjddybCWHxD+tP9yqgM1eVAZJ
	3JR3mWvHyBmBs5WNcFlv+f/5sPSc1xh5nEJrk16UuQHT3mIbCKTwi0cdOSYVozn8GnKyawW74si
	bL8gduIkCi7sOXFvpiJTsVnFEyJRel1IZT+WqBCjprWBDaGkTl7XymeFLf8T2TzJ7QShlbLyvWu
	ni1avxxlHdVJhAx50+GKWHEgzBW2THm25oyBNaBxotJjsfVM2IcCHVqSNawfIYq7RZxzcNqodg/
	Mxc0LYGYQdqSN8UeSLtJ+bF06xdwfumj0g==
X-Google-Smtp-Source: AGHT+IGgwyjBJkS8A9AXx8hnLtvyrGDGaqK5MFnxCflHlyNqWU5j8V8iVeDiiMrTGSbUFmaLqW+/tQ==
X-Received: by 2002:a05:651c:b24:b0:2ff:d133:b54c with SMTP id 38308e7fff4ca-30009c63bf8mr20389271fa.11.1733228033208;
        Tue, 03 Dec 2024 04:13:53 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:52 +0000
Subject: [PATCH v2 4/8] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-4-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
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

