From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v8 0/2] Adds PMU and S2R support for exynos5420
Date: Tue, 30 Sep 2014 15:30:49 +0200
Message-ID: <CABxcv=kEVma+Ho6PPy+4t+zYH67sAWbbvJvrviPop-MBqktbjw@mail.gmail.com>
References: <1412074969-12704-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:47942 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809AbaI3Nau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 09:30:50 -0400
Received: by mail-ob0-f173.google.com with SMTP id wn1so1448196obc.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2014 06:30:49 -0700 (PDT)
In-Reply-To: <1412074969-12704-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>

Hello Vikas,

Thanks a lot for the re-spin.

On Tue, Sep 30, 2014 at 1:02 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>
> Tested on Kukjin Kim's tree, for-next branch +
> 1] http://www.spinics.net/lists/linux-samsung-soc/msg33750.html
> 2] https://lkml.org/lkml/2014/9/30/156

I wanted to test your series but I noticed that Abhilash's patch:

"[PATCH v7] ARM: EXYNOS: Use MCPM call-backs to support S2R on Exynos5420"

does not apply cleanly on Kukjin's for-next branch. I see that all the
dependencies mentioned (modulo $subject or course) have already been
merged though.

Did you rebase Abhilash's to test your series?. I can forward port as
well but just want to be sure that I'm not missing any other
dependency.

These are the patches I've on top of Kukjin's for-next branch fyi:

663dfa7 ARM: exynos5: Add Suspend-to-RAM support for 5420
b4b3b76 ARM: exynos5: Add PMU support for 5420
6c0e381 ARM: EXYNOS: Move PMU specific definitions from common.h
cdf79fe ARM: EXYNOS: Add platform driver support for Exynos PMU
d2d8bc6 mfd: syscon: Decouple syscon interface from platform devices

Best regards,
Javier
