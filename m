From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix soft reboot hang after suspend/resume
Date: Mon, 14 May 2012 14:12:30 +0530
Message-ID: <CAG17yqQ8o3mDCP2k0OE5PG2SXWTyWDh+_xbvKjnvmrgkxqKgZg@mail.gmail.com>
References: <1332929866-31489-1-git-send-email-inderpal.singh@linaro.org>
	<065f01cd31a9$c5f38f80$51daae80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:46117 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754489Ab2ENImb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 04:42:31 -0400
Received: by obbtb18 with SMTP id tb18so7130886obb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 May 2012 01:42:30 -0700 (PDT)
In-Reply-To: <065f01cd31a9$c5f38f80$51daae80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: samsung@lists.linaro.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Hi Kukjin,

On 14 May 2012 13:45, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Inderpal Singh wrote:
>>
>> Upon wake-up, clear the sleep mode set in INFORM1 register.
>>
> Is this for wake-up or _really_ software reset? And is this available=
 on all
> of EXYNOS4 SoCs?

This is for soft reboot hang after one cycle of suspend/resume is compl=
ete.
And yes this is applicable for all exynos SOCs.

With Regards,
Inder

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/pm.c | =A0 =A04 ++++
>> =A01 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>> index f0bb467..16cba3f 100644
>> --- a/arch/arm/mach-exynos/pm.c
>> +++ b/arch/arm/mach-exynos/pm.c
>> @@ -381,6 +381,10 @@ static void exynos4_pm_resume(void)
>> =A0#endif
>>
>> =A0early_wakeup:
>> +
>> + =A0 =A0 /* Clear SLEEP mode set in INFORM1 */
>> + =A0 =A0 __raw_writel(0x0, S5P_INFORM1);
>> +
>> =A0 =A0 =A0 return;
>> =A0}
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
