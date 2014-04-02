From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] Add PMU node for Exynos4210, Exynos4412, Exynos4212
Date: Wed, 02 Apr 2014 17:02:55 +0900
Message-ID: <1396425778-4379-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chow.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch updates Exynos4210, Exynos4412 and Exynos4212 dtsi files
for adding PMU (Power Management Unit) reg node. Also updated binding
document for the same. 
These patches required for using PMU base address via DT for these SoC.
Patches for using PMU base address via DT are posted here-

http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg27875.html

Pankaj Dubey (3):
  ARM: dts: Add PMU reg node to exynos4210
  ARM: dts: Add PMU reg node to exynos4212 and exynos4412
  Documentation: update samsung pmu binding information for
    Exynos4210/4212/4412

 Documentation/devicetree/bindings/arm/samsung/pmu.txt |    3 +++
 arch/arm/boot/dts/exynos4210.dtsi                     |    5 +++++
 arch/arm/boot/dts/exynos4212.dtsi                     |    5 +++++
 arch/arm/boot/dts/exynos4412.dtsi                     |    5 +++++
 4 files changed, 18 insertions(+)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
