Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A5920E32D;
	Mon,  3 Feb 2025 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615007; cv=none; b=fC0AAVuBbN4jBVEqSuVZdgpuZnstHxwzGZr1cRHFqhKEoCQyn/yz73+584QG6EeRecFJ1djPSMZaNLlAgX0os8WxPecXojz09UCQfu1iov4eMV+f/QKf88J2SP6ys24J3I2wsF3w2JPU+BAS2NRpvFS9rprPe6a9CxxL1WbT5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615007; c=relaxed/simple;
	bh=M9W7yFmJb76HU+OcGCmv8Rdo5D960RBR1VhtDL72jo8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p29g/zATaamITMprO8+gEBKqh8X5Qe6JEhnjeuJZqDL99xd+dTwPH4GJ24sOAB6/ke7/QU2HOH7537TVnScV9UO7xKoj8Vvtl8SaWlla9m1yJSyLFBeEjpGX9G486FePFtaOPirKKN+wIjPE2v09/EOmGD7lSWl1gJxJbLDj3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HbtYbtzv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HbtYbtzv"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ABDC825984;
	Mon,  3 Feb 2025 21:36:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtuWXnrBYooy; Mon,  3 Feb 2025 21:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615003; bh=M9W7yFmJb76HU+OcGCmv8Rdo5D960RBR1VhtDL72jo8=;
	h=From:Subject:Date:To:Cc;
	b=HbtYbtzv0RPVTwy9xA26pwqeqUyiGoVL3Cg1Lc3Ec9ptSpaI+wmpkhceRq9y2o35T
	 F4Ec/npaomObeNSV+zuPl/6UfxSsSKze2n4VbEgC5w5+f7LZX6HqtCnaef55fgjilo
	 zw8N9Nuy/o6857BHWwM4NVZpZ5EHjAcKdxpp/wqCgGsxief0SOg8fxk5WuvZdCipc1
	 xDQugCKWjDstahZ9DT25qwd27C1yi+yHN8JMlx5gTo57oXQlhMXkpyDL+Jo8V9z0vu
	 0tUc+t5w1cjLCQRMuZZdhx/YNgkrsUJJECL4uwshPc1ZOHBOd0PqPU7/dOtaw25Yf3
	 Ci6I9DqjxWbYQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/4] Introduce support for Exynos7870's S2MPU05 PMIC and
 its regulators
Date: Tue, 04 Feb 2025 02:06:25 +0530
Message-Id: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkooWcC/x3MwQqDMAwA0F+RnA3UiOv0V2SH6jIX0FaSbSjiv
 1t2fJd3gLEKG3TFAco/MUkxoyoLGN8hTozyzAZy1DhyNfK2x2T+7h2ui4yoPH3n8ElqSLemosG
 3gdoBcrAqv2T75/3jPC8KwugWbAAAAA==
X-Change-ID: 20250203-exynos7870-pmic-regulators-26512b79a29b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614996; l=1650;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=M9W7yFmJb76HU+OcGCmv8Rdo5D960RBR1VhtDL72jo8=;
 b=kzEpVdVYyzMedcgdUWhXAsY/SR78xKCpyqvdklI4kiMeNbBSeI1Wzhy0P4nB3vtqCaURnxrKK
 JJxkNIHRW7NDoU7Zrj8MrLiMaBIBky1z/pQUHp2hM0q6JENu2ImUEs1
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
Kaustabh Chakraborty (2):
      regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: add compatible for s2mpu05-pmic

Sergey Lisov (2):
      mfd: sec: add support for S2MPU05 PMIC
      regulator: s2mps11: Add support for S2MPU05 regulators

 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  13 ++
 .../bindings/regulator/samsung,s2mpu05.yaml        |  44 ++++++
 drivers/mfd/sec-core.c                             |  12 ++
 drivers/mfd/sec-irq.c                              |  85 ++++++++++++
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/s2mps11.c                        |  92 ++++++++++++-
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/mfd/samsung/irq.h                    |  44 ++++++
 include/linux/mfd/samsung/s2mpu05.h                | 152 +++++++++++++++++++++
 9 files changed, 444 insertions(+), 3 deletions(-)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-pmic-regulators-26512b79a29b

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

