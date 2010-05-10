From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support for
 S3C6410
Date: Mon, 10 May 2010 17:17:08 +0200
Message-ID: <4BE82374.2060504@gmail.com>
References: <1054428.61651273231771063.JavaMail.weblogic@epml16> <20100510002802.GT26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f220.google.com ([209.85.219.220]:34734 "EHLO
	mail-ew0-f220.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606Ab0EJPRN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 May 2010 11:17:13 -0400
Received: by ewy20 with SMTP id 20so940545ewy.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2010 08:17:11 -0700 (PDT)
In-Reply-To: <20100510002802.GT26401@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Op 10-05-10 02:28, Ben Dooks schreef:
> On Fri, May 07, 2010 at 11:29:31AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
>   
>> Hi, Maurus
>>
>> ------- Original Message -------
>> Sender : Maurus Cuelenaere<mcuelenaere@gmail.com> 
>> Date   : May 07, 2010 14:55 (GMT+05:00)
>> Title  : Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support for
>>  S3C6410
>>
>> Hi Naveen,
>>
>> "Kukjin Kim" <kgene.kim@samsung.com> wrote:
>>
>>     
>>> From: Naveen Krishna <ch.naveen@samsung.com>
>>>
>>> Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>> ---
>>> arch/arm/mach-s3c64xx/Kconfig          |    1 +
>>> arch/arm/mach-s3c64xx/mach-smdk6410.c  |   12 +++++++
>>> arch/arm/mach-s3c64xx/s3c6410.c        |    1 +
>>> arch/arm/plat-samsung/Kconfig          |    5 +++
>>> arch/arm/plat-samsung/Makefile         |    1 +
>>> arch/arm/plat-samsung/dev-ts.c         |   54 ++++++++++++++++++++++++++++++++
>>> drivers/input/touchscreen/Kconfig      |    3 +-
>>> drivers/input/touchscreen/s3c2410_ts.c |   19 +++++++++--
>>> 8 files changed, 92 insertions(+), 4 deletions(-)
>>> create mode 100644 arch/arm/plat-samsung/dev-ts.c
>>>
>>>       
>> I'm sure you've seen my patch which does pretty much the same wrt adjusting s3c2410_ts.c.
>> Though that one has already been acked by Ben so I'm unsure what should happen: you adjusting your patchset or me dropping mine (obviously I prefer the former :) ).
>> My patch was under review for over a week, its a coincidence that i saw your patch and my patch was posted on mainline. 
>> I'ill rework my patches anyway, I'ill wait for a day on Ben Dook's Comments on my patch set.
>>     
> Naveen's patches do have two advantages, firstly that they add a gpio
> callback to the platform data so that if it is needed in the future it
> can be used again. The second is that it covers more than just the 24xx
> and 64xx series.
>
> I tried applying this with Maurus' updates but they don't apply well together
> and I'm not going to spend a lot of time trying to get the two sets applied.
>
> Maurus, hope you're not too offended if we go for Naveen's series, unless
> you have any technical commenbts that need to be sorted. 
>   

No, sure, go ahead.

-- 
Maurus Cuelenaere
