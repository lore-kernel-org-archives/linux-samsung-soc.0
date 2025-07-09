Received: from mail-m32123.qiye.163.com (mail-m32123.qiye.163.com [220.197.32.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5821ABAC;
	Wed,  9 Jul 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752044552; cv=none; b=o7oDyWfwICFaLwAJo42eNesmDC9JSj13DcHK4XYrAtMQbC7Q2O9kBbd0F0Au82uHC+XO+WLaMqepzOqGMnUMkoQFvTQNUcqbrTv/pwxW/ASRA0XABipOyTH40Hgiut4RJ7SzrAsU2Rog5ukQPSZhlnOMamG+O+Tr8/Znnb7MJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752044552; c=relaxed/simple;
	bh=rTFmnY9GoHSbGPdwpO3DBnr9SBTvcFpOMk3OBJB4CVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p0kh4z20om+xcV0Ddu6iY1a8o5rfnhZwjVMEotNyhh4V77HBBs35LkHITJ04spQhoNZdfJUSdSLWR8p1C5R4tjOfH/stcr/s26O4sM1cOxAiLX4F1AvgTT4Kxc3g3biZ71r+SaZFnNLXI1JefMyQUcOlQRZxD18QjA+X3kJjZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZwK7Ywp5; arc=none smtp.client-ip=220.197.32.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZwK7Ywp5"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b799a;
	Wed, 9 Jul 2025 15:02:16 +0800 (GMT+08:00)
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
Subject: [PATCH v2 00/12] Apply drm_bridge_connector helper for the Analogix DP driver
Date: Wed,  9 Jul 2025 15:01:27 +0800
Message-Id: <20250709070139.3130635-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh8dTlYeS04YHR9IGE8fHhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe02a503a3kunm3a7bcd50c83882
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Lww*KjEzQi8rFRVMI0oR
	NjxPCTdVSlVKTE5JS09PTkhDTE9MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0NNNwY+
DKIM-Signature:a=rsa-sha256;
	b=ZwK7Ywp5C+VjGI7jFlKvgIwk+1+l+e/7zKTo8xfobMIrnOsi7a2QU8ONWp4yynusrFZ+sJtHriTtrdJb38/HUkENYELRlSR7UJ2qy0bHUH2/KbsrnLVkLn+olHV8VIYm7s9U/838ajb8N3TGCodnJVASttHPQ/4vD0LCe9WOzJY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+bjluHkW3SFP0xqLuvonF0izTiZCHO6le07wELtphZs=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is a small format optimization for struct analogid_dp_device.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
PATCH 9 is to apply a better API for the encoder initialization.
PATCH 10-11 are to apply the newly added API to find panel or bridge.
PATCH 12 is to apply the drm_bridge_connector helper.

Damon Ding (12):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Add support to find panel or bridge
  drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
    drm_simple_encoder_init()
  drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/bridge: analogix_dp: Remove unused APIs for AUX bus
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
 include/drm/bridge/analogix_dp.h              |   6 +-
 5 files changed, 217 insertions(+), 236 deletions(-)

-- 
2.34.1

