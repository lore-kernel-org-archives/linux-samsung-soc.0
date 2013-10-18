From: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v10 00/12] Exynos5 IS driver
Date: Fri, 18 Oct 2013 11:07:27 +0530
Message-ID: <1382074659-31130-1-git-send-email-arun.kk@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kilyeon.im-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch series adds support for exynos5 fimc-is driver and a
new sensor s5k4e5. The media driver part is omitted form this series
as it is already applied.

Changes from v9
---------------

- Addressed review comments from Hans and Sylwester
http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg67102.html
http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg67624.html
http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg67623.html
- Skipped already applied media driver

Changes from v8
---------------
- Moved i2c-isp device nodes into the fimc-is node as suggested
  by Sylwester
- Addressed comments given by Sylwester and Philipp Zabel

Changes from v7
---------------
- Addressed few DT related review comments from Sylwester
  http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg66403.html
- Few fixes added after some regression testing

Changes from v6
---------------
- Addressed DT binding doc review comments from Sylwester
  http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg65771.html
  http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg65772.html

Changes from v5
---------------
- Addressed review comments from Sylwester
  http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg65578.html
  http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg65605.html

Changes from v4
---------------
- Addressed all review comments from Sylwester
- Added separate PMU node as suggested by Stephen Warren
- Added phandle based discovery of subdevs instead of node name

Changes from v3
---------------
- Dropped the RFC tag
- Addressed all review comments from Sylwester and Sachin
- Removed clock provider for media dev
- Added s5k4e5 sensor devicetree binding doc

Changes from v2
---------------
- Added exynos5 media device driver from Shaik to this series
- Added ISP pipeline support in media device driver
- Based on Sylwester's latest exynos4-is development
- Asynchronos registration of sensor subdevs
- Made independent IS-sensor support
- Add s5k4e5 sensor driver
- Addressed review comments from Sylwester, Hans, Andrzej, Sachin

Changes from v1
---------------
- Addressed all review comments from Sylwester
- Made sensor subdevs as independent i2c devices
- Lots of cleanup
- Debugfs support added
- Removed PMU global register access


Arun Kumar K (12):
  exynos5-fimc-is: Add Exynos5 FIMC-IS device tree bindings
    documentation
  exynos5-fimc-is: Add driver core files
  exynos5-fimc-is: Add common driver header files
  exynos5-fimc-is: Add register definition and context header
  exynos5-fimc-is: Add isp subdev
  exynos5-fimc-is: Add scaler subdev
  exynos5-fimc-is: Add sensor interface
  exynos5-fimc-is: Add the hardware pipeline control
  exynos5-fimc-is: Add the hardware interface module
  exynos5-is: Add Kconfig and Makefile
  V4L: Add DT binding doc for s5k4e5 image sensor
  V4L: Add s5k4e5 sensor driver

 .../devicetree/bindings/media/exynos5-fimc-is.txt  |   84 +
 .../devicetree/bindings/media/samsung-s5k4e5.txt   |   45 +
 drivers/media/i2c/Kconfig                          |    8 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5k4e5.c                         |  344 ++++
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/exynos5-is/Kconfig          |   20 +
 drivers/media/platform/exynos5-is/Makefile         |    7 +
 drivers/media/platform/exynos5-is/fimc-is-cmd.h    |  187 +++
 drivers/media/platform/exynos5-is/fimc-is-core.c   |  410 +++++
 drivers/media/platform/exynos5-is/fimc-is-core.h   |  132 ++
 drivers/media/platform/exynos5-is/fimc-is-err.h    |  257 +++
 .../media/platform/exynos5-is/fimc-is-interface.c  |  810 ++++++++++
 .../media/platform/exynos5-is/fimc-is-interface.h  |  124 ++
 drivers/media/platform/exynos5-is/fimc-is-isp.c    |  534 ++++++
 drivers/media/platform/exynos5-is/fimc-is-isp.h    |   90 ++
 .../media/platform/exynos5-is/fimc-is-metadata.h   |  767 +++++++++
 drivers/media/platform/exynos5-is/fimc-is-param.h  | 1159 +++++++++++++
 .../media/platform/exynos5-is/fimc-is-pipeline.c   | 1699 ++++++++++++++++++++
 .../media/platform/exynos5-is/fimc-is-pipeline.h   |  129 ++
 drivers/media/platform/exynos5-is/fimc-is-regs.h   |  105 ++
 drivers/media/platform/exynos5-is/fimc-is-scaler.c |  476 ++++++
 drivers/media/platform/exynos5-is/fimc-is-scaler.h |  106 ++
 drivers/media/platform/exynos5-is/fimc-is-sensor.c |   45 +
 drivers/media/platform/exynos5-is/fimc-is-sensor.h |   65 +
 drivers/media/platform/exynos5-is/fimc-is.h        |  160 ++
 27 files changed, 7766 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-fimc-is.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung-s5k4e5.txt
 create mode 100644 drivers/media/i2c/s5k4e5.c
 create mode 100644 drivers/media/platform/exynos5-is/Kconfig
 create mode 100644 drivers/media/platform/exynos5-is/Makefile
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-cmd.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-core.c
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-core.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-err.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-interface.c
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-interface.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-isp.c
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-isp.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-metadata.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-param.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-pipeline.c
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-pipeline.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-regs.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-scaler.c
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-scaler.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-sensor.c
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is-sensor.h
 create mode 100644 drivers/media/platform/exynos5-is/fimc-is.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
