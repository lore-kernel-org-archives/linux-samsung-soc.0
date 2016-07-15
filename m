From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 16:33:45 +0200
Message-ID: <5788F449.6060202@math.uni-bielefeld.de>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com> <5788E3CB.5080103@math.uni-bielefeld.de>
 <5788E457.6060202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39350 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751033AbcGOOdr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 10:33:47 -0400
In-Reply-To: <5788E457.6060202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, nicolas@ndufresne.ca, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

Krzysztof Kozlowski wrote:
> On 07/15/2016 03:23 PM, Tobias Jakobi wrote:
>> Krzysztof Kozlowski wrote:
>>> On 07/15/2016 03:15 PM, Tobias Jakobi wrote:
>>>> Hey,
>>>>
>>>> Krzysztof Kozlowski wrote:
>>>>> On 07/15/2016 09:55 AM, Krzysztof Kozlowski wrote:
>>>>>>>> Nicolas Dufresne wrote:
>>>>>>>>> Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne=
 a =C3=A9crit :
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> I'm using the Odroid U2 to test some features implemented in
>>>>>>>>>> GStreamer.
>>>>>>>>>> The parts I need mostly works in mainline kernel, my main
>>>>>>>>>> annoyance
>>>>>>>>>> ist
>>>>>>>>>> that reboot hangs.
>>>>>>>>>>
>>>>>>>>>> Is this issue known ? I'm booting from SD card is that matte=
rs.
>>>>>>>>>> Any
>>>>>>>>>> advise would be appreciated. I'm not list member, so please =
keep
>>>>>>>>>> me
>>>>>>>>>> in
>>>>>>>>>> CC. I'm sharing my .config, in case that is my fault.
>>>>>>
>>>>>> First of all - use just command "reboot" to restart. It should w=
ork. If
>>>>>> it doesn't, please let us now.
>>>>>>
>>>>>> I was able to reproduce your issue - OOPS in emergency restart -=
 also in
>>>>>> my configuration (U3 + eMMC + network boot).
>>>>>>
>>>>>> It is weird... I'll take a look at it.
>>>>>
>>>>> Actually I did not encounter OOPS of yours. I was able to reprodu=
ce a
>>>>> failure to reboot on U3. XU3 reboots fine. It might be related to=
 pwrseq...
>>>> I'm not sure how much that helps, but I can't reproduce any of thi=
s on
>>>> my X2 (which is quite closely related to the U2/U3).
>>>
>>> You mean sysrq reboot works fine?
>> No, I haven't checked that yet. But normal reboot and poweroff via i=
nit
>> works properly.
>=20
> Yeah, these work fine. It is all about emergency restart.
I can confirm that this indeed doesn't work.

chidori ~ # echo 1 > /proc/sys/kernel/sysrq
chidori ~ # echo s > /proc/sysrq-trigger
chidori ~ # echo u > /proc/sysrq-trigger
chidori ~ # echo b > /proc/sysrq-trigger
<board hangs, only red power LED on>

I guess Nicolas is seeing a different or another problem here though.

With best wishes,
Tobias


> Best regards,
> Krzysztof
>=20
>=20
>=20
