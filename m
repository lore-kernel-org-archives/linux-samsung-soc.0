Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B02698A0;
	Tue, 18 Feb 2025 18:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904609; cv=none; b=j7pT7EnRSa2qBNOdpGYRHrL29+4L6p+VeTtlDwGQdIB6vdVzXqImBw4bwSOD3wHL1QnE52E51TVcr5yxbnx8E/HWGz0ZUbVeT1kgcaOnLZs96MRqCEM8Gqis9fpJlhBgw6jjwmteacVdMZqHH+cMGpKMS6HAnwfgtK3Pqxm++ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904609; c=relaxed/simple;
	bh=Z6tA0s3/rcDzY/zbXHPV6C/z8wYbhUS1zy4lXjuXOjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XQ1cgPe5QBBpDqevH2+YZvyPAjR5PDTR9i0wQ+PngFxaHU+11MebpTjLeHMKpkhhQG1JOIelMSkfsXiMHz7VkpjCRTacgGaU5GQ45++ncsUywO8xGiMF9AjqzmdVOZQz/9UNFNW/+NWYCd2bidSlq8c2N0dcb4tEeR9ORdS23no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CIuURwlM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CIuURwlM"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AEBBB25238;
	Tue, 18 Feb 2025 19:50:06 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqNBLzJZ-af0; Tue, 18 Feb 2025 19:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904602; bh=Z6tA0s3/rcDzY/zbXHPV6C/z8wYbhUS1zy4lXjuXOjU=;
	h=From:Subject:Date:To:Cc;
	b=CIuURwlMAnI4LHLQOCghRCUhFobwmwRYPbgogIq3bt/KWv/z/z3G4uhOOLOh9Z3Yw
	 iynYHslSe9rXr/1s6aNKUvi0RX1+UJjKj9xdxVBcufrOKJTnE5aCKEO4dqaoEdltTM
	 WxNrlLWtHdweo1j0eYbPoLe2P5DxlqqolBIbszoeKNsmGSo+x9bNd0Q2yqy6ZXzvgY
	 SovkgWgm3IYawx8eYcVIa4RfmDVVs2IPMa0e/7itT5oqsyTh6pH7knsSOEX3eyRhWF
	 bOrp1qu7FN9pYlW0OaxQmOxLISsFQrFjcReou4v+xLcfssQzsP1q+u1SyuU/LuoLoE
	 pt+Poyj/tlyAg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Introduce support for Exynos7870's S2MPU05 PMIC and
 its regulators
Date: Wed, 19 Feb 2025 00:19:48 +0530
Message-Id: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzWtGcC/33NTQ6CMBCG4auQrh3TDiI/K+9hWBQ6wiRKSQcJh
 HB3K4lbl++XyTObEgpMoqpkU4FmFvZDDDwlqu3t0BGwi61QY6ZRp0DLOnjJi1zD+OIWAnXvp51
 8EMBrZrDJS4tloyIwBnrwcuD3OnbPEu/W49dsvuuPvfxjZwMadGaddWlhNLY3xxK8n84+dKre9
 /0DjfNZCMYAAAA=
X-Change-ID: 20250203-exynos7870-pmic-regulators-26512b79a29b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904598; l=1997;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=Z6tA0s3/rcDzY/zbXHPV6C/z8wYbhUS1zy4lXjuXOjU=;
 b=WX+GYybD+lkrd6SrUHT/zIir4chjbu+ccKT/j5V7FmTGWYJ2jw4BXHx7QdaWgu9ebx90xluiQ
 td9+X3lIZ6nBSC2h62TTmF9iWyNms7F9q8h21r7NpjfnnBZWXJWEW1P
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 devices use Samsung S2MPU05 as its primary PMIC. Add support
for it in the existing PMIC driver. Additionally, also add support for
voltage regulators which can be accessed and controlled from the PMIC
itself.

Patches from two subsystems have been placed in a single series here as
header files and documentation YAML references have been shared.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Drop applied [PATCH 2/4] from v1.
- Added myself as maintainer in s2mpu05-pmic DT docs.
- Edited LDO description to explain missing LDOs.
- Added all missing regulator control registers intended for CP.
- Modify regulator_desc_s2mpu05_ldo* macros to allow choosing register
  suffixes (CTRL, CTRL1, etc).
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
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-pmic-regulators-26512b79a29b

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

