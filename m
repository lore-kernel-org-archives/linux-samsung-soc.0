From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: ADC: Move to
 clk_prepare_enable/clk_disable_unprepare
Date: Tue, 08 Jul 2014 23:17:51 +0900
Message-ID: <03ba01cf9ab7$671cff40$3556fdc0$@samsung.com>
References: <1404155288-2787-1-git-send-email-anarsoul@gmail.com>
 <53BBDACB.6090601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31103 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbaGHORy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:17:54 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8E00MHAD1SPC70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Jul 2014 23:17:52 +0900 (KST)
In-reply-to: <53BBDACB.6090601@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Vasily Khoruzhick' <anarsoul@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Tomasz Figa wrote:
> 
> Hi Vasily,
> 
> On 30.06.2014 21:08, Vasily Khoruzhick wrote:
> > Use clk_prepare_enable/clk_disable_unprepare to make the driver
> > work properly with common clock framework.
> >
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  arch/arm/plat-samsung/adc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Looks good to me, will apply.

Thanks,
Kukjin
