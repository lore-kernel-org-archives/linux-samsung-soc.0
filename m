From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5410: Fill in CPU clock-frequency
Date: Sat, 05 Jul 2014 06:06:35 +0900
Message-ID: <53B7175B.1030109@samsung.com>
References: <1403466596-3347-1-git-send-email-afaerber@suse.de> <53A7DCF8.4090108@samsung.com> <53B690B9.2090906@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:37830 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725AbaGDVGo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 17:06:44 -0400
In-Reply-To: <53B690B9.2090906@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, LKML <linux-kernel@vger.kernel.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Kumar Gala <galak@codeaurora.org>, "ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>

On 07/04/14 20:32, Andreas F=C3=A4rber wrote:
> Am 23.06.2014 09:53, schrieb Tarek Dakhran:
>> On 06/22/2014 11:49 PM, Andreas F=C3=A4rber wrote:
>>> It's 1.6 GHz for the Cortex-A15.
>>>
>>> Avoids warnings like "/cpus/cpu@0 missing clock-frequency property"=
=2E
>>>
>>> Signed-off-by: Andreas afaerber@suse.de>
>>> ---
>>>    arch/arm/boot/dts/exynos5410.dtsi | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5410.dtsi
>>> b/arch/arm/boot/dts/exynos5410.dtsi
>>> index 3839c26..9d0b8cc 100644
>>> --- a/arch/arm/boot/dts/exynos5410.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5410.dtsi
>>> @@ -28,24 +28,28 @@
>>>                device_type =3D "cpu";
>>>                compatible =3D "arm,cortex-a15";
>>>                reg =3D<0x0>;
>>> +            clock-frequency =3D<1600000000>;
>>>
>>
>> Reviewed-by: Tarek Dakhran<t.dakhran@samsung.com>
>
> Ping? Seems really trivial...
>
Will apply.

BTW Andreas, I can't use 'F=C3=A4rber' in my git tree so which one is r=
ight=20
or more preferred? Farber, Faerber, Ferber? Sorry.

Thanks,
Kukjin
