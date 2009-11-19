From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
	SoC uart
Date: Thu, 19 Nov 2009 20:26:34 +0900
Message-ID: <1b68c6790911190326r38661a55iebcd4ac28a5b8a81@mail.gmail.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
	 <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
	 <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
	 <20091118221345.GB4808@trinity.fluff.org>
	 <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
	 <20091119103336.GB15460@sirena.org.uk>
	 <1b68c6790911190305w33e777e3n1ed6b172d67f1639@mail.gmail.com>
	 <20091119110827.GE9763@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:51064 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830AbZKSL02 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 06:26:28 -0500
Received: by pwi3 with SMTP id 3so1340428pwi.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2009 03:26:34 -0800 (PST)
In-Reply-To: <20091119110827.GE9763@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Nov 19, 2009 at 8:08 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, Nov 19, 2009 at 08:05:29PM +0900, jassi brar wrote:
>> On Thu, Nov 19, 2009 at 7:33 PM, Mark Brown
>
>> > This is going to set off warnings from a clock API point of view -
>> > passing clock names around in platform data is usually a sign that
>> > something is very wrong. =C2=A0Keeping the mapping inside the cloc=
k API
>> > (still controlled by the board driver but by telling the clock API=
 that
>> > device X should use clock Y).
>
>> no clock pointer needs to be passed, just a pointer to an array of _=
strings_
>> There is no need to even include any clock header in platform code
>> for the purpose.
>
> Yes, that's what I was commenting on - like I say, passing clock name=
s
> tends to set off the same alarm bells as passing a struct clk. =C2=A0=
Like I
> say, the general model for this has been that the fixups will be done=
 by
> having the machine code talk to the clock API ratehr than bouncing th=
e
> data about the clock to use through the driver.
The case here is that UART controller can source from various platform =
clocks
to generate the UART clocks. The drivers/serial/samsung.c chooses a sou=
rce
clock that can result in closest match to the requested rate.
How could we do that from machine code(except for writing callbacks for=
 each
machine using the SoC)?

Or maybe i cud understand better looking at some example.
Cud u suggest some please?
