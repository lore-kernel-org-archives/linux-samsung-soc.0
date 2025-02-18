Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6B26FA5D;
	Tue, 18 Feb 2025 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904659; cv=none; b=a5eTh9QjtOWcdLGRrFcrPOygmw2a9v6SdRjCxJ7phbkpLXHQqJBeOl4r68JS+YKafBUY8bN/uuw8Qi1tl+m80Ffw96C6od3mkF6/386whwm0RDHnUMHCEoTeNzfsITWUUb1xJhLYXUUsVIG+qOuSdSAWEbkKAHmLe9FRZrqt5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904659; c=relaxed/simple;
	bh=BXcSZpx+Le2bntwbZDzn7we6IloI2TDAfbSfncDltOE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UKv85A3sNwtZQoPTSeMtuycEooowhSAJ14dqKiP1edv2fVVIYgQa3nkot5xD18PdKbWH/D7SktLms0zeF4SFhQRExdO+UD+Ejj9k7fBiutvDkMMEJKwz03vq38/sA2wN4jATCAUCn2EVkhWROYbDDREU0/9AWpgPOLEEH3GDucY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fXFaJ5Oq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fXFaJ5Oq"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7CA7525FB4;
	Tue, 18 Feb 2025 19:50:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7HvUdC65Vq9; Tue, 18 Feb 2025 19:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904654; bh=BXcSZpx+Le2bntwbZDzn7we6IloI2TDAfbSfncDltOE=;
	h=From:Subject:Date:To:Cc;
	b=fXFaJ5OqeuwDC+WuzjXOs8vW1foiisKEEffYVOfdFCplENol26rGMgwcgm9iWa8QK
	 M54UNyaCsDfiOpAuWDGFqXfmTeW717GEh9NGS3dk4uoYoMue19ZM8R9ezgywsMeZTh
	 q8cqsAUXZp4JQrQuhnUXc2ZsZlEfJxFQw/N999cw0g+NDNGP8KRl+JSnuLYT04WaSl
	 Nrc0Hpdzp43xmUH3n/Yd2olo4aCeAckLJ/hVBukDyJy2ECW0o740F6S9nDfJ37XCTc
	 Dg2u3SVa3uoNcK8sXwzq68SuPo2sTNulczv4uhfQ6X9n0FuIXmD/EUwM6RqDyIPn8z
	 4ebmQBV1Aqzmg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/5] Introduce support for Exynos7870 clocks and PMU
Date: Wed, 19 Feb 2025 00:20:27 +0530
Message-Id: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPWtGcC/3WNQQ6CQAxFr0K6dkyhklFX3MOwGKBCozJkigRCu
 LsjiUuX7yX//RWUg7DCNVkh8CQqvo9AhwTqzvUtG2kiQ4ZZjhmS4XnpvdqzRTO83qZ++vqhpsG
 KCC8W2VmI2yHwXea9eysjd6KjD8t+M6Vf+yue/hSn1KBxhISO86rKqWhEg/fj0YcWym3bPpfOA
 Fe8AAAA
X-Change-ID: 20250203-exynos7870-pmu-clocks-d0b330970ea7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=2379;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BXcSZpx+Le2bntwbZDzn7we6IloI2TDAfbSfncDltOE=;
 b=y+09pcC11CL24RvdlKFlTZ5Vaa3GKfmOCyi0Gb2s4Z00xUVnohX3SmWiXy06QZHlM5mdsvlPd
 yKsXXXEXbBZDiAi4h7BK0P6N12/Z3juZq93EBiWLWQIs28Fyy4TzBwk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add a CMU driver for Exynos7870 devices. It handles the following
clock banks:
 * CMU_MIF
 * CMU_DISPAUD
 * CMU_FSYS
 * CMU_G3D
 * CMU_ISP
 * CMU_MFCMSCL
 * CMU_PERI

It also documents Exynos7870 PMU's compatible, and adds a CLKOUT driver
which depends on the compatible. The CLKOUT driver manages clocks from
PMU_DEBUG.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Fix incorrect versioning (Link to v2: is labelled as v1).
- Fix formatting issues in clk-exynos7870 DT docs (from v1).
- Add myself as maintainer for clk-exynos7870.
- Change clock name definitions in clk-exynos7870 DT docs.
- Fix line wrapping in commit message of exynos7870-pmu DT docs.
- Change a few ordinals of PERI* clocks in the clk-exynos7870 driver.
- Take over ownership of patches by the co-author, upon their request.
- Link to v2: https://lore.kernel.org/r/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org

Changes in v2:
- Drop all patches from v1 except:
  - dt-bindings: clock: add clock definitions for exynos7870 CMU
  - dt-bindings: clock: document exynos7870 clock driver CMU bindings
- Add patch for adding appropriate PMU compatible.
- Add patches for CMU and CLKOUT drivers.
- Link to v1: https://lore.kernel.org/all/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org/

---
Kaustabh Chakraborty (5):
      dt-bindings: clock: add clock definitions for exynos7870 CMU
      dt-bindings: clock: document exynos7870 clock driver CMU bindings
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      clk: samsung: add initial exynos7870 clock driver
      clk: samsung: add exynos7870 CLKOUT support

 .../bindings/clock/samsung,exynos7870-clock.yaml   |  227 +++
 .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    3 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 include/dt-bindings/clock/exynos7870.h             |  324 ++++
 6 files changed, 2386 insertions(+)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-pmu-clocks-d0b330970ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

