From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 3/3] ARM: dts: exynos: Remove the display-timing and
 delay from rinato dts
Date: Tue, 29 Aug 2017 07:58:52 +0200
Message-ID: <CAJKOXPc0oOmx7jVbmDrSWnb-GWvO6Re1qgwiOF6CzL4Mbmx-1A@mail.gmail.com>
References: <1499912443-3671-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170713022057epcas1p464b817a426638cc1566e665aa7903ed7@epcas1p4.samsung.com>
 <1499912443-3671-4-git-send-email-hoegeun.kwon@samsung.com> <2be78f06-8c3a-0076-a19b-07d501c3d460@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750758AbdH2F6y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 01:58:54 -0400
In-Reply-To: <2be78f06-8c3a-0076-a19b-07d501c3d460@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com

On Tue, Aug 29, 2017 at 4:52 AM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
> Hi Krzysztof,
>
> The driver has been merged into exynos-drm-misc.
> Could you please check this patch(3/3).

Hi, OK, no problems for me but it is too late for current cycle so it
will go in for v4.15.

Best regards,
Krzysztof

>
> Best regards,
> Hoegeun
>
>
> On 07/13/2017 11:20 AM, Hoegeun Kwon wrote:
>>
>> The display-timing and delay are included in the panel driver. So it
>> should be removed in dts.
>>
>> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos3250-rinato.dts | 22 ----------------------
>>   1 file changed, 22 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts
>> b/arch/arm/boot/dts/exynos3250-rinato.dts
>> index 443e0c9..6b70c8d 100644
>> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>> @@ -242,28 +242,6 @@
>>                 vci-supply = <&ldo20_reg>;
>>                 reset-gpios = <&gpe0 1 GPIO_ACTIVE_LOW>;
>>                 te-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
>> -               power-on-delay= <30>;
>> -               power-off-delay= <120>;
>> -               reset-delay = <5>;
>> -               init-delay = <100>;
>> -               flip-horizontal;
>> -               flip-vertical;
>> -               panel-width-mm = <29>;
>> -               panel-height-mm = <29>;
>> -
>> -               display-timings {
>> -                       timing-0 {
>> -                               clock-frequency = <4600000>;
>> -                               hactive = <320>;
>> -                               vactive = <320>;
>> -                               hfront-porch = <1>;
>> -                               hback-porch = <1>;
>> -                               hsync-len = <1>;
>> -                               vfront-porch = <150>;
>> -                               vback-porch = <1>;
>> -                               vsync-len = <2>;
>> -                       };
>> -               };
>>                 port {
>>                         dsi_in: endpoint {
>
>
