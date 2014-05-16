From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add PD entry to MFC codec on 5420
Date: Sat, 17 May 2014 07:57:56 +0900
Message-ID: <537697F4.3030007@samsung.com>
References: <1398754183-30764-1-git-send-email-sachin.kamat@linaro.org> <CALt3h790buGxX8JAsqnCr5yVZh-HCGWVmG1w06qyrLbYADCSfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:41320 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104AbaEPW6A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 18:58:00 -0400
Received: by mail-pa0-f45.google.com with SMTP id ey11so3134538pad.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2014 15:58:00 -0700 (PDT)
In-Reply-To: <CALt3h790buGxX8JAsqnCr5yVZh-HCGWVmG1w06qyrLbYADCSfQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 05/16/14 14:12, Arun Kumar K wrote:
> Looks good.
> Reviewed-by : Arun Kumar K<arun.kk@samsung.com>
>
> On Tue, Apr 29, 2014 at 12:19 PM, Sachin Kamat<sachin.kamat@linaro.org>  wrote:
>> PD entry was missing in MFC codec node.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5420.dtsi |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index 6f662b5cc90d..2fd36b0a7568 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -131,6 +131,7 @@
>>                  interrupts =<0 96 0>;
>>                  clocks =<&clock CLK_MFC>;
>>                  clock-names = "mfc";
>> +               samsung,power-domain =<&mfc_pd>;
>>          };
>>
>>          mmc_0: mmc@12200000 {
>> --
>> 1.7.9.5

Applied, thanks.

- Kukjin
