From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: Add support for EXYNOS5410 SoC
Date: Sat, 26 Apr 2014 01:07:37 +0200
Message-ID: <535AEAB9.6020707@gmail.com>
References: <1397459860-21869-1-git-send-email-t.dakhran@samsung.com>	<1397459860-21869-2-git-send-email-t.dakhran@samsung.com>
 <7hwqedf2d5.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7hwqedf2d5.fsf@paris.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@linaro.org>, Tarek Dakhran <t.dakhran@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>, Romain Naour <romain.naour@openwide.fr>, Tarek Dakhran <t.dakhran@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kevin,

On 26.04.2014 00:52, Kevin Hilman wrote:
> Tarek Dakhran <t.dakhran@samsung.com> writes:
>
>> EXYNOS5410 is SoC in Samsung's Exynos5 SoC series.
>> Add initial support for this SoC.
>>
>> Signed-off-by: Tarek Dakhran <t.dakhran@samsung.com>
>> Signed-off-by: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> [...]
>
>> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
>> index 5eead53..83ae5fb 100644
>> --- a/arch/arm/mach-exynos/hotplug.c
>> +++ b/arch/arm/mach-exynos/hotplug.c
>> @@ -95,8 +95,8 @@ static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>>   	for (;;) {
>>
>>   		/* make cpu1 to be turned off at next WFI command */
>> -		if (cpu == 1)
>> -			__raw_writel(0, S5P_ARM_CORE1_CONFIGURATION);
>> +		if (cpu > 0)
>> +			__raw_writel(0, S5P_ARM_CORE_CONFIGURATION(cpu));
>
> This looks like a fix that's probably not specific to the 5410 and maybe
> deserves it's own patch?
>
> [...]
>
>> @@ -107,14 +111,14 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>>   	 */
>>   	write_pen_release(phys_cpu);
>>
>> -	if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
>> +	if (!(__raw_readl(S5P_ARM_CORE_STATUS(cpu)) & S5P_CORE_LOCAL_PWR_EN)) {
>>   		__raw_writel(S5P_CORE_LOCAL_PWR_EN,
>> -			     S5P_ARM_CORE1_CONFIGURATION);
>> +			     S5P_ARM_CORE_CONFIGURATION(cpu));
>>
>>   		timeout = 10;
>>
>>   		/* wait max 10 ms until cpu1 is on */
>> -		while ((__raw_readl(S5P_ARM_CORE1_STATUS)
>> +		while ((__raw_readl(S5P_ARM_CORE_STATUS(cpu))
>>   			& S5P_CORE_LOCAL_PWR_EN) != S5P_CORE_LOCAL_PWR_EN) {
>>   			if (timeout-- == 0)
>>   				break;
>
> ...and this hunk too?

Yes, they do, but we are currently refactoring this code anyway.

Best regards,
Tomasz
