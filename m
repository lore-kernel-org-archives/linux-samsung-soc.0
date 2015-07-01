From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv3] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Thu, 02 Jul 2015 08:50:00 +0900
Message-ID: <55947CA8.5060407@samsung.com>
References: <1433161459-10901-1-git-send-email-chanho61.park@samsung.com>
 <556CF0E5.5060808@samsung.com>
 <CAPTzV15go4HVp0roO2f-b6ZCjgA1L_yABD7FE6bHiutAu1rM4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56942 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752901AbbGAXuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jul 2015 19:50:03 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NQU003HN27CFZ70@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Jul 2015 00:50:00 +0100 (BST)
In-reply-to: <CAPTzV15go4HVp0roO2f-b6ZCjgA1L_yABD7FE6bHiutAu1rM4A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, heesub.shin@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, b.zolnierkie@samsung.com, Chanho Park <chanho61.park@samsung.com>

On 01.07.2015 22:35, Chanho Park wrote:
> Hi,
> 
> On Tue, Jun 2, 2015 at 8:55 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 01.06.2015 21:24, Chanho Park wrote:
>>> The odroid-xu3 board which is based on exynos5422 not exynos5800 is
>>> booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
>>> is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
>>> cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
>>> and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
>>> cpu4-7 are cortex-a15.
>>>
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>> ---
>>> Change from v2:
>>>  - drop inclusion of exynos5420.dtsi from exynos5422-cpus.dtsi
>>>  - drop compatibles from exynos5422-cpus.dtsi
>>>
>>> Changes from v1:
>>>  - rename exynos5422.dtsi to exynos5422-cpus.dtsi
>>>  - include the dtsi file top of the exynos5422-odroidxu3.dts
>>>
>>>  arch/arm/boot/dts/exynos5422-cpus.dtsi     | 81 ++++++++++++++++++++++++++++++
>>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts |  4 +-
>>>  2 files changed, 84 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi
>>
>>
>> Looks good,
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Could you pick up this patch or should I request it to Kukjin?

I reviewed it already so Kukjin should pick it up with my tag.

Anyway it does not apply, probably because of changes in Odroid XU3 DTS
(a common DTSI was added).

Best regards,
Krzysztof
