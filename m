From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Tue, 25 Feb 2014 18:34:01 +0100
Message-ID: <530CD409.80000@gmail.com>
References: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com> <20140225061614.22529.61524@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:52650 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753148AbaBYReO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 12:34:14 -0500
Received: by mail-ee0-f51.google.com with SMTP id t10so865004eei.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Feb 2014 09:34:13 -0800 (PST)
In-Reply-To: <20140225061614.22529.61524@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, sachin.kamat@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Mike,

On 25.02.2014 07:16, Mike Turquette wrote:
> Quoting Sylwester Nawrocki (2014-01-07 04:03:43)
>> Ensure clk->kref is dereferenced only when clk is not NULL.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> Taken into clk-fixes toward -rc5.

Thanks! \o/

Best regards,
Tomasz

>
> Thanks!
> Mike
>
>> ---
>> Hi Sachin,
>>
>> please try if this patch fixes the exyno5420 boot crash.
>>
>> Thanks,
>> Sylwester
>>
>>   drivers/clk/clk.c |   13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index e3e0327..a1fe86f 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2179,24 +2179,25 @@ EXPORT_SYMBOL_GPL(devm_clk_unregister);
>>    */
>>   int __clk_get(struct clk *clk)
>>   {
>> -       if (clk && !try_module_get(clk->owner))
>> -               return 0;
>> +       if (clk) {
>> +               if (!try_module_get(clk->owner))
>> +                       return 0;
>>
>> -       kref_get(&clk->ref);
>> +               kref_get(&clk->ref);
>> +       }
>>          return 1;
>>   }
>>
>>   void __clk_put(struct clk *clk)
>>   {
>> -       if (WARN_ON_ONCE(IS_ERR(clk)))
>> +       if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
>>                  return;
>>
>>          clk_prepare_lock();
>>          kref_put(&clk->ref, __clk_release);
>>          clk_prepare_unlock();
>>
>> -       if (clk)
>> -               module_put(clk->owner);
>> +       module_put(clk->owner);
>>   }
>>
>>   /***        clk rate change notifiers        ***/
>> --
>> 1.7.9.5
>>
