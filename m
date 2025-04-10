Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B531DF97F;
	Thu, 10 Apr 2025 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273934; cv=none; b=nGkxAdobdPtCnM90mY72A74YIat/ziaxTsB2OJH7iOR2H/vJa2VRod68yBI4lb32d3ZzflNmim+FJ41Fq8gBZZpFijItSnvWka3f/lMrE8kwXmT5XpofgQ1jMNTHqhAX8TmMlXJ7UAVvT/tWHI0aXDqzvbjhaibPrzrI28+wjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273934; c=relaxed/simple;
	bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TQ2Sj5gqM3695JRAWGQXR3lPU7DeDALL20zv/o/mc4JgJsGPxHdKJgNKQL6n9LWqjIt/EAVRffqDHkUOE3RkEkIjfQPMsDTzuTeMf2UN7wHlWT/Xb9FIxQl88+xsQUOEhT06sVsN4t8xxlF1U4em5Bs6oixVgESf41l4ILLHE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ddlbP/ht; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ddlbP/ht"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 28A0525C00;
	Thu, 10 Apr 2025 10:32:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42vApmXQL7iW; Thu, 10 Apr 2025 10:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744273922; bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:To:Cc;
	b=ddlbP/ht9FPdCFW5yrI6r+WfmjExvlpGOzUueTMpiwMhUWo/COHleqPJ5YAvK4uFz
	 r7x95elhGJ8kTBvy1o59oZZJHWMQdg0Ta1SKiTxa1s0v99ORW8qzG/JzuEsaNCP782
	 4Umv2tSNM9V7tAR3FijLEZGqTPqeksK5pdXbud4T/qztkSfd3bMLZ2v6huLIQI28C6
	 SyJzqlPHQiRwHmihyInpKUZ48rqTQ06v86qWyhdxI8H2qYCPnfNswRhkqpOSiGM8xM
	 ndQawIXmd5HBV/VU5fdXWfREUl7NImmNmTLw5BJEQicO0GIn5MyZMrc/7LuQWukkQu
	 c8DTg7aeekhRQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH RESEND v2 0/3] Introduce USBDRD-PHY support for Exynos7870
 SoC
Date: Thu, 10 Apr 2025 14:01:11 +0530
Message-Id: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744273913; l=1208;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
 b=+G9OHWZP6035gJvZmvayt6lvoP55fp/X+4NQwi/yUhYw7uO75Tr3CSRsxo/4aciRnT70/QRbk
 7NdfJ58nXlqBCeghauPts0VWnWuRXy8HXWCiZLfoe8vOsfTdIb+APOD
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

