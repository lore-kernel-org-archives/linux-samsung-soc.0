Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCAE16F0D2
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091290; cv=none; b=EgBemmQ+CAHYRrm2XBNVeSUk1CM9DnKbEhC+fKh83E0lEb2o01coo/rR5n8mbkGhGf3I0vOqV9hcQ3Sn6G3gPrtyjCn2xYYtaN8U+uGubVVa7qHePcjr7sR0sFzCs61e47Btw7jS2Tr+wUYzqsCGcozU4bPNVWEeACegvBUXFWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091290; c=relaxed/simple;
	bh=3bFJoZ914QT6J6EQqjd5/3SA82dIJ6nV/7s+Fn+7mFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOkBgzKCkVB5GwZWe1AdjrCg9wyb47XDmk91rFLDDk1bBLu6jEiK2fpPSi3+Jn2ysVj+KpYPOPLPABfA/A6oTqDBoXNQwmn6Ee81KGrlcYyA/o4AMkz5E2fdxzQEmZiLM3Mg4Ycf88TW/Qw8pJpS9ZVqRGlivsSS1SfFH+1WRdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PYRBv4F3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PYRBv4F3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5200afe39eso838632166b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715091287; x=1715696087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRJY6HmSgpn53uyORMcRB9h2EnMXe+jzCDlKmur6pwc=;
        b=PYRBv4F3VRuptvTlCe6L977JCJgqknY5uuvtWh2ulsfZ90knBw6ViZOX6lxoRe68BE
         1qEy/fLayeSl2IC1hrOiglYQffpA6zXaecWohmB2+2Ka2HqNn6o2GagP5f8Ou33Ry0SL
         7cbN3r0ts6YMWh8dW7XQXuh4wWsMUyUR3snkbZPTX2uQ18q8urSwHMTzkdGlV29GbBX1
         sqk3RzSsPUvmoRZxubsd3E6VMx0lL1+vvOcswoNsg2tBeBg/dngeK+wPUZBWJf3Jdq4K
         4Hx1tbKggmi6wF2gEpPqbGPLFeQNqpWmLKSe9hYJ6ePNItqM0UcZ1eXcgGhDh01OKjTQ
         Qvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091287; x=1715696087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRJY6HmSgpn53uyORMcRB9h2EnMXe+jzCDlKmur6pwc=;
        b=klh02rFPglz3QTclK4b6e7GuUsC6Zn26/UR6WNlNZcK2avYT5hljCrJNh+SmD2lJrg
         oAClT7Ce6QJZwKJBKqCdnQ77ZZgY/79hT4+YKOcURWSf2h8A7hHmb/ox/LYBfYhKDx31
         3yspz+VzE2VQ8eyaVxoIJ3OrwavEAFu7tBaR44BdD8NUekkAKBtOnFinR8/ilLzERJ1T
         OCBqUEsg1ELGSpgipA11uu9phVEocLmyzUEVs5dGRtOR/RvtljQL5+DuStCKz6Cjdxrt
         gDLunZU5rqTDLt7vBzrS5c0scIrCX2oLKC6Z+//5Lq344u7r6YIYZJiWrRuFvGSYqwWc
         UIPw==
X-Forwarded-Encrypted: i=1; AJvYcCVvqqY2GnmCTT3fospHuo+iZPZMEbMPaGmf986Ip3RXCGr0ldq1AryY+ENYpvrgYKxI2eJXEU2UkY4w96P3r/XKbie0Uf7Db9yFRiyRTBxj5ng=
X-Gm-Message-State: AOJu0Yxn//ubtMbslNbweA+gaGIqTgv1p51VHzrnoBEASOV5wnUfWztS
	4Iqbb8z8JFMPJfb1sp2aYu9XDpBkeqTrgg2EVIO5JfEdj4n1EoIPbRT4nHqosjhSaxl4pzK4Oro
	1NKn/ng==
X-Google-Smtp-Source: AGHT+IEdZxa78ehLtOjVAh87nK9d2t0R1fsYeVK5kmd0WktV4j/K80OYdHHk5mz5N7FPqzg+kN+QUg==
X-Received: by 2002:a50:a45c:0:b0:572:9dc3:ce3b with SMTP id v28-20020a50a45c000000b005729dc3ce3bmr11623041edb.1.1715091287502;
        Tue, 07 May 2024 07:14:47 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id x2-20020a056402414200b00572cf08369asm5621928eda.23.2024.05.07.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:14:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 May 2024 15:14:47 +0100
Subject: [PATCH 4/5] phy: exynos5-usbdrd: fix definition of
 EXYNOS5_FSEL_26MHZ
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240507-samsung-usb-phy-fixes-v1-4-4ccba5afa7cc@linaro.org>
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Using 0x82 seems odd, where everything else is just a sequence.

On E850, this macro isn't used (as a register value), only to assign
its value to the 'extrefclk' variable, which is otherwise unused on
that platform. Older platforms don't appear to support 26MHz in the
first place (since this macro was added for E850).

Furthermore, the downstream driver uses 0x82 to denote
USBPHY_REFCLK_DIFF_26MHZ (whatever that means exactly), but for all the
other values we match downstream's non-DIFF macros.

Update to avoid confusion. No functional change intended.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ed4898741c99..1da7a4881f72 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -30,7 +30,7 @@
 #define EXYNOS5_FSEL_19MHZ2		0x3
 #define EXYNOS5_FSEL_20MHZ		0x4
 #define EXYNOS5_FSEL_24MHZ		0x5
-#define EXYNOS5_FSEL_26MHZ		0x82
+#define EXYNOS5_FSEL_26MHZ		0x6
 #define EXYNOS5_FSEL_50MHZ		0x7
 
 /* Exynos5: USB 3.0 DRD PHY registers */

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

