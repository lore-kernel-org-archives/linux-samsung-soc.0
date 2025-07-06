Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1A29E10C;
	Sun,  6 Jul 2025 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826361; cv=none; b=sQ2rGjMyKnKlds/TiRe+uOogmFz7v2OLUSdscXjskLTXUcaMpJDtzQBjhSHoIwrNtgaBGGCRiIvZSgnrzzF+qnkonKvTScuosgnAgb1IgFzbW3iaklZLNjyZ/zY5XqQeQmwnADmsV+SS/+8YYD4FXZVso22d4HUmKo9r5jMtMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826361; c=relaxed/simple;
	bh=SqNKvsyPaT4bxu4N9Hr2vwsF5W0btBXizOP0uAlV1Sk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qz52LjbdgXsv5FTDUcrUQn5ghKD7gURDBo7BE20uFy2Iluwu+WB2X3AaheHl0Q8QN5h3IH3fkUjf+F1DfJyAop2UxtPUnxzaQams49vzpKc/0OnCreXBEy+ZP4OA4sHRc8QaSo8EmFchb8WZ/N1SeI+OxQermTnTn7i8Vmvxj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ld+AhX43; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ld+AhX43"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 144DD20E83;
	Sun,  6 Jul 2025 20:25:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5-QImG36bsJ; Sun,  6 Jul 2025 20:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826357; bh=SqNKvsyPaT4bxu4N9Hr2vwsF5W0btBXizOP0uAlV1Sk=;
	h=From:Subject:Date:To:Cc;
	b=Ld+AhX438ROcfab8eKAgnooY7HuCoCdlZr8EzF3O5BXJ4XizTaJ1JN2oYQCwm8JRy
	 /sgnSLYAjEmjgvVGR1mT1avk0W+2msqycpcB87ImplB+vmWMqRXp+lGnpXnFMFwWVu
	 YRYZUzqJgGaKlMNdJDO8muoPWVonKfhqyWzk5YRAAkq2Bk3VdKn7YiaOIPWxzl87ES
	 UZ7LdAqVlBaHQVSNtwvveuR/Y5QN4Rr8IE7GY1DH51PVSdIAsU+x32SjdE4S1U0dWJ
	 6xfBVCDMMjSxVwXtcpEjXckXsbUOENdAmbPE4ZW+pT48zPMQwHJYtEw0n0XRty94vG
	 JpR9HcYUwCIcQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 00/13] Support for Exynos7870 DSIM bridge
Date: Sun, 06 Jul 2025 23:55:34 +0530
Message-Id: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ6/amgC/2XNQQ6CMBCF4auYrq1pZ4SCK+9hXBTawiykpiUNh
 HB3C240LP+XzDcLizaQjex2WliwiSL5IQeeT6zt9dBZTiY3AwGFKAC5nebBR1UpwU2kF3dQm9J
 q1+oCWL56B+to2sXHM3dPcfRh3h8kua1fq5RwsJLkgkuNKJpWV7Vxd0MxeD9efOjYpiX4EUAdB
 diEK2JTKlSVwX9hXdcPa7QIZ/IAAAA=
X-Change-ID: 20250523-exynos7870-dsim-f29d6eafca52
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=2560;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=SqNKvsyPaT4bxu4N9Hr2vwsF5W0btBXizOP0uAlV1Sk=;
 b=5UGrf1rNSH5A3hsdHEVmc/wTiHGXdhyeYJsw1zTDSHwLuVQEJUZgSiPWGgFBnQ5IWPlqAWZhx
 00DazFKQRE+CP8hfrpPZGEZnvtnogRIiFxMtPQ/Uoe4rmHCPmVRFMn8
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series introduces a lot of changes to the existing DSIM
bridge driver, by introdcing new registers and making register offsets
configurable for different SoCs. These preliminary changes are followed
by the introduction of support for Exynos7870's DSIM IP block.

Work is heavily inspired and only possible due to Samsung's vendor
kernel sources. Testing has been done with Samsung Galaxy J7 Prime
(samsung-on7xelte), Samsung Galaxy A2 Core (samsung-a2corelte), and
Samsung Galaxy J6 (samsung-j6lte), all with DSI video mode panels.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- support both legacy STATUS and LINK_STATUS & DPHY_STATUS split (daeinki)
- Link to v2: https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org

Changes in v2:
- added commit to isolate clock names for each variant
- replaced clock names with generic ones (krzk)
- added maxItems to clocks property in dtschema (krzk)
- Link to v1: https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org

---
Kaustabh Chakraborty (13):
      drm/bridge: samsung-dsim: support separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      drm/bridge: samsung-dsim: add ability to define clock names for every variant
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
      drm/exynos: dsi: add support for exynos7870

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 353 ++++++++++++++++-----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
 include/drm/bridge/samsung-dsim.h                  |  16 +-
 4 files changed, 317 insertions(+), 88 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250523-exynos7870-dsim-f29d6eafca52

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

