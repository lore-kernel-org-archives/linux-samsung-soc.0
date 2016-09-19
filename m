From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [RFC PATCH v3 0/2] adding panel claa070wp03xg support for exynos
Date: Tue, 20 Sep 2016 03:02:49 +0800
Message-ID: <1474311771-23321-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The timings issue is still here, this version is just some modifications
in dts file.

Randy Li (2):
  ARM: dts: samsung: add rga-lvds panel in itop elite
  drm/panel: Add support for Chunghwa CLAA070WP03XG panel

 .../display/panel/chunghwa,claa070wp03xg.txt       |  7 +++
 arch/arm/boot/dts/exynos4412-itop-elite.dts        | 54 +++++++++++++++++++++-
 drivers/gpu/drm/panel/panel-simple.c               | 27 +++++++++++
 3 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
