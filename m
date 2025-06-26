Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975372063F3;
	Thu, 26 Jun 2025 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968143; cv=none; b=As/L/2D0bqAIs+5zBHyP8zvY6RNiuLY3hEJ6d4hm2iqZVIKQNVDRy/tgHUcrAp5vkd5HsQ/pmkpIvckXgP1aBxjdTadtcXeJrf3misVJKHCozBG08sZf+VrzWrBI6FgsFsEvwfhMFBJ2e2UNW/nI8psFGqiHuXjvrTFEIAaKgZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968143; c=relaxed/simple;
	bh=ydhmfATLWHhbM+4c9MW00pJAm8CsSLrYzuzsSmtqaoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2m6E5xqQZg2w6P4wZmrcT1qu2WJG+Dz4F+cpNpZOePOGUA7CZaNVmj1yG+rSdyKoJroEABhg8hBHpJYGclk9JF3nTmZUtRTwusiv/3612Am19xol3Wby3bPLxIVmOLVZ5tIj0m2oQsZGRrOccxzpM6CmSlLQt5eV/u4KRHIEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ba7oH6qU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ba7oH6qU"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 440482602D;
	Thu, 26 Jun 2025 22:02:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUiS0VPo8D-v; Thu, 26 Jun 2025 22:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968138; bh=ydhmfATLWHhbM+4c9MW00pJAm8CsSLrYzuzsSmtqaoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ba7oH6qU6ZOOvx6+c/+ihZu/0IaAYOoFLANamYCDpRdo7bzKfeX/FLJb8NR8we6k9
	 bYwl+6GW1Pot10ZW0euszS5TgT3nB0/jeRIKcgG/lPgpAIwivhD9wOq7fMGje8xigj
	 D4EFCYF8A+qWpCNi35AtQ6qDjuImfXfxl9q3YNXb61fR8iaFJxeS/pn7yy6JL411nQ
	 wS0OfDc5Hjg+NCGFzdIX0yC/GKxLFn82vlWrtEYzl0g3c9OeCwlmvdEWcTxqcFq4Km
	 xbaa6oJPGGkI3p4or7ZwDOusSmXatv1D6GN9oc7Wg2K36ERijHtN6n8rwEqVOegXKf
	 wH/wz3Wq56YAQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:31:54 +0530
Subject: [PATCH 1/2] phy: exynos-mipi-video: correct cam0 sysreg compatible
 for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-mipi-phy-fix-v1-1-2eefab8b50df@disroot.org>
References: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
In-Reply-To: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968127; l=999;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ydhmfATLWHhbM+4c9MW00pJAm8CsSLrYzuzsSmtqaoM=;
 b=8UzxlGLWQP1Bs9m6KMhe5vfmpFViPIPyBi3S8jqcRvLGanuRHkyEceGeYjEPRLy7VZXNHm7bO
 2ofPkwC5RR3C/brHkQfumNbbh4NdcG1e1DZQgN2jUA3tQ9mXFEcY5eM
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Fix the cam0 sysreg compatible (samsung,cam0-sysreg), which has been
erroneously declared as samsung,cam-sysreg. This follows the same
compatible name used in Exynos5433 PHY.

Fixes: 543f5e314282 ("phy: exynos-mipi-video: introduce support for exynos7870")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index b184923b9b400f0d536a913bdf32f3156c0a1854..1c9c340f708da0ca214639880d067706aaea8fc7 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -218,7 +218,7 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 	.regmap_names = {
 		"samsung,pmu-syscon",
 		"samsung,disp-sysreg",
-		"samsung,cam-sysreg"
+		"samsung,cam0-sysreg",
 	},
 	.num_phys = 4,
 	.phys = {

-- 
2.49.0

