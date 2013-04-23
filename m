From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/3] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Tue, 23 Apr 2013 16:26:15 +0200
Message-ID: <1696892.zdvbYPFFr0@amdc1227>
References: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
 <201304222310.34775.arnd@arndb.de> <517692FD.9080005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38895 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755664Ab3DWO01 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 10:26:27 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLP00KDVPFZ4970@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Apr 2013 23:26:26 +0900 (KST)
In-reply-to: <517692FD.9080005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org

Hi Kukjin,

On Tuesday 23 of April 2013 22:56:13 Kukjin Kim wrote:
> On 04/23/13 06:10, Arnd Bergmann wrote:
> > On Monday 15 April 2013, Tomasz Figa wrote:
> >> This patch extends exynos_init_time() function to handle Exynos4210 rev0
> >> SoC, which differs in availability of system timers and needs different
> >> clocksource initialization.
> >> 
> >> This makes it possible to use exynos_init_time() function as init_time
> >> callback for all Exynos-based boards, including Universal_C210, which
> >> originally had to use samsung_timer_init().
> >> 
> >> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> > 
> > Acked-by: Arnd Bergmann<arnd@arndb.de>
> > 
> > Note that it would be helpful to mention here that this is required for
> > the calling samsung_timer_init from the exynos4-dt.c file.
> 
> I did 'amend' as per your suggestion and added your ack on this series.
> 
> Thanks.
> 
> - Kukjin

Since the samsung-time rework patches were replaced with a non-invasive subset 
with different semantics (going to send them in a while), this patch should be 
replaced with new version I'm going to send (in a while as well).

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
