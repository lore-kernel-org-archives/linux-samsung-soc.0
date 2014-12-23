From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: clk: samsung: exynos7: Add clocks for MSCL block
Date: Tue, 23 Dec 2014 12:55:43 +0100
Message-ID: <5499583F.9070604@samsung.com>
References: <1418801617-7593-1-git-send-email-tony.kn@samsung.com>
 <5498F6AA.8010405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62966 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754639AbaLWLzt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Dec 2014 06:55:49 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NH1003UQANRC5A0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Dec 2014 11:59:51 +0000 (GMT)
In-reply-to: <5498F6AA.8010405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: tony nadackal <tony.kn@samsung.com>, linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, a.kesavan@samsung.com, bhushan.r@samsung.com

Hi Pankaj,

On 23/12/14 05:59, Pankaj Dubey wrote:
>> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
>> > index a79bf23..95c1160 100644
>> > --- a/drivers/clk/samsung/clk-exynos7.c
>> > +++ b/drivers/clk/samsung/clk-exynos7.c
>> > @@ -34,6 +34,7 @@
>> >   #define DIV_TOPC0		0x0600
>> >   #define DIV_TOPC1		0x0604
>> >   #define DIV_TOPC3		0x060C
>> > +#define	ENABLE_ACLK_TOPC1	0x0804
>
> nit: Tab space between #define and ENABLE_ACLK_TOPC1, should be removed.
> 
> I verified register settings and clock relationships are as per UM I 
> have with me. So other than above nit, everything looks fine.
> 
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Thanks for you review, I have already fixed the whitespace issue when
applying.

--
Regards,
Sylwester
