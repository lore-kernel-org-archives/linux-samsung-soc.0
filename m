From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 00/17] ARM: S5P64X0, S5PC100: no more support in mainline
Date: Thu, 03 Jul 2014 07:46:35 +0900
Message-ID: <53B48BCB.4010308@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com> <53B4494B.1030909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:41034 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751744AbaGBWqk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 18:46:40 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so12644967pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jul 2014 15:46:40 -0700 (PDT)
In-Reply-To: <53B4494B.1030909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 07/03/14 03:02, Tomasz Figa wrote:
> Hi Kukjin,
>
Hi,

> On 30.06.2014 23:32, Kukjin Kim wrote:
>> This series removes S5P64X0 and S5PC100 related codes in mainline,
>> because no more user now. And if its supporting is required later,
>> it will be done with using device tree.
>>
>> [PATCH 01/17] ARM: S5P64X0: no more support S5P6440 and S5P6450 SoCs
>> [PATCH 02/17] gpio: samsung: remove s5p64x0 related gpio codes
>> [PATCH 03/17] spi: s3c64xx: remove s5p64x0 related spi codes
>> [PATCH 04/17] ASoC: samsung: no more support for S5P6440 and S5P6450
>> [PATCH 05/17] pwm: samsung: remove s5p64x0 related pwm codes
>> [PATCH 06/17] video: fbdev: s3c-fb: remove s5p64x0 related fimd
>> [PATCH 07/17] serial: samsung: no more support for S5P6440 and
>> [PATCH 08/17] ARM: S5PC100: no more support S5PC100 SoC
>> [PATCH 09/17] gpio: samsung: remov s5pc100 related gpio codes
>> [PATCH 10/17] spi: s3c64xx: remove s5pc100 related spi codes
>> [PATCH 11/17] pwm: samsung: remove s5pc100 related pwm codes
>> [PATCH 12/17] serial: samsung: no more support for S5PC100 SoC
>> [PATCH 13/17] ata: pata_samsung_cf: removes s5pc100 related ata
>> [PATCH 14/17] mtd: onenand: remove s5pc100 related onenand codes
>> [PATCH 15/17] video: fbdev: s3c-fb: remove s5pc100 related fimd and
>> [PATCH 16/17] [media] exynos4-is: removes s5pc100 related fimc codes
>> [PATCH 17/17] ASoC: Samsung: remove s5pc100 related codes
>
> Thanks for this series.
>
> Just letting you know that I have rebased my s5pv210 DT migration series
> on top of this and will be sending the patches after some more testing.
>
Just note since I've missed one more change in the series, I amended it 
just now but it should be fine with your series I think.

Please see v3.17-next/cleanup-s5p branch.

Thanks for your support for s5pv210 dt migration.

- Kukjin
