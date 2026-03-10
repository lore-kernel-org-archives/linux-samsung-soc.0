Received: from mail-m49200.qiye.163.com (mail-m49200.qiye.163.com [45.254.49.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0152D8762;
	Tue, 10 Mar 2026 01:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106273; cv=none; b=MmgWtnvJKyi7rubuvsMjFBk/loMX2ppnFweOqVoALOxn5lPtBEnL4t0NgoPp/Tgm5RG+S/IPyKjbLO6/nMtTOhuEGMZGEULcABKyObrGlDoiRp1Z6bsYPNEWzGcgk8MYNMYdYjHflMcqW4lKchV2O3DNrmCpfGKSAQ0ghmGl604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106273; c=relaxed/simple;
	bh=4Iz5Csqc7LBPzEA1v8gUMEia6hZDf98AcmPIzY6TlIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ebuHnHn+E7GT8MdTSTRZi6dPD+vaG1hDwZ4LDXHFCUqJ3ZWZnjg12fGItA9bQxz4vy4fWxAW0NdjMR+x6bHyX833XTkLPzMDQAWuQSZZ4VgCtZizHuOUwrPCGvJNIaHsVUF60kAHgCrzZCm7suoFa11sVYCocU76LQCIDc939v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UtFpnBFB; arc=none smtp.client-ip=45.254.49.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UtFpnBFB"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3653ae853;
	Tue, 10 Mar 2026 09:25:52 +0800 (GMT+08:00)
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
Subject: [PATCH v10 12/18] drm/bridge: analogix_dp: Remove unnecessary &analogix_dp_device.connector
Date: Tue, 10 Mar 2026 09:24:52 +0800
Message-Id: <20260310012458.169272-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310012458.169272-1-damon.ding@rock-chips.com>
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd559b82003a3kunm2771af5030e05b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9LGlYYSR9ITktITkkaSUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=UtFpnBFBNg0OYjgIinEpEiVCNwOY6HtIeakanzuJ89fnX+QEdwmRGOlqV6H6M1vu/FE7hsWgRal7etWyLcHFxOttyIn40WvU8cevWwyiv5wNSdZ8BZUkdx4YWOikTWZnQSVu7n6/nKHxWk++P5YVfBU7R7U+GMZdPmcSFII8FZo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=IO+Sa552p1pVsAgbOsXUCoW1boDXQfGs6bzYJR7aeaU=;
	h=date:mime-version:subject:message-id:from;

After adapting to the bridge connector framework, the private
drm_connector is no longer required.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 91b215c6a0cf..17347448c6b0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -154,7 +154,6 @@ struct analogix_dp_device {
 	struct drm_encoder	*encoder;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
-	struct drm_connector	connector;
 	struct drm_bridge	bridge;
 	struct drm_dp_aux	aux;
 	struct clk		*clock;
-- 
2.34.1

