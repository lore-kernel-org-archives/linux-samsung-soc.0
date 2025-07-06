Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB352BCF45;
	Sun,  6 Jul 2025 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826455; cv=none; b=F+m0UvFszOy5DwUaUBKQ7A5YoRASqfcilcD1vBOz50nkjKp3xu/xLg85IV2AMe3EzRjr9zY0jRoOyiVxUjP4Ovt2jORQUt6rb3nUXF2dU/frsLVGb4fl/H+afQmBgKgEiTRzv4oHluia4TUYl44HvcE0E1TSCMqbET2VuRPnMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826455; c=relaxed/simple;
	bh=/7UL4ms+gjpMt6uhXR9N+rIp3nhF1KO7BfGN1Lj06lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jugf0hSPTKoFNV50QKrWIu3O6J1txwXJcN/D7H3KFcD6O1HZ33IVZnMny0sidDEFupUnqPiaQtfrab269SdVAgrrjpFyBehBXY4NgLi5ilFJNCWG5o2SmiTesLyJ2AIssmZdvhM0mc+wnw15Ux5BaRMWXG8bM8UluyhhQH0ZgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SqP4oBgx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SqP4oBgx"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8463E20E83;
	Sun,  6 Jul 2025 20:27:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPeWxYDZmk0M; Sun,  6 Jul 2025 20:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826451; bh=/7UL4ms+gjpMt6uhXR9N+rIp3nhF1KO7BfGN1Lj06lU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SqP4oBgxniiirLF4lByVeRwrrXqzYc9CwMgBXsG2mqedb9SmIU8Gm5REq7mUz2hGu
	 jnRai8J2RZyli5gMfOoLRX483+N9EgevCOpwcE2wnJkNKoyfvNv9vOuP7mLLWJYXyo
	 qiqvHOun77SnRqtXcvHZelVrgeT8xOQmUpApQtJkPODdGz2VbtbaUfwFquKInAUDv0
	 x+VsllVmxQjPEe6goODzgOZA6DALHU/7CNXZ1y80NQ8irv9HLoxmDfcOZ/So5Un94k
	 k0L7jv70lV+KMotrYasVgoOpLX1OKT8WSG7lpu7rwkGyOKKTz6yKmB8YbtvYq0Mmwc
	 wG/H4BMo9jMFw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:43 +0530
Subject: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/7UL4ms+gjpMt6uhXR9N+rIp3nhF1KO7BfGN1Lj06lU=;
 b=TS3mOOgp55WLg7w/Tz0GSENrnAXwnPXDbPcHk6ymGFpCUOyoOZYAcucvh+T5uKf5Bd6NiFGGr
 Z/fpLs8iRdeDvXfNfF2dml/XWNlAdVd1wL8HX1+9M/cVZTc5tEvoD7N
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
index fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973b02507436750889 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0

