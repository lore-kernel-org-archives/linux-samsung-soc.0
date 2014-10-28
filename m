From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v2 1/2] arch: arm: samsung: Clean-up usage of
 CONFIG_SERIAL_SAMSUNG_UARTS symbol
Date: Tue, 28 Oct 2014 12:24:05 +0530
Message-ID: <CAM4voa=_h7O5ybA9joD_XzBCne+oLewyGBNThS90gytpOEjJVw@mail.gmail.com>
References: <1412181777-6388-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voameHriCmmnwNiVGMVK=knYKsqr22iO2xKPWAZugACxD+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:63141 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755791AbaJ1GyF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 02:54:05 -0400
Received: by mail-qa0-f43.google.com with SMTP id j7so22365qaq.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2014 23:54:05 -0700 (PDT)
In-Reply-To: <CAM4voameHriCmmnwNiVGMVK=knYKsqr22iO2xKPWAZugACxD+Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Kukjin,

On Mon, Oct 20, 2014 at 7:11 PM, Abhilash Kesavan
<kesavan.abhilash@gmail.com> wrote:
> Hi Kukjin,
>
> On Wed, Oct 1, 2014 at 10:12 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
>> Remove usage of CONFIG_SERIAL_SAMSUNG_UARTS symbol from platform
>> specific code.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
>
> Can you please pick this up if it looks OK ?

A gentle reminder on these 2 patches.

Abhilash
>
> Abhilash
>> ---
>> Changes in v2:
>>         - Re-ordered the patches
>>         - Added a define for number of uart ports in arch/arm/plat-samsung/init.c
>>         - Removed CONFIG_SERIAL_SAMSUNG #ifdef in arch/arm/plat-samsung/init.c
>>
>> Build tested using s3c2410_defconfig, s3c6400_defconfig, exynos_defconfig
>> and arm64's defconfig with and without the serial driver enabled. Boot tested
>> on Exynos5420 and Exynos7.
>>
>>  arch/arm/mach-s3c64xx/irq-pm.c |    6 +++---
>>  arch/arm/plat-samsung/init.c   |    7 ++-----
>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/mach-s3c64xx/irq-pm.c b/arch/arm/mach-s3c64xx/irq-pm.c
>> index ae4ea76..b20024e 100644
>> --- a/arch/arm/mach-s3c64xx/irq-pm.c
>> +++ b/arch/arm/mach-s3c64xx/irq-pm.c
>> @@ -55,10 +55,10 @@ static struct irq_grp_save {
>>         u32     mask;
>>  } eint_grp_save[5];
>>
>> -#ifndef CONFIG_SERIAL_SAMSUNG_UARTS
>> -#define SERIAL_SAMSUNG_UARTS 0
>> +#ifndef CONFIG_SERIAL_SAMSUNG
>> +#define SERIAL_SAMSUNG_UARTS   0
>>  #else
>> -#define        SERIAL_SAMSUNG_UARTS CONFIG_SERIAL_SAMSUNG_UARTS
>> +#define SERIAL_SAMSUNG_UARTS   4
>>  #endif
>>
>>  static u32 irq_uart_mask[SERIAL_SAMSUNG_UARTS];
>> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
>> index 11fbbc2..6114942 100644
>> --- a/arch/arm/plat-samsung/init.c
>> +++ b/arch/arm/plat-samsung/init.c
>> @@ -92,10 +92,9 @@ void __init s3c24xx_init_clocks(int xtal)
>>  /* uart management */
>>  #if IS_ENABLED(CONFIG_SAMSUNG_ATAGS)
>>  static int nr_uarts __initdata = 0;
>> +#define MAX_UART_PORTS 4
>>
>> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
>> -static struct s3c2410_uartcfg uart_cfgs[CONFIG_SERIAL_SAMSUNG_UARTS];
>> -#endif
>> +static struct s3c2410_uartcfg uart_cfgs[MAX_UART_PORTS];
>>
>>  /* s3c24xx_init_uartdevs
>>   *
>> @@ -110,7 +109,6 @@ void __init s3c24xx_init_uartdevs(char *name,
>>                                   struct s3c24xx_uart_resources *res,
>>                                   struct s3c2410_uartcfg *cfg, int no)
>>  {
>> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
>>         struct platform_device *platdev;
>>         struct s3c2410_uartcfg *cfgptr = uart_cfgs;
>>         struct s3c24xx_uart_resources *resp;
>> @@ -133,7 +131,6 @@ void __init s3c24xx_init_uartdevs(char *name,
>>         }
>>
>>         nr_uarts = no;
>> -#endif
>>  }
>>
>>  void __init s3c24xx_init_uarts(struct s3c2410_uartcfg *cfg, int no)
>> --
>> 1.7.9.5
>>
