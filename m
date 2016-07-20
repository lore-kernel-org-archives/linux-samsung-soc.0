From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Wed, 20 Jul 2016 14:29:24 +0200
Message-ID: <eeaac434-bef1-ae4e-6bfa-0625635ca8b4@samsung.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
 <5787EF8E.2010401@math.uni-bielefeld.de>
 <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com>
 <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de>
 <5788E31D.6010606@samsung.com> <5788E3CB.5080103@math.uni-bielefeld.de>
 <5788E457.6060202@samsung.com> <5788F449.6060202@math.uni-bielefeld.de>
 <1468598213.3819.2.camel@ndufresne.ca> <578E0F28.6010600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31877 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753009AbcGTM3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 08:29:30 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAM00H955D2GYC0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2016 13:29:26 +0100 (BST)
In-reply-to: <578E0F28.6010600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nicolas@ndufresne.ca, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>

On 07/19/2016 01:29 PM, Krzysztof Kozlowski wrote:
> On 07/15/2016 05:56 PM, Nicolas Dufresne wrote:
>> Le vendredi 15 juillet 2016 =C3=A0 16:33 +0200, Tobias Jakobi a =C3=A9=
crit :
>>> I can confirm that this indeed doesn't work.
>>>
>>> chidori ~ # echo 1 > /proc/sys/kernel/sysrq
>>> chidori ~ # echo s > /proc/sysrq-trigger
>>> chidori ~ # echo u > /proc/sysrq-trigger
>>> chidori ~ # echo b > /proc/sysrq-trigger
>>> <board hangs, only red power LED on>
>>>
>>> I guess Nicolas is seeing a different or another problem here thoug=
h.
>>
>> Well for me both method hangs. On an extra note, reset inside Uboot
>> works, but reboot in Linux hang. I tried adding a trace
>> in syscon_restart_handle(), but the trace is never displayed. I'm
>> wondering if that handler is ever called, or if it's just that the
>> serial console was shut down already.
>>
>> Any idea what else should I trace ?
>=20
> This is weird... reboot should work. Just to confirm it - can you tes=
t
> following patch in both scenarios (this should fix both of them... at
> least on Odroid U3 but your board might have different SPL/BL1):

I dig a little bit and emergency reboot on Odroid U3 (and family) is no=
t
solvable in an easy and clean way.

The problem is: reset is a software reset of AP which means that clocks
go to default values. If cpufreq is active and CPU regulator voltage is
low, then it will fail to boot because clock frequency is high but
voltage is low, too low.

Possible solutions would be:
1. Reset PMIC values. This does not happen on software reset. I tried
also hardware reset through watchdog - also nothing.

2. Set regulator to safe value (same as for suspend, opp-suspend). This
cannot be used in emergency path because it is a sleeping, long
operation. I even wrote simpler cpufreq restart handler but still this
is not accepted sleeping operation. Also on Odroid U3 the CPU regulator
voltage cannot be controlled through GPIO/DVS because... they are wired
to VDD.

3. Extend emergency reboot path with execution of some new
syscore_emergency_shutdown() op. That is quite intrusive and requires
changing in many archs... Not really applicable.

4. Change the minimum voltage of buck2 to 1.0V on Odroid. Set is as
constrain, always. Not nice, but should help... Is it worth the effort?

Best regards,
Krzysztof
