From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Fix build with PM_SLEEP=n part #2
Date: Sat, 2 Aug 2014 11:41:34 +0100
Message-ID: <20140802104134.GA30282@n2100.arm.linux.org.uk>
References: <1405349040-5265-1-git-send-email-b.zolnierkie@samsung.com> <1405349040-5265-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:33416 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750851AbaHBKlm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 06:41:42 -0400
Content-Disposition: inline
In-Reply-To: <1405349040-5265-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Sachin Kamat <sachin.kamat@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Jul 14, 2014 at 04:43:59PM +0200, Bartlomiej Zolnierkiewicz wrote:
> Fix building of exynos_defconfig with disabled CONFIG_PM_SLEEP by
> adding checking whether Exynos cpuidle support is enabled before
> accessing exynos_enter_aftr.
> 
> The build error message:
> arch/arm/mach-exynos/built-in.o:(.data+0x74): undefined reference to `exynos_enter_aftr'
> make: *** [vmlinux] Error 1
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

What's happening with this patch?  I'm still seeing failures in my builds
due to the above error from Tuesday's arm-soc.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
