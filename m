From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Sun, 8 Jan 2012 20:49:53 +0000
Message-ID: <20120108204953.GA20043@sirena.org.uk>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
 <CAOesGMhLE3wxM=F9OkHT-bQpsVp8Uc6eE8Uk+WN9pLuz5BRLBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37100 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754272Ab2AHUuA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Jan 2012 15:50:00 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMhLE3wxM=F9OkHT-bQpsVp8Uc6eE8Uk+WN9pLuz5BRLBw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Fri, Jan 06, 2012 at 01:58:29PM -0800, Olof Johansson wrote:

> > Please pull Samsung devel for v3.3 from:
> > ?git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next-samsung-devel-samsung

> Thanks. I've pulled this into late/devel, based on earlier email from
> Arnd we might end up sending this in towards the end of the merge
> window, but there's also a chance it will wait for 3.4.

That'd be extremely disappointing, especially given that there's some
bug fixes in there for updates going in this merge window without which
mainline is going to have problems on s3c64xx (mostly the GPIO stuff).
