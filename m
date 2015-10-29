From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 11:11:41 +0900
Message-ID: <5631805D.9070007@samsung.com>
References: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
 <56317960.9070608@samsung.com>
 <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47382 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbbJ2CLr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 22:11:47 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWY008R2M3KMHA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 02:11:44 +0000 (GMT)
In-reply-to: <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene@kernel.org>

On 29.10.2015 11:06, Pankaj Dubey wrote:
> Hi Pavel,
> 
> On 29 October 2015 at 07:11, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> On 28.10.2015 18:36, Pavel Fedin wrote:
>>> Since 8cfc7fdd33080e30b86d21b1a8c9ad0686427ddc ("ARM: EXYNOS: move restart
>>
>> This should be sufficient (although full is okay as well):
>> $ git config core.abbrev 12
>>
>>> code into pmu driver") PMU support is required in order for the reboot to
>>> work. Unfortunately, there is currently no PMU support for 5410.
>>>
>>> This patch adds exynos5410-pmu to the list of recognized devices. It is
>>> okay for the code to have empty struct exynos_pmu_data, in this case only
>>> minimal support is enabled. This is enough for SWRESET to work.
>>>
>>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>>
>> This definitely looks like a fix for a regression, so:
>> Cc: <stable@vger.kernel.org>
>> Fixes: 8cfc7fdd3308 ("ARM: EXYNOS: move restart code into pmu driver")
>>
>>> ---
>>>  arch/arm/mach-exynos/pmu.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
>>> index de68938..7b9e33c 100644
>>> --- a/arch/arm/mach-exynos/pmu.c
>>> +++ b/arch/arm/mach-exynos/pmu.c
>>> @@ -908,6 +908,10 @@ static const struct exynos_pmu_data exynos5250_pmu_data = {
>>>       .powerdown_conf = exynos5_powerdown_conf,
>>>  };
>>>
>>> +static struct exynos_pmu_data exynos5410_pmu_data = {
>>> +     /* Only SWRESET is currently supported on 5410 */
>>> +};
>>
>> static const struct
>>
>> With these changes:
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>>
> 
> Patch looks ok, but after Alim's patch series [1] to handle poweroff
> and reboot via generic syscon based driver gets merged, this will
> become redundant entry into PMU driver in the absence of any PMU  data
> for Exynos5410. Alim has taken care of adding power-off and reboot
> device node in exynos5410.dtsi [2].
> 
> [1]: http://www.spinics.net/lists/devicetree/msg98858.html
> [2]: http://www.spinics.net/lists/devicetree/msg98862.html
> 

Yes, current patch makes sense only if it gets into fixes for current RC
and then backported to stable kernels. Alim's patchset won't be backported.

Best regards,
Krzysztof
