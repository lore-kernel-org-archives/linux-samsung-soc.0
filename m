From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH] thermal: Add missing cpumask_clear
Date: Sat, 5 Jul 2014 20:29:03 +0530
Message-ID: <CAK5sBcGO1XRUX+bzFykrmj9RA4ku7GNY_OFf5cFP6n6V-6Vpgw@mail.gmail.com>
References: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
	<CAK5sBcHDTgyj67xVWgtNH-Z7XU1Ykp6m650_mWBVp=Az2P6f=Q@mail.gmail.com>
	<000101cf97e0$f9ba7a50$ed2f6ef0$@samsung.com>
	<53B747FF.5010604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:44723 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753570AbaGEO7E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Jul 2014 10:59:04 -0400
Received: by mail-lb0-f181.google.com with SMTP id p9so1795468lbv.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Jul 2014 07:59:03 -0700 (PDT)
In-Reply-To: <53B747FF.5010604@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Jonghwan Choi <jhbird.choi@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Eduardo Valentin <eduardo.valentin@ti.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Jul 5, 2014 at 6:04 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Jonghwan,
>
> On 05.07.2014 01:37, Jonghwan Choi wrote:
>> On Fri, Jul 4, 2014 at 8:23 PM, Sachin Kamat <spk.linux@gmail.com> wrote:
>>
>>>> Cpumasks should be cleared before using.
>>>
>>> Please explain why and what is issue observed without this.
>>>
>>
>> -> When I checked the mask value, I knew that unwanted bit is set.
>>
>> Test code without cpumask_clear.
>>
>> +       cpumask_set_cpu(0, &mask_val);
>> +       cpulist_scnprintf(buf, 64, &mask_val);
>> +       printk("--ID [ %d] = %s \n", id, buf);
>> +       th_zone->cool_dev[id] = cpufreq_cooling_register(&mask_val);
>>
>>
>> Console message-> 4.861157] [c6] --ID [ 1] = 0,4-5,7 (4,5,7 cpu bit was set.)
>>
>> And when I tried to register two cooling devices with cpumask_set_cpu(0, &mask_val) and cpumask_set_cpu(4, &mask_val).
>>
>> I found that cpu 0 bit is also set in latter cpumask. (I hope latter cpumask has a cpu 4 bit.)
>>
>> So I think that cpumask_clear should be inserted.
>
> I believe Sachin's concern was related to your patch description. A good
> description should say what the patch changes and what is the rationale
> behind this change. Also for fixes it is a good practice to specify
> observed issues in patch description as well.

Yes, that is correct. Sorry if it wasn't clear in my previous mail.

-- 
Regards,
Sachin.
