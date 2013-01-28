From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Mon, 28 Jan 2013 11:49:22 +0530
Message-ID: <CAPdUM4Py3dbV_tFnZ6GOxSm-6Sq8FBZu00JH3UDq_PV2U8yq_A@mail.gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
	<1359110384-28402-2-git-send-email-rahul.sharma@samsung.com>
	<51059402.2030405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:52328 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab3A1GTX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 01:19:23 -0500
Received: by mail-wi0-f180.google.com with SMTP id hj13so1105296wib.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 22:19:22 -0800 (PST)
In-Reply-To: <51059402.2030405@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

Hi Sylwester,

On Mon, Jan 28, 2013 at 2:24 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> On 01/25/2013 11:39 AM, Rahul Sharma wrote:
>>
>> Signed-off-by: Rahul Sharma<rahul.sharma@samsung.com>
>
>
> Please provide proper commit text.
>
>> Conflicts:
>>         arch/arm/mach-exynos/mach-exynos4-dt.c
>
>
> And make sure things like this are removed when submitting patches.
>

I will take care.
>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi         | 7 +++++++
>>   arch/arm/mach-exynos/mach-exynos4-dt.c | 2 ++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>> b/arch/arm/boot/dts/exynos4.dtsi
>> index e1347fc..6c2c79d 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -289,4 +289,11 @@
>>                         interrupts =<0 34 0>;
>>                 };
>>         };
>> +
>> +       hdmi {
>> +               compatible = "samsung,exynos4-hdmi14";
>
>
> What "-hdmi14" signifies here ? And to which Exynos4 SoC revisions this
> compatible property is supposed to apply ?
>

-hdmi14 signifies 1.4 compliant Hdmi IP like in Exynos4412, while
Exynos4210 has 1.3
compliant HDMI block. I have done a mistake here. I should have kept
it in 4412.dtsi. OR
I can move it to 4x12.dtsi but not sure whether all 4x12 socs have 1.4 hdmi.

>
>> +               reg =<0x12D00000 0x70000>;
>> +               interrupts =<0 95 0>;
>> +               hpd-gpio =<&gpx3 7 0xf 1 3>;
>> +       };
>
>
> New bindings need to be documented in Documentation/devicetree/bindings/.
>
It is present at Documentation/devicetree/bindings/drm/exynos/hdmi.txt.

Regards,
Rahul Sharma.

> --
>
> Thanks,
> Sylwester
