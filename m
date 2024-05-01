Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42E1502A4
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 May 2024 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714555181; cv=none; b=j91dxt/jD8oIp+Jzyv5DNq++lCUDc1ZmKikQ6bMckXVs6eqabyYKvXdmcymUkH3x+gULGcM1P2a1EVjLcZmaCL0YeZ8hfj3jh2awbaDnZFm9YH5pnQG+Lk7E/dAa+zoZ5qXeyC56GIVsI2AFbdgTDi+7oIytS71vkG73Kce7cpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714555181; c=relaxed/simple;
	bh=vOiHeEPDJN5GlmzdRmXiBwTTBEgNxD0YW3MwZ4O0Zuw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p4VI5CUnvC6+3LGfXcSZtshutP0XWINT5KEoKn3Zlprfy7uEW+Mst405L8P3Ps53TOPT46Ez4cz2qKkcNiXidTmBDtZKRqAO70s0TwGGfJ4JbyNoXEa73X6AAVjnn3jf/nOqB79KlrMv5PxhXFn9CxYkJZIxIF3SohS3pZlxyo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDjoYGB9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDjoYGB9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a58eb9a42d9so524306066b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714555177; x=1715159977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IU5666ZgVnJUhWYrIKpU1fyu97lInGaK9ybimnvX8Wc=;
        b=WDjoYGB9xWSwByFJ4M8d3ZoITb4mHcB9toVxy8G0Xoix6yTHcnqO9rrUrEkCpu9xXT
         otz1kB4MKlo9e92Wa/jOwb28tJKf3TAHWKUg10FUzwnUOIIGlJ0r9uUBjWUfCNP6R31h
         0OWT/7Zm54Ng793dXx00dBiOdQWGvG5I3fjsooKZMWfX1NuwdHRa89waIeL84MubpiJL
         ZQyib9LQGcQBqKvpW+p/UUgOd2mS4WG//uKbHmr6r40uLW1bEPpBuAMG3CaTr431wWtA
         hxs9H6ZINhDJ9zf85ZjshOO+TrUhsfo8JiVWei0DBUkR6BzEHvwk53Q6jBkIXzRnHe4d
         MbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714555177; x=1715159977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IU5666ZgVnJUhWYrIKpU1fyu97lInGaK9ybimnvX8Wc=;
        b=sl/pWKHANkM2NseV3ygjSu/Vaw6P+MzDDLcixjk8ShpPVAYVzSJItQV0ysGckWGA4Z
         h3ND6Q1PB6hQ8P9GGgIUjOV9mfr9JUunRsqiiAC+lDy7IT2aqaJHSfFhhefjT1gf5lGw
         m4meH3Sd63SoUrgKJ5Vgl0Hc1UG/57v9culh5hc3PX83wSmpjVNpciM5J/3JPW6qKxif
         ZZSf96yngWd6XsVgoX8uY7FodoN036DppqQJtmEsCStqSmAwYD+vInojYocnPS+K0s8b
         iaSxDpxZFkqfqogjhPGGsIS+LhJmii1K6EM9H0mrLknK6KIFns4gs9AkWZR5O7iN2jyS
         wPAw==
X-Forwarded-Encrypted: i=1; AJvYcCVS3vDUPWo0qn6jWgtFDNJDolP0+Wn1CYdCD0hCh0I7BSWfSkeZiWEAm5Nsi4Jf8SeWLj/F0om2uzIsRQpyhOHeVYvnY7dVsOBMfxp0M4SOoV0=
X-Gm-Message-State: AOJu0YwZBLRPfGJHqrRAzm2JAiYQxchLT2IGZkR1tjN1Bp/JX96eTt3b
	eCK+CQIiJtzrzsNsR14EOYUBlTRarXYAlzNLO2v20c6X2SoG3qQGKDrs/cXDgjk=
X-Google-Smtp-Source: AGHT+IH/Ba7QbLPRPS+XzgPny6nXWZgsA7cIv4uu6lM0q2mhIikp9GNHF5bwt9YwZT+naZcTk3Cmgw==
X-Received: by 2002:a17:906:2c16:b0:a51:982e:b3f7 with SMTP id e22-20020a1709062c1600b00a51982eb3f7mr1404669ejh.37.1714555177187;
        Wed, 01 May 2024 02:19:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id bw13-20020a170906c1cd00b00a58de09fd92sm5425674ejb.27.2024.05.01.02.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 02:19:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/7] USB31DRD phy support for Google Tensor gs101 (HS &
 SS)
Date: Wed, 01 May 2024 10:19:35 +0100
Message-Id: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACcJMmYC/3XMywrCMBCF4Vcps3YkkwQKrnwP6SKXaTogTUm0W
 Erf3di9y//A+XaoXIQr3LodCq9SJc8t9KWDMLk5MUpsDVppq6w2+K4el2nDVEkROj8apl5HChb
 aZyk8yuf0HkPrSeorl+3kV/qt/6SVUCH7GLxxgXob70+ZXcnXXBIMx3F8Aa6V3tGrAAAA
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
 Arnd Bergmann <arnd@arndb.de>, lee@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This patch series adds support for the Exynos USB 3.1 DRD combo phy, as
found in Exynos 9 SoCs like Google GS101. It supports USB SS, HS and
DisplayPort, but DisplayPort is out of scope for this series.

In terms of UTMI+, this is very similar to the existing Exynos850
support in this driver. The difference is that it supports both UTMI+
(HS) and PIPE3 (SS). Firstly, there are some preparatory patches to simplify
addition, while the bulk of the changes is around the SS part.

This version doesn't change anything around Krzysztof's comments regarding
syscon- vs Exynos-specific PMU APIs, but I wanted to post a version with at
least the simple fixes that are necessary as well applied.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- avoid having nested else/if in the DT binding (Rob)
- add missing bitfield.h include
- Link to v1: https://lore.kernel.org/r/20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org

---
André Draszik (7):
      dt-bindings: phy: samsung,usb3-drd-phy: add gs101 compatible
      phy: exynos5-usbdrd: use exynos_get_pmu_regmap_by_phandle() for PMU regs
      phy: exynos5-usbdrd: support isolating HS and SS ports independently
      phy: exynos5-usbdrd: set ref clk freq in exynos850_usbdrd_utmi_init()
      phy: exynos5-usbdrd: uniform order of register bit macros
      phy: exynos5-usbdrd: convert to clk_bulk for phy (register) access
      phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  61 +-
 drivers/phy/samsung/Kconfig                        |   1 -
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 754 +++++++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h        |   4 +
 4 files changed, 756 insertions(+), 64 deletions(-)
---
base-commit: d04466706db5e241ee026f17b5f920e50dee26b5
change-id: 20240423-usb-phy-gs101-abf3e172d1c4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

