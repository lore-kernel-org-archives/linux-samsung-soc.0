From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel-4 for v3.2
Date: Sat, 5 Nov 2011 00:56:51 +0100
Message-ID: <201111050056.51554.arnd@arndb.de>
References: <027f01cc9ab6$2086eae0$6194c0a0$%kim@samsung.com> <201111050020.55071.arnd@arndb.de> <02d901cc9b4a$15a127f0$40e377d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:56580 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537Ab1KDX4z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 19:56:55 -0400
In-Reply-To: <02d901cc9b4a$15a127f0$40e377d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Saturday 05 November 2011, Kukjin Kim wrote:
> Arnd Bergmann wrote:

> > Please send the contents split up into separate branches (dt, spi, clkdev,
> > rename, devel) for 3.3. I think it's ok if you want to send just the
> > rename patch for 3.2 the way we had discussed earlier, because this kind
> > of patch really makes sense at the end of the merge window.
> > 
> Hi Arnd,
> 
> OK, I will send the rename branch in a half an hour and make separate
> branches for others which will be merged next time.

Ok, very good. I'm sending the pull requests for the other two branches
right now, I assume Linus will take them quickly (or not at all if he
has unexpected objections), so you could base your pull request on top
of his merge.

	Arnd
