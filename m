From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable display on Trats2board
Date: Sat, 23 May 2015 22:27:31 +0200
Message-ID: <6222475.TyjQftkmuB@wuerfel>
References: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com> <555EF2B5.1000504@collabora.co.uk> <555FE392.5030409@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:50277 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932144AbbEWU1k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 May 2015 16:27:40 -0400
In-Reply-To: <555FE392.5030409@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Saturday 23 May 2015 11:18:58 Kukjin Kim wrote:
> On 05/22/15 18:11, Javier Martinez Canillas wrote:
> > Hello Krzysztof,
> > 
> > On 05/22/2015 02:48 AM, Krzysztof Kozlowski wrote:
> >> Enable the Exynos DSI and S6E8AA0 panel for full X11 display on Trats2.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> ---
> >>  arch/arm/configs/multi_v7_defconfig | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> >> index 0848337a2a01..e9785020aab1 100644
> >> --- a/arch/arm/configs/multi_v7_defconfig
> >> +++ b/arch/arm/configs/multi_v7_defconfig
> >> @@ -413,10 +413,12 @@ CONFIG_DRM=y
> >>  CONFIG_DRM_PTN3460=m
> >>  CONFIG_DRM_PS8622=m
> >>  CONFIG_DRM_EXYNOS=m
> >> +CONFIG_DRM_EXYNOS_DSI=y
> >>  CONFIG_DRM_EXYNOS_FIMD=y
> >>  CONFIG_DRM_EXYNOS_HDMI=y
> >>  CONFIG_DRM_RCAR_DU=m
> >>  CONFIG_DRM_TEGRA=y
> >> +CONFIG_DRM_PANEL_S6E8AA0=m
> >>  CONFIG_DRM_PANEL_SIMPLE=y
> >>  CONFIG_FB_ARMCLCD=y
> >>  CONFIG_FB_WM8505=y
> >>
> > 
> > Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> > 
> Looks good to me and this would be handled by arm-soc guys directly 
> 
> Acked-by: Kukjin Kim <kgene@kernel.org>
> 

I'd actually prefer if you could put this into the same branch as your
other defconfig changes. We'll handle any conflicts when merging that in.

	Arnd
