From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: Exynos: Add device tree node for Exynos4 interrupt
 combiner controller
Date: Fri, 13 Jul 2012 11:02:35 +0530
Message-ID: <CAJuYYwTJeS9NgBRZgyDgbNh1u0DpHX2+EZ1TtrcCYUg+5EJf_g@mail.gmail.com>
References: <1342068948-20755-1-git-send-email-thomas.abraham@linaro.org>
	<0fab01cd600e$27d56ec0$77804c40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:44937 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754679Ab2GMFcg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 01:32:36 -0400
Received: by lbbgm6 with SMTP id gm6so5290559lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 22:32:35 -0700 (PDT)
In-Reply-To: <0fab01cd600e$27d56ec0$77804c40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 12 July 2012 14:40, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> Add node for Exynos4 interrupt combiner controller.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4210.dtsi |   11 +++++++++++
>>  1 files changed, 11 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
>> b/arch/arm/boot/dts/exynos4210.dtsi
>> index a1dd2ee..0e4f659 100644
>> --- a/arch/arm/boot/dts/exynos4210.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210.dtsi
>> @@ -33,6 +33,17 @@
>>               reg = <0x10490000 0x1000>, <0x10480000 0x100>;
>>       };
>>
>> +     combiner:interrupt-controller@10440000 {
>> +             compatible = "samsung,exynos4210-combiner";
>> +             interrupt-controller;
>> +             #interrupt-cells = <2>;
>
> How about changing above ordering like interrupt gic controller?

Ok.

>
> +               #interrupt-cells = <2>;
> +               interrupt-controller;
>
> And, don't we need combiner-nr?
> +               samsung,combiner-nr = <16>;

'samsung,combiner-nr' is an optional property. If it is not specfied,
the default value is set as 16. So it is not required for Exynos4
combiner node.

I will resubmit this patch with your suggested change.

Thanks,
Thomas.
