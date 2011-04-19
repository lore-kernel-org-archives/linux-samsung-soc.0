From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: Cleanup Samsung stuff
Date: Tue, 19 Apr 2011 12:59:47 +0200
Message-ID: <BANLkTikxV+4Zxf6Mh1se-h396G4m4qiwaQ@mail.gmail.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
	<20110419080307.GA26650@sirena.org.uk>
	<BANLkTim2VJBoO-otakfVQaYsXLTyM91jsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:54705 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754568Ab1DSK7s convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Apr 2011 06:59:48 -0400
Received: by qwk3 with SMTP id 3so2838751qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2011 03:59:47 -0700 (PDT)
In-Reply-To: <BANLkTim2VJBoO-otakfVQaYsXLTyM91jsA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, LAK <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>

On Tue, Apr 19, 2011 at 10:40 AM, Thomas Abraham <thomas.ab@samsung.com=
> wrote:
> On Tue, Apr 19, 2011 at 1:33 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
>> On Tue, Apr 19, 2011 at 10:46:47AM +0900, Kukjin Kim wrote:
>>
>>> - Device tree (with Linaro)
>>
>> What is going on with device tree? =A0I've asked a couple of times a=
bout
>> this in the other thread but I'm still not clear where the code is o=
r
>> what could usefully be done with it.
>
> Currently I am working on supporting clkdev and Jeremy's common clock
> for all of Samsung's platforms and then continue with the device tree
> support for s5pv310.

I already posted some patches that add DeviceTree to s3c24xx (gpio, sdi=
).
I'm hanging on sdi because I found that mmc-spi already has some DT
support and I'm working to generalize it.

If nobody opposes I'll continue with the effort.

cheers,
Domenico

-----[ Domenico Andreoli, aka cavok
=A0--[ http://www.dandreoli.com/gpgkey.asc
=A0=A0 ---[ 3A0F 2F80 F79C 678A 8936=A0 4FEE 0677 9033 A20E BC50
