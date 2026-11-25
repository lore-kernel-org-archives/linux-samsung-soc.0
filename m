Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.251.158.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605751;
	b=HotgRbPT1YsXicpjqt7RfLvnq86C1m5UmFQpgPbE7rUzzsDuDlaMQ3crPBxJVZN1Ryhp
	 vvIP+JjQ7ME0dBUdOJwbJ5yHX2smS28Zoa12KSrct7zjZ+3n5frxyvP2WyCy4dB/IRj0E
	 M7fEl6P51jeRx2QcB1SUB44dmuxY6ONcYTLWi5S7FAOfSHGGMuNYakGPcedU9sJemHkDY
	 irIksJl2UCGSW3rT2Ra7F+R9N4TBsXZQd0qwvK/Pv7/NsoGB4gLgd1npA8stn76j1y8vn
	 JPLWxCxFIiq0nuqmc4bf2eZ5kCZInRvJnZx/qJSGxDL4O3osbIXSpfTIO+P419Rhp4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605751;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=80wam7NVKgH3O2F9cshM67R6DyozoJjvMXzF6HQQCyw=;
	b=ftnwOaKCKxmEoYbydz3eJY4UxjgXmf8H1LuUiqyUgOIL+/n61Qgfoz4ISdJ9aPerjGlS
	 IMUvu8Gqx2DL8EnFsu5+ICkL2H1tItdCpTe3bNLR0aW3ocDMyK8uFFkIu0p6ffc4b3xeb
	 l3pndsPm3/RL6h2//fVYLnUg8GFbPfu9WhBUBVheLeIRO079Jzr5UQfgafWGOFP83dboa
	 XUFpe0AkBmdEreIhih4XwKl11Xrr74i204j1JZ4FyIEdBjDjvE4eYUXJC7DMcsXRxZdMe
	 cNqwDU1Ja+Wr6+OCVL3JMmVe3kM8RIHEsoizi3kSA7RpmgW9zYAkPyPssWmDERvJ2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Eb1NZQp6;
	arc=none smtp.remote-ip=47.251.158.175
Received: from mail-m158175.netease.com (mail-m158175.netease.com [47.251.158.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B860A262F;
	Wed, 25 Nov 2026 11:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33B860A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Eb1NZQp6
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816087;
	Wed, 25 Nov 2026 19:22:20 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 20/20] MAINTAINERS: Add entry for Analogix DP controller bridge
Date: Wed, 25 Nov 2026 19:21:41 +0800
Message-Id: <20261125112141.1434903-21-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa212713d7a03a8kunm17c23050775901
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGh9PVkpJQk1NSx8dQ0hCTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Eb1NZQp6q98NkuICW6lwkNuzLCcc/qicGb4h6x3FYRXD+fC3R0NON+trl0vlZjXL6BKX74110Ay67F3dS107zeTIIv+g22LBjF7UPyVKl0SOFK+XVjvgK7hxpUZCAmoSCQgMSlCkU9wUqMqAkp+EI+5dGYr4l9JpzD5EjeGomFI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=80wam7NVKgH3O2F9cshM67R6DyozoJjvMXzF6HQQCyw=;
	h=date:mime-version:subject:message-id:from;

Add a MAINTAINERS entry for the Analogix DP controller bridge, covering
the core bridge driver, its register helpers, the public header and the
DT binding, so that get_maintainer.pl routes related patches correctly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95a897dee61b..fc839f2cfebf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8237,6 +8237,17 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
+DRM DRIVER FOR ANALOGIX DISPLAYPORT BRIDGE
+M:	Damon Ding <damon.ding@rock-chips.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+F:	drivers/gpu/drm/bridge/analogix/Kconfig
+F:	drivers/gpu/drm/bridge/analogix/Makefile
+F:	drivers/gpu/drm/bridge/analogix/analogix_dp_*
+F:	include/drm/bridge/analogix_dp.h
+
 DRM DRIVER FOR APPLE TOUCH BARS
 M:	Aun-Ali Zaidi <admin@kodeit.net>
 M:	Aditya Garg <aditya.garg@linux.dev>
-- 
2.34.1

