From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: 3.19-rc1: peach*: display not working (missing patches)
Date: Fri, 2 Jan 2015 11:03:53 +0100
Message-ID: <CABxcv=mJ=pGdU700PWF2B4iCjLzG7SGo-6XWFFs814n4-v9PuA@mail.gmail.com>
References: <20141223101616.GA6238@peachpi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:37309 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbbABKDy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jan 2015 05:03:54 -0500
Received: by mail-wg0-f51.google.com with SMTP id x12so23938280wgg.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jan 2015 02:03:53 -0800 (PST)
In-Reply-To: <20141223101616.GA6238@peachpi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung <linux-samsung-soc@vger.kernel.org>

[adding Kukjin and Vivek as cc]

Hello Paolo,

On Tue, Dec 23, 2014 at 11:16 AM, Paolo Pisati <p.pisati@gmail.com> wrote:
> Hi,
>
> 3.19-rc1 still misses these two patches:
>
> 156823e arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> 03c16e7 ARM: exynos_defconfig: Enable options for display panel support156823e
>
> and without them, the display doesn't turn on on my peachpi: can we have them
> queued for rc2?

Yes, Vivek re-posted his dp phy patch a couple of times and I pinged
Kukjin several times about this both during the 3.18 -rc cycle (since
this also affected 3.18 where display is not working) and during the
3.19 merge window but unfortunately it was not picked yet...

I hope he can merge those patches as 3.19 fixes during the -rc cycle
to avoid having another kernel release with a non-working display on
Exynos5 boards.

Best regards,
Javier
