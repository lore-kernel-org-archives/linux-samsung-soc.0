Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7014AEFE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749115; cv=none; b=IFmNLzaHVpKeHJU2pgIqL7gAg3XnHmJYp/vVBg0d3Ono5dgrZo5WiLwEBCYzmtO0gF7Sn1pF2oERNQ5e3H+FD/G3u5F+cPgGhBQjVbZDadIuvBqm53vDokUV1CMKxQeqgKhPVTohZ/pbywLpnjvb/eX35gKMMctDtG7g/RfXeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749115; c=relaxed/simple;
	bh=c9tM4gs8hqHi3wpi+oTimymzwfue0cuWg7T5+lJhOHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aBs4z1pKczWsPvfIt6+7IxBEJmNR/8/XrxZ42QrWEZRv6Gwh6eDqOAmySIzJedrEBOZGM8Igfybc2i0fyVlFBCjOjm9GodAs42rxK2XpMvcrbUwJbc2QgByJCXDM3sRR7nJT1M8z6hxhbRrDkm0FsrDW8y9ZziO4D/N6COEYMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZR-0004Br-K7; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1s2uZN-00FjHY-C5; Fri, 03 May 2024 17:11:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH 00/14] improve Analogix DP AUX channel handling
Date: Fri,  3 May 2024 17:11:15 +0200
Message-Id: <20240503151129.3901815-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

Currently the AUX channel support in the Analogix DP driver is severely
limited as the AUX block of the bridge is only initialized when the video
link is to be enabled. This is okay for the purposes of link training,
but does not allow to detect displays by probing for EDID. This series
reworks the driver to allow AUX transactions before the video link is
active.

As this requires to rework some of the controller initialization and
also handling of both internal and external clocks, the series includes
quite a few changes to add better runtime PM handling.

Lucas Stach (14):
  drm/bridge: analogix_dp: remove unused platform power_on_end callback
  drm/rockchip: analogix_dp: add runtime PM handling
  drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
  drm/bridge: analogix_dp: handle clock via runtime PM
  drm/bridge: analogix_dp: remove unused analogix_dp_remove
  drm/bridge: analogix_dp: remove clk handling from
    analogix_dp_set_bridge
  drm/bridge: analogix_dp: move platform and PHY power handling into
    runtime PM
  drm/bridge: analogix_dp: move basic controller init into runtime PM
  drm/bridge: analogix_dp: remove PLL lock check from
    analogix_dp_config_video
  drm/bridge: analogix_dp: move macro reset after link bandwidth setting
  drm/bridge: analogix_dp: don't wait for PLL lock too early
  drm/bridge: analogix_dp: simplify and correct PLL lock checks
  drm/bridge: analogix_dp: only read AUX status when an error occured
  drm/bridge: analogix_dp: handle AUX transfer timeouts

 .../drm/bridge/analogix/analogix_dp_core.c    | 196 ++++++++----------
 .../drm/bridge/analogix/analogix_dp_core.h    |   7 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  38 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |   9 +
 drivers/gpu/drm/exynos/exynos_dp.c            |   5 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  26 +--
 include/drm/bridge/analogix_dp.h              |   4 +-
 7 files changed, 120 insertions(+), 165 deletions(-)

-- 
2.39.2

