Received: from mail-m3273.qiye.163.com (mail-m3273.qiye.163.com [220.197.32.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215A4A64E0;
	Mon, 19 Oct 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404885; cv=none; b=NehaHOq1b8oDlk0apUs0K5QOo51GFruvT4sjUGfMo7lnrrMzz4p5cirKXOtyhrJnDrTjdYGEKOxZgzwje8nDUsPx6DJGgzLceO3QzlQpB3tfQhOjvvnyvOveNVC5tYTbQKxNj+mFH6B+HzbfWJUzv554GbYqEuGKYBWywLTzL8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404885; c=relaxed/simple;
	bh=4lhpFWBq6tPVjGLkrQpXE7EY4TtcOZhTlhFIW58OdDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eH99r6eZhrzZm6vItUtLoP3bduyhFbw6dXU+4zkG1kgqN4rXIOGO4DO072puLmRwy3OIhDa3+STmqSunqUZlUD03bQSlfE+d5VkTnzq9tKEGDUsB0ySyAXIpJOioQbLo67c04/GKE3gP6zJL+YUDEIN3u8TIR/eIvZlQyIOyZxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NgKPBcpq; arc=none smtp.client-ip=220.197.32.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NgKPBcpq"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51899c488;
	Mon, 19 Oct 2026 16:59:00 +0800 (GMT+08:00)
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 00/14] Add HPD support for Rockchip Analogix DP
Date: Mon, 19 Oct 2026 16:58:22 +0800
Message-Id: <20261019085836.3065008-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15362b41e03a8kunm6ee755052eabda
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE1NVksaHk4aSxhOGUJDTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQk1VSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=NgKPBcpqxHWE3ptmzPYF1guvxbCmdGVHUQWqFpO0/mdBFds05YWYqlXHFjyuUq87rfYDDwHGeaPHStm8ByFTNvDZDetiexG6YPuWkjwIs0v1m4jhnGLgsse39iEmuYlCv8wFEo8WiuHW4aD0WjuulxwxhNbNpZ4vpytvlPypzy0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xfqFpqOADSC5DFsqn0x/n9f7VvDWA1kZ7LKBjJy4i1M=;
	h=date:mime-version:subject:message-id:from;

This series improves the HPD (Hotplug Detect) interrupt handling in
the Analogix DP driver to enable reliable native HPD pin detection on
Rockchip platforms, and introduces platform-specific HPD detection
schemes with fine-grained interrupt control.

On Rockchip platforms, the Analogix DP native HPD pin IRQ requires the
DP controller to remain powered, clocked and initialized to generate
plug/unplug interrupts. The previous driver enabled/disabled IRQ during
bridge enable/disable, which left no HPD detection when the display
pipeline was inactive. Additionally, the interrupt mute/unmute/clear
routines operated on all HPD interrupt bits unconditionally, lacking
the granularity needed for per-event control.

The series reorganizes IRQ and pm_runtime management into bind/unbind,
adds IRQF_ONESHOT to eliminate read-modify-write races on interrupt
mask registers between hardirq and threaded handlers, converts the
interrupt type detection to a bitmask-based scheme for fine-grained
mute/unmute/clear operations, and configures Rockchip platforms to use
the HOTPLUG_CHG interrupt with a 2ms HPD deglitch setting for better
stability.

Furthermore, the next bridge is now resolved into bridge->next_bridge
instead of the platform data field, the forced connected-status logic
is restricted to panel endpoints based on the bridge chain, and HPD
events from downstream bridges (e.g. display-connector with hpd-gpios)
are handled through the .hpd_notify callback.

Tested on RK3576 with both native HPD pin and GPIO HPD configurations.

Native HPD pin mode:

  &edp {
      status = "okay";
      pinctrl-names = "default";
      pinctrl-0 = <&edp_txm0_pins>;
  };

GPIO HPD mode:

  &edp {
      status = "okay";
      pinctrl-names = "default";
      pinctrl-0 = <&edp0_hpd>;
      hpd-gpios = <&gpio4 RK_PC1 GPIO_ACTIVE_HIGH>;
  };

  &pinctrl {
      edp {
          edp0_hpd: edp0-hpd {
              rockchip,pins = <4 RK_PC1 0 &pcfg_pull_none>;
          };
      };
  };

Display-connector mode (DP connector without HPD GPIO):

  &edp_out_conn {
      remote-endpoint = <&dp_con_in>;
  };

  dp-con {
      compatible = "dp-connector";
      label = "DP OUT";
      type = "full-size";

      port {
          dp_con_in: endpoint {
              remote-endpoint = <&edp_out_conn>;
          };
      };
  };

Display-connector mode (DP connector with HPD GPIO):

  dp-con {
      compatible = "dp-connector";
      label = "DP OUT";
      type = "full-size";
      pinctrl-0 = <&edp0_hpd>;
      pinctrl-names = "default";
      hpd-gpios = <&gpio4 RK_PC1 GPIO_ACTIVE_HIGH>;

      port {
          dp_con_in: endpoint {
              remote-endpoint = <&edp_out_conn>;
          };
      };
  };

All four configurations detect cable plug/unplug events correctly.

Damon Ding (14):
  drm/bridge: analogix_dp: Return bitmask from
    analogix_dp_get_irq_type()
  drm/bridge: analogix_dp: Check all negative return values for
    &analogix_dp_device.irq
  drm/bridge: analogix_dp: Add IRQF_ONESHOT and simplify IRQ handling
  drm/bridge: analogix_dp: Extend clear_hotplug_interrupts to accept IRQ
    bitmask
  drm/bridge: analogix_dp: Extend mute/unmute HPD interrupts to accept
    irq bitmask
  drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
  drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
  drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
  drm/bridge: analogix_dp: Move IRQ enable/disable to bind/unbind
  drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin
    detection
  drm/bridge: analogix_dp: Use bridge->next_bridge instead of plat_data
    field
  drm/bridge: analogix_dp: Restrict forced connected status to panel
    endpoints
  drm/bridge: analogix_dp: Handle HPD notification from downstream
    bridge
  MAINTAINERS: Add entry for Analogix DP controller bridge

 MAINTAINERS                                   |  11 ++
 .../drm/bridge/analogix/analogix_dp_core.c    | 153 ++++++++++++-----
 .../drm/bridge/analogix/analogix_dp_core.h    |  13 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 156 ++++++++++++------
 drivers/gpu/drm/exynos/exynos_dp.c            |  15 +-
 include/drm/bridge/analogix_dp.h              |   1 -
 6 files changed, 233 insertions(+), 116 deletions(-)

---

Changes in v2:
- Split IRQ enable/disable logic, handle native HPD pin and
  GPIO/force-HPD modes separately to avoid unbalanced enable_irq()
  calls.(Sashiko)
- Add separate patch for IRQF_ONESHOT to resolve interrupt mask issues
  triggered by interrupt preemption.(Sashiko)
- Update commit messages to align with newly added IRQF_ONESHOT related
  commit.
- Move ANALOGIX_DP_HPD_DEGLITCH_L/ANALOGIX_DP_HPD_DEGLITCH_H configs to
  analogix_dp_reset().
- Add new patch to restrict the forced connected-status shortcut to
  panel endpoints only, allowing DP connector bridges to rely on HPD
  detection. (Reported by Heiko Stuebner)
- Add new patch to handle HPD notification from downstream bridges
  (e.g., display-connector with hpd-gpios).

Changes in v3:
- Reorder the series: convert the IRQ handling to a bitmask and add
  IRQF_ONESHOT before moving IRQ enable/disable to bind/unbind.
- Add new patch to check all negative return values for
  &analogix_dp_device.irq and propagate the actual error code.(Sashiko)
- Rename macro HPD_IRQ to HPD_IRQ_ALL to avoid confusion with the
  DP specification IRQ_HPD, extract the irq_type-to-register bit
  mapping into a shared helper, and drop the unused
  COMMON_INT_4_HPD_IRQ macro.
- Simplify commit messages across the series.
- Add new patch to use bridge->next_bridge instead of the plat_data
  field, resolving the next bridge in
  analogix_dp_aux_done_probing().(Suggested by Heiko Stuebner)
- Report panel endpoints as always connected from
  analogix_dp_get_plug_in_status() via force_connected_mode, computed
  from the bridge chain at attach time.
- Determine the hpd notify mode from DRM_BRIDGE_OP_HPD on downstream
  bridges that lack DRM_BRIDGE_OP_DETECT.
- Add a MAINTAINERS entry for the Analogix DP controller bridge.

Changes in v4:
- Add Tested-by tag from Heiko.
- Rebase onto latest tree, picking up the two related patch series [0][1].

[0] https://lore.kernel.org/all/20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com/
[1] https://lore.kernel.org/all/20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com/

-- 
2.34.1

