Received: from mail-m3280.qiye.163.com (mail-m3280.qiye.163.com [220.197.32.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DEA33F362;
	Tue, 10 Feb 2026 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714641; cv=none; b=XO7ixGmaJzzmeYnJX5UMOLb/UNQCVPMfW1E9CMQ6pS7zeMUvkIdgPNglJxe5OSe8kkqpF6ItSSaIs8uyrDNEtb1xPnFMnCgCtvTY6ro0Vm2dGAtq0dE9CHFu3cNnj2pshmL5qGWGaaVo3O999kdRnDKlUqHTocc0G/UUotgAZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714641; c=relaxed/simple;
	bh=b1lWevBY8/2C917IyvwgAKe/mSaMoyUGYRHYgLKvDEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pL82Cid6gTw1l0UzBYLAnaqu1287KMlfLCdYDFJEf+zOzAM2m2njwcP9mw6jt/GExKDE4G7JV4bfaWIT2oF706j7YDs7uS+qaGX/ZxYRRrxaBSASKLiRYhtRFG+ZEASTNEgcld0FWiPQcC5MRo3b73BPLeuYZPmxNDd7qUGXxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GZ5a1o4N; arc=none smtp.client-ip=220.197.32.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GZ5a1o4N"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b9824fc;
	Tue, 10 Feb 2026 17:10:31 +0800 (GMT+08:00)
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
Subject: [PATCH v9 14/15] drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing in analogix_dp_unbind()
Date: Tue, 10 Feb 2026 17:10:23 +0800
Message-Id: <20260210091024.2732369-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9c46d10cb403a3kunm0d7fbd00b0725f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtOHVZDH09DQ0oYTEtLGkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=GZ5a1o4NAz0MOQLqXoDZBO9ZxZH9BQwn36FngQk5s1emKikHo2Hky7qZKyPrQwpv4WtqXlonehi508V9mPfrvof+Vi10bqbjUID8fNUTqVe4/09pNKjqGT4kW4a86PkG07SyfIrzUJ6zLGUkzhEvCT72LfHDE0fFvuEEWYkO2rY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yf16a2cU+FS9KHXqo5I7X1GXUmDNyHD8tmwS7pIzZc4=;
	h=date:mime-version:subject:message-id:from;

The analogix_dp_unbind() should be balanced with analogix_dp_bind().
There are no bridge enabling and panel preparing in analogix_dp_bind(),
so it should be reasonable to remove the bridge disabing and panel
unpreparing in analogix_dp_unbind().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

-----

Changes in v9:
- Add Tested-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a6c5601e16ff..7e3e9d4f4ea2 100644
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

