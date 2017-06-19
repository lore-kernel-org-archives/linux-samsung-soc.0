From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] s5p-cec: update MAINTAINERS entry
Date: Mon, 19 Jun 2017 14:12:20 +0200
Message-ID: <20170619121220.GA16269@kozik-book>
References: <CGME20170619120320eucas1p2a84a4472e7d2f1c148e7035ae994c5e1@eucas1p2.samsung.com>
 <1497873782-25543-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1497873782-25543-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 'Mauro Carvalho Chehab' <mchehab@s-opensource.com>, Hans Verkuil <hverkuil@xs4all.nl>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 19, 2017 at 02:03:02PM +0200, Marek Szyprowski wrote:
> I would like to replace Kyungmin Park, who is no longer interested in
> maintaining S5P-CEC driver. I have access to various Exynos boards. I also
> already did some tests of this driver and helped enabling it on various
> Exynos boards. The driver itself is no longer in staging, so lets fix the
> path too. Also change the mailing list from ARM generic to Samsung SoC
> specific to get more attention and easier review in the future.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

You might also want to add file-match for
Documentation/devicetree/bindings/media/s5p-cec.txt

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 053c3bdd1fe5..fbfbc9866fa2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1775,11 +1775,11 @@ F:	arch/arm/plat-samsung/s5p-dev-mfc.c
>  F:	drivers/media/platform/s5p-mfc/
>  
>  ARM/SAMSUNG S5P SERIES HDMI CEC SUBSYSTEM SUPPORT
> -M:	Kyungmin Park <kyungmin.park@samsung.com>
> -L:	linux-arm-kernel@lists.infradead.org
> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	drivers/staging/media/platform/s5p-cec/
> +F:	drivers/media/platform/s5p-cec/
>  
>  ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
>  M:	Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> -- 
> 1.9.1
> 
