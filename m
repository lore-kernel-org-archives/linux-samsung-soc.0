From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH] watchdog: fix error in probe() of s3c2410_wdt (reset at booting)
Date: Tue, 17 Jan 2012 11:00:54 +0900
Message-ID: <CAJ0PZbSpL0-LNHfU7TTM06tPi1B4VgCp=oyPA06qAjp8PoPT2w@mail.gmail.com>
References: <1326431663-4638-1-git-send-email-myungjoo.ham@samsung.com>
	<20120113111117.GT1068@n2100.arm.linux.org.uk>
	<20120113214555.GA19495@infomag.iguana.be>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43755 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795Ab2AQCAy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jan 2012 21:00:54 -0500
In-Reply-To: <20120113214555.GA19495@infomag.iguana.be>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-watchdog@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

On Sat, Jan 14, 2012 at 6:45 AM, Wim Van Sebroeck <wim@iguana.be> wrote=
:
> Hi,
>
> On Fri, Jan 13, 2012 at 11:11:17AM +0000, Russell King - ARM Linux wr=
ote:
>
>> On Fri, Jan 13, 2012 at 02:14:23PM +0900, MyungJoo Ham wrote:
>> > Probe function of s3c2410 watchdog calls request_irq before initia=
lizing
>> > required value (wdt_count). This incurs resetting watchdog counter=
 value
>> > and watchdog-reboot during booting up.
>> >
>> > This patch addresses such an issue by calling request_irq later.
>> >
>> > Error handling in probe function and calling oder in remove functi=
on are
>> > also revised accordingly.
>>
>> On the other hand, this patch violates the general principle that yo=
u set
>> the device up _before_ you publish it to userspace.
>>
>> In the case where you add the watchdog device, but then the subseque=
nt
>> request_irq() fails, there is a window where the watchdog device cou=
ld
>> be opened and started. =A0You then fall out through the error paths,=
 and
>> the module could be removed.
>>
>> Don't do this. =A0Always setup the device first. =A0Then publish it.=
 =A0Never
>> the other way around.
>
> Russell was faster in replying, but I would have given the same NAK:
> the registering of the watchdog means that userspace get access/contr=
ol over
> the watchdog device. So the request_irq should be done before that.
>
> In your trouble description you wrote: "Probe function of s3c2410 wat=
chdog
> calls request_irq before initializing required value (wdt_count)."
> Should we not fix the initialization of the wdt_count value instead o=
f the
> request_irq? i will have a look at the code somewhere this weekend.
>
> Mvg,
> Wim.
>

Yes, if we set wdt_count value properly before request_irq, it's fine.

Anyway, as registering the device (watchdog_register_device()) may be
done after request_irq without any problem, moving request_irq right
before it, not after it should be fine.

Thank you.



Cheers!
MyungJoo.

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
