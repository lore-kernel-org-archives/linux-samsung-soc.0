From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 11/13] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Mon, 29 Apr 2013 00:17:38 +0200
Message-ID: <1736061.BDRHr9MsyY@flatron>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com> <1366731994-7478-12-git-send-email-t.figa@samsung.com> <20130428192231.GB22332@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:37762 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756523Ab3D1WRn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Apr 2013 18:17:43 -0400
Received: by mail-ee0-f46.google.com with SMTP id c13so2434271eek.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2013 15:17:42 -0700 (PDT)
In-Reply-To: <20130428192231.GB22332@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, ben-linux@fluff.org, thomas.abraham@linaro.org

On Sunday 28 of April 2013 12:22:31 Olof Johansson wrote:
> On Tue, Apr 23, 2013 at 05:46:32PM +0200, Tomasz Figa wrote:
> > This patch extends exynos_init_time() function to handle Exynos4210
> > rev0 SoC, which differs in availability of system timers and needs
> > different clocksource initialization.
> > 
> > This makes it possible to use exynos_init_time() function as init_time
> > callback for all Exynos-based boards, including Universal_C210, which
> > originally had to use samsung_timer_init().
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> I didn't apply this one since I had massive conflicts caused by it. Can
> you please resubmit on top of late/fixes?

As we discussed on IRC, since this patch has multiple dependencies, let's 
wait until everything settles and apply it then, as an rc fix to avoid 
further merge conflicts.

Best regards,
Tomasz
