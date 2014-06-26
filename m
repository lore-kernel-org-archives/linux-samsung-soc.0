From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 07/14] mfd: Add driver for Maxim 77802 Power Management IC
Date: Thu, 26 Jun 2014 09:12:58 -0700
Message-ID: <CAD=FV=U5sBQ4VDG65D4rTnfruo5XzQH_EMs4SMpO4BjY1UHA5Q@mail.gmail.com>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>
	<1403723019-6212-8-git-send-email-javier.martinez@collabora.co.uk>
	<1403775093.27156.13.camel@AMDC1943>
	<53AC003E.2010608@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:55593 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757466AbaFZQM7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 12:12:59 -0400
Received: by mail-ve0-f172.google.com with SMTP id jz11so3937678veb.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2014 09:12:58 -0700 (PDT)
In-Reply-To: <53AC003E.2010608@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Javier,

On Thu, Jun 26, 2014 at 4:13 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
>>> +
>>> +#ifdef CONFIG_PM_SLEEP
>>> +static int max77802_suspend(struct device *dev)
>>> +{
>>> +    struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
>>> +    struct max77802_dev *max77802 = i2c_get_clientdata(i2c);
>>> +
>>> +    if (device_may_wakeup(dev))
>>> +            enable_irq_wake(max77802->irq);
>>> +
>>> +    disable_irq(max77802->irq);
>>
>> Can you add short comment why this is needed? I know why but just for
>> future generations which will wonder: "why do we need to disable the IRQ
>> while suspending?" :). Especially that this is rather a workaround for
>> issue in other driver (I2C bus).
>>
>
> Good idea, I'll add a comment here on next version so code archaeologists can
> figure out what what's going on here.

Is the disable_irq() needed if you have
<https://patchwork.kernel.org/patch/4421891/>?
