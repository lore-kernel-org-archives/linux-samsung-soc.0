From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH] watchdog: s3c2410_wdt: code clean up
Date: Mon, 22 Jul 2013 10:58:05 +0530
Message-ID: <CAL1wa8foabtQQwXUjGp_9wZcQ6xmZS1ObqY0x+8yfQ2ur2yWkg@mail.gmail.com>
References: <1374224288-18963-1-git-send-email-l.krishna@samsung.com> <002601ce8670$7a2901d0$6e7b0570$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:46022 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752954Ab3GVF21 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 01:28:27 -0400
Received: by mail-ve0-f182.google.com with SMTP id ox1so4714004veb.41
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Jul 2013 22:28:26 -0700 (PDT)
In-Reply-To: <002601ce8670$7a2901d0$6e7b0570$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>

Hi Jingoo Han,

Thanks for reviewing the patch.

On Mon, Jul 22, 2013 at 5:44 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Friday, July 19, 2013 5:58 PM, Leela Krishna Amudala wrote:
>>
>> This patch removes the global variables in the driver file and
>> group them into a structure.
>
> How about changing the subject as below?
>
> [PATCH] watchdog: s3c2410_wdt: remove the global variables
>

Okay, Will change it.

>
> [.....]
>
>> -static struct device    *wdt_dev;    /* platform device attached to */
>> -static struct resource       *wdt_mem;
>> -static struct resource       *wdt_irq;
>> -static struct clk    *wdt_clock;
>> -static void __iomem  *wdt_base;
>> -static unsigned int   wdt_count;
>> -static DEFINE_SPINLOCK(wdt_lock);
>> +struct s3c2410_watchdog {
>> +struct device                *dev;   /* platform device attached to */
>> +struct clk           *clock;
>> +void __iomem         *reg_base;
>> +unsigned int         count;
>> +spinlock_t           lock;
>> +struct watchdog_device       wdt_device;
>> +struct notifier_block        freq_transition;
>> +};
>
> 'tab' is necessary as below:
>

Oh, I didn't notice it.
I'll change it.

Best Wishes,
Leela Krishna Amudala.

> +struct s3c2410_watchdog {
> +       struct device           *dev;   /* platform device attached to */
> +       struct clk              *clock;
> +       void __iomem            *reg_base;
> +       unsigned int            count;
> +       spinlock_t              lock;
> +       struct watchdog_device  wdt_device;
> +       struct notifier_block   freq_transition;
> +};
>
> Best regards,
> Jingoo Han
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
