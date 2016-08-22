From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH 0/2 v2] Add a new board TOPEET iTOP for exynos 4412
Date: Mon, 22 Aug 2016 22:18:07 +0800
Message-ID: <1471875489-11428-1-git-send-email-ayaka@soulik.info>
References: <4767fc2a-95b7-ee0d-f51a-7a5d6ca89d8f@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4767fc2a-95b7-ee0d-f51a-7a5d6ca89d8f-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Changelog:
 - v2:
   - remove rtc node
     the clock source driver is not done yet.
   - add exynos-bus
   - fix the MFC

Randy Li (2):
  ARM: dts: Add TOPEET itop core board SCP package version
  ARM: dts: add TOPEET itop elite based board

 .../bindings/arm/samsung/samsung-boards.txt        |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos4412-itop-elite.dts        | 147 +++++++
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    | 472 +++++++++++++++++++++
 4 files changed, 623 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4412-itop-elite.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
