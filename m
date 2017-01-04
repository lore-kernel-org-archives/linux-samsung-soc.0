From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/3] Add support for the S6E3HA2 panel on TM2 board
Date: Wed, 04 Jan 2017 15:58:32 +0900
Message-ID: <1483513115-3068-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170104065858epcas5p2f6a70e125b1b6d7051d8fe3a28e626f5@epcas5p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Purpose of this patch is add support for S6E3HA2 AMOLED panel on
the TM2 board. The first patch adds support for S6E3HA2 panel
device tree document and driver, the second patch add support for
S6E3HA2 panel device tree.

Changes for V4:

- Removed display-timings in devicetree, the display-timings has
  been fixed to be provided by the device driver.
- Added the mode_set callback function into exynos_drm_mic,
  because the exynos_drm_mic driver can not parse a videomode
  struct by removing the display-timings from the devicetree.

Hoegeun Kwon (2):
  drm/exynos: mic: Add mode_set callback function
  drm/panel: Add support for S6E3HA2 panel driver on TM2 board

Hyungwon Hwang (1):
  arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board

 .../bindings/display/panel/samsung,s6e3ha2.txt     |  40 ++
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  17 +
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |  33 +-
 drivers/gpu/drm/panel/Kconfig                      |   6 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 741 +++++++++++++++++++++
 6 files changed, 827 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
