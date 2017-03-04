From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: fix segfault when using external
 interrupts on s3c24xx
Date: Sat, 4 Mar 2017 20:45:13 +0900
Message-ID: <CA+Ln22E1FOTdU+drwy8aV8=2Ww=FBs+fZUiPS974vU2N=sD6AA@mail.gmail.com>
References: <1488489799-18136-1-git-send-email-sergio.prado@e-labworks.com> <20170304081504.unv6sihbmp76ynfy@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34445 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751472AbdCDLpP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Mar 2017 06:45:15 -0500
In-Reply-To: <20170304081504.unv6sihbmp76ynfy@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sergio Prado <sergio.prado@e-labworks.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>

[+Chanwoo]

2017-03-04 17:15 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
> On Thu, Mar 02, 2017 at 06:23:19PM -0300, Sergio Prado wrote:
>> We are getting a NULL pointer dereference when working with external
>> interrupts on s3c24xx:
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 000000a8
>> pgd = c0104000
>> [000000a8] *pgd=00000000
>> Internal error: Oops: 5 [#1] ARM
>> Modules linked in:
>> CPU: 0 PID: 0 Comm: swapper Not tainted 4.10.0-rc8mini2440-sub-00047-g0722f57bfae9-dirty #3
>> Hardware name: Samsung S3C2416 (Flattened Device Tree)
>> task: c07399f8 task.stack: c0734000
>> PC is at s3c24xx_demux_eint4_7+0x24/0x10c
>> LR is at s3c24xx_demux_eint4_7+0x108/0x10c
>>
>> The problem is in the function s3c24xx_demux_eint() when dereferencing
>> bank->eint_base.
>>
>> At this point, we cannot get the bank pointer from the irq_desc
>> structure since it is pointing to the hardware irq, not virq.
>>
>> So let's get the bank pointer directly from data->drvdata.
>>
>> This is a regression from commit 8b1bd11c1f8f529057369c5b3702d13fd24e2765.
>
> Checkpatch should complain here about commit format.
>
>>
>> Tested on FriendlyARM mini2440.
>>
>
> Please add:
>   Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
>   Cc: <stable@vger.kernel.org>

Yeah, that patch seems to have also affected s3c64xx...

>
>> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>> ---
>>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>> index b82a003546ae..1b8d887796e8 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>> @@ -356,8 +356,8 @@ static inline void s3c24xx_demux_eint(struct irq_desc *desc,
>>  {
>>       struct s3c24xx_eint_data *data = irq_desc_get_handler_data(desc);
>>       struct irq_chip *chip = irq_desc_get_chip(desc);
>> -     struct irq_data *irqd = irq_desc_get_irq_data(desc);
>> -     struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
>> +     struct samsung_pinctrl_drv_data *d = data->drvdata;
>> +     struct samsung_pin_bank *bank = d->pin_banks;
>
> I think 'pin_banks' point to all banks of given controller not to the
> currently accessed one.

Yeah, this doesn't seem to be a logically correct fix, although it
should work since in s3c24xx all banks would have the same eint_base
value.

I would suggest a partial revert of 8b1bd11c1f8f, i.e. bringing back
samsung_pinctrl_drv_data::virt_base and undoing the changes made in
s3c24xx and s3c64xx EINT code.

Best regards,
Tomasz
