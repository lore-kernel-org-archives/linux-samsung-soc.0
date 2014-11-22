From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5 1/2] clk: samsung: exynos5440: move restart code into
 clock driver
Date: Sat, 22 Nov 2014 11:08:56 +0900
Message-ID: <02a801d005f9$45839030$d08ab090$@kernel.org>
References: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
 <1416307650-15162-2-git-send-email-pankaj.dubey@samsung.com>
 <546B62F3.3030807@samsung.com> <000901d003aa$3490e8a0$9db2b9e0$@samsung.com>
 <546E2968.1070800@samsung.com> <546F1436.4020101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59698 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752944AbaKVCI6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 21:08:58 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFF002A44MW0810@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Nov 2014 11:08:56 +0900 (KST)
In-reply-to: <546F1436.4020101@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net, 'Mike Turquette' <mturquette@linaro.org>, amit.daniel@samsung.com

Pankaj Dubey wrote:
> 
> Hi Kukjin,
> 
Hi,

> On Thursday 20 November 2014 11:18 PM, Sylwester Nawrocki wrote:
> > On 19/11/14 04:37, Pankaj Dubey wrote:
> >>>>
> >>>>>> +static int exynos5440_clk_restart_notify(struct notifier_block *this,
> >>>>>> +		unsigned long code, void *unused)
> >>>>>> +{
> >>>>>> +	u32 val, status;
> >>>>>> +
> >>>>>> +	status = readl_relaxed(reg_base + 0xbc);
> >>>>>> +	val = readl_relaxed(reg_base + 0xcc);
> >>>>>> +	val = (val & 0xffff0000) | (status & 0xffff);
> >>>>>> +	writel_relaxed(val, reg_base + 0xcc);
> >>>>
> >>>> Can we have macro definitions for these 0xcc, 0xbc address offsets ?
> >>>> I must say I couldn't find them documented in any Exynos datasheet I've
> >> got though.
> >>>>
> >>
> >> I also wished this, but I could not find them documented.
> >> So I tried to keep logic of original code as it is, just changed location.
> >> I would also like to mention that I have not tested this on exynos5440 as I
> >> do not have
> >> one with me. I believe if it was working at its original place in
> >> exynos_restart it should work
> >> here also. Other patch (2/2) I have verified on Exynos3250 board and its
> >> working well.
> >
> > I think it's best to merge both patches in that series through
> > the arm-soc tree, since applying them not in order may cause some
> > breakage. Thus I'd let Kukjin take this patch set into his tree.
> >
> > For both patches:
> > Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >
Sylwester, thanks for your ack.

> 
> Will you please take this series into your tree.
> 
+ Amit Daniel

Yeah, this series looks good to me and I'm looking at this series with Amit's
moving pmu.c into drivers/. Maybe I need to ask Amit to respin the series on
top of this? If required, I'll reply.

Thanks,
Kukjin
