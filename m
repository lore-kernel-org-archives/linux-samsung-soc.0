From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] arch: arm: samsung: Clean-up usage of CONFIG_SERIAL_SAMSUNG_UARTS
 symbol
Date: Tue, 30 Sep 2014 22:31:19 +0200
Message-ID: <542B1317.5060704@gmail.com>
References: <1412087695-10591-1-git-send-email-a.kesavan@samsung.com> <2267491.QlLoTEuT3L@wuerfel> <542AD5E6.9050503@gmail.com> <78824730.2ZeRMh8EV2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:64106 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998AbaI3UbW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 16:31:22 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so3412503wgh.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2014 13:31:21 -0700 (PDT)
In-Reply-To: <78824730.2ZeRMh8EV2@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Abhilash Kesavan <a.kesavan@samsung.com>, gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, jslaby@suse.cz



On 30.09.2014 20:36, Arnd Bergmann wrote:
> On Tuesday 30 September 2014 18:10:14 Tomasz Figa wrote:
>>>> @@ -110,7 +110,7 @@ void __init s3c24xx_init_uartdevs(char *name,
>>>>                                   struct s3c24xx_uart_resources *res,
>>>>                                   struct s3c2410_uartcfg *cfg, int no)
>>>>  {
>>>> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
>>>> +#ifdef CONFIG_SERIAL_SAMSUNG
>>>>         struct platform_device *platdev;
>>>>         struct s3c2410_uartcfg *cfgptr = uart_cfgs;
>>>>         struct s3c24xx_uart_resources *resp;
>>>
>>> Since you hardcode the number here now, you can actually drop this #ifdef.
>>
>> I believe what Abhilash did is correct, because this code is not needed
>> when there is no serial support enabled.
>>
> 
> I only added the #ifdef here because it was broken when
> CONFIG_SERIAL_SAMSUNG_UARTS was undefined.

Fair enough. This isn't really that much code to really care and most
(if not all) use cases have UART enabled anyway.

Best regards,
Tomasz
