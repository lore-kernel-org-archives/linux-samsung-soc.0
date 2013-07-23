From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V2] watchdog: s3c2410_wdt: remove the global variables
Date: Tue, 23 Jul 2013 14:11:41 +0530
Message-ID: <CAL1wa8f9xxqViuH4PeFOXuKApkMf=4oA_J-qEG+JhB=8-y6WBQ@mail.gmail.com>
References: <1374473649-20050-1-git-send-email-l.krishna@samsung.com> <CAK9yfHwMZXV_F5=xmcbQfhFmDXsRxu_9a8n7C92gncyiPSJNrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:40585 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754236Ab3GWImC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 04:42:02 -0400
Received: by mail-vb0-f46.google.com with SMTP id w8so384711vbf.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 01:42:01 -0700 (PDT)
In-Reply-To: <CAK9yfHwMZXV_F5=xmcbQfhFmDXsRxu_9a8n7C92gncyiPSJNrA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jg1.han@samsung.com>

Hi Sachin,

On Tue, Jul 23, 2013 at 8:28 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Leela,
>
> On 22 July 2013 11:44, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
>> This patch removes the global variables in the driver file and
>> group them into a structure.
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  Note: This patch is rebased on kgene's for-next branch and tested on SMDK5420.
>>
>>  Changes since V1:
>>         - changed the patch subject.
>>         - indentation correction in s3c2410_watchdog structure.
>>
>>  drivers/watchdog/s3c2410_wdt.c |  204 +++++++++++++++++++++++-----------------
>>  1 file changed, 119 insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>> index 6a22cf5..de679d0 100644
>> --- a/drivers/watchdog/s3c2410_wdt.c
>> +++ b/drivers/watchdog/s3c2410_wdt.c
>> @@ -84,13 +84,20 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, "
>>                         "0 to reboot (default 0)");
>>  MODULE_PARM_DESC(debug, "Watchdog debug, set to >1 for debug (default 0)");
>>
>> -static struct device    *wdt_dev;      /* platform device attached to */
>> -static struct resource *wdt_mem;
>> -static struct resource *wdt_irq;
>> -static struct clk      *wdt_clock;
>> -static void __iomem    *wdt_base;
>> -static unsigned int     wdt_count;
>> -static DEFINE_SPINLOCK(wdt_lock);
>> +struct s3c2410_watchdog {
>> +       struct device           *dev;   /* platform device attached to */
>
> Since you would anyway be respinning this patch to address comments
> from Tomasz, please remove the above comment too.
>

Done

> --
> With warm regards,
> Sachin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
