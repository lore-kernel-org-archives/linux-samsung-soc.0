From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: uncompress - print debug messages if
 DEBUG_LL is defined
Date: Mon, 03 Jun 2013 10:27:06 +0530
Message-ID: <51AC2222.8000604@linaro.org>
References: <1370000944-19786-1-git-send-email-tushar.behera@linaro.org> <1370000944-19786-2-git-send-email-tushar.behera@linaro.org> <20130601035929.GA3868@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:55585 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861Ab3FCE5M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 00:57:12 -0400
Received: by mail-pd0-f172.google.com with SMTP id t10so1560188pdi.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Jun 2013 21:57:12 -0700 (PDT)
In-Reply-To: <20130601035929.GA3868@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, kgene.kim@samsung.com, patches@linaro.org

On 06/01/2013 09:29 AM, Olof Johansson wrote:
> On Fri, May 31, 2013 at 05:19:02PM +0530, Tushar Behera wrote:
>> Printing low-level debug messages make an assumption that the specified
>> UART port has been preconfigured by the bootloader. Incorrectly
>> specified UART port results in system getting stalled while printing the
>> message "Uncompressing Linux... done, booting the kernel"
>>
>> This UART port number is specified through S3C_LOWLEVEL_UART_PORT. Since
>> the UART port might different for different board, it is not possible to
>> specify it correctly for every board that use a common defconfig file.
>>
>> Calling this print subroutine only when DEBUG_LL fixes the problem. By
>> disabling DEBUG_LL in default config file, we would be able to boot
>> multiple boards with different default UART ports.
>>
>> With this current approach, we miss the print "Uncompressing Linux...
>> done, booting the kernel." when DEBUG_LL is not defined.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  arch/arm/mach-exynos/include/mach/uncompress.h  |   11 ++++++++---
>>  arch/arm/plat-samsung/include/plat/uncompress.h |   10 +++++++++-
>>  2 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/uncompress.h b/arch/arm/mach-exynos/include/mach/uncompress.h
>> index 2979995..730f69f 100644
>> --- a/arch/arm/mach-exynos/include/mach/uncompress.h
>> +++ b/arch/arm/mach-exynos/include/mach/uncompress.h
>> @@ -37,11 +37,16 @@ static void arch_detect_cpu(void)
>>  	chip_id >>= 20;
>>  	chip_id &= 0xf;
>>  
>> +#ifdef CONFIG_DEBUG_LL
>>  	if (chip_id == 0x5)
>> -		uart_base = (volatile u8 *)EXYNOS5_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
>> +		uart_base = (volatile u8 *)EXYNOS5_PA_UART +
>> +			(S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
>>  	else
>> -		uart_base = (volatile u8 *)EXYNOS4_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
>> -
>> +		uart_base = (volatile u8 *)EXYNOS4_PA_UART +
>> +			(S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
>> +#else
>> +	uart_base = NULL;
>> +#endif
> 
> You can do:
> 
> 	if (!config_enabled(CONFIG_DEBUG_LL))
> 		return;
> 

Thanks for the hint.

Or rather, we calculate uart_base unconditionally in mach/uncompress.h
and replace check for uart_base with config_enabled(CONFIG_DEBUG_LL) in
plat/uncompress.h. That would get rid of all the ifdef's in the
mach/uncompress.h files.

Let me spin out another version with this change.

> Since uart_base will be set to 0 by being in BSS anyway.
> 
> 
> -Olof
> 


-- 
Tushar Behera
