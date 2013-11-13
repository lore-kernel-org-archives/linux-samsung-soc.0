From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: Update display clock frequency for Origen-4412
Date: Wed, 13 Nov 2013 09:17:34 +0530
Message-ID: <CAHbNUh2gW3KV_T2iJ=m5a9qe0nsNUzXuHS=fHYDeoXMn9H-Leg@mail.gmail.com>
References: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
	<1380171018-24229-2-git-send-email-sachin.kamat@linaro.org>
	<085801cedf90$6e2a6580$4a7f3080$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:37049 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757956Ab3KMDre (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 22:47:34 -0500
Received: by mail-ob0-f172.google.com with SMTP id wm4so7084729obc.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Nov 2013 19:47:34 -0800 (PST)
In-Reply-To: <085801cedf90$6e2a6580$4a7f3080$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>, devicetree <devicetree@vger.kernel.org>

On 12 November 2013 15:47, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
> + dt ml.
>
>> As per the timing information for supported panel, the value should
>> be between 47.2 MHz to 47.9 MHz for 60Hz refresh rate.
>>
>> Total horizontal pixels = 1024 (x-res) + 80 (margin) + 48 (hsync) = 1152
>> Total vertical pixels = 600 (y-res) + 80 (margin) + 3 (vsync) = 653
>
> Should be 683?
>
>>
>> Target pixel clock rate for refresh rate @60 Hz
>>       = 1152 * 653 * 60 = 47208960 Hz ~ 47.5 MHz
>>
> Same here.
>

Yes, typo in both the cases, however the calculation is right. The
same typo in patch 1/2 also. You may please fix them while applying.

>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4412-origen.dts |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
>> b/arch/arm/boot/dts/exynos4412-origen.dts
>> index 8768b03..923bcd7 100644
>> --- a/arch/arm/boot/dts/exynos4412-origen.dts
>> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
>> @@ -152,7 +152,7 @@
>>       display-timings {
>>               native-mode = <&timing0>;
>>               timing0: timing {
>> -                     clock-frequency = <50000>;
>> +                     clock-frequency = <47500000>;
>>                       hactive = <1024>;
>>                       vactive = <600>;
>>                       hfront-porch = <64>;
>> --
>> 1.7.9.5
>
> Please make sure it works fine on both origen boards with your two fixes.
>
> If so, let me pick them up into Samsung tree after squash into one patch.
>
> Thanks,
> Kukjin
>

Thanks.
-- 
Tushar Behera
