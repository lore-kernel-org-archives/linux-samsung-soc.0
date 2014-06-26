From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 07/14] mfd: Add driver for Maxim 77802 Power Management IC
Date: Thu, 26 Jun 2014 09:29:51 -0700
Message-ID: <CAD=FV=Xtkfa5yJSWYDcBvBycMqN-U5F-vdbJeo1h3ksCbqkqgw@mail.gmail.com>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>
	<1403723019-6212-8-git-send-email-javier.martinez@collabora.co.uk>
	<1403775093.27156.13.camel@AMDC1943>
	<53AC003E.2010608@collabora.co.uk>
	<CAD=FV=U5sBQ4VDG65D4rTnfruo5XzQH_EMs4SMpO4BjY1UHA5Q@mail.gmail.com>
	<53AC47E3.2030306@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:60691 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752149AbaFZQ3w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 12:29:52 -0400
Received: by mail-ve0-f182.google.com with SMTP id oy12so3983900veb.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2014 09:29:51 -0700 (PDT)
In-Reply-To: <53AC47E3.2030306@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Javier,

On Thu, Jun 26, 2014 at 9:18 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Doug,
>
> On 06/26/2014 06:12 PM, Doug Anderson wrote:
>> Javier,
>>
>> On Thu, Jun 26, 2014 at 4:13 AM, Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk> wrote:
>>>>> +
>>>>> +#ifdef CONFIG_PM_SLEEP
>>>>> +static int max77802_suspend(struct device *dev)
>>>>> +{
>>>>> +    struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
>>>>> +    struct max77802_dev *max77802 = i2c_get_clientdata(i2c);
>>>>> +
>>>>> +    if (device_may_wakeup(dev))
>>>>> +            enable_irq_wake(max77802->irq);
>>>>> +
>>>>> +    disable_irq(max77802->irq);
>>>>
>>>> Can you add short comment why this is needed? I know why but just for
>>>> future generations which will wonder: "why do we need to disable the IRQ
>>>> while suspending?" :). Especially that this is rather a workaround for
>>>> issue in other driver (I2C bus).
>>>>
>>>
>>> Good idea, I'll add a comment here on next version so code archaeologists can
>>> figure out what what's going on here.
>>
>> Is the disable_irq() needed if you have
>> <https://patchwork.kernel.org/patch/4421891/>?
>>
>
> Probably not but I added the following comment:
>
>         /*
>          * The IRQ must be disabled during suspend since due wakeup
>          * ordering issues it may be possible that the I2C controller
>          * is still suspended when the interrupt happens so the IRQ
>          * handler will fail to read the I2C bus.
>          */
>         disable_irq(max77802->irq);
>
> since in theory this PMIC can be used in other SoCs besides
> Exynos5420/Exynos5800 and it may be possible that the I2C controller driver for
> these other SoCs may not resume at noirq time.
>
> But on a second thought, this PMIC seems to be designed specially for these two
> Exynos SoCs so I guess it's safe to assume that it is not needed?

Right, there's a close coupling between PMICs and SoCs.  The PMIC has
special sequencing and default voltage levels that were tuned exactly
for this SoC.

Note: Wolfram has not actually responded to my patch much less
accepted it.  It's entirely possible that in another month or two
we'll hear back a big fat NAK.  In that case your solution will be the
best one I can think of.


-Doug
