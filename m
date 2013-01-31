From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: add support for mixer to exynos4
Date: Thu, 31 Jan 2013 14:03:33 +0530
Message-ID: <CAPdUM4OD2Ju7s9wGr3r4hT=XhTv0N2fsNhmOJrGUHzhJSLzP4g@mail.gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
	<1359110384-28402-3-git-send-email-rahul.sharma@samsung.com>
	<5105965F.9050402@gmail.com>
	<CAPdUM4P_jf0w+B22p1hmso8uhmTXs=fLdF8WrzDWL8cPyLeTCw@mail.gmail.com>
	<51083015.2030403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:33665 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737Ab3AaIdf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 03:33:35 -0500
Received: by mail-wi0-f171.google.com with SMTP id hn14so4497839wib.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jan 2013 00:33:33 -0800 (PST)
In-Reply-To: <51083015.2030403@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

On Wed, Jan 30, 2013 at 1:54 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi,
>
>
> On 01/28/2013 07:44 AM, Rahul Sharma wrote:
>>>>
>>>> +
>>>> +       mixer: mixer {
>>>> +               compatible = "samsung,exynos4-mixer";
>>>
>>>
>>>
>>> I'm afraid this compatible property it too generic. Is the video mixer IP
>>> really identical an all the Exynos4 series SoCs ?
>>>
>>
>> It is same in Exynos4210, 4212 and 4412.
>>
>>>
>>>> +               reg =<0x12c10000 0x10000>,
>>>> +<0x12c00000 0x10000>;
>>>> +               interrupts =<0 91 0>;
>>>> +               samsung,power-domain =<&pd_tv>;
>>>> +       };
>>>>    };
>>>
>>>
>>>
>>> Is there documentation for these new bindings available somewhere ?
>>>
>>
>> it is there at Documentation/devicetree/bindings/drm/exynos/mixer.txt.
>> Probably I need to add details for power domain node property.
>
>
> Sorry, I can't see anything for Exynos4 there, it's only for exynos5 SoCs.
> I think the need for the 'samsung,power-domain' property (I guess that
> should be optional) needs to be documented for completeness.
>
> Getting back to the bindings documentation,
> Documentation/devicetree/bindings/drm/exynos/ seems not exactly right
> place for me, but that's a minor issue. There is also a V4L2 driver
> for the HDMI and TV output devices in drivers/media/platform/s5p-tv.
> So Documentation/devicetree/bindings/video or
> Documentation/devicetree/bindings/media might be a better home for that
> bindings documentation. These IPs are not specific to DRM at all.
>

Make sense. I will move the documentation file to Documentation/
devicetree/ bindings/video and add exynos4 compatible types in next
version.

regards,
Rahul Sharma.

> --
>
> Thanks,
> Sylwester
