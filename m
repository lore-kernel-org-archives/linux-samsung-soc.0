From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: use uart2 for console on smdkv310 and smdk5250
Date: Thu, 20 Sep 2012 08:18:19 +0900
Message-ID: <099701cd96bd$0e7a3dd0$2b6eb970$@org>
References: <052601cd94ca$058db4d0$10a91e70$%kim@samsung.com>
 <CAJuYYwQ0A9c_R=HzjeBCxL7E5bpw3j+64ApsCH5Uc8Q6i+HY4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23252 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752676Ab2ISXSW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:18:22 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM005AJE2K2PC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:18:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM00J65E2JNYC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:18:20 +0900 (KST)
In-reply-to: <CAJuYYwQ0A9c_R=HzjeBCxL7E5bpw3j+64ApsCH5Uc8Q6i+HY4Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> On 17 September 2012 17:16, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 +-
> >  arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> > index 1beccc8..cb01e3d 100644
> > --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> > +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> > @@ -26,7 +26,7 @@
> >         };
> >
> >         chosen {
> > -               bootargs = "root=/dev/ram0 rw ramdisk=8192
> initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
> > +               bootargs = "root=/dev/ram0 rw ramdisk=8192
> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
> >         };
> 
> Dear Mr. Kim,
> 
> What is the reason for changing the console port to 2 for smdkv310 board?
> 
Since uart1 can be used for other purpose, we changed the default console
port to use uart2 a few month ago for all of SMDKs. And if required, I will
change it for current defconfigs.

Thanks.

K-Gene <kgene@kernel.org>
