From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/4] pinctrl: Add s5pv210 support to pinctrl-exynos
Date: Tue, 27 Aug 2013 14:26:41 +0200
Message-ID: <1882987.W6oKxzvqXu@amdc1227>
References: <1377595171-31116-1-git-send-email-m.krawczuk@partner.samsung.com>
 <521C71A1.4070609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23921 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172Ab3H0M0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 08:26:46 -0400
In-reply-to: <521C71A1.4070609@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, linus.walleij@linaro.org, thomas.abraham@linaro.org, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On Tuesday 27 of August 2013 11:30:09 Sylwester Nawrocki wrote:
> Hi,
> 
> Just a few nits...
> 
> On 08/27/2013 11:19 AM, Mateusz Krawczuk wrote:
> > This patch implements pinctrl for s5pv210 and adds required device tree
> > bindings.
> Would be good to wrap this to not exceed 80 columns.
> 
> > Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> > ---
> 
> [...]
> 
> > diff --git a/drivers/pinctrl/pinctrl-exynos.c
> > b/drivers/pinctrl/pinctrl-exynos.c index a74b3cb..fc3e1d7 100644
> > --- a/drivers/pinctrl/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/pinctrl-exynos.c
> > @@ -660,6 +660,64 @@ static void exynos_pinctrl_resume(struct
> > samsung_pinctrl_drv_data *drvdata)> 
> >  			exynos_pinctrl_resume_bank(drvdata, bank);
> >  
> >  }
> > 
> > +/* pin banks of s5pv210 pin-controller */
> > +static struct samsung_pin_bank s5pv210_pin_banks0[] = {
> 
> Couldn't it be 'static const' ?

This driver relies on this array not being const, as it calculates 
remaining contents of the samsung_pin_bank struct dynamically.

Even though it is far from being elegant, it works correctly, because there 
is always one separate array per each pin controller instance. This could 
be improved by separating the constant part from the variable part or by 
using this array as a template, i.e. marking as __initdata and copying its 
contents, but I couldn't get myself to do that. Feel free to submit 
appropriate patches ;).

Best regards,
Tomasz
