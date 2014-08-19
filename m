From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Tue, 19 Aug 2014 20:54:34 +0100
Message-ID: <CAD8Lp46pY9_+N6M17i4xv71BR_poT2Pfh4cmM0J2jxP96m9sVA@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
	<53C93FEB.2030507@samsung.com>
	<CAOesGMh-XRpX_U9s-BVE=BuOG-1EMDL+B_Dm1hdm+tcPQA9E-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:38791 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbaHSTyf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Aug 2014 15:54:35 -0400
Received: by mail-wg0-f51.google.com with SMTP id b13so6858446wgh.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2014 12:54:34 -0700 (PDT)
In-Reply-To: <CAOesGMh-XRpX_U9s-BVE=BuOG-1EMDL+B_Dm1hdm+tcPQA9E-g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Przemyslaw Marczak <p.marczak@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

On Tue, Aug 19, 2014 at 8:40 PM, Olof Johansson <olof@lixom.net> wrote:
> ODROID-U3 has been broken in mainline for quite a while. Have patches
> been posted for this already?
>
> http://arm-soc.lixom.net/bootlogs/mainline/v3.17-rc1/odroidu3-arm-exynos_defconfig.html
>  for one of the latest boots that failed.

Yes, discussed in the thread titled "[PATCH 1/2] ARM: dts: Enable PMIC
interrupts on ODROID"
Those patches weren't important for boot at the time of submission,
but it looks like something else changed (the max77686 driver?) that
makes them now required.

Daniel
