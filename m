From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/3] Add soc nodes to exynos4 series DTS
Date: Tue, 06 Feb 2018 12:29:39 +0100
Message-ID: <1517916582-13814-1-git-send-email-m.purski@samsung.com>
References: <CGME20180206113006eucas1p148766268255c129223e32f221afc1b94@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

this patchset adds soc node to exynos4, exynos4210 and exynos4412
DTS. The main goal for these changes is unification of all exynos
DTS. Soc nodes are already present in for example exynos5 series.

Best regards,

Maciej Purski

---
Changes in v2:
- rebased onto "ARM: dts: exynos: Use pmu label in exynos4412"
  in order to fix pmu warning
- move "cpu0_opp_table" outside the "soc" node

Maciej Purski (3):
  ARM: dts: exynos: Add soc node to exynos4
  ARM: dts: exynos: Add soc node to exynos4210
  ARM: dts: exynos: Add soc node to exynos4412

 arch/arm/boot/dts/exynos4.dtsi    | 1727 +++++++++++++++++++------------------
 arch/arm/boot/dts/exynos4210.dtsi |  513 +++++------
 arch/arm/boot/dts/exynos4412.dtsi |  772 +++++++++--------
 3 files changed, 1519 insertions(+), 1493 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
