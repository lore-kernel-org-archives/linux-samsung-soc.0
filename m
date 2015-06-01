From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCHv2] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Mon, 1 Jun 2015 21:18:08 +0900
Message-ID: <CAPTzV16p1wdjiQoSBc5RA1S2jvLH4of2jyT=KsZP7SbidtuFHg@mail.gmail.com>
References: <1433082867-32359-1-git-send-email-chanho61.park@samsung.com>
	<556BA64E.9070404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:34742 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357AbbFAMSJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 08:18:09 -0400
Received: by ykfl8 with SMTP id l8so42980656ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 05:18:08 -0700 (PDT)
In-Reply-To: <556BA64E.9070404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: kgene@kernel.org, jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Chanho Park <chanho61.park@samsung.com>

Hi,

On Mon, Jun 1, 2015 at 9:24 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 31.05.2015 23:34, Chanho Park wrote:
>> The odroid-xu3 board which is based on exynos5422 not exynos5800 is
>> booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
>> is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
>> cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
>> and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
>> cpu4-7 are cortex-a15.
>>
>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>> ---
>> Changes from v1:
>>  - rename exynos5422.dtsi to exynos5422-cpus.dtsi
>>  - include the dtsi file top of the exynos5422-odroidxu3.dts
>>
>>  arch/arm/boot/dts/exynos5422-cpus.dtsi     | 88 ++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts |  4 +-
>>  2 files changed, 91 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-cpus.dtsi b/arch/arm/boot/dts/exynos5422-cpus.dtsi
>> new file mode 100644
>> index 0000000..d39db49
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5422-cpus.dtsi
>> @@ -0,0 +1,88 @@
>> +/*
>> + * SAMSUNG EXYNOS5422 SoC cpu device tree source
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>> + *           http://www.samsung.com
>> + *
>> + * The only difference between EXYNOS5422 and EXYNOS5800 is cpu ordering. The
>> + * EXYNOS5422 is booting from Cortex-A7 core while the EXYNOS5800 is booting
>> + * from Cortex-A15 core.
>> + *
>> + * EXYNOS5422 based board files can include this file to provide cpu ordering
>> + * which could boot a cortex-a7 from cpu0.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include "exynos5420.dtsi"
>> +
>> +/ {
>> +     compatible = "samsung,exynos5800", "samsung,exynos5422",
>> +                  "samsung,exynos5";
>> +};
>
> Drop the include and compatible.
>
> The goal of the file is to override only cpus, not to introduce whole
> Exynos5420 node tree.
>
> The exynos5420.dtsi is already included by board file through
> exynos5800.dtsi.

Actually, I concerned when someone want to change cpu nodes of the
exynos5420.dtsi file, he need to take care of the exynos5422-cpu.dtsi.
Yes. it's just override values. I'll drop the inclusion and
compatibles.

Thanks.

-- 
Best Regards,
Chanho Park
