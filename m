From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 1/2] clk: samsung: exynos5440: move restart code into
 clock driver
Date: Thu, 20 Nov 2014 18:48:24 +0100
Message-ID: <546E2968.1070800@samsung.com>
References: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
 <1416307650-15162-2-git-send-email-pankaj.dubey@samsung.com>
 <546B62F3.3030807@samsung.com> <000901d003aa$3490e8a0$9db2b9e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38890 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757553AbaKTRs3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 12:48:29 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFC007BAMXKGBB0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 17:51:20 +0000 (GMT)
In-reply-to: <000901d003aa$3490e8a0$9db2b9e0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net, Mike Turquette <mturquette@linaro.org>

On 19/11/14 04:37, Pankaj Dubey wrote:
>> > 
>>> > > +static int exynos5440_clk_restart_notify(struct notifier_block *this,
>>> > > +		unsigned long code, void *unused)
>>> > > +{
>>> > > +	u32 val, status;
>>> > > +
>>> > > +	status = readl_relaxed(reg_base + 0xbc);
>>> > > +	val = readl_relaxed(reg_base + 0xcc);
>>> > > +	val = (val & 0xffff0000) | (status & 0xffff);
>>> > > +	writel_relaxed(val, reg_base + 0xcc);
>> > 
>> > Can we have macro definitions for these 0xcc, 0xbc address offsets ?
>> > I must say I couldn't find them documented in any Exynos datasheet I've
> got though.
>> > 
>
> I also wished this, but I could not find them documented. 
> So I tried to keep logic of original code as it is, just changed location. 
> I would also like to mention that I have not tested this on exynos5440 as I
> do not have
> one with me. I believe if it was working at its original place in
> exynos_restart it should work
> here also. Other patch (2/2) I have verified on Exynos3250 board and its
> working well.

I think it's best to merge both patches in that series through
the arm-soc tree, since applying them not in order may cause some
breakage. Thus I'd let Kukjin take this patch set into his tree.

For both patches:
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--
Thanks,
Sylwester
