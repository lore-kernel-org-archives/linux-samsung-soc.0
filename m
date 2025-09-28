Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871B1C8632;
	Sun, 28 Sep 2025 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082232; cv=none; b=UkiJehapXhBhVQxbpNPW8wJjwsXVO7qDh+N6Pq0r76nA3gTI3uClGzs0PY+1vnlwsRuYuemfv0oq0m3ESofCYKNp9XWd5ckRVr/+hM0wKd4lW0wWdzHy8TzXzQ2mEaIiaz994Lzg6l6LATJhSys9mklDdCSw/msggA5uxl+ldq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082232; c=relaxed/simple;
	bh=8py30CHyigZviZ2rpSpVxQKrO0mgBy5ZGBCf1zEeL8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dpiOCUeGwTZcY0XAsIWKW9LzPKsgOX5Bc38n5oP34dgMQKFfmj9+seHY+8Q2DFEE7p0fickiAZHuYmHiv0ytc+Oszt+x5n6T2CK0H4pg8A2oYrTxiPRtRduqG/57GG0hbzjswqsA2DqBUmpNDvTHYemw6Lf+KSCsuouZB64N2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MQT1JnPe; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MQT1JnPe"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 516F226173;
	Sun, 28 Sep 2025 19:57:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ivMluFyA8AD; Sun, 28 Sep 2025 19:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082226; bh=8py30CHyigZviZ2rpSpVxQKrO0mgBy5ZGBCf1zEeL8Q=;
	h=From:Subject:Date:To:Cc;
	b=MQT1JnPeQVJhHYBKZrK2Vu0LQRKywq3nBTQ7YhDKQQFbw8PnDou+7xq21v16CZtAu
	 S/hzPa8CWFLFDHuK3PQHX8gySmnybBPenqu8eryyq0bOnUIZ1zljgym1tTKMO1kguc
	 m4Gtl8VHMLG4Pa+zkjui9UiPaQsYewIqA8KVbZdwawUrHXWTOn3yF1qwmuCGfTX073
	 e8q+GS4iyBEv1SOBiHD22WZ5mUBBqQIIlC3Cjj6k6QpUSaR78Ha56UmX+y4VNaK4L2
	 GhkAMflRh87eln7E9THguM9CSs0YnHiaBLhBlbNUaqElMVM+bZx1n63p1hapnBsiVv
	 ZL5LsUby49h2g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
Date: Sun, 28 Sep 2025 23:26:34 +0530
Message-Id: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANV22WgC/23NQQ6DIBCF4as0rEsDQ3Wgq96j6QIBlUWlAUM0x
 rsX7aZNXP4vmW8Wklz0LpHbaSHRZZ98GEqI84mYXg+do96WJsCgYhUI6qZ5CAklMmrji9oxUYn
 G6AYFb7Qi5fAdXeunHX08S/c+jSHO+4/Mt/XL1RyOuMwpo1Iahqh0W5vmbn2KIYyXEDuygRl+E
 MBDBApir7pSwFAoZv+RdV0/5LeXUfsAAAA=
X-Change-ID: 20250523-exynos7870-drm-dts-87ccab731ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=3858;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=8py30CHyigZviZ2rpSpVxQKrO0mgBy5ZGBCf1zEeL8Q=;
 b=/q0ya9ZZafrks/RtT4YDPlXOFvihPaELzrwMJYW8FCOpMFEuYSs9f6XwNIPgl0eORsl7boygW
 C2hIKUqanxPCaBSwjnco859JWtfWt8lm+PkMh7j7iaZL3KklOQgHaSk
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

exynos-sysmmu-resv-regions A https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org
exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
exynos7870-mipi-phy-fix    A https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org
exynos7870-dsim            A https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org
exynosdrm-decon            A https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org
panel-samsung-s6e8aa5x01   A https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org
panel-synaptics-tddi       - https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- fixed minor issues with devicetree in regards to compliance
- added memory-region to framebuffer region for decon device
- added related patchset to list: exynos-sysmmu-resv-regions
- replaced exynos7870-pmu with exynos7-pmu compatible to the list
  allowing a MIPI PHY subnode (krzk)
- updated compatible string and dt node for j6lte's panel
- reorder properties: ${x}, followed by ${x}-names (krzk)
- Link to v2: https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org

Changes in v2:
- modified compatible hierarchy to use non-deprecated syntax (krzk)
- fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] (krzk)
- removed simplefb nodes instead of disabling it (krzk)
- added dt-bindings patch to allow mipi-phy node under PMU
- changed clock names of dsim node
- Link to v1: https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org

---
Kaustabh Chakraborty (6):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7 PMU
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 +++++++++++----
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 +++++++++++----
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84 ++++++++++++++++++++++
 6 files changed, 197 insertions(+), 42 deletions(-)
---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250523-exynos7870-drm-dts-87ccab731ba9

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

