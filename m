From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 32/38] [media] exynos4-is: Remove check for
 SOC_EXYNOS4412
Date: Tue, 18 Jun 2013 18:18:38 +0900
Message-ID: <1b9b01ce6c04$d0f37c10$72da7430$%kim@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
 <1371486863-12398-33-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14225 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755657Ab3FRJSk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 05:18:40 -0400
In-reply-to: <1371486863-12398-33-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-media@vger.kernel.org, 'Mauro Carvalho Chehab' <mchehab@redhat.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Tomasz Figa wrote:
> 
> Since SOC_EXYNOS4412 Kconfig symbol has been removed, it is enough to
> check for SOC_EXYNOS4212 for both SoCs from Exynos4x12 series.
> 
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/media/platform/exynos4-is/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/Kconfig
> b/drivers/media/platform/exynos4-is/Kconfig
> index 004fd0b..0d4fd5c 100644
> --- a/drivers/media/platform/exynos4-is/Kconfig
> +++ b/drivers/media/platform/exynos4-is/Kconfig
> @@ -33,7 +33,7 @@ config VIDEO_S5P_MIPI_CSIS
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called s5p-csis.
> 
> -if SOC_EXYNOS4212 || SOC_EXYNOS4412 || SOC_EXYNOS5250
> +if SOC_EXYNOS4212 || SOC_EXYNOS5250
> 
>  config VIDEO_EXYNOS_FIMC_LITE
>  	tristate "EXYNOS FIMC-LITE camera interface driver"
> --
> 1.8.2.1

NAK, the reason is same with my comments on 30th patch.

- Kukjin
