From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/5] arm64: soc: exynos for v4.12
Date: Wed, 19 Apr 2017 07:00:16 -0700
Message-ID: <20170419140016.GJ29219@localhost>
References: <20170408141004.386-1-krzk@kernel.org>
 <20170408141004.386-6-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170408141004.386-6-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Apr 08, 2017 at 04:10:04PM +0200, Krzysztof Kozlowski wrote:
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc64-4.12
> 
> for you to fetch changes up to 0edf17984f251e633465e028a0115d57b1b7eb88:
> 
>   arm64: defconfig: Enable video, DRM and LPASS drivers for Exynos5433 and Exynos7 (2017-03-21 19:18:53 +0200)
> 
> ----------------------------------------------------------------
> Samsung ARM64 update for v4.12:
> 1. Exynos power management drivers support now ARMv8 SoC - Exynos5433 - so
>    select them in ARCH_EXYNOS.
> 2. Enable few Exynos drivers for supported ARMv8 SoCs.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (2):
>       arm64: exynos: Enable Exynos PMU and PM domains drivers
>       arm64: defconfig: Enable video, DRM and LPASS drivers for Exynos5433 and Exynos7

Merged, thanks!


-Olof
