From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] arm64: dts: Enable ir-spi in the tm2 and tm2e boards
Date: Mon, 13 Feb 2017 08:55:40 -0300
Message-ID: <70290326-2775-bcf9-a40d-01305d25f112@osg.samsung.com>
References: <CGME20170210022252epcas1p2cad2a32fb74a5ecc17ed73387579c6ab@epcas1p2.samsung.com>
 <20170210022238.12401-1-andi.shyti@samsung.com>
 <287b5f0b-26b2-7811-9305-5194ebf0138a@osg.samsung.com>
 <20170211044434.ujkayqmfg52rvw32@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34432
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752829AbdBMLzt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 06:55:49 -0500
In-Reply-To: <20170211044434.ujkayqmfg52rvw32@gangnam.samsung>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>

Hello Andi,

On 02/11/2017 01:44 AM, Andi Shyti wrote:
> Hi Javier,
> 
> On Fri, Feb 10, 2017 at 11:04:50AM -0300, Javier Martinez Canillas wrote:
>> On 02/09/2017 11:22 PM, Andi Shyti wrote:
> ...
>>> +	irda_regulator: irda-regulator {
>>> +		compatible = "regulator-fixed";
>>> +		enable-active-high;
>>> +		gpio = <&gpr3 3 GPIO_ACTIVE_HIGH>;
>>> +		regulator-name = "irda_regulator";
>>
>> How is this regulator named in the board schematics? My
>> understanding is that regulator-name should match this.
>>
>> I don't have access to this so it may be "irda_regulator"
>> although I was expecting something more like "VDD_IRDA".
> 
> This is not a real regulator.
>

I see, I misunderstood and thought it was a real regulator.
 
> This is an external regulator which is enabled with a gpio
> (GPR3[3]). The regulator-fixed allows me to use the regulator API
> even though I would only need to control a gpio (with the gpio
> API). I prefer using regulator to keep the same interface no
> matter how the irda is connected.
>
> About the name, I have full freedom to chose as of course it's
> not documented in the exynos5433 datasheet. Perhaps I could call
> it irda-gpio-regulator to make it more clear?
>

I don't have a strong opinion on the regulator-name in this
case.

>> Patch looks good to me though:
>>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Thanks,
> Andi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
