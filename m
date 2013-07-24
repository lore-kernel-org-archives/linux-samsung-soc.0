From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: remove obsolete exynos4_defconfig
Date: Wed, 24 Jul 2013 17:33:42 +0900
Message-ID: <0e8c01ce8848$810bf370$8323da50$%kim@samsung.com>
References: <2326060.vKzrGtO1Cq@amdc1032> <51CD5C9B.2010706@linaro.org>
 <2247183.K8o4ATxfnz@amdc1032> <51CDAA7A.9030209@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44922 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115Ab3GXIdo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 04:33:44 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF009FLMEQGPS0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 17:33:43 +0900 (KST)
In-reply-to: <51CDAA7A.9030209@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daniel Lezcano' <daniel.lezcano@linaro.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>

Daniel Lezcano wrote:
> 
> On 06/28/2013 02:45 PM, Bartlomiej Zolnierkiewicz wrote:
> > On Friday, June 28, 2013 11:51:23 AM Daniel Lezcano wrote:
> >> On 06/28/2013 11:48 AM, Bartlomiej Zolnierkiewicz wrote:
> >>> It hasn't been updated since Novemeber 2011 and exynos_defconfig
> >>> should be used instead.
> >>
> >> Why ?
> >
> > After conversion to using device tree only (no board files) on
> > mach-exynos using exynos4_defconfig results in unbootable kernel
> > (I used next-20130626):
> 
> Ok, thanks for the clarification.
> 
> If the other one is usable in place of the exynos4_defconfig, that makes
> sense to not keep a duplicate one.
> 
> With a more detailed changelog, you can add my:
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
OK, applied with amending for a more detailed changelog and Sylwester's ack.

Thanks,
Kukjin
