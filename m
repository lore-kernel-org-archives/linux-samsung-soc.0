From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Mon, 16 Jan 2012 23:24:17 -0800
Message-ID: <CAOesGMh=E8LUB-k67ZmbZ_hk132aW+F8z8yp8YX606ZZeS0=mg@mail.gmail.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
	<CAOesGMhLE3wxM=F9OkHT-bQpsVp8Uc6eE8Uk+WN9pLuz5BRLBw@mail.gmail.com>
	<20120108204953.GA20043@sirena.org.uk>
	<CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com>
	<20120109082640.GI22134@opensource.wolfsonmicro.com>
	<CAOesGMiU+-wfxsfha7GTO3s7dHysP65gcrbJsLWhBpZNT9O+UQ@mail.gmail.com>
	<001f01ccd4e8$d8456730$88d03590$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:39128 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459Ab2AQHYT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 02:24:19 -0500
Received: by werb14 with SMTP id b14so862580wer.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jan 2012 23:24:18 -0800 (PST)
In-Reply-To: <001f01ccd4e8$d8456730$88d03590$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

On Mon, Jan 16, 2012 at 11:23 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Olof Johansson wrote:
>>
>> Hi,
>>
> Hi Olof,
>
>> On Mon, Jan 9, 2012 at 12:26 AM, Mark Brown
>> <broonie@opensource.wolfsonmicro.com> wrote:
>> > On Sun, Jan 08, 2012 at 05:21:02PM -0800, Olof Johansson wrote:
>> >
>> >> Mark, Kukjin, can either of you split out the fixes in a separate
>> branch?
>> >
>> > Here's some of them, there were a few others I'm aware of that dep=
ended
>> > on feature updates. =A0Ideally we'd actually get all the changes t=
hat have
>> > been in -next in.
>> >
>> > The following changes since commit
>> 5f0a6e2d503896062f641639dacfe5055c2f593b:
>> >
>> > =A0Linux 3.2-rc7 (2011-12-23 21:51:06 -0800)
>> >
>> > are available in the git repository at:
>> > =A0git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git
>> fixes/samsung
>> >
>> > Mark Brown (5):
>> > =A0 =A0 =A0ARM: SAMSUNG: Fix GPIO space reservation for S3C64xx pl=
atforms
>> > =A0 =A0 =A0ARM: S3C64XX: Correct reservation of GPIOs for CPU modu=
le on
>> Cragganmore
>>
>> The above two don't seem to have been in the branch that was sent by
>> Kukjin, it had:
>>
>> =A0 =A0 =A0 ARM: EXYNOS: Invert VCLK polarity for framebuffer on ORI=
GEN
>> =A0 =A0 =A0 ARM: S3C64XX: Fix interrupt configuration for PCA935x on=
 Cragganmore
>> =A0 =A0 =A0 ARM: S3C64XX: Fix the memory mapped GPIOs on Cragganmore
>> =A0 =A0 =A0 ARM: S3C64XX: Remove hsmmc1 from Cragganmore
>> =A0 =A0 =A0 ARM: S3C64XX: Remove unconditional power domain disables
>> =A0 =A0 =A0 ARM: SAMSUNG: Declare struct platform_device in plat/s3c=
64xx-spi.h
>> =A0 =A0 =A0 ARM: SAMSUNG: dma-ops.h needs mach/dma.h
>> =A0 =A0 =A0 ARM: SAMSUNG: Guard against multiple inclusion of plat/d=
ma.h
>>
>> I've pulled the branch from him.
>>
> No, please drop it because above you said are in mainline now.
>
> - commit 4ff13995("ARM: SAMSUNG: Fix GPIO space reservation for S3C64=
xx
> platforms")
> - commit aaed44e1("ARM: S3C64XX: Correct reservation of GPIOs for CPU=
 module
> on Cragganmore")
>
> Seems to be merged via arm-soc/next/boards and there was some
> mis-communications.
> (Refer to the commit 8df97495 ("Merge branch 'samsung/board' into
> next/boards"))
>
> Sorry for bothering.

Ok, no worries, thanks for checking.

>> Kukjin, please consider picking up the missing two patches above and
>> send another pull request with those and any other needed fixes.
>>
> As I said, please ignore next-samsung-devel-samsung and Mark's
> fixes/samsung.
> I think, you can go ahead with my previous pull request, samsung-fixe=
s.

Done, it was in the batch I just sent a request to Linus for.


-Olof
