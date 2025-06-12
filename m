Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A3E27511A;
	Thu, 12 Jun 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741003; cv=none; b=KxjBof4xEkDuLZRh7TPl8hVuW1rhIJujBBhAhbDBF0ILFWNTps6SHVl5Ap0cCS6yVtInO25vwcPOhNcGHVRB8uSY7tQaryJCaxSBymRmC0h4pi/PLOz2Ltam0exk0ip0wIcsJ0Q6COkORMT4FHAP+CFcuBU4lMM2eKrPSXzIsNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741003; c=relaxed/simple;
	bh=dSXo45mIJJx9bDeTqNn31sUJ/q0OnjYwLXEix43Xrw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jcTd9rZ7YGucSbORzdahNljm6SEvTu4B75VdVhRh3e1Vt2CI7u+9LMjIJPbrt9yZPPY5Sidf8MYSEQvBtntB+xaiGijuSAV6KBWJhlqmoSE/GfnkxjYWyabQe2U23roxs6ymlWTs70BAq8FwMhOHhRMd55pyKXf/FXzGZIw1WkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=glwmPQ2C; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="glwmPQ2C"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7075025C7B;
	Thu, 12 Jun 2025 17:10:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guWSlxOGple0; Thu, 12 Jun 2025 17:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749740999; bh=dSXo45mIJJx9bDeTqNn31sUJ/q0OnjYwLXEix43Xrw0=;
	h=From:Subject:Date:To:Cc;
	b=glwmPQ2CSMUg8fREOyygECG6WwXxlVb+wX16fBWBwWSdhrZZs3DDXfSGRf1pL2KUv
	 XBiaj0mtIneJeaSpdZBwbrM27QMAN5ZPKHsV6E94LVOqygMVnlh5SbVyRkjXFLO4Kh
	 ytQFo315OmRo8ozmC6/lB7Q0RrpIFYHfa2se+eG2hA5HyScrGNlNJvvSRDeIFcvn1W
	 SRIFgp8gVdxMjO6SzYVMTTg/2XS95cuhMeOTEwdKhMQAsVdFC7vCD4C9jI6ilIy39i
	 WktJloerb2WhF6VsYwM/vsSLNVk712C2IvKdBN+1o4EAHlSK2VtT7yr+3wYeDgOHXZ
	 H+wnu1ViQdNqg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Support for Exynos7870's MIPI PHY blocks
Date: Thu, 12 Jun 2025 20:39:28 +0530
Message-Id: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjtSmgC/x3MTQqAIBBA4avErBswy4yuEi36GWsWmSiEIt09a
 fkt3ssQyDMFGKsMnh4OfNuCpq5gOxd7EPJeDFJIJZRskWKyd9CDFnixY3Rnwk41ZtDK9OsioZT
 Ok+H4X6f5fT+Xq/nrZQAAAA==
X-Change-ID: 20250523-exynos7870-mipi-phy-451f875f6ba2
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740994; l=845;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dSXo45mIJJx9bDeTqNn31sUJ/q0OnjYwLXEix43Xrw0=;
 b=8D4uqf1bHJF54i/+4jjJQo9pGHE9cAYBK0Au1T4+ogxwrDYvP9PPCEjq13Ru+GQKkhUc+0qcS
 IlkF/AAqxdhCI54z50n1Z7RsvpIJIcihHrGP2kSNOtGQtBp+xNwGE3C
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series adds support for Exynos7870's MIPI DSIM (for display)
and CSIS (for camera) PHY blocks. It contains a single DSIM and three
CSIS PHYs.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: phy: samsung,mipi-video-phy: document exynos7870 MIPI phy
      phy: exynos-mipi-video: introduce support for exynos7870

 .../bindings/phy/samsung,mipi-video-phy.yaml       | 29 ++++++++++--
 drivers/phy/samsung/phy-exynos-mipi-video.c        | 52 ++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  5 +++
 3 files changed, 82 insertions(+), 4 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-exynos7870-mipi-phy-451f875f6ba2

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

