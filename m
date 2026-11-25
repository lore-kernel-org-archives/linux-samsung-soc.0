Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605746;
	b=o1QaHeLGNsgFHFOu9fElMGnBB/mF18QLiqMYTaccfG6IbKc75ZVhqRnLsL3tmUgtbjU2
	 3HU9co+u7ITHQW1yHrdaSvWJadmpLOc7mVuGSb+tSF1K50G1z1ZlSNzdUMNMEx54BScuO
	 XoSA6Txy1W81YMNriqzqJROoSBdjfr0ukWXLZ/k/MymLsPP6WaOOCpOl358TLD9A31FqA
	 VR9d89vi0cUHbb+yqnxPrj+MJM91kKGoty7xXtQcyk7UusnanCC+eMrEPDtOyMvnC/AGP
	 NI3e41iys4qmKI+revhxduxs5J3kMAMfMicH+c/zphiXuiAhBgdB5RG42jxnObXW9cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605746;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=p4zmPdPsDeiWHAtXZWhH+tPhJrTy6vvnSAwhPV5ND4Q=;
	b=YMR/eHLA5G/W7Rb4tHwDB99/1XLiJItOSS5w/mX7GIxbX8GEFiDy1VLI4uFOIyGvly65
	 VghjHps4dQsOqG4w5tz+pGJ8JaLHT/Uu1Gaz2hyHHlIRGv6BJhkvDTjj7LQ8wvl1dMcJs
	 JfCZCpGkwIoNCfoRb6ysdGI35sR2et/etQ9sW/jQ1u4xpK5B+NYzhZjXt9tslYiZo9LGZ
	 0B21sQsAofi3AGfjyrP0TY7K0TO7dkXOg4SXU/8F+H3/QfXyCpo5yNshj9g63TjowzaOr
	 uLrFnisHEIkkX8Vv8uPN601nB9q24jPeQQpQujpKgTUjlWcs+a03zxyJf8trgU7NNsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ope0rw3j;
	arc=none smtp.remote-ip=160.236.52.252
Received: from mail-m16023652252.xmail.ntesmail.com (mail-m16023652252.xmail.ntesmail.com [160.236.52.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D39606A684;
	Wed, 25 Nov 2026 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D39606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ope0rw3j
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f81606c;
	Wed, 25 Nov 2026 19:22:14 +0800 (GMT+08:00)
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
Subject: [PATCH v7 15/20] drm/exynos: exynos_dp: Unbind bridge when connector init fails
Date: Wed, 25 Nov 2026 19:21:36 +0800
Message-Id: <20261125112141.1434903-16-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa21271232b03a8kunm17c230507758dc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkhCVkNPHRlDHk1DSU5NHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ope0rw3jC4tAAH4rq2k/oGAe3l00Li+Py+YHRktF6SMaToNMgIUdRRdzb+iaNDdsnKO0tdPhHrh+lEcVlexh21IcKPAml7B569YFq08nJ/DSQh3Pe9A95DXx1vPcoU/7hsD6R453jsIxRAVs704u0GuelugS0Cr7clVt7lvxue0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=p4zmPdPsDeiWHAtXZWhH+tPhJrTy6vvnSAwhPV5ND4Q=;
	h=date:mime-version:subject:message-id:from;

The exynos_dp_bind() returns without unwinding analogix_dp_bind() when
drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Fixes: 99a49ff5ef7a ("drm/bridge: analogix_dp: Apply drm_bridge_connector helper")
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add Tested-by tag.

Changes in v7:
- Add Fixes tag.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 572e261e09da..86dc53014fff 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -121,6 +121,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		analogix_dp_unbind(dp->adp);
 		return ret;
 	}
 
-- 
2.34.1

