From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 3/9] soc: samsung: Add Exynos Adaptive Supply Voltage
 driver
Date: Thu, 8 Aug 2019 14:07:36 +0200
Message-ID: <a56fe2d8-1f26-b462-1564-f23902f7dbb5@samsung.com>
References: <CGME20190718143130eucas1p26f2058f47eb2f4020e1ddbf1619d1ac8@eucas1p2.samsung.com>
        <20190718143044.25066-1-s.nawrocki@samsung.com>
        <20190718143044.25066-4-s.nawrocki@samsung.com>
        <CAJKOXPeOfDHjqSotxVwVuy+6r9X3Q8ZXLit1_=gGd7bOwkHupA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeOfDHjqSotxVwVuy+6r9X3Q8ZXLit1_=gGd7bOwkHupA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 7/23/19 15:38, Krzysztof Kozlowski wrote:
> On Thu, 18 Jul 2019 at 16:31, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>>
>> The Adaptive Supply Voltage (ASV) driver adjusts CPU cluster operating
>> points depending on exact revision of an SoC retrieved from the CHIPID
>> block or the OTP memory.  This allows for some power saving as for some
>> CPU clock frequencies we can lower CPU cluster supply voltage comparing
>> to safe values common to the all chip revisions.
>>
>> This patch adds support for Exynos5422/5800 SoC, it is partially based
>> on code from https://github.com/hardkernel/linux repository,
>> branch odroidxu4-4.14.y, files: arch/arm/mach-exynos/exynos5422-asv.[ch].
>>
>> Tested on Odroid XU3, XU4, XU3 Lite.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>> Changes since v1 (RFC):
>>  - removed code for parsing the ASV OPP tables from DT, the ASV OPP tables
>>    moved to the driver;
>>  - converted to use the regmap API;
>>  - converted to normal platform driver.
>> ---
>>  drivers/soc/samsung/Kconfig          |  11 +
>>  drivers/soc/samsung/Makefile         |   3 +
>>  drivers/soc/samsung/exynos-asv.c     | 185 ++++++++++
>>  drivers/soc/samsung/exynos-asv.h     |  82 +++++
>>  drivers/soc/samsung/exynos5422-asv.c | 499 +++++++++++++++++++++++++++
>>  drivers/soc/samsung/exynos5422-asv.h |  25 ++
>>  6 files changed, 805 insertions(+)
>>  create mode 100644 drivers/soc/samsung/exynos-asv.c
>>  create mode 100644 drivers/soc/samsung/exynos-asv.h
>>  create mode 100644 drivers/soc/samsung/exynos5422-asv.c
>>  create mode 100644 drivers/soc/samsung/exynos5422-asv.h
>>
>> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
>> index 2905f5262197..539cd95dd176 100644
>> --- a/drivers/soc/samsung/Kconfig
>> +++ b/drivers/soc/samsung/Kconfig
>> @@ -7,6 +7,17 @@ menuconfig SOC_SAMSUNG
>>
>>  if SOC_SAMSUNG
>>
>> +config EXYNOS_ASV
>> +       bool "Exynos Adaptive Supply Voltage support" if COMPILE_TEST
>> +       depends on ARCH_EXYNOS || COMPILE_TEST
>> +       depends on EXYNOS_CHIPID
> 
> (ARCH_EXYNOS && EXYNOS_CHIPID) || COMPILE_TEST

OK
>> +       select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
>> +
>> +# There is no need to enable these drivers for ARMv8
>> +config EXYNOS_ASV_ARM
>> +       bool "Exynos ASV ARMv7-specific driver extensions" if COMPILE_TEST
>> +       depends on EXYNOS_ASV

>> diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
>> new file mode 100644
>> index 000000000000..b1a7e0ba8870
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-asv.c
>> @@ -0,0 +1,185 @@

>> +static int exynos_asv_probe(struct platform_device *pdev)
>> +{
>> +       int (*probe_func)(struct exynos_asv *asv);
>> +       struct exynos_asv *asv;
>> +       struct device *cpu_dev;
>> +       u32 product_id = 0;
>> +       int ret, i;
>> +
>> +       cpu_dev = get_cpu_device(0);
>> +       ret = dev_pm_opp_get_opp_count(cpu_dev);
>> +       if (ret < 0)
>> +               return -EPROBE_DEFER;
>> +
>> +       asv = kcalloc(1, sizeof(*asv), GFP_KERNEL);
>> +       if (!asv)
>> +               return -ENOMEM;
>> +
>> +       asv->chipid_regmap = syscon_node_to_regmap(pdev->dev.of_node);
>> +       if (IS_ERR(asv->chipid_regmap)) {
>> +               dev_err(&pdev->dev, "Could not find syscon regmap\n");
> 
> Here and in following error-paths - kfree().

Thanks, I will fix that.

>> +               return PTR_ERR(asv->chipid_regmap);
>> +       }
>> +
>> +       regmap_read(asv->chipid_regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);

>> +module_platform_driver(exynos_asv_driver);
>> diff --git a/drivers/soc/samsung/exynos-asv.h b/drivers/soc/samsung/exynos-asv.h
>> new file mode 100644
>> index 000000000000..d0a5d603093d
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-asv.h
>> @@ -0,0 +1,82 @@

>> +#ifndef _EXYNOS_ASV_H
>> +#define _EXYNOS_ASV_H
> 
> Here and in other header use prefix:
> __LINUX_SOC_
> (just like the existing exynos-pmu.h)

OK, I will change that.

>> +struct exynos_asv_subsys {
>> +       struct exynos_asv *asv;
>> +       char *cpu_dt_compat;
> 
> const char *

OK
>> +       int id;

>> +#endif /* _EXYNOS_ASV_H */
>> diff --git a/drivers/soc/samsung/exynos5422-asv.c b/drivers/soc/samsung/exynos5422-asv.c
>> new file mode 100644
>> index 000000000000..5fd673a6a733
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos5422-asv.c
>> @@ -0,0 +1,499 @@

>> +#include <linux/bitrev.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
> 
> Looks unused.

Indeed, I will drop it.

>> +static unsigned int exynos5422_asv_parse_table(struct exynos_asv *asv,
>> +                                     unsigned int pkg_id)
>> +{
>> +       return (pkg_id >> EXYNOS5422_TABLE_OFFSET) & EXYNOS5422_TABLE_MASK;
>> +}
>> +
>> +static bool exynos5422_asv_parse_bin2(struct exynos_asv *asv,
>> +                                    unsigned int pkg_id)
>> +{
>> +       return (pkg_id >> EXYNOS5422_BIN2_OFFSET) & EXYNOS5422_BIN2_MASK;
> 
> return !!() for converting to boolean.

I'm not convinced it is needed, the return type of the function is bool
and value of the expression will be implicitly converted to that type.
Is there any compiler warning related to that?

>> +}
>> +
>> +static bool exynos5422_asv_parse_sg(struct exynos_asv *asv,
>> +                                       unsigned int pkg_id)
>> +{
>> +       return ((pkg_id >> EXYNOS5422_USESG_OFFSET) & EXYNOS5422_USESG_MASK);
> 
> Unneeded () over entire statement.

Will drop it.

-- 
Regards,
Sylwester
