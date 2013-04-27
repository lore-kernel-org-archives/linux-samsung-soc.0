From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-1 for v3.10
Date: Fri, 26 Apr 2013 18:01:37 -0700
Message-ID: <20130427010137.GD2350@quad.lixom.net>
References: <51795C62.8070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:44445 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754719Ab3D0BBm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 21:01:42 -0400
Received: by mail-pb0-f52.google.com with SMTP id mc17so1100386pbc.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2013 18:01:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51795C62.8070500@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Fri, Apr 26, 2013 at 01:40:02AM +0900, Kukjin Kim wrote:
> The following changes since commit 58a7bbf75442ea439a4d3b7993ad87023e406063:
> 
>   ARM: dts: add PDMA0 changes for exynos5440 (2013-04-09 01:39:27 +0900)

So these are fixes based on code that's already staged. We normally
don't do that -- if you have a fix for a specific branch that introduced
something, send a fresh pull request for that branch.

Looks like Doug's fix is for the common clock framework branch, so I'll apply
it to next/drivers. Thomas' is for the dt branch. I'll cherry-pick it onto
next/dt2.


-Olof
