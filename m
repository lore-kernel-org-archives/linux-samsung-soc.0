Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2882FA630;
	Thu, 26 Jun 2025 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966873; cv=none; b=ZuhSkvz494+JTJoT8oaUFg0Jf573vCh/eMFPABmmak0Ku3nPsbBsG9Jwx9aEtlJGkEzMkp6O8bhiXIy68XaKrvQxdevIYWobnh2VgnY1luWPp7ckwJ/ci64zDVxf43xXYPOE/3QoWr3ExMioYOdPpGo+9TscoseouTaE3rG0mVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966873; c=relaxed/simple;
	bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Foh/iRrIA37VVwRkxXxZCWdN7TJoqK6sXWLJ4lEauSFhdRqBXc7qrIEC3CB7D6S/4bUoMfb4u9EJy7V+8gr4/K/eFWL5MGdTPklERzo0GDyQAtdJBU5CIJ1JKv6MZKv6ODXDt5n216h8Khdu3mVq7hNSYrljNMldpuIroJDkSFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Lb3j0kGr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Lb3j0kGr"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5FBE225AFA;
	Thu, 26 Jun 2025 21:41:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFCUli431S5E; Thu, 26 Jun 2025 21:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966865; bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lb3j0kGrriHaoBpC4hGLaDqjZ0kTOQ4BM2YaozjNb+EISLlOKii0na8hdm/PImaRT
	 FvrKztzM616N13kJN19V3aXYIKhLwsFc4mra8+0aD0cAD4N5VlTOVF5D+Yvs90Pt4u
	 xTjFPv72FZxuXp4SrsLqvm0h19IaSYYu+fh8Xj49E6wM8lDEWqQCVD7a9Vik2cP7xT
	 LktAuxOZOCYDWRLrQHR0p1CiY42rxBOSEYT48wEWqtYotsbi3PVLJ+c4fB8rzCXQ7l
	 y/3l9FkMlr6xPyvIMMA2X3+Zhs+TGy7A48vWNtHA9J2KNFoqopyEDvR2S/avRiC4TS
	 MJxt7zPuZJoMA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:58 +0530
Subject: [PATCH v2 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-9-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
 b=tuIO+GEyrWvCTjkPRhokjgmcnFCs1r/Ux62zw0hOtqO2IHMl5Gi3MccQ0YL91PrCUp0knSDAm
 b7R0B69o9RuDa3Cg6gLlmbOqv+gApGtxia1YDbaGcYIyV+xmJKhMGEB
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
index 739e1d1e6d239d06896daa131b692309cfeda843..5b96a5a1c78d212aca4e4fb057952927eb90f0d4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -752,7 +752,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0

