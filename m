From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Fix status property of mmc nodes for snow
 board
Date: Thu, 19 Dec 2013 04:35:33 +0900
Message-ID: <52B1F905.1060206@samsung.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>	<CAD=FV=WqgGPZaEz46JLJAPymLA5Wzehgre2Z7X4AFAWN9L_Lvg@mail.gmail.com>	<52A62E7A.1010006@samsung.com> <CAOesGMha3i+k+aBSivJopRxoi1rxAaF+ktU4KG9vfTf54A8f8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:60532 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499Ab3LRTfl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 14:35:41 -0500
In-Reply-To: <CAOesGMha3i+k+aBSivJopRxoi1rxAaF+ktU4KG9vfTf54A8f8Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On 12/19/13 03:38, Olof Johansson wrote:
> On Mon, Dec 9, 2013 at 12:56 PM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> On 12/10/13 01:16, Doug Anderson wrote:
>>>
>>> Yuvaraj,
>>>
>>> On Sun, Dec 8, 2013 at 10:38 PM, Yuvaraj Kumar C D<yuvaraj.cd@gmail.com>
>>> wrote:
>>>>
>>>> Commit 0c3de788 ("ARM: dts: change status property of dwmmc nodes
>>>> for exynos5250") missed out handling the exynos5250 snow dts file.
>>>>
>>>> Signed-off-by : Abhilash Kesavan<a.kesavan@samsung.com>
>>>>
>>>> Signed-off-by: Yuvaraj Kumar C D<yuvaraj.cd@samsung.com>
>>>> ---
>>>>    arch/arm/boot/dts/cros5250-common.dtsi |    4 ----
>>>>    arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi
>>>> b/arch/arm/boot/dts/cros5250-common.dtsi
>>>> index 6470536..1ceb62e 100644
>>>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
>>>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
>>>> @@ -247,10 +247,6 @@
>>>>                   };
>>>>           };
>>>>
>>>> -       mmc@12210000 {
>>>> -               status = "disabled";
>>>> -       };
>>>> -
>>>>           mmc@12220000 {
>>>>                   num-slots =<1>;
>>>>                   supports-highspeed;
>>>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts
>>>> b/arch/arm/boot/dts/exynos5250-snow.dts
>>>> index a9395c4..67484d1 100644
>>>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>>>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>>>> @@ -171,11 +171,20 @@
>>>>                   };
>>>>           };
>>>>
>>>> +       mmc@12200000 {
>>>> +               status = "okay";
>>>> +       };
>>>> +
>>>> +       mmc@12220000 {
>>>> +               status = "okay";
>>>> +       };
>>>> +
>>>
>>>
>>> I probably would have put the 12200000 and 12220000 ones in
>>> cros5250-common since that's where all of the other stuff relating to
>>> those ports is.  Some of it may need to be moved around once we get
>>> the HP Chromebook 11 (exynos5250-spring) in place, but until then it
>>> seems best to keep it all together.
>>>
>>> -Doug
>>
>>
>> OK, sounds better, I don't know well about the HP Chromebook though ;-)
>
> This broke linux-next on snow ever since the original patch went in.
> Please squash the above into the original patch or at the very least
> apply it as soon as possible.
>
Oops, OK. I've applied this separately just now.

Thanks,
Kukjin
