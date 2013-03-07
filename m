From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Set clock parent if provided
Date: Thu, 7 Mar 2013 15:12:38 +0530
Message-ID: <CAOD6ATpb+mJMVDATj2FO9KVX0-xnRezmqdVOeJYpyX2ugR8Rpg@mail.gmail.com>
References: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
	<CAPdUM4PzGiwOvbva+Raq7EtHQ6+8g3rY_yudbidCy+aeqT2geA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:43109 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755394Ab3CGJmj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 04:42:39 -0500
Received: by mail-qa0-f53.google.com with SMTP id z4so186668qan.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 01:42:38 -0800 (PST)
In-Reply-To: <CAPdUM4PzGiwOvbva+Raq7EtHQ6+8g3rY_yudbidCy+aeqT2geA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Rahul,

On Thu, Mar 7, 2013 at 2:58 PM, Rahul Sharma <r.sh.open@gmail.com> wrote:
> On Thu, Mar 7, 2013 at 11:01 AM, Shaik Ameer Basha
> <shaik.ameer@samsung.com> wrote:
>> s3c_set_clksrc() updates the clock source as per u-boot settings.
>> This patch adds the functionality to overwrite u-boot settings,
>> if user provides the clock parent field. In case of wrong source
>> provided by the user, it will retain the u-boot settings.
>>
>> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
>> ---
>>  arch/arm/plat-samsung/clock-clksrc.c |    7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
>> index 786a410..4fecd80 100644
>> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> @@ -150,7 +150,12 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
>>                 return;
>>         }
>>
>> -       clk->clk.parent = srcs->sources[clksrc];
>> +       if (clk->clk.parent) {
>> +               if (s3c_setparent_clksrc(&clk->clk, clk->clk.parent))
>> +                       clk->clk.parent = srcs->sources[clksrc];
>
> IMO, it make sense to return the error value if failed. Now you
> are masking the failed cases (due to invalid parent clk) and proceeding
> with uboot values which is not the intention when parent clock
> is provided.

yes you are right. But as the function s3c_set_clksrc() is not
expected to return any error codes,
I tried to use default u-boot settings.
We can add a warning message to let user know in case of wrong parent
assignment.

Regards,
Shaik Ameer Basha

>
> Regards,
> Rahul Sharma,
>
>> +       } else {
>> +               clk->clk.parent = srcs->sources[clksrc];
>> +       }
>>
>>         if (announce)
>>                 printk(KERN_INFO "%s: source is %s (%d), rate is %ld\n",
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
