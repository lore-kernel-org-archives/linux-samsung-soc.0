From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Use of_machine_is_compatible instead ofsoc_is_exynos4
Date: Thu, 14 May 2015 13:37:35 +0900
Message-ID: <CAJKOXPe4cfcWOQjpwnoR56wOGwH6ezuQzWjsfYkXiMdgkd7gxQ@mail.gmail.com>
References: <1431307646-10779-1-git-send-email-k.kozlowski@samsung.com>
	<1431307646-10779-2-git-send-email-k.kozlowski@samsung.com>
	<55540B4F.6060607@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:34236 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932942AbbENEhg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 00:37:36 -0400
In-Reply-To: <55540B4F.6060607@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

2015-05-14 11:41 GMT+09:00 Kukjin Kim <kgene@kernel.org>:
> On 05/11/15 10:27, Krzysztof Kozlowski wrote:
>> of_machine_is_compatible() seems to be preferred over soc_is_exynos4().
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> ---
>> Changes since v2:
>> 1. New patch, requested by Kukjin Kim.
>> ---
>>  arch/arm/mach-exynos/exynos.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index c3bfbba3006d..5917a30eee33 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -179,7 +179,7 @@ static void __init exynos_init_io(void)
>>   */
>>  void exynos_set_delayed_reset_assertion(bool enable)
>>  {
>> -     if (soc_is_exynos4()) {
>> +     if (of_machine_is_compatible("samsung,exynos4")) {
>>               unsigned int tmp, core_id;
>>
>>               for (core_id = 0; core_id < num_possible_cpus(); core_id++) {
>
> Maybe we need to change the compatible for exynos4415.dtsi? because no
> exynos4 in the compatible...Applied, anyway.

It could be quite significant change and each path checking for
compatibility with exynos4 should be tested. There is no board DTS for
Exynos4415 so I am not quite convinced that we should care about it.

Best regards,
Krzysztof
