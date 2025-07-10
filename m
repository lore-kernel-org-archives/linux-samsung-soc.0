Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1279219E8D;
	Thu, 10 Jul 2025 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145986; cv=none; b=IXNpeaWJGB08mSgRpuh6HPvxwI7TIKSkOhltBhNr6cDCpee4ZYjkPknFEbmIjDgdWc4uo4+o6AXsUBiiXplTNru1Eg9XEvUf0avh2r2CzKbT9NA5pON4hV0vLgs7g5eoyiQU7q+quIhJfI8eoPMR4/GYEi+sD0O4aV+JTDTx/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145986; c=relaxed/simple;
	bh=9/R3I2QTvmAT11keXIpb9oxTfzuCpNx6iVbeNs8GKZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eRmsJ2bTe2UOCjD/tjt90P76+Ufi3+6pSvB+4HFEpBRVVXXnhxhXNDTiCvNlOk68QNVTIq4sbn8B0D8ZtDmZwiXlsmwNpY2gRfoZ3ksbU9tsbke1e6Nfj+fH3FHy5bNs1iky4FlWaGvlTSbjQpX6W5ssJ+84tDVFposR7er9CfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ejolLtlC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ejolLtlC"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9065120E4B;
	Thu, 10 Jul 2025 13:13:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEsDnv1RYoAT; Thu, 10 Jul 2025 13:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752145980; bh=9/R3I2QTvmAT11keXIpb9oxTfzuCpNx6iVbeNs8GKZ4=;
	h=From:Date:Subject:To:Cc;
	b=ejolLtlCHS97Q1CYEqWwE0gQlrPQw7JSZkvhf6n+/CrhWa1jkT9GMnZUj0FDP+hBp
	 ihfPgVCgUYva5wryaflZjvltbfLC+O+kEkQqAhXXrNncS2MbWieZN2btBeGHNQFULT
	 nPi04s7nlGAsO2B+LJoQHJTLC/+xnYmf6JrLIntfOr5RdSMV22LR4p9ZvLbGpy2V2J
	 D4DmS+WgOyV0D1/igyKdVK3haZodOrgNH0gdNw1G0lDtOfvPdbslvVYgy5GVfPG297
	 hXkTSALlq2r7GMrIO0rrmv78f6Qke4FOHuanwRpnACUreNx3QqWd5KaUzAP/MuKFlI
	 oM2NSCdWX9ttg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 10 Jul 2025 16:42:48 +0530
Subject: [PATCH v2] phy: exynos-mipi-video: correct cam0 sysreg property
 name for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org>
X-B4-Tracking: v=1; b=H4sIAC+gb2gC/3WNQQqDMBBFryKz7pQxJY3tynsUF2omOosaSSQo4
 t2bCl12+R7893eIHIQjPIsdAieJ4qcM6lJAP7bTwCg2MyhSmu5KI6/b5KOpDOFbZsF53NDJiub
 GpNlVD0s95PUcOOuz/GoyjxIXH7bzKJVf+2uav81UIqFidm1XdZqsq63E4P1y9WGA5jiODzI1u
 PfAAAAA
X-Change-ID: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752145974; l=1740;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=9/R3I2QTvmAT11keXIpb9oxTfzuCpNx6iVbeNs8GKZ4=;
 b=6zaZcpyBYmtLQRw2NAbiS13U61IX/RUnZZ3bzEL0nX80n8mv9RvaT2jnG/9yjwHrWTu90FXDx
 uNwFk+7suv+B/95Y73oY1OLSWQhtOS0DQ2Pa/Kna1vnYtDKvCKO3YfA
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Fix the cam0 sysreg property name (samsung,cam0-sysreg), which has been
erroneously declared as samsung,cam-sysreg. This follows the same name
used in Exynos5433 PHY.

Fixes: 543f5e314282 ("phy: exynos-mipi-video: introduce support for exynos7870")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
A few issues have been realized after Exynos7870 MIPI PHY support got
merged [1], this patch series aims to address them.

More information about the fixes is provided in respective commit
descriptions.

[1] https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
---
Changes in v2:
- tweaked commit message of [v1 1/2] (krzk)
- dropped useless patch [v1 2/2]
- Link to v1: https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index b184923b9b400f0d536a913bdf32f3156c0a1854..be925508ed97a397239bd41f34b61ead20d04d27 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -218,7 +218,7 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 	.regmap_names = {
 		"samsung,pmu-syscon",
 		"samsung,disp-sysreg",
-		"samsung,cam-sysreg"
+		"samsung,cam0-sysreg"
 	},
 	.num_phys = 4,
 	.phys = {

---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

