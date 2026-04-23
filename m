Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7242354AF8;
	Thu, 23 Apr 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978905; cv=none; b=QBp88Q120WFQvOjIkBN/OkKOt8819m+3euTDEeo71CAL6uojXu0ERrIpc6QXi3s6Lq5VGskxQn3CuuLphd/K7Y0zlbvijJJ3FxX4jhLLg8STPkworbT0uOh7hj8voIARWUCZTIH3cPIwtj0/8AfZUcs7PeOY5r3cc2jhzjj0Yu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978905; c=relaxed/simple;
	bh=DNv/BymC1AAVCjxZpiHQBqb+igrvXkujC8y0poGRAEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0yDZAeOmdR/7lnGejdDOl/cIQGrmQJLmgtjNzqji3PorQUBtzH78qYQ5bl8EbZJUlu9Gi1KAC7z1swvJWi4rlOpeNkTRwVVO1jpUrXk3ERZ7Fjg1FJygkda1WMet/vNXB13UyzvYPAXK5fSswxVFFnYIqpcS+N3RY7C9qzj/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g1plB2FTJz9twV;
	Thu, 23 Apr 2026 23:15:02 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Thu, 23 Apr 2026 23:14:38 +0200
Subject: [PATCH 2/5] drm/panel-edp: Add support for Samsung LTL101DL02-002
 panel
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4g1plB2FTJz9twV

From: Alexandre Marquet <tb@a-marquet.fr>

Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
Samsung Manta (Google Nexus 10).

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..2004699db41b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1542,6 +1542,34 @@ static const struct panel_desc samsung_lsn122dl01_c01 = {
 	},
 };
 
+static const struct drm_display_mode samsung_ltl101dl02_002_mode = {
+	.clock = 268627,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 48,
+	.hsync_end = 2560 + 48 + 32,
+	.htotal = 2560 + 48 + 32 + 80,
+	.vdisplay = 1600,
+	.vsync_start = 1600 + 3,
+	.vsync_end = 1600 + 3 + 6,
+	.vtotal = 1600 + 3 + 6 + 37,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc samsung_ltl101dl02_002 = {
+	.modes = &samsung_ltl101dl02_002_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 218,
+		.height = 136,
+	},
+	.delay = {
+		.hpd_absent = 200,
+		.unprepare = 500,
+	},
+
+};
+
 static const struct drm_display_mode samsung_ltn140at29_301_mode = {
 	.clock = 76300,
 	.hdisplay = 1366,
@@ -1696,6 +1724,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,lsn122dl01-c01",
 		.data = &samsung_lsn122dl01_c01,
+	}, {
+		.compatible = "samsung,ltl101dl02-002",
+		.data = &samsung_ltl101dl02_002,
 	}, {
 		.compatible = "samsung,ltn140at29-301",
 		.data = &samsung_ltn140at29_301,

-- 
2.53.0

