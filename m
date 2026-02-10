Received: from mail-m49216.qiye.163.com (mail-m49216.qiye.163.com [45.254.49.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDAB340280;
	Tue, 10 Feb 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716113; cv=none; b=iONY4u0zs7rv4VwotB3xHtetdqEcmhDVB7fSec1zOjbQUBThZLb9R+/09ZMddZLpYXbK+x29RtrTTh5f2T3FTgtFfyE8bhZC7M4b6ImUywLykRPePtFCn2CDovNappc/o1YAxTJe3ZGdYH7eeb2iNCay37u2N44keXirb3Hm/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716113; c=relaxed/simple;
	bh=/79zM8oFHyOFVl27np1x4CiORucckveQXvkRV5olPj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=japUbwi5UFJyavEpe7NowP4U+9jbzYYAOwErf5wv29Ic+46wfJRI27geGCwlay9Y+E8m+qRzbxRFZyu9CzMPbtLS07nFTnOSs9EDGZyNfvwBq1yyAS+LGSQp+nKP01MO2LCbxLqQ2aO6hOTJlC8l98N6sVbs3iuUTpnla7OI+B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=dUgImSU5; arc=none smtp.client-ip=45.254.49.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="dUgImSU5"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b530b48;
	Tue, 10 Feb 2026 15:12:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v9 04/15] drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
Date: Tue, 10 Feb 2026 15:12:14 +0800
Message-Id: <20260210071225.2566099-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210071225.2566099-1-damon.ding@rock-chips.com>
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c46653ed403a3kunm1f53a888aef98c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtKGFYfGBpIH09MHRlPGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=dUgImSU5UBmkXN2HvuOewqGZvnVMXTBQ+6orECmXHMTG3Zf7FNiGIYwbSB3S9+9oYLp4MqhhIq3bCslF/oeBPBh+inWd8DsFL6ye+bEAS46hmU+hQsHgOr7uj/8LI3fVTO4z+fmkc0s2C9jPcxHO/iNL82Pm6y4VFf4ZaP5/Dxg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=0ZOi30iqvElH92jG4uV8QMY3iphYINqvrpBWAIBZe3M=;
	h=date:mime-version:subject:message-id:from;

The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
but never used. It should make sense to remove it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v5:
- Fix the 'drm/bridge' to 'drm/exynos' in commit message.

Changes in v9:
- Add Reviewed-by and Tested-by tags.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f469ac5b3c2a..e20513164032 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -35,7 +35,6 @@
 
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
-	struct drm_connector       *connector;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
@@ -102,8 +101,6 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	int ret;
 
-	dp->connector = connector;
-
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
 		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-- 
2.34.1

