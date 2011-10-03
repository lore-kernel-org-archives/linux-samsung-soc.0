From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.2
Date: Mon, 3 Oct 2011 13:16:39 +0100
Message-ID: <20111003121639.GF23811@sirena.org.uk>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
 <20111002192950.GB1005@sirena.org.uk>
 <005801cc817c$5d42f9e0$17c8eda0$%kim@samsung.com>
 <20111003103626.GA3731@opensource.wolfsonmicro.com>
 <20111003112235.GD11710@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:59279 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755084Ab1JCMQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Oct 2011 08:16:42 -0400
Content-Disposition: inline
In-Reply-To: <20111003112235.GD11710@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org

On Mon, Oct 03, 2011 at 12:22:35PM +0100, Russell King - ARM Linux wrote:
> On Mon, Oct 03, 2011 at 11:36:26AM +0100, Mark Brown wrote:

> > It's possible it's something that doesn't manifest on that board, I've
> > no real idea what's exploding or why.  There's also a bunch of other
> > early boot problems right now like try_to_freeze() which aren't helping.

> I don't know whether I can solve that before the next merge window.
> There's lots of corner cases, and I'm no longer convinced that my
> previous patch doesn't introduce more problems than it solves (such
> as completely breaking the -ERESTART_RESTARTBLOCK handing.)

> While it's possible to shut up the warning by enabling IRQs, that makes
> the race for restarting (or not restarting) syscalls *huge*, and that
> could cause unexpected userspace behaviour depending on whether they
> handle EINTR and _how_ they handle EINTR on system calls which they
> expect would've been restarted by the kernel.

It looks like the patches to stop it happening constantly have been
applied so it's a much less serious problem than it was originally - we
can boot and run reasonably cleanly.  It's certainly not the crippling
issue it was originally.
