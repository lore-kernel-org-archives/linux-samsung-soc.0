From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 12/12] ARM: restart: S3C24XX: use new restart hook
Date: Mon, 2 Jan 2012 14:33:57 +0100
Message-ID: <201201021433.57356.heiko@sntech.de>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com> <201201021414.17551.heiko@sntech.de> <20120102132631.GC18443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:33446 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084Ab2ABNeH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 08:34:07 -0500
In-Reply-To: <20120102132631.GC18443@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Am Montag, 2. Januar 2012, 14:26:31 schrieb Mark Brown:
> On Mon, Jan 02, 2012 at 02:14:16PM +0100, Heiko St?bner wrote:
> > Therefore I'm introducing a new s3c2443-pm-common.c. Question now is,
> > should this move directly to plat-samsung?
> 
> If it's s3c2443 specific I'd expect it'd end up in the relevant mach
> directory?
nope, it's specific to 2443, 2416 and 2450. These three SoCs seem to share a 
lot of features and it seems other common code (i.e. plat-s3c24xx/s3c2443-
clock.c) has got its name from the first SoC that had this feature (the 
S3C2443 in 2007).

Therefore I just continue this naming scheme, as I also don't have a better 
idea on how to identify all three of them at once.

Heiko
