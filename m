From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RESEND][PATCH] ARM: Exynos4: fixed SYSMMU setup definition to
 mate parameter name
Date: Mon, 27 Aug 2012 11:11:08 -0700
Message-ID: <503BB83C.8030501@samsung.com>
References: <1346050903-4450-1-git-send-email-sw0312.kim@samsung.com>	<1346051491-5131-1-git-send-email-sw0312.kim@samsung.com> <CAHQjnONVGq4faWbwg8C+fA4MFKQH1CWarJueLjdgU2ebYwFbGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40117 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806Ab2H0SLO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 14:11:14 -0400
Received: by dady13 with SMTP id y13so2706119dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 11:11:14 -0700 (PDT)
In-Reply-To: <CAHQjnONVGq4faWbwg8C+fA4MFKQH1CWarJueLjdgU2ebYwFbGw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On 08/27/12 04:59, KyongHo Cho wrote:
> On Mon, Aug 27, 2012 at 4:11 PM, Seung-Woo Kim<sw0312.kim@samsung.com>  wrote:
>> This is trivial patch to mate parameter name between iommu api enabled case and
>> disabled case.
>>
>> Signed-off-by: Seung-Woo Kim<sw0312.kim@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>> Sorry about typo in previous patch.
>>
>>   arch/arm/mach-exynos/include/mach/sysmmu.h |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/sysmmu.h b/arch/arm/mach-exynos/include/mach/sysmmu.h
>> index 998daf2..81e4c66 100644
>> --- a/arch/arm/mach-exynos/include/mach/sysmmu.h
>> +++ b/arch/arm/mach-exynos/include/mach/sysmmu.h
>> @@ -58,7 +58,7 @@ static inline void platform_set_sysmmu(
>>   #endif
>>
>>   #else /* !CONFIG_EXYNOS_DEV_SYSMMU */
>> -#define platform_set_sysmmu(dev, sysmmu) do { } while (0)
>> +#define platform_set_sysmmu(sysmmu, dev) do { } while (0)
>>   #endif
>>
>
> Thank you for your correction.
>

OK, applied with KyongHo's ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
