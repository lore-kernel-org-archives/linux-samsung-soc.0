From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 0/8] Some V4L2 documentation pending patches
Date: Mon, 18 Dec 2017 17:53:54 -0200
Message-ID: <cover.1513625884.git.mchehab@s-opensource.com>
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
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Songjun Wu <songjun.wu@microchip.com>, Hans Verkuil <hverkuil@xs4all.nl>, Pravin Shedge <pravin.shedge4linux@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Markus Elfring <elfring@users.sourceforge.net>, Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Kukjin Kim <kgene@kernel.org>, Mats Randgaard <matr>
List-Id: linux-samsung-soc@vger.kernel.org

This series contain the patches of a /17 and a /24 series
of documentation that required non-trivial changes.

Mauro Carvalho Chehab (8):
  media: v4l2-device.h: document helper macros
  media: v4l2-ioctl.h: convert debug into an enum of bits
  media: v4l2-async: simplify v4l2_async_subdev structure
  media: v4l2-async: better describe match union at async match struct
  media: v4l2-mediabus: convert flags to enums and document them
  media: v4l2-subdev: get rid of __V4L2_SUBDEV_MK_GET_TRY() macro
  media: v4l2-subdev: document remaining undocumented functions
  media: v4l2-subdev: use kernel-doc markups to document subdev flags

 drivers/media/i2c/adv7180.c                        |  10 +-
 drivers/media/i2c/ml86v7667.c                      |   5 +-
 drivers/media/i2c/mt9m111.c                        |   8 +-
 drivers/media/i2c/ov6650.c                         |  19 +-
 drivers/media/i2c/soc_camera/imx074.c              |   6 +-
 drivers/media/i2c/soc_camera/mt9m001.c             |  10 +-
 drivers/media/i2c/soc_camera/mt9t031.c             |  11 +-
 drivers/media/i2c/soc_camera/mt9t112.c             |  11 +-
 drivers/media/i2c/soc_camera/mt9v022.c             |  16 +-
 drivers/media/i2c/soc_camera/ov5642.c              |   5 +-
 drivers/media/i2c/soc_camera/ov772x.c              |  10 +-
 drivers/media/i2c/soc_camera/ov9640.c              |  10 +-
 drivers/media/i2c/soc_camera/ov9740.c              |  10 +-
 drivers/media/i2c/soc_camera/rj54n1cb0c.c          |  12 +-
 drivers/media/i2c/soc_camera/tw9910.c              |  13 +-
 drivers/media/i2c/tc358743.c                       |  10 +-
 drivers/media/i2c/tvp5150.c                        |   6 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   6 +-
 drivers/media/platform/atmel/atmel-isc.c           |   2 +-
 drivers/media/platform/atmel/atmel-isi.c           |   2 +-
 drivers/media/platform/davinci/vpif_capture.c      |   4 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   4 +-
 drivers/media/platform/pxa_camera.c                |  10 +-
 drivers/media/platform/qcom/camss-8x16/camss.c     |   2 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   6 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   4 +-
 drivers/media/platform/rcar_drif.c                 |   4 +-
 .../platform/soc_camera/sh_mobile_ceu_camera.c     |   2 +-
 drivers/media/platform/soc_camera/soc_camera.c     |   5 +-
 .../platform/soc_camera/soc_camera_platform.c      |   2 +-
 drivers/media/platform/soc_camera/soc_mediabus.c   |   2 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   2 +-
 drivers/media/platform/ti-vpe/cal.c                |   2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |   2 +-
 drivers/media/v4l2-core/v4l2-async.c               |  16 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |  18 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |  15 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   7 +-
 drivers/staging/media/imx/imx-media-dev.c          |   4 +-
 include/media/v4l2-async.h                         |  33 ++-
 include/media/v4l2-device.h                        | 246 ++++++++++++++++++---
 include/media/v4l2-fwnode.h                        |   4 +-
 include/media/v4l2-ioctl.h                         |  33 +--
 include/media/v4l2-mediabus.h                      | 145 ++++++++----
 include/media/v4l2-subdev.h                        | 143 +++++++++---
 45 files changed, 632 insertions(+), 265 deletions(-)

-- 
2.14.3
