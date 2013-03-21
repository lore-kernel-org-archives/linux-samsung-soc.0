From: Alexander Graf <agraf@suse.de>
Subject: Re: [PATCH 3/3] ARM: EXYNOS5250: Register architected timers
Date: Thu, 21 Mar 2013 16:40:55 +0100
Message-ID: <FA105342-1A3A-41E5-87B2-31E9802AD31D@suse.de>
References: <1363222742-15220-1-git-send-email-agraf@suse.de> <1363222742-15220-4-git-send-email-agraf@suse.de> <51421FDA.8070507@cogentembedded.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38273 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753703Ab3CUPlA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Mar 2013 11:41:00 -0400
In-Reply-To: <51421FDA.8070507@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu


On 14.03.2013, at 20:07, Sergei Shtylyov wrote:

> Hello.
> 
> On 14-03-2013 4:59, Alexander Graf wrote:
> 
>> When running on an exynos 5250 SoC, we don't initialize the architected
>> timers. The chip however supports architected timers.
> 
>> When we don't initialize them, KVM will try to access them and run into
>> NULL pointer dereferences attempting to do so.
> 
>> This patch is really more of a hack than a real fix, but does get me
>> working with KVM on Arndale.
> 
>> Signed-off-by: Alexander Graf <agraf@suse.de>
>> ---
>>  arch/arm/mach-exynos/mct.c |    4 ++++
>>  1 file changed, 4 insertions(+)
> 
>> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
>> index c9d6650..eefb8af 100644
>> --- a/arch/arm/mach-exynos/mct.c
>> +++ b/arch/arm/mach-exynos/mct.c
>> @@ -482,4 +482,8 @@ void __init exynos4_timer_init(void)
>>  	exynos4_timer_resources();
>>  	exynos4_clocksource_init();
>>  	exynos4_clockevent_init();
>> +
>> +	if (soc_is_exynos5250()) {
>> +		arch_timer_of_register();
>> +	}
> 
>   {} not needed here. scripts/checkpatch.pl should probabl;y warn about it.

Yeah, I'd leave it to whoever wants to apply this patch to remove the braces :). IMHO it's not worth it to respin just for this.


Alex
