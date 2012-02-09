From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] [CPUFREQ] EXYNOS: Initialize locking_frequency with initial
 frequency
Date: Thu, 09 Feb 2012 10:12:50 +0530
Message-ID: <4F334ECA.5000507@linaro.org>
References: <1327466713-29101-1-git-send-email-tushar.behera@linaro.org> <4F291D44.4040502@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62133 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756693Ab2BIEm4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Feb 2012 23:42:56 -0500
In-Reply-To: <4F291D44.4040502@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com, jc.lee@samsung.com, myungjoo.ham@samsung.com

Ping

On 02/01/2012 04:38 PM, Tushar Behera wrote:
> Ping
> 
> On 01/25/2012 10:15 AM, Tushar Behera wrote:
>> As per definition, locking_frequency is the initial frequency which is
>> set by boot-loader. Hence the value is updated with the initial value
>> during boot time init call.
>>
>> This code was present in exynos210-cpufreq.c before this consolidation
>> patch.
>> - a125a17fa61a ([CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver).
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
>> ---
>> The patch is based on v3.3-rc1.
>>
>>  drivers/cpufreq/exynos-cpufreq.c |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
>> index 5467879..7cfb516 100644
>> --- a/drivers/cpufreq/exynos-cpufreq.c
>> +++ b/drivers/cpufreq/exynos-cpufreq.c
>> @@ -210,6 +210,8 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
>>  
>>  	cpufreq_frequency_table_get_attr(exynos_info->freq_table, policy->cpu);
>>  
>> +	locking_frequency = exynos_getspeed(0);
>> +
>>  	/* set the transition latency value */
>>  	policy->cpuinfo.transition_latency = 100000;
>>  
> 
> 


-- 
Tushar Behera
