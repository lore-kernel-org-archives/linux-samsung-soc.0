From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: S5PC100: Fix for compilation error
Date: Wed, 6 Jul 2011 13:13:51 +0530
Message-ID: <CAAgF-BdC2qOYdqHJqfO1J-wnm2Ph6M+bhLw2is7RSU_d=qwJ7g@mail.gmail.com>
References: <1309801312-27377-1-git-send-email-padma.v@samsung.com>
	<00c201cc3ba6$901a62c0$b04f2840$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:59359 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab1GFHnw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 03:43:52 -0400
Received: by wyg8 with SMTP id 8so4475361wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2011 00:43:51 -0700 (PDT)
In-Reply-To: <00c201cc3ba6$901a62c0$b04f2840$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

On Wed, Jul 6, 2011 at 12:02 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Padmavathi Venna wrote:
>>
>> From: padmavathi venna <padma.v@samsung.com>
>>
>> S5PC100 Compilation fails without this patch
>>
>> Signed-off-by: padmavathi venna <padma.v@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pc100/dev-spi.c | =A0 =A01 +
>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pc100/dev-spi.c
> b/arch/arm/mach-s5pc100/dev-spi.c
>> index 2b58c9a..e5d6c4d 100644
>> --- a/arch/arm/mach-s5pc100/dev-spi.c
>> +++ b/arch/arm/mach-s5pc100/dev-spi.c
>> @@ -15,6 +15,7 @@
>> =A0#include <mach/dma.h>
>> =A0#include <mach/map.h>
>> =A0#include <mach/spi-clocks.h>
>> +#include <mach/irqs.h>
>>
>> =A0#include <plat/s3c64xx-spi.h>
>> =A0#include <plat/gpio-cfg.h>
>> --
>> 1.7.0.4
>
> Ok, will apply in -fix tree.
>
> But, I'm not sure you really need to use your name ' padmavathi venna=
'
> here...you used "Padmavathi Venna" in other patch.
Thanks for your pointing out. I am going to send a new patch by
removing the parenthesis. In that I will also correct my name.

Thanks&Regards
Padma
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
