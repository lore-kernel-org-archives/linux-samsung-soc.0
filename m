From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] ARM: dts: Fix status property of mmc nodes for snow board
Date: Mon, 23 Dec 2013 13:43:01 -0800
Message-ID: <CAOesGMhBMh6+DJTXSDcmQWk8EAPJG1O0ZWwGJuNC_A8k6fgegw@mail.gmail.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
	<CAD=FV=WqgGPZaEz46JLJAPymLA5Wzehgre2Z7X4AFAWN9L_Lvg@mail.gmail.com>
	<52A62E7A.1010006@samsung.com>
	<CAOesGMha3i+k+aBSivJopRxoi1rxAaF+ktU4KG9vfTf54A8f8Q@mail.gmail.com>
	<52B1F905.1060206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:53771 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932405Ab3LWVnC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 16:43:02 -0500
Received: by mail-qa0-f48.google.com with SMTP id w5so5583409qac.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2013 13:43:01 -0800 (PST)
In-Reply-To: <52B1F905.1060206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Wed, Dec 18, 2013 at 11:35 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 12/19/13 03:38, Olof Johansson wrote:
>>
>> On Mon, Dec 9, 2013 at 12:56 PM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>>>
>>> On 12/10/13 01:16, Doug Anderson wrote:
>>>>
>>>>
>>>> Yuvaraj,
>>>>
>>>> On Sun, Dec 8, 2013 at 10:38 PM, Yuvaraj Kumar C D<yuvaraj.cd@gmail.com>
>>>> wrote:
>>>>>
>>>>>
>>>>> Commit 0c3de788 ("ARM: dts: change status property of dwmmc nodes
>>>>> for exynos5250") missed out handling the exynos5250 snow dts file.
>>>>>
>>>>> Signed-off-by : Abhilash Kesavan<a.kesavan@samsung.com>
>>>>>
>>>>> Signed-off-by: Yuvaraj Kumar C D<yuvaraj.cd@samsung.com>
>>>>> ---
>>>>>    arch/arm/boot/dts/cros5250-common.dtsi |    4 ----
>>>>>    arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
>>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi
>>>>> b/arch/arm/boot/dts/cros5250-common.dtsi
>>>>> index 6470536..1ceb62e 100644
>>>>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
>>>>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
>>>>> @@ -247,10 +247,6 @@
>>>>>                   };
>>>>>           };
>>>>>
>>>>> -       mmc@12210000 {
>>>>> -               status = "disabled";
>>>>> -       };
>>>>> -
>>>>>           mmc@12220000 {
>>>>>                   num-slots =<1>;
>>>>>                   supports-highspeed;
>>>>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> b/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> index a9395c4..67484d1 100644
>>>>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>>>>> @@ -171,11 +171,20 @@
>>>>>                   };
>>>>>           };
>>>>>
>>>>> +       mmc@12200000 {
>>>>> +               status = "okay";
>>>>> +       };
>>>>> +
>>>>> +       mmc@12220000 {
>>>>> +               status = "okay";
>>>>> +       };
>>>>> +
>>>>
>>>>
>>>>
>>>> I probably would have put the 12200000 and 12220000 ones in
>>>> cros5250-common since that's where all of the other stuff relating to
>>>> those ports is.  Some of it may need to be moved around once we get
>>>> the HP Chromebook 11 (exynos5250-spring) in place, but until then it
>>>> seems best to keep it all together.
>>>>
>>>> -Doug
>>>
>>>
>>>
>>> OK, sounds better, I don't know well about the HP Chromebook though ;-)
>>
>>
>> This broke linux-next on snow ever since the original patch went in.
>> Please squash the above into the original patch or at the very least
>> apply it as soon as possible.
>>
> Oops, OK. I've applied this separately just now.

Since you hadn't applied this to the branch you sent me, I now have an
arm-soc for-next branch that doesn't boot on Chromebooks.

I've picked up the above patch directly into arm-soc. Please drop it
from your branch.


-Olof
