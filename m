From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [RESEND][PATCH] ARM: EXYNOS: Add clocks for EXYNOS I2S and PCM I/F
Date: Fri, 08 Feb 2013 17:57:08 +0900
Message-ID: <011101ce05da$46be7760$d43b6620$@samsung.com>
References: <003201ce0429$c15e8350$441b89f0$@samsung.com>
 <CAAgF-Be1UKyyX0VBkdy7GbhxH4mZmsVwskr2Yj3TM54qjs6dEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29608 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946115Ab3BHI5L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 03:57:11 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHW006QU8UWI9C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Feb 2013 17:57:10 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHW004JS8V9PM20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Feb 2013 17:57:09 +0900 (KST)
In-reply-to: <CAAgF-Be1UKyyX0VBkdy7GbhxH4mZmsVwskr2Yj3TM54qjs6dEQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padma Venkat' <padma.kvr@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kukjin Kim' <kgene.kim@samsung.com>, sbkim73@samsung.com, 'Tushar Behera' <tushar.behera@linaro.org>

On Fri, Feb 8, 2013 at 13:23 PM, Padma Venkat <padma.kvr@gmail.com> wrote:
> On Wed, Feb 6, 2013 at 10:51 AM, Sangsu Park <sangsu4u.park@samsung.com>
wrote:
> > +void __init exynos_register_audss_clocks(void)
> > +{
> > +       clk_audss_base = ioremap(EXYNOS_PA_AUDSS, SZ_4K);
> > +       if (clk_audss_base == NULL) {
> 
> Please run checkpatch. There should be space after if.

I mistakenly forgot checking patch with checkpatch.
I can find some errors and warnings about this patch.
I'll fix them. Thank you for your comment.

> 
> > +               pr_err("unable to ioremap for gpio_base1\n");
> 
> Please fix the err message.

I'll change it. :)

Thanks.
Sangsu Park
