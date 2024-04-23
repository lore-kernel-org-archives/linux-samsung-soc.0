Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882013C9C9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891990; cv=none; b=LVppSyYCytq6S0zQbKdh8jg8qfWL2sHI3bkh3zzf5BT3w4+mOuS1wI2tBH74Hjcp/N01+CsozDaINZUnWCAWFPQsOSoSj5sFEVq9T2GYVglDZ3Z9WJGFpwQWdx5sadWH7Dv8cM7VtevjfxciWKmi3fdXdJOStYyAchcdd/vXriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891990; c=relaxed/simple;
	bh=/U4RNSE6GOJLkC+Bia6Ykc/PsiWjQWzhLb3Hjhc3LHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o3FUWOL10nEk1byDDD1o9RB8ZZiFyjBj4hspacGYJzYrU3aPGkiklyft33EnyPDMzUluI3OoRc9eZex6S9AMAqOxm8IteTK9ABztbp8BiXm+rXiAC+ZvdijT3ySPgfJBgpyTA+Q7WpjGlMIcKpylmZgVuA8Q4Bm1BeToBgVrDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMy2Iyyg; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMy2Iyyg"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-572256b1636so607599a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891985; x=1714496785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BF47HR8rwGnW7a+NGpGna006XTjqIwQDe3zUQkmwlF4=;
        b=jMy2IyygF5agQNhRph/Sx/r9T5qSs1u09SZ9xcmcQ0IS0GwJ+WZ0ZoLOsBLs5P4F0g
         XO6wWlhtShByR3Z3r6kpFPTaPrfMlMqlrDFl7BR9QKkUIz+9WwncK2LnFaLCHMnU3hwO
         Yf1GW5ET9flbKR57O1roGJ4ILCiKWJesd32V4hAbfEntrP4CivznTVujZSRTOfhdbo/C
         MOVgML1i2kT8WSN7as8bhqqu+f/bgKOqEjfuMTB8OGD/EeorrDh4DTULyB5Xcom9uCyl
         ZZDwnYallW5sbEG0DBGUKOnfaZYi81sySTQOyXXMbzamNg9Pdmlmnn6+iCjGJfl1LzQ6
         aplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891985; x=1714496785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BF47HR8rwGnW7a+NGpGna006XTjqIwQDe3zUQkmwlF4=;
        b=eBkDYXlj0NpiSUBUEUKOJ8M/QejJatPS23rm+EYzL9u8AfjxbiFvUl7BDaxP1I9N81
         q8iYLnsYN41XWYp3quGzGSuAgPvkjj+5ZBnFEX2IvZOR88/LSFgus4tpdbDK0CWtEAw7
         nVbzSaKPG/YREYGWWBLUTDegbQgkdbEUtMrblBqyGeBM77UKoeYFFdaRpqjOsMnSt39p
         W+1gBJD0291rUKO5m16VoPuFyUQfAC7LULADFCDgKs6PZ/dMmbOFlO8rC3Ev/gc/8B3K
         hu7TLcN257WpTGd65Sbgav367P2U++2WWPjgqVlxlTljRz5MpumWPBMVbMYHXxrOX1NJ
         TfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoqDsZJGQ7Fj8PwdBHKDarnAMMHsglicmAE1qQ8APKN5njuZjaTM3HvGwDDne3nAv4GX7Xl6TbaGgvKo0ZQ/2h0W45+ozGK6FoygJchz5KHw0=
X-Gm-Message-State: AOJu0YwxiCgQOxQ5xlKYIwkOKVLlBzQiNaRn1E7xEp49Zzj6x6DpEMeH
	950WBAnZN//7sA2ZnjKmeRo40evGbgDm9jNTKfUxs30DIMFgud3hQb0KgdnYZE8=
X-Google-Smtp-Source: AGHT+IGsJUTYp6jPj3zCnglMqmn8IdnSJ9732oBBXj4sEuFPOsBM8m9lsAHScdfHBSn55C1oqSfAww==
X-Received: by 2002:a17:906:259a:b0:a46:65fd:969d with SMTP id m26-20020a170906259a00b00a4665fd969dmr8177311ejb.71.1713891984836;
        Tue, 23 Apr 2024 10:06:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/7] USB31DRD phy support for Google Tensor gs101 (HS & SS)
Date: Tue, 23 Apr 2024 18:06:02 +0100
Message-Id: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHrqJ2YC/x3MMQqAMAxA0atIZgNNLQheRRy0pm2WKg2KIt7d4
 viG/x9QLsIKQ/NA4VNUtlxBbQM+zTkyyloN1lhnnO3w0AX3dGNUMoTzEjqm3q7kHdRmLxzk+n/
 j9L4fADc1WF8AAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This patch series add support for the Exynos USB 3.1 DRD combo phy, as found
in Exynos 9 SoCs like Google GS101. It supports USB SS, HS and DisplayPort,
but DisplayPort is out of scope for this series.

In terms of UTMI+, this is very similar to the existing Exynos850
support in this driver. The difference is that it supports both UTMI+
(HS) and PIPE3 (SS). Firstly, there are some preparatory patches to simplify
addition, while the bulk of the changes is around the SS part.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (7):
      dt-bindings: phy: samsung,usb3-drd-phy: add gs101 compatible
      phy: exynos5-usbdrd: use exynos_get_pmu_regmap_by_phandle() for PMU regs
      phy: exynos5-usbdrd: support isolating HS and SS ports independently
      phy: exynos5-usbdrd: set ref clk freq in exynos850_usbdrd_utmi_init()
      phy: exynos5-usbdrd: uniform order of register bit macros
      phy: exynos5-usbdrd: convert to clk_bulk for phy (register) access
      phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  78 ++-
 drivers/phy/samsung/Kconfig                        |   1 -
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 753 +++++++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h        |   4 +
 4 files changed, 757 insertions(+), 79 deletions(-)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240423-usb-phy-gs101-abf3e172d1c4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

