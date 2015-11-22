From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 0/5] drm/exynos: rework layer blending setup
Date: Sun, 22 Nov 2015 17:09:39 +0100
Message-ID: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45583 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752229AbbKVQKE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 11:10:04 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this is a rework of the layer blending setup in the Exynos DRM mixer. There are currently two problems with the setup:

(1) It's static and doesn't take the alpha state of the layers into consideration.
(2) It's spread out through the mixer code.

This rework pushes all the configuration details into a layer_cfg array, which specifies the priority of each layer, and adds dynamic configuration based on layer enable and alpha state.

Two default configs are currently specified, one for mixer versions with a video processor (VP) and one for mixers without VP. The VP gives us one additional layer, the video layer, which natively supports the NV12/NV21 pixelformat.

The blending setup roughly works like this:
1) Find the bottom-most enabled layer. Disable all blending for this layer. This is done because we currently don't expose modification of the mixer background to userspace. Once this is done we can add more flexibility here.
2) Find the next enabled layer in our layer stack. If the layer has a framebuffer with an alpha-pixelformat attached, enable blending for this layer. If not, disable blending.
3) Iterate (2) until all enabled layers are processed.

The series has been tested on a Hardkernel Odroid-X2 (Exynos4412, which has a VP).

You can check the series with libdrm's modetest by setting up two planes, one with a NV12/NV21 format and another one with a ARGB8888 format (or another format with an alpha channel).

With best wishes,
Tobias

v2: General code clean-up, indentation fixes and other small misc changes.
    Layer state caching was added, to reduce the amount of register programming.

Tobias Jakobi (5):
  drm/exynos: mixer: refactor layer setup
  drm/exynos: mixer: introduce mixer_layer_blending()
  drm/exynos: mixer: remove all static blending setup
  drm/exynos: mixer: do blending setup in mixer_cfg_layer()
  drm/exynos: mixer: also allow ARGB1555 and ARGB4444

 drivers/gpu/drm/exynos/exynos_mixer.c | 236 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/exynos/regs-mixer.h   |   1 +
 2 files changed, 203 insertions(+), 34 deletions(-)

-- 
2.4.9
