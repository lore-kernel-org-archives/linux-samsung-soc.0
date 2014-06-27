From: Laura Abbott <lauraa@codeaurora.org>
Subject: Re: mainline boot: 64 boots: 62 pass, 2 fail (v3.16-rc1-2-gebe0618)
Date: Fri, 27 Jun 2014 02:09:58 -0700
Message-ID: <53AD34E6.8000302@codeaurora.org>
References: <53A2AE11.2050208@gmail.com> <53A2BE94.2010308@gmail.com> <53A7A579.4010702@gmail.com> <CAGa+x85H510fNGTXJHGYfQybRa2FGgg2NyCgJ8rmjJ6TE7GNbA@mail.gmail.com> <53A9B99F.4040806@codeaurora.org> <53A9FBB5.60709@codeaurora.org> <53AABCF5.4050403@gmail.com> <53AB45D1.90909@codeaurora.org> <53ABC13C.8030908@gmail.com> <CAGa+x84UTbmFc2Twg9zEcr+ZP2xsq68gFvk=385+_cFM5hvGHg@mail.gmail.com> <20140626151756.GU32514@n2100.arm.linux.org.uk> <53AC77A2.4090207@codeaurora.org> <53ACDFC2.5020206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:48185 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753227AbaF0JKB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 05:10:01 -0400
In-Reply-To: <53ACDFC2.5020206@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, kernel-build-reports@lists.linaro.org

On 6/26/2014 8:06 PM, Tushar Behera wrote:
> On 06/27/2014 01:12 AM, Laura Abbott wrote:
>
>>
>> +static unsigned int bank_cnt;
>> +static unsigned int max_cnt;
>> +
>>   int __init arm_add_memory(u64 start, u64 size)
>>   {
>>   	u64 aligned_start;
>>
>>   	/*
>> +	 * Some buggy bootloaders rely on the old meminfo behavior of not adding
>> +	 * more than n banks since anything past that may contain invalid data.
>> +	 */
>> +	if (bank_cnt >= max_cnt) {
>> +		pr_crit("Max banks too low, ignoring memory at 0x%08llx\n",
>> +			(long long)start);
>> +		return -EINVAL;
>> +	}
>> +
>> +	bank_cnt++;
>> +
>> +	/*
>>   	 * Ensure that start/size are aligned to a page boundary.
>>   	 * Size is appropriately rounded down, start is rounded up.
>>   	 */
>> @@ -879,6 +894,7 @@ void __init setup_arch(char **cmdline_p)
>>   		mdesc = setup_machine_tags(__atags_pointer, __machine_arch_type);
>>   	machine_desc = mdesc;
>>   	machine_name = mdesc->name;
>> +	max_cnt = mdesc->bank_limit;
>
> arm_add_memory is getting called before this is being set, resulting in
> none of the memory banks getting added[1].
>
> setup_machine_fdt -> early_init_dt_scan -> early_init_dt_scan_memory
>
> Would it make sense to re-introduce the config option ARM_NR_BANKS and
> replace max_cnt with NR_BANKS?
>
> [1] http://pastebin.com/MawYD7kb
>

I was hoping to avoid re-introducing the config option but that may be
the case if we can't make the machine_info work. I'll take a better
look tomorrow.

Thanks,
Laura


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
