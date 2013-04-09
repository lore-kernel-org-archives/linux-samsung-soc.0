From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung fixes-2 for v3.9
Date: Wed, 10 Apr 2013 00:43:11 +0900
Message-ID: <5164370F.6020503@samsung.com>
References: <51643279.7050200@samsung.com> <201304091734.30298.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:38157 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760614Ab3DIPnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 11:43:19 -0400
Received: by mail-pd0-f174.google.com with SMTP id p12so3824679pdj.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 08:43:19 -0700 (PDT)
In-Reply-To: <201304091734.30298.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On 04/10/13 00:34, Arnd Bergmann wrote:
> On Tuesday 09 April 2013, Kukjin Kim wrote:
>> The following changes since commit 31880c37c11e28cb81c70757e38392b42e695dc6:
>
>> ----------------------------------------------------------------
>> Sylwester Nawrocki (2):
>>         ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
>>         ARM: S3C24XX: Fix interrupt pending register offset of the EINT
>> controller
>
>
> I got a conflict merging this into the for-next branch, which has earlier
> patches. Please confirm that the resolution below is correct.
>
Yes, your resolution is correct.

Thanks.

- Kukjin

>
> diff --cc arch/arm/mach-s3c24xx/irq.c
> index 8296d94,d8ba9be..7f56a93
> --- a/arch/arm/mach-s3c24xx/irq.c
> +++ b/arch/arm/mach-s3c24xx/irq.c
> @@@ -498,9 -500,10 +498,9 @@@ struct s3c_irq_intc *s3c24xx_init_intc(
>                  base = (void *)0xfd000000;
>
>                  intc->reg_mask = base + 0xa4;
> -               intc->reg_pending = base + 0x08;
> +               intc->reg_pending = base + 0xa8;
>   -              irq_num = 20;
>   +              irq_num = 24;
>                  irq_start = S3C2410_IRQ(32);
>   -              irq_offset = 4;
>                  break;
>          default:
>                  pr_err("irq: unsupported controller address\n");
>
> --
