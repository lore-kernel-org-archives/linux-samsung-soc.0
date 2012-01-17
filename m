From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Mon, 16 Jan 2012 22:40:17 -0800
Message-ID: <CAOesGMiU+-wfxsfha7GTO3s7dHysP65gcrbJsLWhBpZNT9O+UQ@mail.gmail.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
	<CAOesGMhLE3wxM=F9OkHT-bQpsVp8Uc6eE8Uk+WN9pLuz5BRLBw@mail.gmail.com>
	<20120108204953.GA20043@sirena.org.uk>
	<CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com>
	<20120109082640.GI22134@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:50249 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851Ab2AQGkS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 01:40:18 -0500
Received: by yenm6 with SMTP id m6so17315yen.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jan 2012 22:40:17 -0800 (PST)
In-Reply-To: <20120109082640.GI22134@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

On Mon, Jan 9, 2012 at 12:26 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Sun, Jan 08, 2012 at 05:21:02PM -0800, Olof Johansson wrote:
>
>> Mark, Kukjin, can either of you split out the fixes in a separate br=
anch?
>
> Here's some of them, there were a few others I'm aware of that depend=
ed
> on feature updates. =A0Ideally we'd actually get all the changes that=
 have
> been in -next in.
>
> The following changes since commit 5f0a6e2d503896062f641639dacfe5055c=
2f593b:
>
> =A0Linux 3.2-rc7 (2011-12-23 21:51:06 -0800)
>
> are available in the git repository at:
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git fix=
es/samsung
>
> Mark Brown (5):
> =A0 =A0 =A0ARM: SAMSUNG: Fix GPIO space reservation for S3C64xx platf=
orms
> =A0 =A0 =A0ARM: S3C64XX: Correct reservation of GPIOs for CPU module =
on Cragganmore

The above two don't seem to have been in the branch that was sent by
Kukjin, it had:

      ARM: EXYNOS: Invert VCLK polarity for framebuffer on ORIGEN
      ARM: S3C64XX: Fix interrupt configuration for PCA935x on Cragganm=
ore
      ARM: S3C64XX: Fix the memory mapped GPIOs on Cragganmore
      ARM: S3C64XX: Remove hsmmc1 from Cragganmore
      ARM: S3C64XX: Remove unconditional power domain disables
      ARM: SAMSUNG: Declare struct platform_device in plat/s3c64xx-spi.=
h
      ARM: SAMSUNG: dma-ops.h needs mach/dma.h
      ARM: SAMSUNG: Guard against multiple inclusion of plat/dma.h

I've pulled the branch from him.

Kukjin, please consider picking up the missing two patches above and
send another pull request with those and any other needed fixes.


-Olof
