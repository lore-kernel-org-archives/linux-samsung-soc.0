From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Enable watchdog in Exynos4
Date: Wed, 13 Nov 2013 09:02:10 +0530
Message-ID: <CAK9yfHxFGJ1hgOg1AdPG=o3a5aNqQOu3ni6eh2tPAgJ7ZzvvQw@mail.gmail.com>
References: <1383208845-17227-1-git-send-email-sachin.kamat@linaro.org>
	<086501cedf96$cab39be0$601ad3a0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:57206 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755444Ab3KMDcK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 22:32:10 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp4so4893092obc.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Nov 2013 19:32:10 -0800 (PST)
In-Reply-To: <086501cedf96$cab39be0$601ad3a0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Kukjin,

On 12 November 2013 16:33, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
>> Enabled watchdog in Exynos4.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>> b/arch/arm/boot/dts/exynos4.dtsi
>> index ce24edba7f6d..b7378154c0a1 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -196,7 +196,6 @@
>>               interrupts = <0 43 0>;
>>               clocks = <&clock 345>;
>>               clock-names = "watchdog";
>> -             status = "disabled";
>>       };
>>
>>       rtc@10070000 {
>> --
>> 1.7.9.5
>
> Sachin, please see my comments on your RTC enabling patch.

Same reply as given for RTC.

-- 
With warm regards,
Sachin
