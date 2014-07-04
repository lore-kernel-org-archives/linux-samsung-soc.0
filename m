From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/6] pinctrl: samsung: Handle GPIO request and free using
 pinctrl helpers
Date: Fri, 04 Jul 2014 13:00:36 +0200
Message-ID: <53B68954.30300@samsung.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
 <1404315664-3174-3-git-send-email-t.figa@samsung.com>
 <CAK5sBcFHFg7u-40NVovp9D2ro=MnQbOyiP6MtMss2PJmByR4iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:55784 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869AbaGDLBJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 07:01:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8600E5YP9M6M40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jul 2014 12:00:58 +0100 (BST)
In-reply-to: <CAK5sBcFHFg7u-40NVovp9D2ro=MnQbOyiP6MtMss2PJmByR4iQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>

On 04.07.2014 11:41, Sachin Kamat wrote:
> Hi Tomasz,
> 
> On Wed, Jul 2, 2014 at 9:11 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> This patch adds .request() and .free() operations to gpio_chip of
>> pinctrl-samsung driver, which call pinctrl request and free helpers to
>> request and free pinctrl pin along with GPIO pin.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>>  drivers/pinctrl/pinctrl-samsung.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
>> index 779c8bc..6e099d6 100644
>> --- a/drivers/pinctrl/pinctrl-samsung.c
>> +++ b/drivers/pinctrl/pinctrl-samsung.c
>> @@ -779,7 +779,8 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
>>                 pin_bank = &drvdata->ctrl->pin_banks[bank];
>>                 pin_bank->grange.name = pin_bank->name;
>>                 pin_bank->grange.id = bank;
>> -               pin_bank->grange.pin_base = pin_bank->pin_base;
>> +               pin_bank->grange.pin_base = drvdata->ctrl->base
>> +                                               + pin_bank->pin_base;
> 
> Is this a fix?
> 

Hmm, could be.

I haven't observed any issues due to this without further patches from
this series, so I'm not sure if this needs to be sent as a separate fix,
but I might split this patch into two if necessary.

Best regards,
Tomasz
