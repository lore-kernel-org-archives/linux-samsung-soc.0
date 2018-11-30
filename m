From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 0/2] drm: Create and use helper function
Date: Fri, 30 Nov 2018 13:02:10 +0100
Message-ID: <1543579332-16609-1-git-send-email-c.manszewski@samsung.com>
References: <CGME20181130120225eucas1p2563258e9ede809b9d82af135e1442d80@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This patch series implements a generic helper function, to determine
the default color space format. I've tried to do it in analogy to 
an already existing function, but I'am not sure if it is done the right way.

Patch 1 implements the mentioned function
Patch 2 makes use of it in exynos_mixer.c

Regards,
Chris

Christoph Manszewski (2):
  drm/edid: Add colorimetry helper function
  drm/exynos: mixer: Use colorimetry helper function

 drivers/gpu/drm/drm_edid.c            | 12 ++++++++++++
 drivers/gpu/drm/exynos/exynos_mixer.c |  3 ++-
 include/drm/drm_edid.h                |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.7.4
