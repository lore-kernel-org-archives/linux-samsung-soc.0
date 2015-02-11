From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 0/4] ASoC: samsung: clean up references to outdated
 Kconfig symbols
Date: Wed, 11 Feb 2015 10:21:38 +0100
Message-ID: <1423646498.21685.35.camel@x220>
References: <1421664067.9655.51.camel@x220>
	 <20150206235044.GO31311@finisterre.sirena.org.uk>
	 <1423298284.2246.5.camel@x220>
	 <20150209060704.GB19229@finisterre.sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10]:56228 "EHLO
	cpsmtpb-ews07.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751927AbbBKJVl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Feb 2015 04:21:41 -0500
In-Reply-To: <20150209060704.GB19229@finisterre.sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Valentin Rothberg <valentinrothberg@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

TL;DR: what exactly should I resend and when?

On Mon, 2015-02-09 at 14:07 +0800, Mark Brown wrote:
> On Sat, Feb 07, 2015 at 09:38:04AM +0100, Paul Bolle wrote:
> 
> > Patches 2/4, 3/4, and 4/4 didn't apply. Locally I carry them in a tree
> > that constantly rebases on top of linux-next. So locally I carry these
> > patches on top of next-20150204.
> 
> What's posted doesn't apply against -next.

That's because of trivial conflicts with commit a59aa180ea56 ("ASoC:
samsung: Replace depends on REGMAP_I2C with depends on I2C"). That
commit landed in next-20150127 (ie, eight days after I sent this short
series). I guess I resolved these conflicts in the local version of
these patches and promptly forgot about them, as they were so trivial.

> > What tree would you like me to rebase this onto?
> 
> As ever submit against the tree listed in MAINTAINERS
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Which is not entirely obvious, since this series only touches files
below sound/soc/samsung/. That directory is mentioned in MAINTAINERS
under "ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" and under "SAMSUNG AUDIO
(ASoC) DRIVERS". (Why does that directory need two entries?) Neither
entry mention a repository.

Anyhow, this entire series will probably now apply to your for-next
branch. That's because your for-next branch doesn't contain commit
a59aa180ea56 ("ASoC: samsung: Replace depends on REGMAP_I2C with depends
on I2C"), which I mentioned above, or commit 6cf2cf315075 ("ASoC:
samsung: Remove goni or aquila with the WM8994"), which is 1/4 of this
series, anymore.

See, it turns out there are two sound.git#for-next branches in
linux-next. One is done by Takashi, the other by you. Yours is called
sound-asoc in Next/Trees, the other sound. sound-asoc contained the two
commits I just mentioned in next-20150209. It has dropped both, it
seems, by next-20150210, but by then they were already included in
Takashi's sound. So these two commits are now in linux-next through that
branch. Figuring this all out required quite a bit of head-scratching.

And now I wonder what I should resend: the three patches 2/4, 3/4, and
4/4 with the trivial conflicts resolved or the entire series? And when
do you prefer I resend?

Thanks,


Paul Bolle
