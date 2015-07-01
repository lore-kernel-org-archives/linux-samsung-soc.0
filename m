From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCHv3] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Wed, 1 Jul 2015 22:35:06 +0900
Message-ID: <CAPTzV15go4HVp0roO2f-b6ZCjgA1L_yABD7FE6bHiutAu1rM4A@mail.gmail.com>
References: <1433161459-10901-1-git-send-email-chanho61.park@samsung.com>
	<556CF0E5.5060808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:33481 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076AbbGANfJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jul 2015 09:35:09 -0400
Received: by igcur8 with SMTP id ur8so91322998igc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2015 06:35:06 -0700 (PDT)
In-Reply-To: <556CF0E5.5060808@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, heesub.shin@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, b.zolnierkie@samsung.com, Chanho Park <chanho61.park@samsung.com>

Hi,

On Tue, Jun 2, 2015 at 8:55 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 01.06.2015 21:24, Chanho Park wrote:
>> The odroid-xu3 board which is based on exynos5422 not exynos5800 is
>> booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
>> is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
>> cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
>> and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
>> cpu4-7 are cortex-a15.
>>
>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>> ---
>> Change from v2:
>>  - drop inclusion of exynos5420.dtsi from exynos5422-cpus.dtsi
>>  - drop compatibles from exynos5422-cpus.dtsi
>>
>> Changes from v1:
>>  - rename exynos5422.dtsi to exynos5422-cpus.dtsi
>>  - include the dtsi file top of the exynos5422-odroidxu3.dts
>>
>>  arch/arm/boot/dts/exynos5422-cpus.dtsi     | 81 ++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts |  4 +-
>>  2 files changed, 84 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi
>
>
> Looks good,
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Best regards,
> Krzysztof
>

Could you pick up this patch or should I request it to Kukjin?

-- 
Best Regards,
Chanho Park
