From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Thu, 20 Feb 2014 11:22:48 +0000
Message-ID: <20140220112248.GC32456@localhost>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
 <5302B306.8090503@samsung.com>
 <CAOesGMhnUDcUL7hREV=EYEGr5YG-ZLL6v9NiGcrBr6477WfdyQ@mail.gmail.com>
 <6032891.ndY8FikAMY@wuerfel>
 <CALAqxLX6STNqUeVO2G18bm_HKabpoRxZTa3uK6i-JP97zEYVZg@mail.gmail.com>
 <CAOesGMjLR3PGXeyJPAvGwam4yK97+vnDfq5MVutJz75aKPX8gw@mail.gmail.com>
 <CALAqxLU7ehHfvQa58HpdzojRU-2zhNpEgkr9KEJ3cf550WcnWw@mail.gmail.com>
 <CAOesGMjSjzZ4iX3NVA6eS4LHJF2MQQ=KJpNgKWikJb6YkQxNpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:53831 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752240AbaBTLW4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Feb 2014 06:22:56 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMjSjzZ4iX3NVA6eS4LHJF2MQQ=KJpNgKWikJb6YkQxNpQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On Thu, Feb 20, 2014 at 09:03:30AM +0000, Olof Johansson wrote:
> So, after giving this some more thought (and getting my hands dirty in
> some of this code), I think I'm going to change my mind on this. For
> mobile platforms I think it might make sense to bring over the
> toplevel platform Kconfig from arch/arm, to simplify dependencies
> without tearing up the driver subtree with churn like this.
> 
> This, of course, only holds true for v8 mobile platforms. Samsung
> isn't saying if GH7 is a server platform and not, and they don't have
> to tell us. But I think we should consider only enabling and bringing
> over the mobile ones (and ideally try to avoid even that, but it might
> make sense to do some of them at least initially -- it does provide
> some convenient ways to enable larger subsets of default drivers per
> platform/vendor family).
> 
> I.e. I'd be OK with an
> ARCH_EXYNOS/ARCH_TEGRA/ARCH_IMX/ARCH_<whatever>, but I don't think we
> should add more finegrained options than that globally on ARM64, at
> least not until truly proven to be needed. We're trying to push back
> against new per-SoC Kconfig entries on 32-bit as well right now.

I'm fine with this. Do we still need something for ARMv8 server
platforms like ARCH_ARM_SBSA? The only advantage would be to make it
easier for mobile targeted kernel builds to disable server features but
I'm not sure there are so many such features, people can trim the
.config manually.

Two additional points:

1. Single arm64 defconfig file covering everything
2. Modules rather than built-in by default where possible (especially
   for server platforms)

-- 
Catalin
