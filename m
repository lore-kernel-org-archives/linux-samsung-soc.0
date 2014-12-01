From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH v5 3/6] driver: soc: exynos-pmu: Add an API to be called
 after wakeup
Date: Mon, 1 Dec 2014 09:54:20 +0530
Message-ID: <CADGdYn52_ETbU8e--bdL5QDew-=Mrkt63FTLegeDD5yR4vvoRw@mail.gmail.com>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
	<1417270508-11174-4-git-send-email-amit.daniel@samsung.com>
	<02a301d00c2b$ef2f0eb0$cd8d2c10$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f44.google.com ([209.85.213.44]:61754 "EHLO
	mail-yh0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604AbaLAEYU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Nov 2014 23:24:20 -0500
Received: by mail-yh0-f44.google.com with SMTP id c41so4468778yho.31
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 Nov 2014 20:24:20 -0800 (PST)
In-Reply-To: <02a301d00c2b$ef2f0eb0$cd8d2c10$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: LAK <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

On Sun, Nov 30, 2014 at 4:56 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Amit Daniel Kachhap wrote:
>>
>> This patch adds an API exynos_sys_powerup_conf to be called after system sleep
>> wakeup. This will useful for exynos7 SoC to perform resume related
>> initialisations. This is similar to currently existing API
>> exynos_sys_powerdown_conf.
>>
>> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>
> In subject,
>
> "driver: soc..." -> "drivers: soc..." ?
Ok will change.
>
> - Kukjin
>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c       |    9 +++++++++
>>  include/linux/soc/samsung/exynos-pmu.h |    1 +
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
>> index 7eb5b0b..c3307eb 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -33,6 +33,7 @@ struct exynos_pmu_data {
>>       void (*pmu_init)(void);
>>       void (*powerdown_conf)(enum sys_powerdown);
>>       void (*powerdown_conf_extra)(enum sys_powerdown);
>> +     void (*powerup_conf)(enum sys_powerdown);
>>  };
>>
>>  struct exynos_pmu_context {
>> @@ -768,6 +769,14 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
>>       }
>>  }
>>
>> +void exynos_sys_powerup_conf(enum sys_powerdown mode)
>> +{
>> +     const struct exynos_pmu_data *pmu_data = pmu_context->pmu_data;
>> +
>> +     if (pmu_data->powerup_conf)
>> +             pmu_data->powerup_conf(mode);
>> +}
>> +
>>  static void exynos3250_pmu_init(void)
>>  {
>>       unsigned int value;
>> diff --git a/include/linux/soc/samsung/exynos-pmu.h b/include/linux/soc/samsung/exynos-pmu.h
>> index a2ab0d5..b497712 100644
>> --- a/include/linux/soc/samsung/exynos-pmu.h
>> +++ b/include/linux/soc/samsung/exynos-pmu.h
>> @@ -20,5 +20,6 @@ enum sys_powerdown {
>>  };
>>
>>  extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
>> +extern void exynos_sys_powerup_conf(enum sys_powerdown mode);
>>
>>  #endif /* __EXYNOS_PMU_H */
>> --
>> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
