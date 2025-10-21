Received: from mail-m81200.xmail.ntesmail.com (mail-m81200.xmail.ntesmail.com [156.224.81.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7A1FF7B3;
	Tue, 21 Oct 2025 03:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.81.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761016118; cv=none; b=YeUa8tYv8F1TxpZDENcF3e5A/bqJqW5xG3QKrka5wl78AD145LKOdfpa2aOw2iB4nQFPCWykz/9CsuUmP8T5hReas13L6boNhAlzCbBbwWRU4dKzz8CKH4iFIk7jW4tC3NEY4a4P2zbFKpZk+ZuBUUEk89EZVmn85A1af9Ep1zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761016118; c=relaxed/simple;
	bh=27sWcGgopy8L9O52zrINaPxkx4hhS3gSfw1vvWRUM44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rbwPKkEt8sxbcdJorhUAt9nL+/lbGt0ZbOdVZWPRNHS3pMOhZpxV1ad6aZkRyiCLpU115yMpLnk/2N+I23fIjTNZGJ7wqBWgBdog/P7eutA0a0UGSAkY0tKbWFq2cffw/NHfzHk7Hl5jkgoiBAJ3Tvh6tzxAnBgRC60dXHnXhE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=TzhKZYyf; arc=none smtp.client-ip=156.224.81.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="TzhKZYyf"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 269693c5a;
	Tue, 21 Oct 2025 10:33:05 +0800 (GMT+08:00)
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
Subject: [PATCH v7 02/18] drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
Date: Tue, 21 Oct 2025 10:31:14 +0800
Message-Id: <20251021023130.1523707-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021023130.1523707-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a049cefd303a3kunm42a8e83d59a94a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgfSlYZTU1PHUpISxhIHUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=TzhKZYyfI6DjwNXo0ON/uuRAbgJTw/9jSJ1f5rccJEckDA9LfPL1SFMzRSLnx5++vnzKIgYGDkgBwjz2NnBylZDZorLztFDLsbOBXXPYaDhrBlv0cu7VKJ5fKkqkbEUTg45eB2rLRiqZAgeFCjJxRBalBIfekUwXiz7H8WlstEg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wMgNU9HKWX4U88wR/qYvG3evHrpviSSz9KGW1/W263o=;
	h=date:mime-version:subject:message-id:from;

Use the tap instead of the space for &analogix_dp_device.aux and
&analogix_dp_device.force_hpd.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index b86e93f30ed6..91b215c6a0cf 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -156,7 +156,7 @@ struct analogix_dp_device {
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_bridge	bridge;
-	struct drm_dp_aux       aux;
+	struct drm_dp_aux	aux;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
@@ -166,7 +166,7 @@ struct analogix_dp_device {
 	struct phy		*phy;
 	int			dpms_mode;
 	struct gpio_desc	*hpd_gpiod;
-	bool                    force_hpd;
+	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
 
-- 
2.34.1

