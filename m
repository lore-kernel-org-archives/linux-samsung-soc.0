From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 03 Jun 2011 14:54:02 +0530
Message-ID: <4DE8A832.4040808@linaro.org>
References: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org> <4DE8924B.5010003@samsung.com> <4DE89EF0.5090707@linaro.org> <4DE8A21C.3000908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f170.google.com ([209.85.212.170]:45010 "EHLO
	mail-px0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753423Ab1FCJYJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 05:24:09 -0400
Received: by pxi19 with SMTP id 19so1027304pxi.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2011 02:24:08 -0700 (PDT)
In-Reply-To: <4DE8A21C.3000908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, samsung@lists.linaro.org, m.szyprowski@samsung.com

On Friday 03 June 2011 02:28 PM, Joonyoung Shim wrote:
> On 2011-06-03 =EC=98=A4=ED=9B=84 5:44, Tushar Behera wrote:
>> Hi,
>>
>> On Friday 03 June 2011 01:20 PM, Joonyoung Shim wrote:
>>> On 2011-06-03 =EC=98=A4=ED=9B=84 4:04, Tushar Behera wrote:
>>>> Added Kconfig entry for setup-usb-phy.c on which EHCI support is
>>>> dependent on.
>>>>
>>>> Following the naming convention of other setup files, we have foll=
owing
>>>> renaming.
>>>> usb-phy.c =3D=3D> setup-usb-phy.c
>>>>
>>>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>>>> ---
>>>> arch/arm/mach-exynos4/Kconfig | 6 ++++++
>>>> arch/arm/mach-exynos4/Makefile | 2 +-
>>>> .../mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} | 0
>>>> 3 files changed, 7 insertions(+), 1 deletions(-)
>>>> rename arch/arm/mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} (100=
%)
>>>>
>>>
>>> There is one white space but
>>>
>>> Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>>
>>>> diff --git a/arch/arm/mach-exynos4/Kconfig
>>>> b/arch/arm/mach-exynos4/Kconfig
>>>> index b92c1e5..a45a022 100644
>>>> --- a/arch/arm/mach-exynos4/Kconfig
>>>> +++ b/arch/arm/mach-exynos4/Kconfig
>>>> @@ -91,6 +91,11 @@ config EXYNOS4_SETUP_FIMC
>>>> help
>>>> Common setup code for the camera interfaces.
>>>>
>>>> +config EXYNOS4_SETUP_USB_PHY
>>>> + bool
>>>> + help
>>>> + Common setup code for USB PHY controller
>>>
>>> White space.
>> The space was added so that it is formatted in the same way as other
>> Kconfig entries.
>
> So your patch has 1 error by scripts/checkpatch.pl, it can be removed
> using scripts/cleanpatch.
:-( .. I had overseen that error .. thanks for pointing out ...

Kukjin,
If required, I will resubmit again.
--=20
Tushar Behera
