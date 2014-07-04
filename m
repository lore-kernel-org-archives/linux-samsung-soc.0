From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v6] ARM: EXYNOS: Use MCPM call-backs to support S2R on
 Exynos5420
Date: Fri, 4 Jul 2014 17:03:57 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1407041702310.22282@knanqh.ubzr>
References: <alpine.LFD.2.11.1407041408120.22282@knanqh.ubzr> <CAM4voamqpCj=Zw69DGjzhouwu=6RE6e3Px5WL8akc-TUAts0Xg@mail.gmail.com> <CAM4voa=K6s0FFmeuiqWZh6HSQZAfSpxL8A_kMTxCi+2t3tzydw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:38307 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbaGDVEA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 17:04:00 -0400
Received: by mail-qc0-f170.google.com with SMTP id l6so1894438qcy.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 14:03:59 -0700 (PDT)
In-Reply-To: <CAM4voa=K6s0FFmeuiqWZh6HSQZAfSpxL8A_kMTxCi+2t3tzydw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Bresticker <abrestic@chromium.org>, Douglas Anderson <dianders@chromium.org>

On Sat, 5 Jul 2014, Abhilash Kesavan wrote:

> On a different note, I have been using the cpuidle patchset
> (https://patchwork.kernel.org/patch/4357421/) as base for S2R support
> and had a question. Rather than making the driver depend on
> ARCH_EXYNOS should it depend on EXYNOS5420_MCPM which in turn depends
> on MCPM (like TC2) or should we just be making the bL cpuidle driver
> depend on MCPM ?

Probably making it depend on MCPM directly is the best approach.


Nicolas
