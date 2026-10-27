Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.195.24.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107727;
	b=mJ4d2P+EwnJopSCGBL2aWqAnSXpxfOdc9y7dPz0Xolslgw8j0fxHiP3x+pnxg8X/G0l9
	 58/+DDHr933nUskMdjntX8Eva+7aCckXiPH25PYCp8jEzXaz1dEwetnQxTuNIjJs+StNQ
	 j5ytDistWeMcnj8kDAlmabnbpFJcjfVq71N1ZnzjNLrNLSzMTA7qO1b5OdOCjmXoaLYQq
	 C/GuvLfHuD0f9TfHhL5r98TJIvvza/0pZny+gwehwPPh5N8spXAGcLVMH+TBlNit8Mxrg
	 OX84sjKLdrDpVzraj4aApqj8K9ymi19GZfS/FDhSIWanGfvqLZjZjPUpILoXJTwMzGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107727;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=PfFndZaVFmyUrI+kd6bT8WqUeL7pyt32bXHtU/pq9QY=;
	b=1fCOAfIcxLSYI2s7YLGyypSnqZBZl8dShup5zbKccIH4dhshTUdbQAyHSTlLpVWGUZy6
	 3FMNpCJ/T2yBpPRU/49ijsF7SiYKAOo8mFMVBbRQUZGn3VlHulQvGOfJbHUrTC6fkqfJV
	 fPFvlEFRiiqcY8uGuYg4V+PMUUguZNvEAiGrHAZijbnlxvH3Ph828Z53sUYktIIdWBWPc
	 mIO8iDE7mVxZ6XK7bobI5Mlob8GakrPuy4hHUhk7ctqg0OgUprfCrDxeMVmGMHR34UWil
	 r5sNiY1Fv7mYNe6DxJfOe8jUiqKO2tYyLwdBUR/U1K3MhmPgwknNBS3uq1jxIjzpjeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PVzW6r5D;
	arc=none smtp.remote-ip=45.195.24.42
Received: from mail-m2442.xmail.ntesmail.com (mail-m2442.xmail.ntesmail.com [45.195.24.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD060A5BDF;
	Tue, 27 Oct 2026 13:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FD060A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PVzW6r5D
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a4d;
	Tue, 27 Oct 2026 21:28:37 +0800 (GMT+08:00)
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
	Sandy Huang <hjc@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 18/18] MAINTAINERS: Add entry for Analogix DP controller bridge
Date: Tue, 27 Oct 2026 21:28:10 +0800
Message-Id: <20261027132810.1746118-19-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa17d8c6bb203a8kunm87c266213d5746
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEtKVkxCT0JMSUNMSUoYSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PVzW6r5DVDLh52Trbqih5h5wPKU5MsC3JbNEDZuUpJEgnYIvkDBkMtS78wZ89hw9S2xogLAQeTcLG44wJG3z9+A6zMevKZy/pYUC/ni4mdlEOtKlBhUQqIJg6Abjawrh3SZWgNEzEcRzYBv6nfcx1AEVuiO4iYf5SgLSz6HY1NQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PfFndZaVFmyUrI+kd6bT8WqUeL7pyt32bXHtU/pq9QY=;
	h=date:mime-version:subject:message-id:from;

Add a MAINTAINERS entry for the Analogix DP controller bridge, covering
the core bridge driver, its register helpers, the public header and the
DT binding, so that get_maintainer.pl routes related patches correctly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..6518cbbd578c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8037,6 +8037,17 @@ S:	Supported
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

