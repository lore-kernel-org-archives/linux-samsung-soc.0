From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/10] ARM: s3c64xx multiplatform, help needed
Date: Mon, 02 Mar 2015 21:48:04 +0100
Message-ID: <4881827.s58SBDBL3P@wuerfel>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:59776 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754746AbbCBUsP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 15:48:15 -0500
In-Reply-To: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, dmitry.torokhov@gmail.com, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, cw00.choi@samsung.com, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, a.kesavan@samsung.com, ch.naveen@samsung.com, jic23@kernel.org

On Monday 02 March 2015 13:35:53 Arnd Bergmann wrote:
> Hi everyone,
> 
> I've had these patches in a private git tree for a while, and have
> finally gotten around to clean them up some more for submission.
> Hopefully we can get all of it merged into 4.1.
> 
> I've done this to the best of my knowledge, but some parts are
> a bit tricky, so I expect that there are bugs. The trickiest
> part is the touchscreen driver. I've sent it out for review
> last year already, but I have not found anybody who could test
> it, and it's basically a blind rewrite of an existing driver,
> so it's unlikely that I got it all right.
> 
> The other parts may actually work, but it is possible that
> I made a mistake with the ASoC driver, the sparseirq support
> or something else.
> 
> Does anyone still have access to the hardware? I'm particularly
> interested in seeing this patch set get tested on smartq
> and on smdk6410, which have the majority of the hardware.
> 

I should have mentioned, this series (and the respective bits
for realview, mmp, and orion) is now at
http://git.kernel.org/cgit/linux/kernel/git/arnd/playground.git/log/?h=multiplatform-4.0-rc1

	Arnd
