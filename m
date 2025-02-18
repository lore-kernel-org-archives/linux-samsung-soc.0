Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9AF1E51F6;
	Tue, 18 Feb 2025 18:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904978; cv=none; b=p8229MP5IrLH8tCeP7+pP6v/pdFfJRS7QDvRUX8joVM7sxL+i8OPnzn1xxZ4fjtci0r3h+WDY29MgNbmdshTU4wv4bGct1g0BnekL4DMsu9045cYR5+C+0YXgP6KiYBHE6zLizaLpq9rcORNvDj+9tKDnZVIDXjuNb/gjJBvec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904978; c=relaxed/simple;
	bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HBEuysb5VMdrCA20FeQcbrS5MacfJ/7JZA+CNKUYLz9WkmAbaEF6iM1VIaL3DGssBPM6Zqw9km9p/tKO9DhbV9uCi718zxEoaiOTpBg9c4Gx1ssGTfAttH8oOHhksfY4WA1OB/KEjn4T0dAsYSpifPVy+dW+tiVinb6tGiwOLps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KcIEgY2o; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KcIEgY2o"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB76A234ED;
	Tue, 18 Feb 2025 19:56:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUP-Q1szeK_g; Tue, 18 Feb 2025 19:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904974; bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:To:Cc;
	b=KcIEgY2o6kVj0oRQMDdMVgVROrZfc5cJSJem5YEK0AxUL2LKe89E5eOr9WCcrbTnK
	 vxcqvLNIBe0f9ZbuOBCD40JzebjSRbm+78IQOZYerficCbC/L6X74OZhbnbCdT9LWm
	 7al+YW1SGDX/PWSibNguJ07qST8oIez1Q9sE3fFrj3bdjVpEjYvSePiVXT4N0TqI2/
	 Gebwv3u5HpaDumDw6QwIZ4nggPGfaoO6fkmsnpxXqU6gasFVcGXnJYpItqa/zkl26F
	 fnrsna4I/BKobedyfcGsCe/6DpW8lPrkbt2VOaMSWAstqw6eczk1byrVKI7vYhYrgO
	 b7wdEyqHJdKAA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Introduce USBDRD-PHY support for Exynos7870 SoC
Date: Wed, 19 Feb 2025 00:25:37 +0530
Message-Id: <20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnXtGcC/22NOw6DMBAFr4K2jiNjPgaq3COigLDG29jISxAI+
 e5xkNKlnJHevBMYAyFDl50QcCMm7xKoWwYvO7gZBU2JQUlVSSULgfvhPOtGS/HmcbGHqMe2aYv
 alGU+QdotAQ3tV/PZJ7bEqw/HdbHlX/urlX9qWy6kMIUc2qbSaHB8TMTB+/Xuwwx9jPEDYDxWh
 7QAAAA=
X-Change-ID: 20250203-exynos7870-usbphy-6b98936f441d
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904968; l=1208;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
 b=Vg1OPg3CQFyh2tZdL14b9baf4IKxguTJiHMkoT4ZXtxC7l3bb51GqXJ5CfNfyMa9dv+wUDzpl
 YN17CKw6wW1Cp+Olk4fxqseV/zB9Lqag56L3ssU9oLWREBCZHnLmwNI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Apart from introducing driver support and documentation, this patch series
also introduces a masking fix and non-functional changes.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Do away with [PATCH 1/4] from v1 as it was sent separately.
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org

---
Kaustabh Chakraborty (3):
      phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible
      phy: exynos5-usbdrd: add exynos7870 USBDRD support

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   2 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 407 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |   2 +
 3 files changed, 339 insertions(+), 72 deletions(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-usbphy-6b98936f441d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

