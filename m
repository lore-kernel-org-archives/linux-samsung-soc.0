From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 00/12] ARM: EXYNOS: add support new EXYNOS5250
Date: Wed, 14 Mar 2012 15:40:01 -0700
Message-ID: <20120314224001.GB13872@quad.lixom.net>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:38156 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606Ab2CNWkG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 18:40:06 -0400
Received: by dadp12 with SMTP id p12so3630302dad.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 15:40:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de

On Wed, Mar 14, 2012 at 07:42:06AM -0700, Kukjin Kim wrote:
> This patch adds support EXYNOS5250 SoC which has two A15 cores
> can be used on mobile and tablet devices.

Looks good. I've switched back with Arnd so he does pulls right now,
but I'd be OK with this going in as it is now (see one nit to fixup when you
build the branch -- no need to repost with it I think).


So, I'll leave it up to Arnd to pull but it looks good enough for me at this
time.


-Olof
