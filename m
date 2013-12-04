From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] s3c64xx dmaengine conversion
Date: Wed, 4 Dec 2013 13:38:39 -0800
Message-ID: <CAOesGMj2uun+0Kr0yKtpHs_0FntJ_rnYGeM8hs+DjpT8Nn-bwg@mail.gmail.com>
References: <20131124145011.GA14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f53.google.com ([209.85.128.53]:54866 "EHLO
	mail-qe0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753220Ab3LDVim (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Dec 2013 16:38:42 -0500
Received: by mail-qe0-f53.google.com with SMTP id nc12so15299330qeb.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2013 13:38:40 -0800 (PST)
In-Reply-To: <20131124145011.GA14725@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sun, Nov 24, 2013 at 6:50 AM, Mark Brown <broonie@kernel.org> wrote:
> The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
>
>   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git tags/s3c64xx-dmaengine
>
> for you to fetch changes up to 3faecea70b0d6d050e0ae911032ec340341dc389:
>
>   spi: s3c64xx: Always select S3C64XX_PL080 when ARCH_S3C64XX is enabled (2013-11-24 14:38:25 +0000)
>
> ----------------------------------------------------------------
> ARM: s3c64xx: Convert to dmaengine
>
> This series of commits from Tomasz converting s3c64xx to use dmaengine
> rather than the old s3c-dma API missed the v3.13 merge window - Kukjin
> said that he'd applied it (which should mean it's OK from a review point
> of view) but it didn't make it into -next or a pull request.
>
> Since a s3c64xx based system is one of my primary development platforms
> it'd be really helpful if I could merge this into both ASoC and SPI,
> I've got some patches for ASoC ready to go converting to use dmaengine
> directly which help with multiplatform and there's some other dmaengine
> work for SPI in progress too.  I've therefore made this signed tag, it'd
> be great if it could be merged into both arm-soc and those two trees.
>
> ----------------------------------------------------------------
>
> I'm open to other ideas for doing this, I'd just really like to see the
> code building on this go in this cycle so anything that accomplishes
> that is good for me.

It's been 10 days and Kukjin hasn't moved on this, nor replied. I'm
going to merge it into arm-soc as samsung/s3c64xx-dmaengine ->
next/drivers so that you can use the branch as a base for your work.


-Olof
