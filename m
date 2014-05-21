From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] Add more supported blocks to UniversalC210 and Trats
Date: Wed, 21 May 2014 22:43:28 +0900
Message-ID: <036d01cf74fa$a5ae18d0$f10a4a70$@samsung.com>
References: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
 <537BDBF5.3040304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48563 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411AbaEUNna (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 09:43:30 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5X00GKHFGGWD90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 22:43:28 +0900 (KST)
In-reply-to: <537BDBF5.3040304@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 
> On 20.05.2014 14:46, Marek Szyprowski wrote:
> > Hello,
> >
> > This is a small update for Exynos4210 based UniversalC210 and Trats
> > boards. Full USB support requires merging '[PATCHv5 0/4] Enable usbphy
> > and hsotg for exynos4' series recently posted by Chanho Park.
> >
> > Best regards
> > Marek Szyprowski
> > Samsung R&D Institute Poland
> >
> > Marek Szyprowski (3):
> >   ARM: dts: exynos4210-universal_c210: enable USB functionality
> >   ARM: dts: exynos4210-universal_c210: add multimedia nodes
> >   ARM: dts: exynos4210-universal_c210: add external sd card node
> >
> > Tomasz Figa (1):
> >   ARM: dts: exynos4210-trats: Enable USB gadget functionality
> >
> >  arch/arm/boot/dts/exynos4210-trats.dts          | 10 +++++
> >  arch/arm/boot/dts/exynos4210-universal_c210.dts | 53
> +++++++++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> >
> 
> For the whole series, after addressing comments for patch 2/4:
> 
Hi Marek,

Can you please re-spin soon?

> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Then, I will take this whole series.

Thanks,
Kukjin
