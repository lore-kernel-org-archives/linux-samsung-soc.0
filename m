Received: from mail-m3278.qiye.163.com (mail-m3278.qiye.163.com [220.197.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78723CD8D9;
	Mon, 13 Apr 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087700; cv=none; b=r8wy0j/Fq4Ek/qmA1fqPN4eK9dGKueSJPMh3unUE7QnZLjsTIX88/Y7+AE5F+KcDhXqOopSA8SF66f2PJIXYn0z5se+dYL7yY4Rg71TKmC2nj2fSaRAaWJxIItXXi/qaSZjloSTN7QmbRyErVK5Eh5mln8gHLSZGtUeqco1+JE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087700; c=relaxed/simple;
	bh=p9UHdXydGFWEup5pDizVJZIhDhHChtWtyX9VpMgxKjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mi1eVbMNlT8nZ5u9kCyNmq5wfkFWgtR+44AXC5REcwnOy0bnuR1dlmDwf22o2dd+XcfTq4bwdMrb9PZdM6M+6/jHkaMKxywM0NkbZiBrOmA2QoXVH9wKu+LIXSvnF0AqL7zOWpqtEyIMO4qpEJ5EooPV4wa/68BqH7QN49JRQfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=DdURDvYb; arc=none smtp.client-ip=220.197.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="DdURDvYb"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a8976aed;
	Mon, 13 Apr 2026 21:26:08 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v14 7/8] drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing in analogix_dp_unbind()
Date: Mon, 13 Apr 2026 21:25:50 +0800
Message-Id: <20260413132551.1049307-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413132551.1049307-1-damon.ding@rock-chips.com>
References: <20260413132551.1049307-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d87055cc603a3kunmf5e06f40656e72
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJLT1ZPTh4ZTUNMSEMaQ0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=DdURDvYbPoh1Jr0gvygEHROP5G7cHUOGOtSsMWcIjBqclEc1HJ5JIQtpt6/nocrXtFULhn7haH71rFk95aR3/0XYC6Q/3/O3EqROMgMRc9JRGj4KWsyci9x2EHWGiJua+bkdBqZ6K4BFhkGYIbPg3TSpcf+A0x8tNAOsw6iS1Tk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Lr0drAXv6a9U/siAoum2C72I0Kf7N9TKVRu8v95lrJA=;
	h=date:mime-version:subject:message-id:from;

The analogix_dp_unbind() should be balanced with analogix_dp_bind().
There are no bridge enabling and panel preparing in analogix_dp_bind(),
so it should be reasonable to remove the bridge disabing and panel
unpreparing in analogix_dp_unbind().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588

---

Changes in v9:
- Add Tested-by tag.

Changes in v11:
- Add Reviewed-by tag.

Changes in v13:
- Modify '(on rk3588)' to '# rk3588' for Tested-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 85033a8ab146..ec56d900f899 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1527,10 +1527,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
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

