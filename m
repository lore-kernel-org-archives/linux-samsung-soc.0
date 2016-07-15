From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 15:20:29 +0200
Message-ID: <5788E31D.6010606@samsung.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21164 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752146AbcGONUf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 09:20:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAC00C7RYE7BO90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2016 14:20:31 +0100 (BST)
In-reply-to: <5788E1EB.4030003@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, nicolas@ndufresne.ca, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

On 07/15/2016 03:15 PM, Tobias Jakobi wrote:
> Hey,
>=20
> Krzysztof Kozlowski wrote:
>> On 07/15/2016 09:55 AM, Krzysztof Kozlowski wrote:
>>>>> Nicolas Dufresne wrote:
>>>>>> Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne a =
=C3=A9crit :
>>>>>>> Hi,
>>>>>>>
>>>>>>> I'm using the Odroid U2 to test some features implemented in
>>>>>>> GStreamer.
>>>>>>> The parts I need mostly works in mainline kernel, my main
>>>>>>> annoyance
>>>>>>> ist
>>>>>>> that reboot hangs.
>>>>>>>
>>>>>>> Is this issue known ? I'm booting from SD card is that matters.
>>>>>>> Any
>>>>>>> advise would be appreciated. I'm not list member, so please kee=
p
>>>>>>> me
>>>>>>> in
>>>>>>> CC. I'm sharing my .config, in case that is my fault.
>>>
>>> First of all - use just command "reboot" to restart. It should work=
=2E If
>>> it doesn't, please let us now.
>>>
>>> I was able to reproduce your issue - OOPS in emergency restart - al=
so in
>>> my configuration (U3 + eMMC + network boot).
>>>
>>> It is weird... I'll take a look at it.
>>
>> Actually I did not encounter OOPS of yours. I was able to reproduce =
a
>> failure to reboot on U3. XU3 reboots fine. It might be related to pw=
rseq...
> I'm not sure how much that helps, but I can't reproduce any of this o=
n
> my X2 (which is quite closely related to the U2/U3).

You mean sysrq reboot works fine?

Best regards,
Krzysztof

> I'm only encountering non-working reboot when applying Marek's latest
> IOMMU runpm patchset.
>=20
>=20
>> The failure seems to be present for long time, at least since v4.2. =
I am
>> in progress of testing more releases.
> At least not for the X2, and I'm booting from a sdcard like Nicolas.
> IIRC then pwrseq only plays a role for booting from eMMC.
>=20
>=20
>> ext4 backtrace present in your OOPs might be related to improper reb=
oot.
>> Even for emergency reboot you should first sync, then remount ro and
>> finally reboot (so sysrq: sub).
> I currently don't have access to my UART adapater, but I'll try to
> reproduce the Oops by issuing a reboot SysRq directly.
>=20
>=20
> With best wishes,
> Tobias
>=20
>=20
>> Best Regards,
>> Krzysztof
>>
>=20
>=20
>=20
