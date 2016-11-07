From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/6] mfd: max8997: Initialize max8997 register map
Date: Mon, 7 Nov 2016 22:42:34 +0530
Message-ID: <CAGcde9FvWWW4Yc08s9BzPsKrcqvWCj+kOPGp9pN__ssQC0V4tg@mail.gmail.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
 <1478513376-14307-2-git-send-email-pankaj.dubey@samsung.com> <1b150578-b766-3470-475c-fe494bcc8c54@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33968 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932411AbcKGRNB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 12:13:01 -0500
Received: by mail-lf0-f65.google.com with SMTP id o141so8210143lff.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2016 09:12:56 -0800 (PST)
In-Reply-To: <1b150578-b766-3470-475c-fe494bcc8c54@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, krzk@kernel.org, Kukjin Kim <kgene@kernel.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, myungjoo.ham@samsung.com, Lee Jones <lee.jones@linaro.org>

Hi Javier,

On 7 November 2016 at 19:52, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello Pankaj,
>
> On 11/07/2016 07:09 AM, Pankaj Dubey wrote:
>> This patch add regmap initialization to use register map
>> in max8997-clk device driver
>>
>> CC: Lee Jones <lee.jones@linaro.org>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>
> Patch looks good to me. Now that the driver uses regmap, I think you should
> be able to get rid of drivers/mfd/max8997-irq.c and use the regmap IRQ chip
> like is done in most Maxim PMIC MFD drivers.
>
> That can be done as a follow-up of this series though.
>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>

Thanks for review.
You are right, that we can get rid of max8997-irq.c by using regmap
IRQ chip, but I would like to take that as a separate follow-up
series.

Thanks,
Pankaj Dubey

> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
