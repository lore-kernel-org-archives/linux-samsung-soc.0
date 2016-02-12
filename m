From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 00/17] drm encoders cleanup: nuke optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:50:52 +0000
Message-ID: <1455285069-2819-1-git-send-email-palminha@synopsys.com>
References: <daniel.vetter@ffwll.ch,>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:59953 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbcBLNva (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:51:30 -0500
In-Reply-To: <daniel.vetter@ffwll.ch,>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

mode_fixup function for encoder drivers became optional with patch
http://patchwork.freedesktop.org/patch/msgid/1455106522-32307-1-git-send-email-palminha@synopsys.com

This patch set nukes all the dummy mode_fixup implementations.

(made on top of Daniel topic/drm-misc branch)

Carlos Palminha (17):
  drm/virtio: removed optional dummy encoder mode_fixup function.
  drm/udl: removed optional dummy encoder mode_fixup function.
  drm/exynos: removed optional dummy encoder mode_fixup function.
  drm/amdgpu: removed optional dummy encoder mode_fixup function.
  drm/ast: removed optional dummy encoder mode_fixup function.
  drm/bochs: removed optional dummy encoder mode_fixup function.
  drm/cirrus: removed optional dummy encoder mode_fixup function.
  drm/exynos: removed optional dummy encoder mode_fixup function.
  drm/gma500: removed optional dummy encoder mode_fixup function.
  drm/imx: removed optional dummy encoder mode_fixup function.
  drm/msm/mdp: removed optional dummy encoder mode_fixup function.
  drm/mgag200: removed optional dummy encoder mode_fixup function.
  drm/qxl: removed optional dummy encoder mode_fixup function.
  drm/radeon: removed optional dummy encoder mode_fixup function.
  drm/rockchip: removed optional dummy encoder mode_fixup function.
  drm/sti: removed optional dummy encoder mode_fixup function.
  drm/tilcdc: removed optional dummy encoder mode_fixup function.

 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c           |  8 --------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c           |  8 --------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c            |  8 --------
 drivers/gpu/drm/ast/ast_mode.c                   |  8 --------
 drivers/gpu/drm/bochs/bochs_kms.c                |  8 --------
 drivers/gpu/drm/cirrus/cirrus_mode.c             |  9 ---------
 drivers/gpu/drm/exynos/exynos_dp_core.c          |  8 --------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c          |  8 --------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          |  8 --------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c         |  8 --------
 drivers/gpu/drm/gma500/cdv_intel_crt.c           |  1 -
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c          |  1 -
 drivers/gpu/drm/gma500/gma_display.c             |  7 -------
 drivers/gpu/drm/gma500/gma_display.h             |  3 ---
 drivers/gpu/drm/gma500/oaktrail_hdmi.c           |  1 -
 drivers/gpu/drm/imx/dw_hdmi-imx.c                |  8 --------
 drivers/gpu/drm/imx/imx-ldb.c                    |  8 --------
 drivers/gpu/drm/imx/imx-tve.c                    |  8 --------
 drivers/gpu/drm/imx/parallel-display.c           |  8 --------
 drivers/gpu/drm/mgag200/mgag200_mode.c           |  8 --------
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_dsi_encoder.c  |  8 --------
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_dtv_encoder.c  |  8 --------
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_lcdc_encoder.c |  8 --------
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_cmd_encoder.c  |  9 ---------
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_encoder.c      |  8 --------
 drivers/gpu/drm/qxl/qxl_display.c                |  9 ---------
 drivers/gpu/drm/radeon/atombios_encoders.c       |  8 --------
 drivers/gpu/drm/rockchip/dw-mipi-dsi.c           |  8 --------
 drivers/gpu/drm/sti/sti_tvout.c                  | 10 ----------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c            |  9 ---------
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c           |  9 ---------
 drivers/gpu/drm/udl/udl_encoder.c                |  8 --------
 drivers/gpu/drm/virtio/virtgpu_display.c         |  8 --------
 33 files changed, 244 deletions(-)

-- 
2.5.0
