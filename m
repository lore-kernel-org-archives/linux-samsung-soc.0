From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH 0/3] making rtc cores from s3c6410 and exynos3250 both work
Date: Sat,  9 Jul 2016 17:23:43 +0800
Message-ID: <1468056226-19128-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The 8792f7772f4f40ffc68bad5f28311205584b734d would just make those
platform using rtc core from exynos3250 work but have a huge 
effect on those platforms using the rtc core from s3c6410.
These patches would fix this problem.

Randy Li (3):
  Revert "drivers/rtc/rtc-s3c.c: add .needs_src_clk to s3c6410 RTC data"
  rtc: s3c: add device data for samsung,exynos3250-rtc
  ARM: dts: exynos: correct the rtc compatible value for exynos5

 arch/arm/boot/dts/exynos3250.dtsi |  2 +-
 arch/arm/boot/dts/exynos5.dtsi    |  2 +-
 drivers/rtc/rtc-s3c.c             | 15 +++++++++++++--
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
