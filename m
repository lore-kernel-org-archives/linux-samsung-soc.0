From: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/11] ARM: dts: Refactor Exynos4 boards for phandle notation
Date: Mon,  6 Apr 2015 22:28:11 +0200
Message-ID: <1428352102-12855-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


The phandle notation reduces possible mistakes when overriding nodes
by child board files and reduces duplication of addresses.

The patchset refactors Exynos4 boards to use the phandle way.

Tested by comparison of decompiled DTB for each commit.

The same refactoring for Exynos5 is on the way.


Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  ARM: dts: Add labels to nodes used in Exynos4 based DTS
  ARM: dts: Use phandle notation for overriding nodes in Exynos4210
  ARM: dts: Use phandle notation for overriding nodes in Exynos4210
    Origen
  ARM: dts: Use phandle notation for overriding nodes in SMDKv310
  ARM: dts: Use phandle notation for overriding nodes in Trats
  ARM: dts: Use phandle notation for overriding nodes in Exynos4212
  ARM: dts: Use phandle notation for overriding nodes in Exynos4x12
  ARM: dts: Use phandle notation for overriding nodes in Exynos4412
  ARM: dts: Use phandle notation for overriding nodes in Odroid
  ARM: dts: Use phandle notation for overriding nodes in SMDK4412
  ARM: dts: Use phandle notation for overriding nodes in Trats2

 arch/arm/boot/dts/exynos4.dtsi                  |   22 +-
 arch/arm/boot/dts/exynos4210-origen.dts         |  418 +++----
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi       |    6 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |  280 ++---
 arch/arm/boot/dts/exynos4210-trats.dts          |  592 +++++-----
 arch/arm/boot/dts/exynos4210.dtsi               |   49 +-
 arch/arm/boot/dts/exynos4212.dtsi               |   12 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  728 ++++++-------
 arch/arm/boot/dts/exynos4412-odroidx.dts        |   16 +-
 arch/arm/boot/dts/exynos4412-smdk4412.dts       |  210 ++--
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1331 ++++++++++++-----------
 arch/arm/boot/dts/exynos4412.dtsi               |   20 +-
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi       |    8 +-
 arch/arm/boot/dts/exynos4x12.dtsi               |  212 ++--
 14 files changed, 1952 insertions(+), 1952 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
