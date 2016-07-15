From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Fri, 15 Jul 2016 09:55:07 +0200
Message-ID: <578896DB.7060708@samsung.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de> <1468528408.4843.9.camel@ndufresne.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:9800 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865AbcGOHzL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 03:55:11 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAC00F9TJBX5410@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2016 08:55:09 +0100 (BST)
In-reply-to: <1468528408.4843.9.camel@ndufresne.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nicolas@ndufresne.ca, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

On 07/14/2016 10:33 PM, Nicolas Dufresne wrote:
> Le jeudi 14 juillet 2016 =C3=A0 22:01 +0200, Tobias Jakobi a =C3=A9cr=
it :
>> Hi Nicolas,
>>
>> do you have the reset and poweroff drivers activated?
>>
>> CONFIG_POWER_RESET_SYSCON=3Dy
>> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
>=20
> Yes, both.
>=20
>>
>> With best wishes,
>> Tobias
>>
>>
>> Nicolas Dufresne wrote:
>>> Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne a =C3=
=A9crit :
>>>> Hi,
>>>>
>>>> I'm using the Odroid U2 to test some features implemented in
>>>> GStreamer.
>>>> The parts I need mostly works in mainline kernel, my main
>>>> annoyance
>>>> ist
>>>> that reboot hangs.
>>>>
>>>> Is this issue known ? I'm booting from SD card is that matters.
>>>> Any
>>>> advise would be appreciated. I'm not list member, so please keep
>>>> me
>>>> in
>>>> CC. I'm sharing my .config, in case that is my fault.

=46irst of all - use just command "reboot" to restart. It should work. =
If
it doesn't, please let us now.

I was able to reproduce your issue - OOPS in emergency restart - also i=
n
my configuration (U3 + eMMC + network boot).

It is weird... I'll take a look at it.

Best regards,
Krzysztog
