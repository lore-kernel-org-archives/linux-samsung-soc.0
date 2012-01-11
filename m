From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Wed, 11 Jan 2012 17:29:20 +0000
Message-ID: <20120111172918.GA24213@opensource.wolfsonmicro.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com> <201201102013.54958.arnd@arndb.de> <20120110223712.GL7164@opensource.wolfsonmicro.com> <201201111619.05650.arnd@arndb.de> <CAOesGMhDeN9N5A+xVGzM2aoO7YWMkxdpYxZ4o1VV42g_NP6tnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51975 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757268Ab2AKR3W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 12:29:22 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMhDeN9N5A+xVGzM2aoO7YWMkxdpYxZ4o1VV42g_NP6tnQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, Jan 11, 2012 at 08:50:54AM -0800, Olof Johansson wrote:
> On Wed, Jan 11, 2012 at 8:19 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> > I would also prefer if people stopped having their own trees included
> > in next, but I know that I'm sometimes slow to pick up patches that

> I also have to admit, as tegra maintainer, that it is convenient to
> have my tree in linux-next, and have things show up in linux-next as
> soon as I pick it up, and then send arm-soc pull requests about once a
> week or so. While we should reduce latency to pull into arm-soc,
> getting pull requests daily will be a bit on the heavy side.

Plus it also means that if there are problems you can resolve it
directly rather than having to get the fixes included in a separate tree
which helps cut down on latencies.
