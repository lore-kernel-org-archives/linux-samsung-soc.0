From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 5/8] ARM: EXYNOS: Support secondary CPU boot of Exynos3250
Date: Thu, 17 Apr 2014 17:04:33 +0900
Message-ID: <534F8B11.8090808@samsung.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
 <1397527192-21988-6-git-send-email-cw00.choi@samsung.com>
 <534E9374.6010807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49357 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751143AbaDQIEb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 04:04:31 -0400
In-reply-to: <534E9374.6010807@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hi Tomasz,

On 04/16/2014 11:28 PM, Tomasz Figa wrote:
> Hi Chanwoo,
> 
> On 15.04.2014 03:59, Chanwoo Choi wrote:
>> This patch fix the offset of CPU boot address and don't operate smc call
>> of SMC_CMD_CPU1BOOT command for Exynos3250.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-exynos/firmware.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
>> index aa01c42..6205d4f 100644
>> --- a/arch/arm/mach-exynos/firmware.c
>> +++ b/arch/arm/mach-exynos/firmware.c
>> @@ -30,13 +30,16 @@ static int exynos_do_idle(void)
>>
>>   static int exynos_cpu_boot(int cpu)
>>   {
>> +    if (soc_is_exynos3250()) {
>> +        return 0;
> 
> This is strange. How the firmware knows when to boot the CPU then, if CPU1BOOT command is not called?

As I knew, Exynos3250 doesn't need smc for secondary boot
because WFE in secure mode for Exynos3250 is removed.
So, Exynos3250 doesn't need to send IPI_WAKEUP after call_firmware_op(cpu_boot, ...).

Best Regards,
Chanwoo Choi
