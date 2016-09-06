From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] mfd: exynos-lpass: mark PM functions as __maybe_unused
Date: Tue, 06 Sep 2016 15:50:57 +0200
Message-ID: <85bba0e5-cd64-a8e8-b576-acc094003004@samsung.com>
References: <20160906132432.2083493-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160906132432.2083493-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Beomho Seo <beomho.seo@samsung.com>, Inha Song <ideal.song@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/06/2016 03:24 PM, Arnd Bergmann wrote:
> The newly added exynos lpass driver produces a build warning when
> CONFIG_PM is disabled since the only callers of exynos_lpass_disable
> are under an #ifdef:
> 
> drivers/mfd/exynos-lpass.c:93:13: error: 'exynos_lpass_disable' defined but not used [-Werror=unused-function]
>  static void exynos_lpass_disable(struct exynos_lpass *lpass)
> 
> This removes the #ifdef and replaces it with __maybe_unused annotations
> so the compiler can leave out the unused code silently with less
> room for mistakes.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 36c26760bba8 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")

Thanks for fixing this,

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
