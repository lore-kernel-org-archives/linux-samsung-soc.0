Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFB19DFB4;
	Sun,  6 Jul 2025 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826501; cv=none; b=Oif0x5NyNP0d1f4cG8xIjN4z6Odl4qSCQQ5ubvXeoh79vTex4Z0FyEpGAPo+UoxdkwXW6dJkJQ8ADOhd35I4b/qi3gz8sAv1CSdZwGbAG1cpzeSFGsTPKRTDAWICmDDlJlYy3K22BZhp7X7CcrJZXNwk6bqR/9cyBtJm25YStsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826501; c=relaxed/simple;
	bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d0mCinOf/AlJ5sEGlUBPS9f9IkbJ84OZ8Xg8U7KEir4zOi+jZdyPFNVHAQKMxHCKIW9fFAfSAc27LtGdnSzeSsyvND5OrWa18+ZthFgYjejicKm5kJG2X89j2WEQ5OApTxJqNH8Q4Kj5QoIk0dYj6GYGkKEHuIqGZ9/5u7uJ95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=mZeL7Azx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="mZeL7Azx"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 394C2252CB;
	Sun,  6 Jul 2025 20:28:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKyM3LjktSyw; Sun,  6 Jul 2025 20:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826498; bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mZeL7Azx9pvTBO/XZA+C2RRKe4dOY1p97G9izs0EGm5LBZqrFwaPc0Wkev6ftGWUI
	 v8zK0D/VaIeWf9RegwftPWS2HmVyGSdl/LE7Jsc6OwcECpdfwMBu6xHu58n5UKDpRU
	 Ri0DIqkztOP+IGAhj52jFH4ozUNHDBIdmkp7LxiD+aEhkTPylvE3UUvhzIwS4B27fB
	 72/1YRGh1VgQl9UycaGx3Wz9GJnIwoxDlc523j/gcYMf8r59OY57EFVc1mZYaZxJ0s
	 rtDq3HuI2Ru1fjIjkwp9+ADp+C1SbDalCxWlxlU4zwBp3Yy060mpP7J6hdFjCFT6ja
	 0k99907zDMfTw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:47 +0530
Subject: [PATCH v3 13/13] drm/exynos: dsi: add support for exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-13-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=1284;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
 b=uKy2IIutBFRwXBDbPmTpTTgEzxdiT2/Opbe2OKCOjqx5XHG89DV2J+xbzI2b9Mm/K/8YTadQw
 EknlV+5ZTEyBc+yw2IZyXBw3+87K4K7ojNREnlrUf3mdUjxIKSAKaMd
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add glue layer support for Exynos7870's DSIM IP bridge driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 896a03639e2d9b80971d43aff540fc7fb9f005bd..c4d098ab7863890b2111742c07953c148304e4ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -154,6 +154,11 @@ static const struct samsung_dsim_plat_data exynos5433_dsi_pdata = {
 	.host_ops = &exynos_dsi_exynos_host_ops,
 };
 
+static const struct samsung_dsim_plat_data exynos7870_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS7870,
+	.host_ops = &exynos_dsi_exynos_host_ops,
+};
+
 static const struct of_device_id exynos_dsi_of_match[] = {
 	{
 		.compatible = "samsung,exynos3250-mipi-dsi",
@@ -175,6 +180,10 @@ static const struct of_device_id exynos_dsi_of_match[] = {
 		.compatible = "samsung,exynos5433-mipi-dsi",
 		.data = &exynos5433_dsi_pdata,
 	},
+	{
+		.compatible = "samsung,exynos7870-mipi-dsi",
+		.data = &exynos7870_dsi_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);

-- 
2.49.0

