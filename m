From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Disable MDMA1 node for Arndale-octa board
Date: Fri, 21 Mar 2014 04:29:13 +0900
Message-ID: <532B4189.4090204@samsung.com>
References: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org> <CAHbNUh0sWquBXk9bXAr6LKqYz_1JHDXwzoRy4==R0ze2FNoaQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:55219 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964875AbaCTT3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 15:29:17 -0400
Received: by mail-pd0-f180.google.com with SMTP id v10so1358432pde.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 12:29:16 -0700 (PDT)
In-Reply-To: <CAHbNUh0sWquBXk9bXAr6LKqYz_1JHDXwzoRy4==R0ze2FNoaQw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kgene Kim <kgene.kim@samsung.com>

On 03/19/14 17:38, Tushar Behera wrote:
> On 5 March 2014 13:39, Tushar Behera<tushar.behera@linaro.org>  wrote:
>> MDMA1 can support both secure and non-secure AXI transactions. When this
>> is enabled in the kernel for boards that run in secure mode, we get
>> imprecise external aborts causing the kernel to oops.
>>
>> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
>>
>> Suggested-by: Javi Merino<javi.merino@arm.com>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5420-arndale-octa.dts |   12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
>> index f509e8f..810ec73 100644
>> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
>> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
>> @@ -361,4 +361,16 @@
>>                          gpio-key,wakeup;
>>                  };
>>          };
>> +
>> +       amba {
>> +               mdma1: mdma@11C10000 {
>> +                       /*
>> +                        * MDMA1 can support both secure and non-secure
>> +                        * AXI transactions. When this is enabled in the kernel
>> +                        * for boards that run in secure mode, we are getting
>> +                        * imprecise external aborts causing the kernel to oops.
>> +                        */
>> +                       status = "disabled";
>> +               };
>> +       };
>>   };
>> --
>> 1.7.9.5
>>
> Kukjin,
>
> Can you please apply this with Javi's "Tested-by"?
>
>
Looks OK, applied this and second one.

Thanks,
Kukjin
