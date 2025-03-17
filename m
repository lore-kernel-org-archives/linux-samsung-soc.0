Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA741EB5CD;
	Mon, 17 Mar 2025 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742239951; cv=none; b=ZaMt16EayVHgDANn/RdM92wmLpOMxkNb2CW+hMyUW/up7aklSo++IJsaqKWAl+450erDYPms0B3QEtb3lDhW0gXpAe8Od4OPa+1ScWjvbqLrm70LaXbUW6wYgiuSGNPac9skNg8at7U1y/wLKyt53bsOPTB/cfWCWvSnlHzy7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742239951; c=relaxed/simple;
	bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jO4uUmJDnMmRY44moqj5/Rj/Kc2mEYkEsNILZg8ezf6oGks5O0b9SAN5Lc9B1bXmlKopnhxNGaNjvpaeCOE+l9zyjGycUOc/j34YfZ0R0VqO+k6BdgUcnyx+XaPffgh75qd56/rH9Ee4odsYe1O3RO+eaHrBD126eTzkRb7mRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R9OWoe6F; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R9OWoe6F"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8C0F425989;
	Mon, 17 Mar 2025 20:32:28 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 482UUYVCRaQc; Mon, 17 Mar 2025 20:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742239933; bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:To:Cc;
	b=R9OWoe6FSuBqgImq7TpfMos4ZiBRprbQSPoH9ytSiEWfUGwwNu33LDwACZitBNYdj
	 QNSV+DqD/PP0rtmhNGMuP+3w9WoWZbL2dwrIzSFh9Twk2HJKPEl9OcP4RJew8Dqfem
	 1aMUv/zrBnxSCQmi5/Af6mQgkVKXNhFDrDBxa7OLkCAa2jD8cXFPAHJphsyF6YITA3
	 UkyXrBB0lL3Nq6ZMqFtN+ooLOuGaIiJRugo2zbbcZIdlF8hr1F/sNJS1EggD4D3t7X
	 qg1BTpuLhQQnEK/qBDueU/Tjpna3qencXeqmhK4Kw6LZR1c1WX20SlYnHzI38MYsDf
	 gxtLwIEu/nT9g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH RESEND v2 0/3] Introduce USBDRD-PHY support for Exynos7870
 SoC
Date: Tue, 18 Mar 2025 01:01:40 +0530
Message-Id: <20250318-exynos7870-usbphy-v2-0-551433b1b27c@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742239924; l=1208;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
 b=Ioi0x7v/fqX26/WW74A2LJdQiVqOJ1v8TZ6YsZJgFaFkZPIGr6fDansoFn24pLSjnf1SkeZ38
 ck6U6cOTkWkBolOYnuWHVca94vJiFhhJgdE8cjBdR4wJQkqNF1a+RCW
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

