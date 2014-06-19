From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 4/4] ARM: dts: refactor Odroid DTS file and add support
 for Odroid X2 and U2/U3
Date: Thu, 19 Jun 2014 13:43:04 +0100
Message-ID: <CAD8Lp46oYP6wiT_Ehor6O-LZ8Z+vgJLh0fKivKKCdzVG+SGNgQ@mail.gmail.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
	<1402997133-13827-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:34799 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbaFSMnG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 08:43:06 -0400
Received: by mail-wi0-f182.google.com with SMTP id bs8so2769507wib.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 05:43:04 -0700 (PDT)
In-Reply-To: <1402997133-13827-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

On Tue, Jun 17, 2014 at 10:25 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch moves some parts of exynos4412-odroidx.dts to common
> exynos4412-odroid-common.dtsi file and adds support for Odroid X2 and
> U2/U3 boards. X2 is same as X, but it has faster SoC module (1.7GHz
> instead of 1.4GHz), while U2/U3 differs from X2 by different way of
> routing signals to host USB hub. It also lacks some hw modules not yet
> supported by those dts files (i.e. LCD & touch panel).

Thanks for this! It is working on ODROID-U2: at least eMMC/SD, LED, serial.

Just 2 minor questions from reviewing:

Odroid-X DTS used to have serial ports at 13820000 and 13830000, this
patch removes them, but leaves 2.
I can understand the idea of removing entries for ports that are not
available on the board, but I've never seen an ODROID with 2 serial
ports - should we bring this down to just the 1 enabled serial port
that is accessible?

Odroid-X DTS used to enable EHCI port 2, but with this refactoring, no
longer does. Intentional?

Thanks
Daniel
