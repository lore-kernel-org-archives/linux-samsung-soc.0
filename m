From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: mcpm: Don't rely on firmware's
 secondary_cpu_start
Date: Tue, 10 Jun 2014 11:49:27 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1406101146140.25775@knanqh.ubzr>
References: <1402090985-8061-1-git-send-email-dianders@chromium.org> <20140607181221.GB25068@e102568-lin.cambridge.arm.com> <CAD=FV=X17PeJ6JPE9Qyc1QT07AvA2PTE69Q87gz9a6MdUHgi4A@mail.gmail.com> <20140609223831.GB16889@e102568-lin.cambridge.arm.com>
 <CANuQgHHxAhTNYX-JAEdRkO=PMYT4A5GwXcuQfiqwE0CEkQyR+w@mail.gmail.com> <CAD=FV=V5_RRNkgA7Rk7XbQw9m1qh6-RJA8arW7ZRU=QbWAPa+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:48945 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbaFJPta (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 11:49:30 -0400
Received: by mail-qc0-f181.google.com with SMTP id x3so2391330qcv.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 08:49:30 -0700 (PDT)
In-Reply-To: <CAD=FV=V5_RRNkgA7Rk7XbQw9m1qh6-RJA8arW7ZRU=QbWAPa+w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Chander Kashyap <chander.kashyap@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Inderpal Singh <inderpal.s@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, "olof@lixom.net" <olof@lixom.net>, Tushar Behera <trblinux@gmail.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, 10 Jun 2014, Doug Anderson wrote:

> My S-state knowledge is not strong, but I believe that Lorenzo's
> questions matter if we're using S2 for CPUidle (where we actually turn
> off power and hot unplug CPUs) but not when we're using S1 for CPUidle
> (where we just enter WFI/WFE).
> 
> I believe that in ChromeOS we use S1 CPUidle and that it works fine.
> We've never implemented S2 that I'm aware of.

You'll have to rely on MCPM for that.  That's probably why it hasn't 
been implemented before.


Nicolas
