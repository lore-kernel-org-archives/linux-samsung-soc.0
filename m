From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/3] ARM: dts: exynos: Changes for v5.2
Date: Sun, 28 Apr 2019 12:29:36 -0700
Message-ID: <20190428192936.ybxa437r3jznxgbv@localhost>
References: <20190414154805.10188-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190414154805.10188-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Apr 14, 2019 at 05:48:03PM +0200, Krzysztof Kozlowski wrote:
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.2
> 
> for you to fetch changes up to 8cc76b1c75722196fb3d7ffe67cbfeb721a7b0e3:
> 
>   ARM: dts: exynos: Remove console argument from bootargs (2019-04-10 18:13:31 +0200)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.2
> 
> 1. Use proper ADC on Exynos4412.
> 2. Extend the Exynos5420 Arndale Octa board with: CPU cooling maps,
>    unused regulators, ADC and UHS-I SD card support.  Beside that adjust
>    regulators to proper level and add always-on when needed.
> 3. Extend the Exynos5260: high speed I2C and proper external interrupts.
>    Also fix shared external interrupt line and use better PLL for MMC
>    clocks.
> 4. Fix audio recording (broken around v5.1) and microphone recording
>    (since v4.14) on Exynos5422 Odroid XU3 boards.
> 5. Minor cleanups (stdout-path and bootargs).

Merged, thanks!


-Olof
