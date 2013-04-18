From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/5] ARM: dts: Add clock entries to G2D node for exynos4210
Date: Thu, 18 Apr 2013 17:24:47 +0530
Message-ID: <CAK9yfHxDe6=FysOM4v+iGZqLeafKAP=E86NxMNKK_atJpdRF=A@mail.gmail.com>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
	<1366283719-9615-3-git-send-email-sachin.kamat@linaro.org>
	<516FDB1D.3050302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:62252 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754953Ab3DRLys (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Apr 2013 07:54:48 -0400
Received: by mail-pa0-f41.google.com with SMTP id kx1so1560825pab.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Apr 2013 04:54:48 -0700 (PDT)
In-Reply-To: <516FDB1D.3050302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sylwester,

On 18 April 2013 17:08, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi Sachin,
>
> On 04/18/2013 01:15 PM, Sachin Kamat wrote:
>> Added clock entries to G2D node.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4210.dtsi |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
>> index 66e6b03..50ab9d4 100644
>> --- a/arch/arm/boot/dts/exynos4210.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210.dtsi
>> @@ -117,6 +117,8 @@
>>               compatible = "samsung,s5pv210-g2d";
>>               reg = <0x12800000 0x1000>;
>>               interrupts = <0 89 0>;
>> +             clocks = <&clock 177>, <&clock 277>;
>> +             clock-names = "sclk_fimg2d", "fimg2d";
>
> Same clocks are used for exynos4210 and exynos4212/4412. Wouldn't
> it work if you have added those properties to exynos4.dtsi, instead
> of having same entries in exynos4210.dtsi and exynos4x12.dtsi  ?

The clocks are the same. However, base address of register is
different for 4210 and 4x12.
That was the reason 2 separate nodes were created. Do you want me to
create a common node in exynos4.dtsi with all the common properties
and separate nodes in exynos4210.dtsi and exynos4x12.dtsi with just
the 'reg' property?


-- 
With warm regards,
Sachin
