From: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Subject: [PATCH v3 0/4] Add Exynos4412-based midas boards support
Date: Mon, 18 Dec 2017 23:38:01 +1100
Message-ID: <20171218123805.26345-1-simon@lineageos.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patch series adds support for a new set of boards, codenamed
"midas". These are the Galaxy S3 (m0/m3, GT-I9300/GT-I9305)
and the Galaxy Note 2 (t0, GT-N7100/GT-N7105).

These boards are closely related to trats2 - m0 is a trats2 but with a
bootloader geared towards booting Android rather than a traditional Linux
distribution - and because of this, the dts files are largely based off
what is already in-place for trats2. Trats2 is modified to use
the dts files added by this series.

Patch #1 adds documentation for the bindings used by the boards.
Patch #2 splits the existing trats2 DTS into the common midas,
m0/m3/trats2-specific, and trats2-specific parts.
Patch #3 adds the device-tree files for the other boards.
Patch #4 enables cpuidle support for all added boards.

Changes since v1:
* Include trats2 in inheritance
* Add the new dtbs to the makefile
* Cleanup style per Krzysztof's comments

Changes since v2:
* Rebase on linux-next 20171218 (adds some fixes yet to land in mainline)
* Leave any changes to the DTS out of patch #2
* Minimise diff of exynos4412-midas.dtsi, using format-patch -B30%
  (thanks for the suggestion, Krzysztof)
* Leave original trats2 copyrights on midas and galaxy-s3 DTS files
* Preserve ABI for the cpuidle compatability check
* Explain the m0/m3/t0 -> GT-I9300/GT-I9305/GT-N7100/GT-N7105 relationship
 in the DT binding docs.

Cheers,
Simon

Simon Shields (4):
  dt-bindings: samsung: document bindings for Midas family boards
  ARM: dts: split trats2 DTS in preparation for midas boards
  ARM: dts: add Samsung's exynos4412-based midas boards
  ARM: exynos: extend cpuidle support to midas boards

 .../bindings/arm/samsung/samsung-boards.txt        |    4 +
 arch/arm/boot/dts/Makefile                         |    3 +
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  145 ++
 arch/arm/boot/dts/exynos4412-m0.dts                |   27 +
 arch/arm/boot/dts/exynos4412-m3.dts                |   14 +
 ...exynos4412-trats2.dts => exynos4412-midas.dtsi} |  117 +-
 arch/arm/boot/dts/exynos4412-t0.dts                |   40 +
 arch/arm/boot/dts/exynos4412-trats2.dts            | 1446 +-------------------
 arch/arm/mach-exynos/exynos.c                      |    3 +-
 9 files changed, 274 insertions(+), 1525 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-m0.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-m3.dts
 copy arch/arm/boot/dts/{exynos4412-trats2.dts => exynos4412-midas.dtsi} (92%)
 create mode 100644 arch/arm/boot/dts/exynos4412-t0.dts
 rewrite arch/arm/boot/dts/exynos4412-trats2.dts (97%)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
