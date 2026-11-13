Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.83.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558230;
	b=1i/7pOvzqEWtlsochp3jT4291Cl6gTU62J8cGLMjGJRlDeBJVq247tib6ZEAlnVxwtn+
	 uB0Px7q8vtkaUaMY4b5SF94rbtaJyFl35QPdXNEVydFzGhIKdMnLpoVQ8eYUSeCSpvS+D
	 5EH5dJSnYxqmBUK+m6G8Et/JvfUPyuLDy65bsouCT9gW4SbqlJSx4ys6dcmc7rYu9O9Nh
	 o820bq4ga517lMu20fcPqRwtdGNoNBzsf/+b9h1WT3F7ZSoRBBDNv01pvq2Bx2xCdOSPi
	 DDfyfkL2a01BQWqt5272XSU2ESm7VBDv6peEI5v0ho7oiB5xTARUFxctIKdTjrpZzMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558230;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=AA+a4AqBKVz6oTbXNI6y+nYVwdd7pC27rIG5UDZFMk0=;
	b=hTtC1FmicBCvr6cIEfd7/Cy8TQrTVDHuDExHXBWAMjhg5SUfAaDSDQvLMyWeV5W5bO2v
	 ruk+W2CMUxEz/C62Y69RK2wzjerH+Sc+BzGIl5lIjhtjXrN2ZocPNIPkqaTz+9bR8Sgut
	 1kvCpPPhosm1EDYDvqT5rNwAmcPB5AUKXxuTF7um010A6rDFpHB/s/yxGtxJljCuVLHCh
	 gcQtUk/j81vooNk54hQm6uTFkkNlDkRWTtI+BwRjNdB9FICwk4zySuw0DyNmoDgv4hNfG
	 cmxxO+74UuJBMOeP9jBctvlLElhXt6lSgiJztuYgkIXSpecSX6rAecJOLOcMhPGwSpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=djj0o+aR;
	arc=none smtp.remote-ip=156.224.83.232
Received: from mail-m83232.xmail.ntesmail.com (mail-m83232.xmail.ntesmail.com [156.224.83.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD07606C9B1;
	Fri, 13 Nov 2026 08:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD07606C9B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=djj0o+aR
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be9a;
	Fri, 13 Nov 2026 16:23:40 +0800 (GMT+08:00)
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
Subject: [PATCH v6 18/18] MAINTAINERS: Add entry for Analogix DP controller bridge
Date: Fri, 13 Nov 2026 16:23:05 +0800
Message-Id: <20261113082305.541652-19-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d40156e303a8kunm073aab0481b15
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUJPVklDSEwYSUkdQk4aQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=djj0o+aRo4G14XCLhZ/EuBRTd4zvl9MexsxiTtDO8Ja7dZBo2iWhAWWirjNmYkDZ1SteR6NkxTKDiCagfHJsLSZxEUteqh0p4S7uQ+ropWa8s3gbyboff1wKQ/nYQ+Df5cuLCd95blaa5aNW0uQl2CRy5cJLtWeirXb+Osg+pg0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=AA+a4AqBKVz6oTbXNI6y+nYVwdd7pC27rIG5UDZFMk0=;
	h=date:mime-version:subject:message-id:from;

Add a MAINTAINERS entry for the Analogix DP controller bridge, covering
the core bridge driver, its register helpers, the public header and the
DT binding, so that get_maintainer.pl routes related patches correctly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c4f4e48774d0..8f014ec3a185 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8235,6 +8235,17 @@ S:	Supported
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

