From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/4] [media] Media entity cleanups and build fixes
Date: Wed, 19 Aug 2015 17:35:18 +0200
Message-ID: <1439998526-12832-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-kernel@vger.kernel.org
Cc: devel@driverdev.osuosl.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>, linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, "Prabhakar\"" <prabhakar.csengg@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This series contains a couple of build fixes and cleanups for the
Media Controller framework. The goal of the series is to get rid of
the struct media_entity .parent member since now that a media_gobj is
embedded into entities, the media_gobj .mdev member can be used to
store a pointer to the parent struct media_device.

So the .parent field becomes redundant and can be removed after all
the users are converted to use entity .graph_obj.mdev instead.

Patches 1/4 and 2/4 are build fixes I found while build testing if no
regressions were introduced by the conversion. Patch 3/4 converts
all the drivers and the MC core to use .mdev instead of .parent and
finally patch 4/4 removes the .parent field since now is unused.

The series depend on Mauro's "[PATCH v6 0/8] MC preparation patches
series" [0].

The transformation were automated using a coccinelle semantic patch
and the drivers were build tested using allyesconfig and x-building
the ARM Exynos and OMAP defconfigs + the needed media config options.

Best regards,
Javier

[0]: http://www.mail-archive.com/linux-media@vger.kernel.org/msg91330.html


Javier Martinez Canillas (4):
  [media] staging: omap4iss: get entity ID using media_entity_id()
  [media] omap3isp: get entity ID using media_entity_id()
  [media] media: use entity.graph_obj.mdev instead of .parent
  [media] media: remove media entity .parent field

 drivers/media/media-device.c                       |  8 ++---
 drivers/media/media-entity.c                       | 34 ++++++++++++----------
 drivers/media/platform/exynos4-is/fimc-isp-video.c |  6 ++--
 drivers/media/platform/exynos4-is/fimc-lite.c      |  8 ++---
 drivers/media/platform/exynos4-is/media-dev.c      |  2 +-
 drivers/media/platform/exynos4-is/media-dev.h      |  8 ++---
 drivers/media/platform/omap3isp/isp.c              | 11 ++++---
 drivers/media/platform/omap3isp/ispccdc.c          |  2 +-
 drivers/media/platform/omap3isp/ispvideo.c         | 10 ++++---
 drivers/media/platform/vsp1/vsp1_video.c           |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |  2 +-
 drivers/staging/media/davinci_vpfe/vpfe_video.c    |  6 ++--
 drivers/staging/media/omap4iss/iss.c               |  6 ++--
 drivers/staging/media/omap4iss/iss_video.c         |  4 +--
 include/media/media-entity.h                       |  1 -
 15 files changed, 58 insertions(+), 52 deletions(-)

-- 
2.4.3
