From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Thu, 31 Jan 2013 13:39:27 +0530
Message-ID: <CAPdUM4NxRkE_g36yPPjhFO8jHYdBwQ6cNk+pndyO+h9fcwn-8w@mail.gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
	<1359110384-28402-2-git-send-email-rahul.sharma@samsung.com>
	<51059402.2030405@gmail.com>
	<CAPdUM4Py3dbV_tFnZ6GOxSm-6Sq8FBZu00JH3UDq_PV2U8yq_A@mail.gmail.com>
	<5108344D.4090202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:37824 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754688Ab3AaIJ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 03:09:28 -0500
Received: by mail-wg0-f47.google.com with SMTP id dr13so1768709wgb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jan 2013 00:09:27 -0800 (PST)
In-Reply-To: <5108344D.4090202@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>, thomas.ab@samsung.com

Thanks Sylwester,

On Wed, Jan 30, 2013 at 2:12 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi Rahul,
>
>
> On 01/28/2013 07:19 AM, Rahul Sharma wrote:
>>>>
>>>> --- a/arch/arm/boot/dts/exynos4.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>>>> @@ -289,4 +289,11 @@
>>>>                          interrupts =<0 34 0>;
>>>>                  };
>>>>          };
>>>> +
>>>> +       hdmi {
>>>> +               compatible = "samsung,exynos4-hdmi14";
>>>
>>>
>>>
>>> What "-hdmi14" signifies here ? And to which Exynos4 SoC revisions this
>>> compatible property is supposed to apply ?
>>>
>>
>> -hdmi14 signifies 1.4 compliant Hdmi IP like in Exynos4412, while
>> Exynos4210 has 1.3
>> compliant HDMI block. I have done a mistake here. I should have kept
>> it in 4412.dtsi. OR
>> I can move it to 4x12.dtsi but not sure whether all 4x12 socs have 1.4
>> hdmi.
>
>
> Exynos4210 also have the HDMI IP. I'm not sure how much common those IP's
> are
> among Exynos4 series SoCs. I suppose it makes sense to create a hdmi node in
> exynos4.dtsi and override what's required either in exynos4x12.dtsi or
> exynos4412.dtsi file.
>
> What is worring me is that you're trying to just append the supported
> HDMI standard version to the string, and there might be more differences
> in the IPs across all Exynos4 SoC series. What if there are two different
> SoCs that support e.g. HDMI v1.4 but there are some differences in the
> HDMI IPs ? You would likely need to invent new properties and pass them
> to the driver. Appending specific SoC name to the compatible string looks
> like a better alternative to me.
>

I agree to it. Putting compatible string with first soc having the IP,
is a better
approach altogether. I will incorporate the change in next version.

regards,
Rahul Sharma.

>
>>>> +               reg =<0x12D00000 0x70000>;
>>>> +               interrupts =<0 95 0>;
>>>> +               hpd-gpio =<&gpx3 7 0xf 1 3>;
>>>> +       };
>>>
>>>
>>>
>>> New bindings need to be documented in Documentation/devicetree/bindings/.
>>>
>> It is present at Documentation/devicetree/bindings/drm/exynos/hdmi.txt.
>
>
> Thanks. Sorry, I've missed that. But it seems to be only for exynos5 SoCs ?
> Also the location is a bit unexpected to me, if we want to have Exynos4 and
> Exynos5 specific IP documented in this file. As I mentioned in previous
> e-mail this IP is not only handled by the DRM API.
>
> --
>
> Regards,
> Sylwester
