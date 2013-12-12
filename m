From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH CFT] ARM:S5P64X0: Enable ARM_PATCH_PHYS_VIRT and
 AUTO_ZRELADDR by default
Date: Thu, 12 Dec 2013 12:40:59 +0100
Message-ID: <3126277.U19MiHChc4@amdc1227>
References: <1386825152-398-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
 <26167386.hX5eWUjT6T@flatron>
 <CAAunhULO5n3rf5_Q+HwExd=kadsPC_rTz9oP8kXKM7krBetbdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38115 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380Ab3LLLlN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 06:41:13 -0500
In-reply-to: <CAAunhULO5n3rf5_Q+HwExd=kadsPC_rTz9oP8kXKM7krBetbdQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Panchaxari Prasannamurthy Tumkur <panchaxari.prasannamurthy@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kgene Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 12 of December 2013 16:33:46 Panchaxari Prasannamurthy Tumkur wrote:
> Hi Tomasz
> 
> > Could you explain the purpose of this change on S5P64x0?
> >
> > This is actually quite a poor platform choice. As of today, the kernel
> > is stuck with supporting just SMDK6440/6450 boards, which are proprietary
> > development boards and it doesn't look like any further boards will show
> > up in future. Kukjin has actually proposed removing support for this
> > platform at all and I consider this reasonable.
> >
> > Kukjin, should we proceed with removal?
> 
> The purpose of this patch is with the greater intent of consolidating
> ARM-32 kernel. Which means a generic kernel for ARM-32 processors.

OK. So do you have plans to send similar patches for other, more active
(and closer to having multiplatform support) platforms, such as s3c64xx,
s5pv210 and exynos?

In case of s5p64x0 probably the only person capable of testing it is
Kukjin, as we don't have any other active people with boards based on
these SoCs.

Best regards,
Tomasz
