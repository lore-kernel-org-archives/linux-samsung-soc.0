From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: remove no longer needed s3c_pm_check_*()
 calls
Date: Mon, 12 Nov 2018 21:23:01 +0100
Message-ID: <20181112202301.GA25275@kozik-lap>
References: <CGME20181015134828eucas1p1b0b3287b5a330591e0976a3a83edbf11@eucas1p1.samsung.com>
 <20181015134828eucas1p1b0b3287b5a330591e0976a3a83edbf11~dzFPt-ZL_1531815318eucas1p1t@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181015134828eucas1p1b0b3287b5a330591e0976a3a83edbf11~dzFPt-ZL_1531815318eucas1p1t@eucas1p1.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 15, 2018 at 03:48:27PM +0200, Bartlomiej Zolnierkiewicz wrote:
> Since commit 6862fdf2201a ("ARM: samsung: Limit SAMSUNG_PM_CHECK
> config option to non-Exynos platforms") s3c_pm_check_*() calls
> are redundant and can be removed.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/mach-exynos/suspend.c |    7 -------

Thanks, applied.

Best regards,
Krzysztof
