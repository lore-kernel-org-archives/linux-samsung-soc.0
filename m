Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.82.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107710;
	b=Ven1fsI0p8h4NpqCPkU1Y/qTBl82PmU9LXKKv1c+eh0723UJwXdyYfWkrrlI90AAOXNd
	 xXmKvOQC4Q2p6ptzv34OVPXKyapXJgaiSGPHeLaTjhBGc8CpFz8h+QDovjs1cYCnAWg9n
	 wxbG/eIqp0Q33xyDw5Gkb5rahOIhNWWS0zRlA5ou8cXBgDLqq4i/Wj/u2hv+9mOmyECTh
	 3vMbicpLOflBmS0LYIdjgbdtk3a/gzUJoy1a0NZm1vOWQtI/0m3143LYsp9hKlb0h/uwY
	 wptaYVGsJKyCG3++jTYIuCMJJTq8H7vRax+onLRJHtbabodov2SJVfso7fwzABBP2YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107710;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=PJNmddl5n2TxVGqmRtvT5dewxyqqKvr1WFhlUGMg4pw=;
	b=CY5AeK/6cObdSsbUyD7Sk6lcnGL8J/dt1jbAL3ipXt9zq5lOnGuAdeqQEATCXknRksr5
	 g1Enm7yHv5GDIkPm0DqzOm8nsrpQyFm78pkcuDffc+fkY3wHBENVTWddFyn8VTiTeGVKG
	 a9RlYXAkKcI3/TIDYYu+K10f44AMsQ/OheowjQjSwocqY4FKnkoPrHMKvOcUVzcGtmEs5
	 31frerUvnslAiZ6q/46cFOMvSlWvnMVLrE7ScboPP1N4soQ6X0YyJ2G27LiCqI2GOm2OB
	 0RWp6XnjQ1c79sxDKCMLhdgbCjXXr2hW2BigRl7kt5H9MB0nnzSd+RYvCTDBl9i+J+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=L9ulkoWj;
	arc=none smtp.remote-ip=156.224.82.207
Received: from mail-m82207.xmail.ntesmail.com (mail-m82207.xmail.ntesmail.com [156.224.82.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC48606A31A;
	Tue, 27 Oct 2026 13:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC48606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=L9ulkoWj
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a1d;
	Tue, 27 Oct 2026 21:28:14 +0800 (GMT+08:00)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>
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
Subject: [PATCH v5 00/18] Add HPD support for Rockchip Analogix DP
Date: Tue, 27 Oct 2026 21:27:52 +0800
Message-Id: <20261027132810.1746118-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17d8c118e03a8kunm87c266213d56d1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx5LVkIdH0JCSk8YTkxLSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=L9ulkoWju2I9Qsb6IThoAIQODAjvNaPbC2jEkO/xjfw+PDDX80/12B86nm7qg6bnO4y0jaaQk5uXCDHqADYCq7gdfuXDLfWQuqgVEPndiGmjbzQ0T5ir23Tu1UIkz8C9lCjkZAXwCnQ6WfMwyYtPxymR/+YKjwT0dm79DgtXyt8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PJNmddl5n2TxVGqmRtvT5dewxyqqKvr1WFhlUGMg4pw=;
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

Damon Ding (18):
  drm/bridge: Select VIDEOMODE_HELPERS for DRM_OF_DISPLAY_MODE_BRIDGE
  drm/bridge: analogix_dp: Use bridge->next_bridge instead of plat_data
    field
  drm/bridge: analogix_dp: Restrict forced connected status to panel
    endpoints
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
  drm/rockchip: analogix_dp: Unbind bridge when connector init fails
  drm/exynos: exynos_dp: Unbind bridge when connector init fails
  drm/bridge: analogix_dp: Move IRQ enable/disable to bind/unbind
  drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin
    detection
  drm/bridge: analogix_dp: Declare DRM_BRIDGE_OP_HPD for hotplug
    reporting
  drm/bridge: analogix_dp: Handle HPD notification from downstream
    bridge
  MAINTAINERS: Add entry for Analogix DP controller bridge

 MAINTAINERS                                   |  11 +
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 221 +++++++++++++-----
 .../drm/bridge/analogix/analogix_dp_core.h    |  15 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 153 +++++++-----
 drivers/gpu/drm/exynos/Kconfig                |   1 -
 drivers/gpu/drm/exynos/exynos_dp.c            |  16 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   1 +
 include/drm/bridge/analogix_dp.h              |   1 -
 10 files changed, 291 insertions(+), 130 deletions(-)

---

Changes in v2:
- Split IRQ enable/disable logic, handle native HPD pin and
  GPIO/force-HPD modes separately to avoid unbalanced enable_irq()
  calls. (Sashiko)
- Add separate patch for IRQF_ONESHOT to resolve interrupt mask issues
  triggered by interrupt preemption. (Sashiko)
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
  &analogix_dp_device.irq and propagate the actual error code. (Sashiko)
- Rename macro HPD_IRQ to HPD_IRQ_ALL to avoid confusion with the
  DP specification IRQ_HPD, extract the irq_type-to-register bit
  mapping into a shared helper, and drop the unused
  COMMON_INT_4_HPD_IRQ macro.
- Simplify commit messages across the series.
- Add new patch to use bridge->next_bridge instead of the plat_data
  field, resolving the next bridge in
  analogix_dp_aux_done_probing(). (Suggested by Heiko Stuebner)
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

Changes in v5:
- Add four new patches:
  - Select VIDEOMODE_HELPERS for DRM_OF_DISPLAY_MODE_BRIDGE to fix
    the undefined references for non-Exynos users.
  - Unbind the bridge when drm_bridge_connector_init() fails on the
    Rockchip and Exynos platforms.
  - Declare DRM_BRIDGE_OP_HPD on the Analogix DP bridge and report
    the hotplug events via drm_bridge_hpd_notify().
- Move the next_bridge resolving patch and the forced connected
  status restriction to the front of the series.
- Use a pure threaded IRQ handler and hold runtime PM references in
  the IRQ thread and the detect paths. (Sashiko)
- Limit the runtime PM holding to the RK3576/RK3588 platforms and
  exclude the boards with a fixed panel. (Sashiko)
- Fix the display timings leak in analogix_dp_aux_done_probing().
  (Sashiko)
- Change the type of &analogix_dp_device.irq to int to fix the dead
  dp->irq < 0 check. (Sashiko)
- Rebase onto the latest drm-misc-next.

-- 
2.34.1
