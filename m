From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Thu, 17 Jul 2014 23:02:49 -0700
Message-ID: <CAOesGMhjCSononiVtv1rWaP7hAbk=CgtBYx23dFvv6MhXT5-Cg@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
	<CAOesGMirJ0R6NDUY=Yx2Pjaipw32ZGORVqtnrFMPMHpSP8YuBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:59723 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755019AbaGRGCu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 02:02:50 -0400
Received: by mail-vc0-f169.google.com with SMTP id hu12so6619149vcb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2014 23:02:49 -0700 (PDT)
In-Reply-To: <CAOesGMirJ0R6NDUY=Yx2Pjaipw32ZGORVqtnrFMPMHpSP8YuBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Przemyslaw Marczak <p.marczak@samsung.com>

On Thu, Jul 17, 2014 at 10:56 PM, Olof Johansson <olof@lixom.net> wrote:

> I gave the kernel (next-0717) a go here on my U3, and it boots (as you
> mention, no USB comes up).

Btw, please update multi_v7_defconfig as well (as a separate patch,
since it needs to be merged directly by us). Right now it doesn't find
rootfs with that config.


-Olof
