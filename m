From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 04/27] ARM: EXYNOS: Support secondary CPU boot of Exynos4212
Date: Fri, 11 Apr 2014 14:14:01 +0900
Message-ID: <53477A19.6070509@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
 <1397122658-16013-5-git-send-email-cw00.choi@samsung.com>
 <20140411014424.GA14934@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12679 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753037AbaDKFOB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 01:14:01 -0400
In-reply-to: <20140411014424.GA14934@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

On 04/11/2014 10:44 AM, Olof Johansson wrote:
> On Thu, Apr 10, 2014 at 06:37:15PM +0900, Chanwoo Choi wrote:
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> This patch fix the offset of CPU boot address and change parameter of smc call
>> of SMC_CMD_CPU1BOOT command for Exynos4212.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/mach-exynos/firmware.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
>> index 932129e..91a911d 100644
>> --- a/arch/arm/mach-exynos/firmware.c
>> +++ b/arch/arm/mach-exynos/firmware.c
>> @@ -18,6 +18,8 @@
>>  
>>  #include <mach/map.h>
>>  
>> +#include <plat/cpu.h>
>> +
>>  #include "smc.h"
>>  
>>  static int exynos_do_idle(void)
>> @@ -28,14 +30,22 @@ static int exynos_do_idle(void)
>>  
>>  static int exynos_cpu_boot(int cpu)
>>  {
>> -	exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
>> +	if (soc_is_exynos4212())
>> +		exynos_smc(SMC_CMD_CPU1BOOT, 0, 0, 0);
>> +	else
>> +		exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
> 
> 	/* <explain why you need this special case on 4212> */

It's better to ask system lsi person. We don't know it well.
I got the guide about secondary boot from system lsi.
But, this patch was completely tested.

> 	if (soc_is_exynos4212())
> 		cpu = 0;
> 
> ...and then do the call as before.

OK, I'll modify it as following:

 static int exynos_cpu_boot(int cpu)
 {
+       if (soc_is_exynos4212())
+               cpu = 0;
+
        exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
        return 0;
 }

> 
> 
>>  	return 0;
>>  }
>>  
>>  static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
>>  {
>> -	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
>> +	void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
>>  
>> +	if (soc_is_exynos4212())
>> +		goto out;
>> +	else
>> +		boot_reg += 4*cpu;
> 
> 	if (!soc_is_exynos4212())
> 		boot_reg += 4 * cpu;
> 
> That way you avoid a goto, especially since the "goto out" isn't actually
> an "out", it's still doing stuff at the end of the funciton.
> 

OK, I'll remove goto statement and then modify it as your comment.

-       void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
+       void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
+
+       if (!soc_is_exynos4212())
+               boot_reg += 4*cpu;

Best Regards,
Chanwoo Choi
