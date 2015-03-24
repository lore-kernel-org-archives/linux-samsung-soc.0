From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: exynos_defconfig: Enable HDMI support
Date: Tue, 24 Mar 2015 21:52:10 +0900
Message-ID: <02b201d06631$58129d70$0837d850$@kernel.org>
References: <1423244567-24463-1-git-send-email-javier.martinez@collabora.co.uk>
 <CABxcv=mMD=X=EKOC2sGXcDwMeOmoO6cmVAu=roV_AVqUwG+pXg@mail.gmail.com>
 <CABxcv==Ko2PUfwuo8D2JDL4iR4+VGvewQpR_RDh9pB4Qbg5c=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49459 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917AbbCXMwN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Mar 2015 08:52:13 -0400
In-reply-to: <CABxcv==Ko2PUfwuo8D2JDL4iR4+VGvewQpR_RDh9pB4Qbg5c=g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Andrzej Hajda' <a.hajda@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Linux Kernel' <linux-kernel@vger.kernel.org>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>

Javier Martinez Canilla wrote:
> 
> Hello Kukjin,
> 
Hi,

> On Tue, Mar 17, 2015 at 7:54 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> > On Fri, Feb 6, 2015 at 6:42 PM, Javier Martinez Canillas
> > <javier.martinez@collabora.co.uk> wrote:
> >> Many Exynos boards have an HDMI port so enable Exynos DRM HDMI support.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> >> ---
> >>
> >> Exynos DRM HDMI has some issues that were fixed by Andrzej's [0] series.
> >> So now is safe to HDMI support for Exynos boards.
> >>
> >> [0]: https://lkml.org/lkml/2015/2/5/265
> >>
> >>  arch/arm/configs/exynos_defconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> >> index 70e5d0bdb4e4..e44da52e5223 100644
> >> --- a/arch/arm/configs/exynos_defconfig
> >> +++ b/arch/arm/configs/exynos_defconfig
> >> @@ -120,6 +120,7 @@ CONFIG_REGULATOR_S2MPS11=y
> >>  CONFIG_REGULATOR_S5M8767=y
> >>  CONFIG_REGULATOR_TPS65090=y
> >>  CONFIG_DRM=y
> >> +CONFIG_DRM_EXYNOS_HDMI=y
> >>  CONFIG_DRM_BRIDGE=y
> >>  CONFIG_DRM_PTN3460=y
> >>  CONFIG_DRM_PS8622=y
> >> --
> >
> > It seems you missed this patch when picking the exynos_defconfig patches.
> >
> 
> Another gentle reminder about this patch.
> 
Thanks, will apply tonight ;-)

- Kukjin
