From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: s5p: Remove skeleton.dtsi usage and fix memory node DTC warnings
Date: Thu,  8 Sep 2016 11:25:59 -0400
Message-ID: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This small patch series is similar to [0] that removed the skeleton.dtsi
usage for Exynos DTS. This series do the same for S5PV210 boards DTS.

[0]: http://www.spinics.net/lists/kernel/msg2333268.html

Best regards,
Javier


Javier Martinez Canillas (2):
  ARM: dts: s5p: Remove skeleton.dtsi inclusion for S5PV210
  ARM: dts: s5p: Add missing unit name to memory nodes for S5PV210
    boards

 arch/arm/boot/dts/s5pv210-aquila.dts   | 2 +-
 arch/arm/boot/dts/s5pv210-goni.dts     | 2 +-
 arch/arm/boot/dts/s5pv210-smdkc110.dts | 2 +-
 arch/arm/boot/dts/s5pv210-smdkv210.dts | 2 +-
 arch/arm/boot/dts/s5pv210-torbreck.dts | 2 +-
 arch/arm/boot/dts/s5pv210.dtsi         | 4 +++-
 6 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
