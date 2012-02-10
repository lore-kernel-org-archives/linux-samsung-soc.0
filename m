From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung EXYNOS pm domains for devel
Date: Fri, 10 Feb 2012 23:34:29 +0000
Message-ID: <201202102334.29545.arnd@arndb.de>
References: <010a01cce7e2$438f6d40$caae47c0$%kim@samsung.com> <201202102305.45710.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:49479 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761116Ab2BJXeh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 18:34:37 -0500
In-Reply-To: <201202102305.45710.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Friday 10 February 2012, Rafael J. Wysocki wrote:
> On Friday, February 10, 2012, Kukjin Kim wrote:
> > Hi Arnd, Olof,
> > 
> > Please pull samsung exynos pm domains.
> > 
> > It has been merged into linux-pm tree by Rafael and I think it should be
> > pulled into arm-soc.
> 
> No, this doesn't work like this.  A single patchset is not expected to be
> present in two different trees at a time.

We've been doing this for a number of other branches and I see nothing wrong
with this approach as long as we can rely on both trees not to rebase the
patches so the commit IDs remain stable.

Rafael, do you want to keep the option of rebasing the patches that you
got from Kukjin? If your workflow requires that, I can't take them, but
if you can guarantee that the branch you have pulled them into is stable,
I would prefer to pull it into a branch of arm-soc so that we can have
other branches based on that where needed to avoid conflicts.

	Arnd
