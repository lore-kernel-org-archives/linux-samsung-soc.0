From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: no need to select ARCH_HAS_BANDGAP any
 longer
Date: Thu, 3 May 2018 18:22:18 +0200
Message-ID: <20180503162218.47umsrz3hiphxw4y@kozik-lap>
References: <CGME20180502143026eucas1p144f0f581196615d9c0fba89a562e6e12@eucas1p1.samsung.com>
 <9721484.FBO9LEPOs5@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9721484.FBO9LEPOs5@amdc3058>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, May 02, 2018 at 04:30:26PM +0200, Bartlomiej Zolnierkiewicz wrote:
> This is not needed since commit fcbb1e02ee54 ("drivers: thermal:
> Remove ARCH_HAS_BANDGAP dependency for samsung") from 2014.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
