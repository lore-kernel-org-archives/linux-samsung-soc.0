From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH V3 2/3] ARM: EXYNOS5: Add Suspend-to-RAM support for 5420
Date: Tue, 13 May 2014 15:44:00 +0530
Message-ID: <CAM4voakJyOqpECEbtSc=BrsMqb=c90-t-i4_m3F4wKqrEarH_w@mail.gmail.com>
References: <1399546368-30537-1-git-send-email-vikas.sajjan@samsung.com>
	<8537431.uXYiuaPHBe@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:36721 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761000AbaEMKOC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 06:14:02 -0400
Received: by mail-qa0-f51.google.com with SMTP id w8so105406qac.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 03:14:00 -0700 (PDT)
In-Reply-To: <8537431.uXYiuaPHBe@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Vikas Sajjan <vikas.sajjan@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Bartlomiej,

[...]
>>
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_MAUDIO_OPTION, (1 << 28));
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_GPIO_OPTION, (1 << 28));
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_UART_OPTION, (1 << 28));
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_MMCA_OPTION, (1 << 28));
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_MMCB_OPTION, (1 << 28));
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_EBIA_OPTION, (1 << 28));
>> -     regmap_write(pmu_regmap, S5P_PAD_RET_EBIB_OPTION, (1 << 28));
>> +     if (soc_is_exynos5250()) {
>
> Adding a check here for EXYNOS5250 doesn't look correct (the old code
> behavior for older EXYNOS SoCs should be preserved).
Will fix this in the next version.

Regards,
Abhilash
