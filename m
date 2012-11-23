From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] i2c: s3c2410: Add devm_* apis and cleanup
Date: Fri, 23 Nov 2012 12:14:50 +0530
Message-ID: <50AF1B62.1000209@linaro.org>
References: <1353650353-17576-1-git-send-email-tushar.behera@linaro.org> <CAM=Q2cs=oYq4e17LXxUEhATiYLAjnzoTH-+nsO5KNQwGj2qSBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM=Q2cs=oYq4e17LXxUEhATiYLAjnzoTH-+nsO5KNQwGj2qSBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 11/23/2012 11:45 AM, Shubhrajyoti Datta wrote:
> On Fri, Nov 23, 2012 at 11:29 AM, Tushar Behera
> <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> This patchset cleans up the probe function of i2c-s3c2410 driver.
>> These have been tested on Exynos4210 based Origen board.
>>
>> Tushar Behera (7):
>>   i2c: s3c2410: Remove unnecessary label err_noclk
>>   i2c: s3c2410: Convert to use devm_clk_get()
>>   i2c: s3c2410: Convert to use devm_request_mem_region()
>>   i2c: s3c2410: Convert to use devm_ioremap()
>>   i2c: s3c2410: Convert to use devm_request_irq()
> 
> You may want to consider request_and_ioremap.
> 

Thanks. I will redo the patchset and submit again.

> 
>>   i2c: s3c2410: Move location of clk_prepare_enable() call in probe
>>     function
>>   i2c: s3c2410: Remove err_cpufreq label
>>
>>  drivers/i2c/busses/i2c-s3c2410.c |   74 ++++++++++++--------------------------
>>  1 files changed, 23 insertions(+), 51 deletions(-)
>>
>> --
>> 1.7.4.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-i2c" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Tushar Behera
