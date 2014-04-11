From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 04/27] ARM: EXYNOS: Support secondary CPU boot of Exynos4212
Date: Fri, 11 Apr 2014 15:04:11 +0900
Message-ID: <006f01cf554b$dbc6a2d0$9353e870$@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
 <1397122658-16013-5-git-send-email-cw00.choi@samsung.com>
 <20140411014424.GA14934@quad.lixom.net> <53477A19.6070509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64889 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754611AbaDKGEN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 02:04:13 -0400
In-reply-to: <53477A19.6070509@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Hi,
On 04/11/2014 2:14 PM, Chanwoo Choi wrote:

> >>  {
> >> -	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
> >> +	if (soc_is_exynos4212())
> >> +		exynos_smc(SMC_CMD_CPU1BOOT, 0, 0, 0);
> >> +	else
> >> +		exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
> >
> > 	/* <explain why you need this special case on 4212> */
> 
> It's better to ask system lsi person. We don't know it well.
> I got the guide about secondary boot from system lsi.
> But, this patch was completely tested.

exynos_smc(SMC_CMD_CPU1BOOT, ...) is cpu hotplug SMC interface.
Exynos4212 is dual core processor.
Exynos4212 only have to boot cpu1 on smp boot.
So, Second parameter of exynos_smc is fixed by 0 which means cpu1.
It don't need to boot another cpu (ex. cpu2, cpu3 for quad core processor).
But In case of quad core processor (ex. Exynos4412), 
It need to boot another cpu and specify parameter of booting core.
As I know, Exynos3250 is dual core. 
So It can be included 1st condition too.

Sangbeom,
Thanks,
