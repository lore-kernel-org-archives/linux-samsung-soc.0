Received: from mail-m1973177.qiye.163.com (mail-m1973177.qiye.163.com [220.197.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0553A1CE6;
	Thu, 19 Mar 2026 07:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906489; cv=none; b=J2r6ce90OvSqoFsQas3RjDBuHRmXkJfTUyEB9cIm5sZYhap8hPPw2mBdxuRILGYXITO0LH0J0AMUbZB2Z5RJjgcCZYA+ToB47p+cnfQU2gQ+wjG726oKD9cfWm0jj6nRCH9va0KQgZrbjFBktrgxq9uu9xAMnG3iVLnNFGh4lL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906489; c=relaxed/simple;
	bh=eHrChhip+o8m1iHgX+5tHnZt/MGjQEgQ16TleRy/Ozg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYWHNhXZboNGVESqXz3yamIe0pqAJJd4EQDRsVPqOWxs+orrjnlvklcMzR8pmHyDDsor9tMmvywomlJnPjKHHfK5c3zbLGfiRjaREbTmTXBPq3ti37qgcWQbW7YywZRde04PjKtinjKeqlFV2bEF3kk0uY9VZDaDgG7JeYzd1zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hIukTVb4; arc=none smtp.client-ip=220.197.31.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hIukTVb4"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3789bd688;
	Thu, 19 Mar 2026 15:47:54 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 16/17] drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing in analogix_dp_unbind()
Date: Thu, 19 Mar 2026 15:47:43 +0800
Message-Id: <20260319074744.1965918-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319074744.1965918-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
 <20260319074744.1965918-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0510b79003a3kunmf4d8b30239c7d0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh4ZGFZKQkNPTh5JTUhMQ0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hIukTVb4XFxetlBt0FPS/KTYfkbeXsbwZhSS6r1lq+x7LVB2jrQ7Vp2Gm95nrXZJrVYcklQur4NFZMEAQDEgnckMZFeqrtWUcLkxUqlxftjGXpMpkyyiIVVZW4sC5NAEPL85yH9Mynt7Vb/QGEAiCVc/JKwa20litQlAzvqgZok=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nPGx4IvWV+Ock1XEVW+WwXHaTIvJp5Q7k7Ol/XePnRM=;
	h=date:mime-version:subject:message-id:from;

The analogix_dp_unbind() should be balanced with analogix_dp_bind().
There are no bridge enabling and panel preparing in analogix_dp_bind(),
so it should be reasonable to remove the bridge disabing and panel
unpreparing in analogix_dp_unbind().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

-----

Changes in v9:
- Add Tested-by tag.

Changes in v11:
- Add Reviewed-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b66fd3062e41..8bb248e44c26 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1526,10 +1526,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
-	analogix_dp_bridge_disable(&dp->bridge);
-
-	drm_panel_unprepare(dp->plat_data->panel);
-
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1

