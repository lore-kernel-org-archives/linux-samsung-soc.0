From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 2/4] ARM: dts: exynos4412-odroidx: enable common hardware blocks
Date: Thu, 19 Jun 2014 13:21:08 +0100
Message-ID: <CAD8Lp46az1w9K8ad-KOrnt1SvCgWS75OGjCw1vBNh3HOc4cSMg@mail.gmail.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
	<1402997133-13827-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:46931 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757947AbaFSMVK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 08:21:10 -0400
Received: by mail-we0-f179.google.com with SMTP id w62so2231788wes.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 05:21:09 -0700 (PDT)
In-Reply-To: <1402997133-13827-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

On Tue, Jun 17, 2014 at 10:25 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch adds support for common hardware modules available on all
> Exynos4412-based Odroid boards, which already have complete support in
> mainline kernel. This includes secure firmware calls, watchdog, g2d and
> fimc (mem2mem) multimedia accelerators.

For the secure firmware, this is indeed required for U2/U3, otherwise
the system crashes in weird ways during early boot. If this entry also
makes sense for ODROID-X, I'm surprised it was not there already, does
it boot without it?

As for the watchdog, g2d and fimc, is there really any Exynos4412
configuration where such components are not available?
Sorry if that is a silly question - just wondering why we wouldn't
enable these in exynos4412.dtsi.

Thanks
Daniel
