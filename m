From: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RESEND 0/2] ARM: dts: exynos3250: revise property for gpio-keys
 node
Date: Tue, 06 Jan 2015 12:43:27 +0900
Message-ID: <1420515809-5151-1-git-send-email-beomho.seo@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch revises property of gpio-keys node.
The first patch remove unecessary property.
And then, replace by macro in gpio keys.

Beomho Seo (2):
  ARM: dts: exynos3250: remove unecessary property of gpio-keys node
  ARM: dts: exynos3250: replace number by macro in gpio keys

 arch/arm/boot/dts/exynos3250-monk.dts   |    5 ++---
 arch/arm/boot/dts/exynos3250-rinato.dts |    5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
