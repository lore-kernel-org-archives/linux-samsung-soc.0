From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 11/19] ARM: S5PV210: Remove support for board files
Date: Thu, 4 Sep 2014 18:02:36 +0200
Message-ID: <201409041802.36466.arnd@arndb.de>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com> <53C675E4.4020502@samsung.com> <1409825105.5546.91.camel@x220>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:49467 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753140AbaIDQC4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Sep 2014 12:02:56 -0400
In-Reply-To: <1409825105.5546.91.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>

On Thursday 04 September 2014, Paul Bolle wrote:
> 
> On Wed, 2014-07-16 at 14:53 +0200, Tomasz Figa wrote:
> > I believe that both sound card drivers for Goni and Aquilla could be
> > replaced with simple cards in DT, so I'll send a follow-up patch for this.
> 
> References to MACH_GONI and MACH_AQUILA can still be seen in v3.17-rc3
> and next-20140903. Note that as consequence SND_SOC_GONI_AQUILA_WM8994
> can not be set anymore.
> 
> > Most likely the same is the case for SMDK boards, but they don't seem to
> > have any active users (see cover letter for more details), which means
> > that probably they could be simply dropped from
> > sound/soc/samsung/Kconfig in another follow-up patch.
> 
> Ditto for MACH_SMDKC100, MACH_SMDKC110, and MACH_SMDKV210. Note that
> here SND_SOC_SMDK_WM8580_PCM can not be set anymore.
> 
> (This is intended to be a gentile reminder. I hope it actually comes
> across like that.)

At least I find those reminders useful. We clearly have a bug here
that was recently introduced, and we should fix that.

I think it would be nice if you could submit a patch to remove the
drivers from ASoC, then we can see if anybody complains.

	Arnd
