Received: from mail-m3291.qiye.163.com (mail-m3291.qiye.163.com [220.197.32.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA42221703;
	Thu, 24 Jul 2025 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344515; cv=none; b=Tk/KugGZTSZaeDvQCi4SrWp6Cx8M7jungTVJ42qnYrjMGiVoHHbI/esxWFxok5qlolzvBd1iAJb+m+tl6W0ZlU1ZW8Fs3TZsJQQASvAHofjpH+fp49GWNiOIPZjLlSrU7+n/Rq+cGrKu8Ue9GWytVywBO6SiLrrYu7CfcZ2AGcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344515; c=relaxed/simple;
	bh=f+bJznwfDNcGaCDPJA7XKPSX5TuUL/iHzNvaTBvqpig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e5vvncnIE6N47KgPSoDH218p6huIvKC9xZlDfVYtPtWFR4I6Enmgzq9mcidCnCqtfxVta7P5JVfNkERwUh0PYQ15J/h0d1gkepqKhbwShNDZq7f8DFJYKcRfRe+trLuEuIMTwy/j6i5QYECdCozLlG5ADf39BqWllJSmPy6XS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=aE5wZPbt; arc=none smtp.client-ip=220.197.32.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="aE5wZPbt"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c34377;
	Thu, 24 Jul 2025 16:03:14 +0800 (GMT+08:00)
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
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Thu, 24 Jul 2025 16:02:50 +0800
Message-Id: <20250724080304.3572457-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983b75378603a3kunmbbba7af29cef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1KTVZKH0JKSkhPQkkfSE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aE5wZPbtuRrtIKfTtfH1/ikI4T3SwqKfYIQFQF0cJgKNHKPMw5hIHuZnyzme+bRPAfqFFVFvp6NN8I7ysZI2sy6CpvDBGLi2k3yp8xSSpOhh6MEiXP7iKv6qUoIs5OJ9Xj//5OYtjK95hW+TofDYLNMxGpYuH9pcHBjhQi0YroE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/a3ZH/e6MX3cQWLnQo0XUfQLEK6LM5ZgF2VvUtU43P0=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is a small format optimization for struct analogid_dp_device.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3 is to apply a better API for the encoder initialization.
PATCH 4-7 are preparations for apply drm_bridge_connector helper.
PATCH 8 is to apply the drm_bridge_connector helper.
PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
PATCH 12-13 are preparations for apply panel_bridge helper.
PATCH 14 is to apply the panel_bridge helper.

Damon Ding (14):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
    drm_simple_encoder_init()
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper
  drm/bridge: analogix_dp: Add support to find panel or bridge
  drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/bridge: analogix_dp: Remove panel disabling and enabling in
    analogix_dp_set_bridge()
  drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
    in analogix_dp_unbind()
  drm/bridge: analogix_dp: Apply panel_bridge helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 383 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  48 +--
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  53 +--
 include/drm/bridge/analogix_dp.h              |   7 +-
 5 files changed, 248 insertions(+), 248 deletions(-)

-- 
2.34.1

