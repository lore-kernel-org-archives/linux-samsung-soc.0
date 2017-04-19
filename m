From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/5] ARM: dts: exynos: DTS for v4.12
Date: Wed, 19 Apr 2017 06:44:53 -0700
Message-ID: <20170419134453.GX29219@localhost>
References: <20170408141004.386-1-krzk@kernel.org>
 <20170408141004.386-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170408141004.386-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Apr 08, 2017 at 04:10:02PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> I provided some of the patches as sub-tags to other maintainers who
> needed it.
> 
> 
> Best regards,
> Krzysztof
> 
> 
> Cc: Hans Verkuil <hans.verkuil@cisco.com>
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.12
> 
> for you to fetch changes up to a1146328ec47141007a6ec076e1cbfc80f31887f:
> 
>   Merge tag 'samsung-dt-hdmi-cec-4.12' into next/dt (2017-03-31 00:27:18 +0300)
> 
> ----------------------------------------------------------------
> Samsung DeviceTree ARM update for v4.12:
> 1. Enhancements to PCIe nodes on Exynos5440.
> 2. Fix thermal values on some of Exynos5420 boards like Odroid XU3.
> 3. Add proper clock frequency properties to DSI nodes.
> 4. Fix watchdog reset on Exynos4412.
> 5. Fix watchdog infinite interrupt in soft mode on Exynos4210,
>    Exynos5440, S3C64xx and S5Pv210.
> 6. Enable watchdog on Exynos4 and S3C SoCs.

Merged, thanks!


-Olof
