From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 00/12] ARM: EXYNOS: add support new EXYNOS5250
Date: Tue, 13 Mar 2012 20:57:28 -0700
Message-ID: <20120314035728.GC2531@quad.lixom.net>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
 <201203131622.09048.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40598 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224Ab2CND5a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 23:57:30 -0400
Received: by iagz16 with SMTP id z16so1729362iag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 20:57:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201203131622.09048.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Mar 13, 2012 at 04:22:08PM +0000, Arnd Bergmann wrote:
> On Tuesday 13 March 2012, Kukjin Kim wrote:
> > 
> > This patch adds support EXYNOS5250 SoC which has two A15 cores
> > can be used on mobile and tablet devices.
> 
> Looks basically ok to me. I've commented on patches 5 and 9 and
> in both cases, I would either like to see the patch get dropped
> or the changeset description expanded to give a good explanation
> why the change is actually needed.

Agree, looks quite reasonable. I had a few nits as well but nothing
major.


Thanks,

-Olof
