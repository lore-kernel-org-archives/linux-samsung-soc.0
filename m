From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] Use Exynos macros for pinctrl settings
Date: Thu, 29 Dec 2016 17:42:07 +0900
Message-ID: <20161229084211.20442-1-andi.shyti@samsung.com>
References: <CGME20161229084221epcas1p4d76b4b30f59734f7eee29aec53b54af3@epcas1p4.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset is just a refactoring of the exynos5433 and TM2
pinctrl definitions. Standing to the samsung-pinctrl.txt binding
the Exynos related DTS should use the macros introduced by
commit:

5db7e3bb87df ("pinctrl: dt-bindings: samsung: Add header with
       values used for configuration")

Would be nice to see in the future all the PIN related macros in
the same file, as they more or less do the same thing.

Thanks,
Andi


Andi Shyti (4):
  pinctrl: dt-bindings: samsung: add drive strength macros for
    Exynos5433
  ARM64: dts: exynos5433: use macros for pinctrl configuration on
    Exynos5433
  ARM64: dts: TM2: comply to the samsung pinctrl naming convention
  ARM64: dts: exynos5433: remove unused code

 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 373 ++++++++++-----------
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 254 +++++++-------
 include/dt-bindings/pinctrl/samsung.h              |   6 +
 3 files changed, 314 insertions(+), 319 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
