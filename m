From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 3/3] ARM: s3c24xx: H1940: Move gpiochip_add call into
 core_init() callback
Date: Mon, 4 May 2015 21:27:43 +0300
Message-ID: <CA+E=qVeYgddYLxK8izaJk2ta+d9OT+e-2Je7KZUpwbj3AAQsPQ@mail.gmail.com>
References: <1430676910-30657-1-git-send-email-anarsoul@gmail.com>
 <1430676910-30657-3-git-send-email-anarsoul@gmail.com> <CAJKOXPd8XgpcoS2knB8JYNeRVRjO=jetwM64tVYW9hPCYN8UoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33416 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750992AbbEDS2F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 14:28:05 -0400
Received: by layy10 with SMTP id y10so110457365lay.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 11:28:03 -0700 (PDT)
In-Reply-To: <CAJKOXPd8XgpcoS2knB8JYNeRVRjO=jetwM64tVYW9hPCYN8UoA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Mon, May 4, 2015 at 6:23 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-04 3:15 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
>> gpiochip_add() allocates memory, however it's not possible anymore
>
> "...to call it..."? Something is missing in the sentence.

"it" replaces "memory allocation" here (kzalloc fails)

>> from
>> machine map_io() callback thus it failed and prevented machine from booting
>> properly.
>>
>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> ---
>>  arch/arm/mach-s3c24xx/mach-h1940.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
>> index 86d9ec7..744aa4f 100644
>> --- a/arch/arm/mach-s3c24xx/mach-h1940.c
>> +++ b/arch/arm/mach-s3c24xx/mach-h1940.c
>> @@ -777,9 +777,14 @@ static void __init h1940_map_io(void)
>>
>>         /* Add latch gpio chip, set latch initial value */
>>         h1940_latch_control(0, 0);
>> -       WARN_ON(gpiochip_add(&h1940_latch_gpiochip));
>>  }
>>
>> +static __init int h1940_gpiolib_init(void)
>> +{
>> +       return gpiochip_add(&h1940_latch_gpiochip);
>> +}
>> +core_initcall(h1940_gpiolib_init);
>> +
>
> arch_initcall() or init_machine() callback seems more appropriate.
> What do you think?

I did the same way as Kukjin Kim did in samsung gpio driver.

> Best regards,
> Krzysztof
