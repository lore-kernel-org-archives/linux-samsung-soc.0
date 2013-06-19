From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 00/10] Samsung 2nd pull-request for v3.11
Date: Wed, 19 Jun 2013 20:36:05 +0900
Message-ID: <1f6601ce6ce1$2f473400$8dd59c00$%kim@samsung.com>
References: <51C0BC2D.80705@samsung.com>
 <CAK9yfHx--0dKDzdpBz3o_V_j+D+4f_N576rwuuVcJbMROtx=mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53790 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934052Ab3FSLgH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 07:36:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MON00FFQ1K5JN90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 20:36:06 +0900 (KST)
In-reply-to: <CAK9yfHx--0dKDzdpBz3o_V_j+D+4f_N576rwuuVcJbMROtx=mQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> Hi Kukjin,
> 
> On 19 June 2013 01:29, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Hi Arnd, Olof
> >
> > This is 2nd pull-request for Samsung stuff for v3.11.
> >
> > This is including following branches.
> > v3.11-next/cleanup-samsung
> > v3.11-next/exynos-arch-2
> > v3.11-next/exynos-dt-2
> > v3.11-next/s3c24xx-dt-2
> > v3.11-next/dt-n-clk-audio
> > v3.11-next/remove-nondt-exynos-3
> > v3.11-next/s3c24xx-pinctrl-2
> > v3.11-next/soc-exynos5420
> > v3.11-next/samsung-defconfig
> > v3.11-next/non-critical-fixes
> >
> > Just note, for remove-nondt-exynos-3 branch, small merge conflict will
> be
> > happened. I added my resolution in the pull-request.
> >
> > If any problems, please kindly let me know.
> >
> > Thanks,
> > - Kukjin
> 
> [snip]
> >
> > Sachin Kamat (3):
> >       ARM: dts: Add PWM related pinctrl entries for exynos4210
> >       ARM: dts: Add LCD related pinctrl entries for exynos4210
> >       ARM: dts: Add FIMD node to Origen4210 board
> 
> I dont see my following patch in this pull request which you said you
> had applied.
> https://patchwork.kernel.org/patch/2469891/
> 
This will be handled with other clock stuff.

Thanks,
- Kukjin
