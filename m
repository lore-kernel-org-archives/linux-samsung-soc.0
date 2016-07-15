From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 13:35:03 +0200
Message-ID: <5788CA67.5090200@samsung.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23147 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932590AbcGOLfJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 07:35:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAC00FS1TIH5460@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2016 12:35:05 +0100 (BST)
In-reply-to: <578896DB.7060708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nicolas@ndufresne.ca, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

On 07/15/2016 09:55 AM, Krzysztof Kozlowski wrote:
>>> Nicolas Dufresne wrote:
>>>> Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne a =C3=
=A9crit :
>>>>> Hi,
>>>>>
>>>>> I'm using the Odroid U2 to test some features implemented in
>>>>> GStreamer.
>>>>> The parts I need mostly works in mainline kernel, my main
>>>>> annoyance
>>>>> ist
>>>>> that reboot hangs.
>>>>>
>>>>> Is this issue known ? I'm booting from SD card is that matters.
>>>>> Any
>>>>> advise would be appreciated. I'm not list member, so please keep
>>>>> me
>>>>> in
>>>>> CC. I'm sharing my .config, in case that is my fault.
>=20
> First of all - use just command "reboot" to restart. It should work. =
If
> it doesn't, please let us now.
>=20
> I was able to reproduce your issue - OOPS in emergency restart - also=
 in
> my configuration (U3 + eMMC + network boot).
>=20
> It is weird... I'll take a look at it.

Actually I did not encounter OOPS of yours. I was able to reproduce a
failure to reboot on U3. XU3 reboots fine. It might be related to pwrse=
q...

The failure seems to be present for long time, at least since v4.2. I a=
m
in progress of testing more releases.

ext4 backtrace present in your OOPs might be related to improper reboot=
=2E
Even for emergency reboot you should first sync, then remount ro and
finally reboot (so sysrq: sub).

Best Regards,
Krzysztof
