From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Mon, 9 Jan 2012 08:11:54 -0800
Message-ID: <20120109161152.GA2974@opensource.wolfsonmicro.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
 <CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com>
 <01a301ccce6f$9bb51790$d31f46b0$%kim@samsung.com>
 <201201091556.34817.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49790 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932170Ab2AIQM1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 11:12:27 -0500
Content-Disposition: inline
In-Reply-To: <201201091556.34817.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 09, 2012 at 03:56:34PM +0000, Arnd Bergmann wrote:

> Of course we will take all bug fixes. Just rebase the rest on top of 3.3-rc1
> and we can take it right away for 3.4.

I've sent a pull request earlier in the thread for the main ones I'm
aware of (which are mostly fixes for things introduced in this cycle) -
the others I'm aware of are all specific to Cragganmore and given that
we can't get any of the features for that merged the fixes aren't going
to have any practical effect until we can manage to get the feature
stuff merged so it's not really worth the effort.

This really is very disappointing.
