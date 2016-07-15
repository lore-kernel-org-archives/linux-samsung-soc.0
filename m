From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 15:23:23 +0200
Message-ID: <5788E3CB.5080103@math.uni-bielefeld.de>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:38917 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751540AbcGONXZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 09:23:25 -0400
In-Reply-To: <5788E31D.6010606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, nicolas@ndufresne.ca, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

Krzysztof Kozlowski wrote:
> On 07/15/2016 03:15 PM, Tobias Jakobi wrote:
>> Hey,
>>
>> Krzysztof Kozlowski wrote:
>>> On 07/15/2016 09:55 AM, Krzysztof Kozlowski wrote:
>>>>>> Nicolas Dufresne wrote:
>>>>>>> Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne a=
 =C3=A9crit :
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I'm using the Odroid U2 to test some features implemented in
>>>>>>>> GStreamer.
>>>>>>>> The parts I need mostly works in mainline kernel, my main
>>>>>>>> annoyance
>>>>>>>> ist
>>>>>>>> that reboot hangs.
>>>>>>>>
>>>>>>>> Is this issue known ? I'm booting from SD card is that matters=
=2E
>>>>>>>> Any
>>>>>>>> advise would be appreciated. I'm not list member, so please ke=
ep
>>>>>>>> me
>>>>>>>> in
>>>>>>>> CC. I'm sharing my .config, in case that is my fault.
>>>>
>>>> First of all - use just command "reboot" to restart. It should wor=
k. If
>>>> it doesn't, please let us now.
>>>>
>>>> I was able to reproduce your issue - OOPS in emergency restart - a=
lso in
>>>> my configuration (U3 + eMMC + network boot).
>>>>
>>>> It is weird... I'll take a look at it.
>>>
>>> Actually I did not encounter OOPS of yours. I was able to reproduce=
 a
>>> failure to reboot on U3. XU3 reboots fine. It might be related to p=
wrseq...
>> I'm not sure how much that helps, but I can't reproduce any of this =
on
>> my X2 (which is quite closely related to the U2/U3).
>=20
> You mean sysrq reboot works fine?
No, I haven't checked that yet. But normal reboot and poweroff via init
works properly.

- Tobias


> Best regards,
> Krzysztof
>=20
>> I'm only encountering non-working reboot when applying Marek's lates=
t
>> IOMMU runpm patchset.
>>
>>
>>> The failure seems to be present for long time, at least since v4.2.=
 I am
>>> in progress of testing more releases.
>> At least not for the X2, and I'm booting from a sdcard like Nicolas.
>> IIRC then pwrseq only plays a role for booting from eMMC.
>>
>>
>>> ext4 backtrace present in your OOPs might be related to improper re=
boot.
>>> Even for emergency reboot you should first sync, then remount ro an=
d
>>> finally reboot (so sysrq: sub).
>> I currently don't have access to my UART adapater, but I'll try to
>> reproduce the Oops by issuing a reboot SysRq directly.
>>
>>
>> With best wishes,
>> Tobias
>>
>>
>>> Best Regards,
>>> Krzysztof
>>>
>>
>>
>>
>=20
