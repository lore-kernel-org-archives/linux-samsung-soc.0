From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v2 0/2] Associate ddc adapters with connectors
Date: Tue, 25 Jun 2019 12:24:39 +0200
Message-ID: <cover.1561458051.git.andrzej.p@collabora.com>
References: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com, m.szyprowski@samsung.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

It is difficult for a user to know which of the i2c adapters is for which
drm connector. This series addresses this problem.

The idea is to have a symbolic link in connector's sysfs directory, e.g.:

ls -l /sys/class/drm/card0-HDMI-A-1/ddc
lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/ddc \
	-> ../../../../soc/13880000.i2c/i2c-2

The user then knows that their card0-HDMI-A-1 uses i2c-2 and can e.g. run
ddcutil:

ddcutil -b 2 getvcp 0x10
VCP code 0x10 (Brightness                    ): current value =    90, max value =   100

The first patch in the series adds struct i2c_adapter pointer to struct
drm_connector. If the field is used by a particular driver, then an
appropriate symbolic link is created by the generic code, which is also added
by this patch.

The second patch is an example of how to convert a driver to this new scheme.

v1..v2:

- used fixed name "ddc" for the symbolic link in order to make it easy for
userspace to find the i2c adapter

Andrzej Pietrasiewicz (2):
  drm: Include ddc adapter pointer in struct drm_connector
  drm/exynos: Provide ddc symlink in connector's sysfs

 drivers/gpu/drm/drm_sysfs.c          |  7 +++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c | 11 +++++------
 include/drm/drm_connector.h          | 11 +++++++++++
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.17.1
