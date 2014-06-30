From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/17] ARM: S5P64X0, S5PC100: no more support in mainline
Date: Mon, 30 Jun 2014 16:31:22 +0200
Message-ID: <4717633.z8gH3C8KXB@wuerfel>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com> <6153646.CZ57BgYKf3@wuerfel> <20140630142224.GA30417@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:55903 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbaF3Obe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 10:31:34 -0400
In-Reply-To: <20140630142224.GA30417@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Monday 30 June 2014 16:22:25 Thierry Reding wrote:
> On Mon, Jun 30, 2014 at 03:34:27PM +0200, Arnd Bergmann wrote:
> > On Tuesday 01 July 2014 06:32:10 Kukjin Kim wrote:
> > > This series removes S5P64X0 and S5PC100 related codes in mainline,
> > > because no more user now. And if its supporting is required later,
> > > it will be done with using device tree.
> > > 
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> It seems like I'm not completely up-to-date. What happened to our prime
> directive never to remove support for boards? Why is this special? What
> about people that still use this hardware? The commit message says that
> there are no longer any users. How was this determined?

>From what I can tell, the supported machines on these two platforms are
all the official development prototypes, not production boards, and they
came out in rather small quantities, probably Samsung-internal for the
most part. The maintainers have previously assured me they are not aware
of anybody using it, and I trust their judgment.

I'm totally fine with removing support for these machines, and we have
removed a number of similar platforms in the past. The rule is not that
we never remove stuff, the rule is that we never break things for
active users.

As always, if it turns out that we missed some active users, we will
revert these patches, or bring support back another way.

This should probably all be spelled out explicitly in the changelog
for patch 1, which I admit I have not seen.

	Arnd
