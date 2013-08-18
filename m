From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add secure-firmware boot support for OrigenQaud
 board
Date: Mon, 19 Aug 2013 04:30:59 +0900
Message-ID: <521120F3.4040706@samsung.com>
References: <1374560579-25084-1-git-send-email-tushar.behera@linaro.org> <CAHbNUh0Bzk7+MnQaCtEaL2_K3PQgTsueAJY84Y0T4jiFL_E-KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:57103 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754481Ab3HRTbC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 15:31:02 -0400
Received: by mail-pd0-f176.google.com with SMTP id q10so4180814pdj.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 12:31:02 -0700 (PDT)
In-Reply-To: <CAHbNUh0Bzk7+MnQaCtEaL2_K3PQgTsueAJY84Y0T4jiFL_E-KA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>

On 08/12/13 14:16, Tushar Behera wrote:
> On 23 July 2013 11:52, Tushar Behera<tushar.behera@linaro.org>  wrote:
>> OrigenQuad board boots with secure firmware support. Enable support for
>> reading smc commands.
>>
>> The binding has been updated as per the documentation provided in
>> Documentation/devicetree/bindings/arm/samsung-boards.txt.
>>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos4412-origen.dts |    5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
>> index 7993641..8768b03 100644
>> --- a/arch/arm/boot/dts/exynos4412-origen.dts
>> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
>> @@ -27,6 +27,11 @@
>>                  bootargs ="console=ttySAC2,115200";
>>          };
>>
>> +       firmware@0203F000 {
>> +               compatible = "samsung,secure-firmware";
>> +               reg =<0x0203F000 0x1000>;
>> +       };
>> +
>>          mmc_reg: voltage-regulator {
>>                  compatible = "regulator-fixed";
>>                  regulator-name = "VMEM_VDD_2.8V";
>> --
>> 1.7.9.5
>>
>
> Any comments on this?
>
Applied, thanks,

Kukjin
