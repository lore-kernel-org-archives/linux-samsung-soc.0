From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Wed, 11 Jan 2012 16:19:05 +0000
Message-ID: <201201111619.05650.arnd@arndb.de>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com> <201201102013.54958.arnd@arndb.de> <20120110223712.GL7164@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50527 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756912Ab2AKQTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 11:19:11 -0500
In-Reply-To: <20120110223712.GL7164@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Tuesday 10 January 2012, Mark Brown wrote:

> I do also wonder if it's worth letting people push stuff to you
> more aggressively - right now you seem to be asking people to batch
> things up and I wonder if that's making it a it easier for things to end
> up dropping on the floor if a time based routine isn't working well for
> people.

I really wish people would push stuff into arm-soc more aggressively,
and I certainly didn't want to give the impression that maintainers
should let their stuff sit in linux-next before sending it to us.

It's absolutely fine to send multiple updates per branch for arm-soc
as stuff comes in, as long as we can keep track of the dependencies
and we don't have to rebase the stuff that's already merged.

I would also prefer if people stopped having their own trees included
in next, but I know that I'm sometimes slow to pick up patches that
were submitted to arm-soc and that it helps people if they can get
earlier integration testing that way. Hopefully we're also getting
better at dealing with pull requests quickly so that there is no
need for the other tree in linux-next any more.

	Arnd
