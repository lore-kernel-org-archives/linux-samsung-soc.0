From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/5] drm/exynos: rework layer blending setup
Date: Wed,  6 May 2015 15:36:45 +0200
Message-ID: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34777 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751295AbbEFNhD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 09:37:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this is a rework of the layer blending setup in the Exynos DRM mixer. The current setup is static and spread out through the mixer code. This rework pushes all the configuration details into a layer_config array, which specifies the priority of each layer.

Two arrays are currently found in the code, one for SoC versions with a video processor (VP) and one for SoC versions without VP. The VP gives us one additional layer, the video layer, which natively supports the NV12/NV21 pixelformat.

The blending setup roughly works like this:
1) Find the bottom-most enabled layer. Disable all blending for this layer. This is done because we currently don't expose modification of the mixer background to userspace. Once this is done we can add more flexibility here.
2) Find the next enabled layer in our layer stack. If the layer has a framebuffer with an alpha-pixelformat attached, enable blending for this layer. If not, disable blending.
3) Iterate (2) until all enabled layers are processed.

The series has been tested on a Hardkernel Odroid-X2 (Exynos4412, which has a VP).

If you want to use libdrm's modetest to check the series, please apply patches [1] and [2]. This should make it possible to also test a plane with NV12 format (which is located 'behind' the primary plane).

With best wishes,
Tobias

[1] https://patchwork.kernel.org/patch/6349241/
[2] https://patchwork.kernel.org/patch/6349261/


Tobias Jakobi (5):
  drm/exynos: mixer: refactor layer setup
  drm/exynos: mixer: introduce mixer_layer_blending()
  drm/exynos: mixer: remove all static blending setup
  drm/exynos: mixer: do blending setup in mixer_cfg_layer()
  drm/exynos: mixer: also allow ARGB1555 and ARGB4444

 drivers/gpu/drm/exynos/exynos_mixer.c | 246 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/exynos/regs-mixer.h   |   1 +
 2 files changed, 213 insertions(+), 34 deletions(-)

-- 
2.0.5
