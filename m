From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/4] ARM: dts: exynos: Pull for v4.21
Date: Wed, 12 Dec 2018 12:52:51 -0800
Message-ID: <20181212205251.lmbteairsojqvnge@localhost>
References: <20181209114911.25194-1-krzk@kernel.org>
 <20181209114911.25194-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209114911.25194-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Dec 09, 2018 at 12:49:09PM +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.21
> 
> for you to fetch changes up to 57b13b8b34002ce8f1d822ea05f0a84e5bc3a64a:
> 
>   ARM: dts: exynos: remove display-port node from Arndale (2018-12-06 19:47:15 +0100)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v4.21
> 
> 1. Add missing properties and nodes for PMIC clocks in multiple DTS
>    files.
> 2. Add UHS-I bus speed support to Odroid XU3/XU4/HC SD card and bump the
>    maximum clock frequency to 200 MHz for SD and eMMC.
> 3. Update cooling maps to include all CPU devices in multiple DTS files.
> 4. Enable quirks for Exynos3250 DWC.
> 5. Add JPEG CODEC node to S5Pv210.
> 6. Add opp-suspend to devfreq OPPs on Exynos4 boards to fix resuming
>    from suspend to RAM.
> 7. Remove eDP from Arndale board as it does not work and breaks also
>    DSI.

Merged, thanks!


-Olof
