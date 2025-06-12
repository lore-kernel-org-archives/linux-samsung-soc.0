Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE382BF3DF;
	Thu, 12 Jun 2025 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741843; cv=none; b=hp3beWmtYx7PyowoywzIMizYHtYNi9ptEF57w7uRCnu3SwN2uzc1NsNSWJrz6ltOIClB2FgqvASo2wdw7h/CTx1euG+CLmBgS5vp+jtcyv+ICevG9bPam0Xelz7f1HIA8BjqFuM0LEUNsZcRf5RYezVcAJ09T++32nSvFRb8hOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741843; c=relaxed/simple;
	bh=e2L+AV00TtnXw1GDXliijhYZY+VMGmWnxJeetHc99Lw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b9qdb1qrOssI45sDrwDy7xQEIsIMKei6So8LaiyZBGbRRMCjAp5bVbujvweAg0KQKdQrkjmPFPc81Ch++EJfs+h0P92syPSQKOxe39tJFNvmSYA+38Pb7A0LmFN0WmebF/yzvnAkO6UXsiu4V6pNKNOThSLrI+Bxe2UwhHdUyzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JoPZTG1K; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JoPZTG1K"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0EDA25C00;
	Thu, 12 Jun 2025 17:24:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzejOIWm-WrY; Thu, 12 Jun 2025 17:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741839; bh=e2L+AV00TtnXw1GDXliijhYZY+VMGmWnxJeetHc99Lw=;
	h=From:Subject:Date:To:Cc;
	b=JoPZTG1K6VC45U7XtfBY06ap5s93Rik5lgGujH2W+JLf3pxrnEtJV/eH/p1ys7uG/
	 VyX6XBI4ef8t6H7fKaKACPhJpSXegVdZhYvqq+Rj1c1025y4n7efdT+oOpJjvgllun
	 uVyl3u911sKoWhpI7iRr8ShukuAUXK7BsU8jpZEqSY/2Z128kV4+REgD/9fpL4Ainw
	 WeicsoCcSLJ7MlTC3lIjhmBzHJklyBO9j70uPL8W0fso5rxLJPwv+dl/xkln3rot8c
	 ULI2Y5Hc/O1lPIl+MXuvPrvkDH0Rw+/AMGAJkEJaaIIlRuESLAiubQG2gCLPtn/1Dw
	 jNMGBjgTqUXlQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/5] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
Date: Thu, 12 Jun 2025 20:53:36 +0530
Message-Id: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjwSmgC/x3MTQ5AMBBA4avIrE1SFSmuIhb9GcxCSUeEiLtrL
 L/Few8IJSaBvngg0cnCW8yoygL8YuNMyCEbtNKNanSNdN1xE9MahSGtGA7B1nhvnakrZzvI4Z5
 o4uufDuP7fl9vAzZkAAAA
X-Change-ID: 20250523-exynos7870-drm-dts-87ccab731ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=2522;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=e2L+AV00TtnXw1GDXliijhYZY+VMGmWnxJeetHc99Lw=;
 b=IvYVO6KFyABl3lbASbgkJhmTWfjQJX6zHF9WbeGzXKnrcA7VcRJxNE9s4peKlOdsfTDZmTNUH
 c36YxJ2VAD9Dnup2Mr4nBiKF+6E+kPQClh8o/Z42pDKgHfSiBS9zGVd
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 has a IP subsystem in its architecture dedicated to display
management. Notably, this block includes the Display Enhancement
Controller (DECON), and the DSI Master (DSIM).

The following series and its sub-series implement all components for a
functioning display pipeline. All vital information which helped shaping
up the patches have been retrieved from Exynos7870 vendor kernel sources
as provided by Samsung.

Testing has been done on all three devices available upstream, i.e.
Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
(samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). Regrettably,
I've only been able to test the functionality on video mode, as none of
the devices have panels working in command mode.

This series implements changes in the SoC subsystem, which includes
devicetree additions. It depends on all sub-series listed below:
(Legend: [R]eviewed, [A]ccepted)

exynosdrm-decon            - https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org
exynos7870-mipi-phy        - https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
exynos7870-dsim            - https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org
panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
panel-synaptics-tddi       - https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (5):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      arch: arm64: dts: exynos7870: add DSI support
      arch: arm64: dts: exynos7870-on7xelte: enable display panel support
      arch: arm64: dts: exynos7870-a2corelte: enable display panel support
      arch: arm64: dts: exynos7870-j6lte: enable display panel support

 .../soc/samsung/samsung,exynos-sysreg.yaml         |  6 ++
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 41 ++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 +++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 +++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 94 ++++++++++++++++++++++
 5 files changed, 219 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-exynos7870-drm-dts-87ccab731ba9

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

