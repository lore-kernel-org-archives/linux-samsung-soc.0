From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 1/2] ARM: EXYNOS: Add EXYNOS4415 SoC ID
Date: Tue, 28 Oct 2014 13:05:04 +0900
Message-ID: <544F15F0.9080102@samsung.com>
References: <1414373759-4362-1-git-send-email-cw00.choi@samsung.com>
 <1414373759-4362-2-git-send-email-cw00.choi@samsung.com>
 <02b501cff262$127d44b0$3777ce10$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <02b501cff262$127d44b0$3777ce10$@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, yj44.cho@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Dear Kukjin,

On 10/28/2014 12:48 PM, Kukjin Kim wrote:
> Chanwoo Choi wrote:
>>
>> This patch add Exynos4415's SoC ID.
>>
> Since the CPU ID has been removed as per comments, need to update the commit
> message accordingly.

OK, I'll update it.

> 
>> Exynos4415 is based on the 32-bit RISC
>> processor for Smartphone. Exynos4415 uses Cortex A9 quad-cores and has a target
>> speed of 1.6GHz and provides 8.5GB/s memory bandwidth.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/mach-exynos/Kconfig  | 5 +++++
>>  arch/arm/mach-exynos/exynos.c | 2 ++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 46f3c0d..349c867 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -75,6 +75,11 @@ config SOC_EXYNOS4412
>>  	default y
>>  	depends on ARCH_EXYNOS4
>>
>> +config SOC_EXYNOS4415
>> +	bool "SAMSUNG EXYNOS4415"
>> +	default y
>> +	depends on ARCH_EXYNOS4
>> +
> 
> I think, this is not required more...

But,
The clock driver must need to CONFIG_SOC_EXYNOS4415 configuration
to build it. The clock driver[1] of exynos4415 used CONFIG_SOC_EXYNOS4415 as following diff:
  [1] https://lkml.org/lkml/2014/10/26/159

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 8909c93..4561297 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
 obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
 obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
+obj-$(CONFIG_SOC_EXYNOS4415)	+= clk-exynos4415.o

Best Regards,
Chanwoo Choi
