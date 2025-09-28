Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ED01C6A3;
	Sun, 28 Sep 2025 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077850; cv=none; b=JzmQU7Gq/6VgXdToX7bSj2K2Qiz3uL4kongxBF+6byWL2ThbDoBP40+DYgOflpmx9wpUk09MLT9nAcBwa6SNYaLCe4HG2ApYTBlpxsCCnrZMuME4NRTslklI7SZtCiZd+9xfrkGIGRbwLjrwY2Lr3kEPJvUgAyOc2ZxSCtgVRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077850; c=relaxed/simple;
	bh=e1OfZxzNPwwiaonitVzU1HpgjvpPK0JLXAurui8x2y8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fu8JvB9snpWsA9IGONOdFb0NmilrKed1Coj6EcX7hYStaEXF5fP3x/XyooS+T5f7K+Gb6XomG3PhT4W3xvQRZDtFWMJIKP6rCw2f7h8m/+yZij8hMngLDYHB5U4rh6ti9p+311daeLFO2nBfHK/LhIJN4qWiXS96pV19/ls6prQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R9CxUyk4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R9CxUyk4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5422A25F6E;
	Sun, 28 Sep 2025 18:44:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M00hG7zezvcS; Sun, 28 Sep 2025 18:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077844; bh=e1OfZxzNPwwiaonitVzU1HpgjvpPK0JLXAurui8x2y8=;
	h=From:Subject:Date:To:Cc;
	b=R9CxUyk4oNQGd+cCwaYMXAsK12ipVbgx3Pc0ULbRephzT0/D6woVGD40hn60Urj4x
	 nF6BEjas8BqUyZ7Vx8IrYCE8ivGb+x6VpjqqhqFlpNCupjm7SiajICkBLHtDFCVQkb
	 Ue6ml2Pz0F9HoFcFA/M6y7RQ/qJtF8tHbXvtIJWC1VivtjAAwTkXSS6oLFMGm40PVC
	 Vvh87cDzvW58XjXf8UgIzkEs3C1Ux8LwEC5I60nuo9dxD0f84eFohSsHhRYqP0aR8e
	 ba8llvGWyhXsMt8ID5LSexTGU6t2oGkGeq92t1Uh/prtoVAMw5r828dYx+gQcTPXCy
	 48+yLauXmLIQQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/7] Another set of exynos7870 devicetree fixes
Date: Sun, 28 Sep 2025 22:13:51 +0530
Message-Id: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdl2WgC/x3LMQqAMAxA0atIZgOxqBWvIg5qU81SpRFRine3O
 D4+P4FyFFboiwSRL1HZQ0ZVFrBsU1gZxWWDIdNQZwj5fsKutrOE7kQvNyvO9eTI2IV9ayGfR+Q
 /5HEY3/cDQXTU+2UAAAA=
X-Change-ID: 20250820-exynos7870-dt-fixes-b4ad027cef67
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1335;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=e1OfZxzNPwwiaonitVzU1HpgjvpPK0JLXAurui8x2y8=;
 b=vOleMytmxLFyYirZlybtdfiVdvBrDujdeWsiASK9ZWdUvTF0FHgH+d4OwC8htEfp34J9a6qBt
 l5vb8AlS5mWA7O2QcrNTD4M4M3oOwUaypzJn8JStjcSmft1qPinF5wA
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Applying this patchset will introduce the following:
* All ${x}-names properties will now follow the corresponding ${x}
  properties.
* bus-width of mmc0 node of all exynos7870 devices will be explicitly
  defined.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (7):
      arm64: dts: exynos7870: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-a2corelte: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-j6lte: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-on7xelte: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node

 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  21 ++--
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  21 ++--
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  21 ++--
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 ++++++++++-----------
 4 files changed, 87 insertions(+), 84 deletions(-)
---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250820-exynos7870-dt-fixes-b4ad027cef67

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

