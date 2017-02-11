From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: Enable ir-spi in the tm2 and tm2e boards
Date: Sat, 11 Feb 2017 13:44:34 +0900
Message-ID: <20170211044434.ujkayqmfg52rvw32@gangnam.samsung>
References: <CGME20170210022252epcas1p2cad2a32fb74a5ecc17ed73387579c6ab@epcas1p2.samsung.com>
 <20170210022238.12401-1-andi.shyti@samsung.com>
 <287b5f0b-26b2-7811-9305-5194ebf0138a@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34192 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdBKEoj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 23:44:39 -0500
Content-disposition: inline
In-reply-to: <287b5f0b-26b2-7811-9305-5194ebf0138a@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@samsung.com>

Hi Javier,

On Fri, Feb 10, 2017 at 11:04:50AM -0300, Javier Martinez Canillas wrote:
> On 02/09/2017 11:22 PM, Andi Shyti wrote:
...
> > +	irda_regulator: irda-regulator {
> > +		compatible = "regulator-fixed";
> > +		enable-active-high;
> > +		gpio = <&gpr3 3 GPIO_ACTIVE_HIGH>;
> > +		regulator-name = "irda_regulator";
> 
> How is this regulator named in the board schematics? My
> understanding is that regulator-name should match this.
> 
> I don't have access to this so it may be "irda_regulator"
> although I was expecting something more like "VDD_IRDA".

This is not a real regulator.

This is an external regulator which is enabled with a gpio
(GPR3[3]). The regulator-fixed allows me to use the regulator API
even though I would only need to control a gpio (with the gpio
API). I prefer using regulator to keep the same interface no
matter how the irda is connected.

About the name, I have full freedom to chose as of course it's
not documented in the exynos5433 datasheet. Perhaps I could call
it irda-gpio-regulator to make it more clear?

> Patch looks good to me though:
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks,
Andi
