From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Enable RTC node in exynos4.dtsi file
Date: Wed, 13 Nov 2013 09:01:36 +0530
Message-ID: <CAK9yfHzj+bA1mbZP3KJsU=XiAm+6GaXryDKphPX=UKaaOkXpNw@mail.gmail.com>
References: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
	<086401cedf96$933b0450$b9b10cf0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:63001 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756037Ab3KMDbh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 22:31:37 -0500
Received: by mail-ob0-f179.google.com with SMTP id wn1so5642561obc.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Nov 2013 19:31:36 -0800 (PST)
In-Reply-To: <086401cedf96$933b0450$b9b10cf0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Hi Kukjin,

On 12 November 2013 16:31, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
>> Since there are no board specific properties for the RTC node,
>> keep it enabled in the dtsi file.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>> b/arch/arm/boot/dts/exynos4.dtsi
>> index a73eeb5..e262946 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -205,7 +205,6 @@
>>               interrupts = <0 44 0>, <0 45 0>;
>>               clocks = <&clock 346>;
>>               clock-names = "rtc";
>> -             status = "disabled";
>>       };
>>
>>       keypad@100A0000 {
>> --
>> 1.7.9.5
>
> Well, I don't think every exynos4 boards want to make the default
> enabled...so I don't want to take this. If any opinions, please let me know.
>

As was discussed earlier too, status field of DT node is not supposed
to be used for
keeping an IP enabled or disabled. That should be done via the kernel
config. The DT status
is mostly to indicate the hardware status of the IP on the SoC/board.
If the node fully defines the hardware,
then it should be kept enabled by default unless such enabling causes
some issues with other IPs due to
pin sharing conflicts, etc. In the above case the node completely
defines the hardware and hence there is no
reason to keep it disabled.

-- 
With warm regards,
Sachin
