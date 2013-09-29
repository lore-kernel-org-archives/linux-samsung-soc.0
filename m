From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 07:49:38 +0900
Message-ID: <002101cebd66$2d6487c0$882d9740$%lee@samsung.com>
References: <006e01cebc08$995a8650$cc0f92f0$%lee@samsung.com>
 <CAK9yfHwUrHoq5G37mRJ_20FfX+pR9kKFqVzqULE_M3=PoiHPkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38353 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752210Ab3I2Wtk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 18:49:40 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTW00DEASQMS3B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Sep 2013 07:49:39 +0900 (KST)
In-reply-to: <CAK9yfHwUrHoq5G37mRJ_20FfX+pR9kKFqVzqULE_M3=PoiHPkw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: kgene.kim@samsung.com, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

On Saturday, September 28, 2013 6:26 PM, Sachin Kamat wrote:
> On 28 September 2013 10:37, Jungseok Lee <jays.lee@samsung.com> wrote:
> >
> > +static void exynos5440_power_off(void)
> > +{
> > +       struct device_node *np;
> > +       void __iomem *addr;
> > +
> > +       np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-clock");
> > +
> > +       addr = of_iomap(np, 0) + 0x14;
> > +
> > +       __raw_writel(0x1, addr);
> 
> Probably the magic numbers could be defined as macros or atleast a
> comment to that effect would be useful.

Thanks for your suggestion.
I will add some comments on magic numbers and resend a patch.
(I've also missed [PATCH] at mail title.)


Best Regards
Jungseok Lee
