From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 04/11] ARM: EXYNOS: add interrupt definitions for EXYNOS5250
Date: Wed, 7 Mar 2012 21:53:38 -0800
Message-ID: <CAOesGMgbm0+3nSnw=MTM--5kzUNMEofNQRudRUNzF_LCLCKX5A@mail.gmail.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
	<1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
	<CAOesGMhmcnt6LPb9O+3420VgG=PiCnOjzZA3JqsA=4OdHN-R-g@mail.gmail.com>
	<00a901ccf084$90460900$b0d21b00$%kim@samsung.com>
	<CAOesGMgedngJKRVCYwK=+xRnchXj4StGLTVqvv9BMqVhtM=5RA@mail.gmail.com>
	<4F575EC8.2090205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:56557 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694Ab2CHFxi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 00:53:38 -0500
Received: by mail-gy0-f174.google.com with SMTP id r11so50690ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 21:53:38 -0800 (PST)
In-Reply-To: <4F575EC8.2090205@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

Hi,

On Wed, Mar 7, 2012 at 5:12 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Thanks for your kindly reminder but I couldn't finish it yet because it is
> required to touch most of samsung stuff, and it's a big change. Frankly, I
> need more time...
>
> So how about sending current exynos5 stuff for now and then sorting out
> single kernel for exynos4 and exynos5 next time? Actually, this exynos5 arch
> part is _really_ needed for developing/contribution of drivers on exynos5.

I suggest that you work on the code until it's in shape to go in. If
we pick it up half-finished it just causes extra churn.

We have been pushing back on v6/v7 additions that are not multi-board
and multi-soc within the same machine type. Not being able to build a
combined binary with exynos 4 and 5 support in one would be a step
backwards on that effort.

I'm not sure I understand the argument about drivers -- they should
mostly be possible to submit and get included without the core SoC
patches such that when those land, you'll have a fully functional
system.


-Olof
