From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/5] ARM: defconfig: exynos for v4.12
Date: Wed, 19 Apr 2017 06:34:47 -0700
Message-ID: <20170419133447.GN29219@localhost>
References: <20170408141004.386-1-krzk@kernel.org>
 <20170408141004.386-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170408141004.386-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Apr 08, 2017 at 04:10:00PM +0200, Krzysztof Kozlowski wrote:
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.12
> 
> for you to fetch changes up to fd2694a112d6b53eba8d8e182fef0dccdab6c9e8:
> 
>   ARM: exynos_defconfig: Increase CONFIG_CMA_SIZE_MBYTES to 96 (2017-03-07 21:01:52 +0200)
> 
> ----------------------------------------------------------------
> Samsung defconfig ARM update for v4.12:
> 1. Enable DYNAMIC_DEBUG because it is useful for debugging.
> 2. Increase CMA memory region to allow handling H.264 1080p videos.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: exynos_defconfig: Enable DYNAMIC_DEBUG and get rid of old ext3
> 
> Shuah Khan (1):
>       ARM: exynos_defconfig: Increase CONFIG_CMA_SIZE_MBYTES to 96

Merged, thanks!


-Olof
