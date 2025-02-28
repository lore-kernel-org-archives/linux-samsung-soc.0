Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680CF277037;
	Fri, 28 Feb 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771453; cv=none; b=Hvgg/ZVbGm5Ut3FPdsO37xUmrfsQiLQKB5ZPqCWvcxU3klHOY18rGP8z7wy0udTTuSTTRqmhYRRsw3kbloKfFLMEYsot15d3HovkQC7K/03m3pmEwPr+lkkvWMfhYSfMR8QrNhrFki1yFeyu81eHwnD4h7AGWWng1WBOekHtcSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771453; c=relaxed/simple;
	bh=lekLNpIC0JMB0Mv8Ap6hTSePxwm1BKpx4HN7vzZA+mM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OMgfGqZXHBhTksGvrEmKtQsqohNmgtVjS1gHr6TflykB41hfsmutDjGukNx9OTV036Y/XpNqAtPJs+pkTFKdBQ1lFlBCzm0xarFO2/Z5R6XSNYYZ63E2qO5vU0Yubk4ajmQPamfUYI+Fw/F6m9+5kPfzvPNZq8fbCNR0llQpXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fiTlliBf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fiTlliBf"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E2B5A258EF;
	Fri, 28 Feb 2025 20:37:29 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdAxX5mkwXvz; Fri, 28 Feb 2025 20:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771445; bh=lekLNpIC0JMB0Mv8Ap6hTSePxwm1BKpx4HN7vzZA+mM=;
	h=From:Subject:Date:To:Cc;
	b=fiTlliBfFJKIEvXH2/+f49K8r4NasrvYhvqROfjBJ5Mr0TeftiuWVPq7GtnJ1zMTi
	 QUh8EMeIDUBHoWPasCnJ8SGsz0014y2ZR6d7DOyZt/wBdCW1KzDYCGq/R5HZIqdZ3X
	 d5D8wvz/ejQGD93J3CQ0fYkwI4ncR5Q2xnPuQKm/MjD0L0Onuol/yHsUhrH/G4KQyf
	 01dl0td6ErM1h7lC0PSVOFS5iaLGUCr5bDyT4U69jRRu4R+pBcZFVjDEgbSFEHYsdr
	 NDHvHyJaeTYby1NT+gLd09IgTEnRJ+/2nqPhd0FtJae8kLZZB7C2IdTxmobervjV+d
	 UBRD/dMwzwdlw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Introduce support for Exynos7870's S2MPU05 PMIC and
 its regulators
Date: Sat, 01 Mar 2025 01:07:11 +0530
Message-Id: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGcQwmcC/33NTQqDMBCG4atI1k1JJvWvq96jdBHNqAOtkcQGR
 bx7o1BoNy7fj+GZhXl0hJ5dk4U5DOTJ9jHUKWF1p/sWOZnYDASkAoTiOM299XmRCz68qOYO2/d
 Tj9Z5DlkqocpLDWXFIjA4bGja8fsjdkc+3s37ryC39ctejtggueAi1UYbVUgB9c2Qd9aOZ+tat
 sEBfjBZHmIQMYm6yJpKKWjyf2xd1w/ZM2v2EwEAAA==
X-Change-ID: 20250203-exynos7870-pmic-regulators-26512b79a29b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771440; l=2569;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lekLNpIC0JMB0Mv8Ap6hTSePxwm1BKpx4HN7vzZA+mM=;
 b=1GMBgCQV423Z4oTb+PWePlB9XstCjo4gcHj+IrfaeEvW5tmy/f4NTVqsxNRVML4O6+WrZ3J0I
 0WGUswzWvbOC2E/MUzsw7fJKDXFxyX6W3tUKS/oc7XtrpSHrJCi+VNa
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 devices use Samsung S2MPU05 as its primary PMIC. Add support
for it in the existing PMIC driver. Additionally, also add support for
voltage regulators which can be accessed and controlled from the PMIC
itself.

Patches from mfd and regulator subsystems have been placed together in
this series. Here, both patches from both subsystems depend on the other:
1. The regulator driver patch includes a header file which describes the
   PMIC registers. This header is introduced in a PMIC patch.
2. The PMIC dt-binding patch references the regulator documentation.

Note that 1. is a build dependency, but 2. is not.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Lowercase "ldo" and "buck" in regulator dt-bindings and driver patches.
- Add back missing Reviewed-by: tag in [PATCH v2 2/3].
- Link to v2: https://lore.kernel.org/r/20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org

Changes in v2:
- Drop applied [PATCH 2/4].
- Added myself as maintainer in s2mpu05-pmic DT docs.
- Edited LDO description to explain missing LDOs.
- Added all missing regulator control registers intended for CP.
- Modify regulator_desc_s2mpu05_ldo* macros to allow choosing register
  suffixes (CTRL, CTRL1, etc). Subsequently, drop Reviewed-by: tag in
  [PATCH 4/4].
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org

---
Kaustabh Chakraborty (3):
      regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
      mfd: sec: add support for S2MPU05 PMIC
      regulator: s2mps11: Add support for S2MPU05 regulators

 .../bindings/regulator/samsung,s2mpu05.yaml        |  47 ++++++
 drivers/mfd/sec-core.c                             |  12 ++
 drivers/mfd/sec-irq.c                              |  34 ++++
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/s2mps11.c                        |  92 ++++++++++-
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/mfd/samsung/irq.h                    |  44 +++++
 include/linux/mfd/samsung/s2mpu05.h                | 183 +++++++++++++++++++++
 8 files changed, 414 insertions(+), 3 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-pmic-regulators-26512b79a29b

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

