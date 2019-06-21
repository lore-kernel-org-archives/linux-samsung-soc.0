From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: exynos: only build mcpm support if used
Date: Fri, 21 Jun 2019 20:12:42 +0200
Message-ID: <20190621181242.GA18341@kozik-lap>
References: <20190619125545.1087023-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619125545.1087023-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Russell King <linux@armlinux.org.uk>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 02:55:29PM +0200, Arnd Bergmann wrote:
> We get a link error for configurations that enable an exynos
> SoC that does not require mcpm, but then manually enable
> mcpm anyway wihtout also turning on the arm-cci:
> 
> arch/arm/mach-exynos/mcpm-exynos.o: In function `exynos_pm_power_up_setup':
> mcpm-exynos.c:(.text+0x8): undefined reference to `cci_enable_port_for_self'
> 
> Change it back to only build the code we actually need, by
> introducing a CONFIG_EXYNOS_MCPM that serves the same purpose
> as the older CONFIG_EXYNOS5420_MCPM.
> 
> Fixes: 2997520c2d4e ("ARM: exynos: Set MCPM as mandatory for Exynos542x/5800 SoCs")

Thanks, applied.

Best regards,
Krzysztof
