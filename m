From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 15:24:34 +0200
Message-ID: <5788E412.7020508@samsung.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29233 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbcGONYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 09:24:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAC00FB0YL05490@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2016 14:24:36 +0100 (BST)
In-reply-to: <5788E31D.6010606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, nicolas@ndufresne.ca, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

On 07/15/2016 03:20 PM, Krzysztof Kozlowski wrote:
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

BTW, I bisected this to merge commit appearing in v4.3 merge window,
bringing in cpufreq-dt to Exynos4412. There was a reboot issue related
to cpufreq frequency and voltage. Bartlomiej fixed it in 1605b60ad064
("ARM: dts: add suspend opp to exynos4412"). However the opp-suspend an=
d
cpufreq-suspend are activated through syscore shutdown.

Unfortunately it seems that syscore shutdown is not called during
emergency reboot.

It looks like more generic problem.

Best regards,
Krzysztof
