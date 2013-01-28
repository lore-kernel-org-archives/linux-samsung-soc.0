From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: add support for mixer to exynos4
Date: Mon, 28 Jan 2013 12:14:38 +0530
Message-ID: <CAPdUM4P_jf0w+B22p1hmso8uhmTXs=fLdF8WrzDWL8cPyLeTCw@mail.gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
	<1359110384-28402-3-git-send-email-rahul.sharma@samsung.com>
	<5105965F.9050402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:60840 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785Ab3A1Gok (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 01:44:40 -0500
Received: by mail-wg0-f54.google.com with SMTP id fm10so1537974wgb.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 22:44:39 -0800 (PST)
In-Reply-To: <5105965F.9050402@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

On Mon, Jan 28, 2013 at 2:34 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> On 01/25/2013 11:39 AM, Rahul Sharma wrote:
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>> b/arch/arm/boot/dts/exynos4.dtsi
>> index 6c2c79d..07cb7d4 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -296,4 +296,12 @@
>>                 interrupts =<0 95 0>;
>>                 hpd-gpio =<&gpx3 7 0xf 1 3>;
>>         };
>> +
>> +       mixer: mixer {
>> +               compatible = "samsung,exynos4-mixer";
>
>
> I'm afraid this compatible property it too generic. Is the video mixer IP
> really identical an all the Exynos4 series SoCs ?
>

It is same in Exynos4210, 4212 and 4412.

>
>> +               reg =   <0x12c10000 0x10000>,
>> +                       <0x12c00000 0x10000>;
>> +               interrupts =<0 91 0>;
>> +               samsung,power-domain =<&pd_tv>;
>> +       };
>>   };
>
>
> Is there documentation for these new bindings available somewhere ?
>

it is there at Documentation/devicetree/bindings/drm/exynos/mixer.txt.
Probably I
need to add details for power domain node property.

regards,
Rahul Sharma.

> --
>
> Thanks,
> Sylwester
