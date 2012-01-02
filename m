From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 12/12] ARM: restart: S3C24XX: use new restart hook
Date: Mon, 2 Jan 2012 13:39:07 +0000
Message-ID: <20120102133906.GP4300@opensource.wolfsonmicro.com>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com>
 <201201021414.17551.heiko@sntech.de>
 <20120102132631.GC18443@sirena.org.uk>
 <201201021433.57356.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48949 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751084Ab2ABNjK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 08:39:10 -0500
Content-Disposition: inline
In-Reply-To: <201201021433.57356.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 02, 2012 at 02:33:57PM +0100, Heiko St=FCbner wrote:
> Am Montag, 2. Januar 2012, 14:26:31 schrieb Mark Brown:
> > On Mon, Jan 02, 2012 at 02:14:16PM +0100, Heiko St?bner wrote:

> > > Therefore I'm introducing a new s3c2443-pm-common.c. Question now=
 is,
> > > should this move directly to plat-samsung?

> > If it's s3c2443 specific I'd expect it'd end up in the relevant mac=
h
> > directory?

> nope, it's specific to 2443, 2416 and 2450. These three SoCs seem to =
share a=20
> lot of features and it seems other common code (i.e. plat-s3c24xx/s3c=
2443-
> clock.c) has got its name from the first SoC that had this feature (t=
he=20
> S3C2443 in 2007).

Oh, right - that's not terribly clear but I guess.
