From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv2 3/8] ARM: EXYNOS: Add IO mapping for PMU of Exynos3250
Date: Tue, 15 Apr 2014 17:32:40 +0900
Message-ID: <534CEEA8.6020800@samsung.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
 <1397527192-21988-4-git-send-email-cw00.choi@samsung.com>
 <4788081.xvaJfdGTMu@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <4788081.xvaJfdGTMu@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 04/15/2014 05:11 PM, Arnd Bergmann wrote:
> On Tuesday 15 April 2014 10:59:47 Chanwoo Choi wrote:
>> This patch add memory mapping for PMU (Power Management Unit) which is used
>> for power control of Exynos3250.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Arnd Bergmann suggested that need proper driver instead of static memory mapping.
>> As Chanho Park reply[2], Sachin Kamat already posted the DT support patch[1]
>> for memory mapping for SYSRAM.
>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg27647.html
>> [2] https://lkml.org/lkml/2014/4/10/161
>>
>> So, I'm going to re-implement following patch related to static memory mapping
>> after merged Sachin Kamat patch[1].
>>   ARM: EXYNOS: Add IO mapping for PMU of Exynos3250
> 
> I don't think we have a patch for the PMU yet, Sachin was looking at the SYSRAM
> only.

You are right. Sachin's patch only included the solution of SYSRAM memory mapping.
I set out the plan that I would implment proper driver for PMU memory mapping
instead of static method after merged Sachin's patch for SYSRAM.

But,
If you'd like me to implment PMU memory mapping instead of static mapping right now,
I'll implement it for PMU such as Sachin's patch on next posting(v3).

Thanks for your review.

Best Regards,
Chanwoo Choi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
