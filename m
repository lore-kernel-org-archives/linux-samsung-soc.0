Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306729B8CE;
	Thu, 12 Jun 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741597; cv=none; b=VCsKn4UjXn6ays+g3l1bHnn/OBfienLhHN+RMUVSKES9lIrlHlvDVFbKBwvNA4hDEvmVS8Hu8TWXwyTGcNx09XoypcCOO9ozlFV+rfYWYsiCaGw6DekNu9H/KhX32fd5k4K8ZhHyBJ3qefl0UDOE9hOOt2L4l+MVc+LzGn1UfIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741597; c=relaxed/simple;
	bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hD2yjUkTI6zyDkQvP4p9O3QNO2xXO8aEXFfRprFJ4v3MwS6fa2V0x3ROLo0QE/tmtzOKMtB6Z2xB7IVMGQf7eOyTlz9w9StqlLC2Zxde1icrjfSX2jy8Utfru1yJrvHqaZd/bIl2l+UOgtazaSxbetkTN70zdKKGT02DkheXvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I7aIZh6L; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I7aIZh6L"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B246825FB3;
	Thu, 12 Jun 2025 17:19:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9C6iqa3FDfA; Thu, 12 Jun 2025 17:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741594; bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I7aIZh6Ln545sq0unm1sphOQFrhraXVVGY0qJ9f1qHb6rgkTD1MKaaPDlrOh76eXy
	 3arDXBu/Y/9SmV6QiK/P4JbHat4qGTvxLNMN6+gmj7iJDtl5qrh/WK+BRwgUwddmE9
	 UX3CZoiw1fGKKxyWj+S90qOOCZOekNJg/tpmYOwgGOe9jQznHGRubUmziPLU6CtYZD
	 SCn3EzGATpmgQOvUt4adeYZM2Rtv+DGo0hc76JhoFMZRPwLQytUIji9IBKeJYlQ8Ck
	 7zhCHZoXEjsPBoNatdNOANAFsrrZhdja3EYKBx/zP4EW/vefEPFu9MmIxlSz+57icy
	 WY46IgqVm+tAQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:13 +0530
Subject: [PATCH 09/12] drm/bridge: samsung-dsim: increase timeout value for
 PLL_STABLE
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-9-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
 b=tiIUwQi6DLbTe77YgBJLRkD2Oe6Q6xWPTXRYMY/gZ9JE/8+RjbNwurwr9+FECVQNxZx9ijXlo
 38E3959WWPgDBF5hnJ1jpi9uvHuZh8mqko4a4TTPwBQdpQsDGOOkqyZ
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's DSIM requires more time to stabilize its PLL. The current
timeout value, 1000, doesn't suffice. Increase the value to 3000, which
is just about enough as observed experimentally.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5787746c63035a94c0b8b7497df61bb1e69656cd..50dcdb9b81f68098936fbb3f121a0010b11cd8dd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -751,7 +751,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0

