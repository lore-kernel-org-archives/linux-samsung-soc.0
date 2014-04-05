From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 06/10] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Sat, 05 Apr 2014 19:53:53 +0900
Message-ID: <533FE0C1.6070207@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
 <1396425058-4012-7-git-send-email-pankaj.dubey@samsung.com>
 <533BF905.6070701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <533BF905.6070701@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Young-Gun Jang <yg1004.jang@samsung.com>, chow.kim@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/02/2014 08:48 PM, Sylwester Nawrocki wrote:
> On 02/04/14 09:50, Pankaj Dubey wrote:
>> From: Young-Gun Jang <yg1004.jang@samsung.com>
>>
>> Add support for mapping Exynos Power Management Unit (PMU) base address
>> from device tree. Code will use existing samsung pmu binding information.
>> This patch also adds "get_exynos_pmubase" a helper function to return mapped base
>> address to various other files under "mach-exynos".
>>
>> Signed-off-by: Young-Gun Jang <yg1004.jang@samsung.com>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/common.h |    2 ++
>>   arch/arm/mach-exynos/exynos.c |   44 +++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 46 insertions(+)
>>
> [...]
>>   #endif /* __ARCH_ARM_MACH_EXYNOS_COMMON_H */
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index a5e1349..a5127fb 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -35,6 +35,8 @@
>>   #define L2_AUX_VAL 0x7C470001
>>   #define L2_AUX_MASK 0xC200ffff
>>   
>> +static void __iomem *exynos_pmu_base __initdata;
>> +
>>   static struct map_desc exynos4_iodesc[] __initdata = {
>>   	{
>>   		.virtual	= (unsigned long)S3C_VA_SYS,
>> @@ -245,6 +247,47 @@ void __init exynos_init_late(void)
>>   	exynos_pm_init();
>>   }
>>   
>> +static char const *exynos_dt_pmu_match[] __initconst = {
>> +	"samsung,exynos4210-pmu",
>> +	"samsung,exynos4212-pmu",
>> +	"samsung,exynos4412-pmu",
>> +	"samsung,exynos5250-pmu",
>> +	NULL
>> +};
>> +
>> +static int __init exynos_fdt_map_pmu(unsigned long node,
>> +		const char *uname, int depth, void *data)
>> +{
>> +	struct map_desc iodesc;
>> +	__be32 *reg;
>> +	unsigned long len;
>> +
>> +	if (of_flat_dt_match(node, exynos_dt_pmu_match)) {
>> +		phys_addr_t phys_addr;
>> +		reg = of_get_flat_dt_prop(node, "reg", &len);
>> +		if (reg == NULL || len != (sizeof(unsigned long) * 2))
>> +			return 0;
>> +
>> +		phys_addr = be32_to_cpu(reg[0]);
>> +		iodesc.pfn = __phys_to_pfn(phys_addr);
>> +		iodesc.length = be32_to_cpu(reg[1]) - 1;
>> +		iodesc.virtual = (unsigned long)S5P_VA_PMU;
>> +		iodesc.type = MT_DEVICE;
>> +		iotable_init(&iodesc, 1);
> Are you sure...you need this in addition to ioremap() below ?
> Can't you just use the Linux syscon API ?
> There were some patches posted for syscon to make it available in earlier
> system initialization stage: https://lkml.org/lkml/2014/2/19/218
Thanks for review and suggestion.

We need ioremap() in addition to iotable_init to get virtual address,
which will be used by other files also for read/write PMU registers.

Regarding syscon early initialization, since I was not aware of any such
patch earlier I have not used it. But after you suggested I tried it and
modified this implementation to use syscon API and regmap API and it's
working fine.
I will wait for review of other patches in this series and status of above
mentioned syscon API based on that I will update this in next revision.

>> +		exynos_pmu_base = ioremap(phys_addr, be32_to_cpu(reg[1]));
>> +		if (WARN_ON(!exynos_pmu_base))
>> +			return -EFAULT;
>> +	}
>> +
>> +	return 0;
>> +}
> --
> Thanks,
> Sylwester
>


-- 
Best Regards,
Pankaj Dubey
