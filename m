From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] arch: arm: samsung: Clean-up usage of CONFIG_SERIAL_SAMSUNG_UARTS
 symbol
Date: Tue, 30 Sep 2014 18:10:14 +0200
Message-ID: <542AD5E6.9050503@gmail.com>
References: <1412087695-10591-1-git-send-email-a.kesavan@samsung.com> <1412087695-10591-2-git-send-email-a.kesavan@samsung.com> <2267491.QlLoTEuT3L@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:55969 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219AbaI3QKR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 12:10:17 -0400
Received: by mail-wi0-f181.google.com with SMTP id hi2so225182wib.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2014 09:10:16 -0700 (PDT)
In-Reply-To: <2267491.QlLoTEuT3L@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Abhilash Kesavan <a.kesavan@samsung.com>
Cc: gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, jslaby@suse.cz

On 30.09.2014 17:13, Arnd Bergmann wrote:
> On Tuesday 30 September 2014 20:04:55 Abhilash Kesavan wrote:
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
> 
> I think this won't work because now you access invalid registers
> on machines that have only three uarts.

Both S3C6400 and S3C6410 SoCs have 4 UART blocks. AFAICT
CONFIG_SERIAL_SAMSUNG_UARTS was always set to 4 on ARCH_S3C64XX.

> 
>> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
>> index 11fbbc2..03cafe9 100644
>> --- a/arch/arm/plat-samsung/init.c
>> +++ b/arch/arm/plat-samsung/init.c
>> @@ -93,8 +93,8 @@ void __init s3c24xx_init_clocks(int xtal)
>>  #if IS_ENABLED(CONFIG_SAMSUNG_ATAGS)
>>  static int nr_uarts __initdata = 0;
>>  
>> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
>> -static struct s3c2410_uartcfg uart_cfgs[CONFIG_SERIAL_SAMSUNG_UARTS];
>> +#ifdef CONFIG_SERIAL_SAMSUNG
>> +static struct s3c2410_uartcfg uart_cfgs[4];

Abhilash: Instead of using 4 directly, you could define a constant for it.

>>  #endif
>>  
>>  /* s3c24xx_init_uartdevs
>> @@ -110,7 +110,7 @@ void __init s3c24xx_init_uartdevs(char *name,
>>                                   struct s3c24xx_uart_resources *res,
>>                                   struct s3c2410_uartcfg *cfg, int no)
>>  {
>> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
>> +#ifdef CONFIG_SERIAL_SAMSUNG
>>         struct platform_device *platdev;
>>         struct s3c2410_uartcfg *cfgptr = uart_cfgs;
>>         struct s3c24xx_uart_resources *resp;
> 
> Since you hardcode the number here now, you can actually drop this #ifdef.

I believe what Abhilash did is correct, because this code is not needed
when there is no serial support enabled.

Best regards,
Tomasz
