From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 4/5] media: platform: s5p-jpeg: fix number of components
 macro
Date: Thu, 10 Aug 2017 16:09:43 +0200
Message-ID: <0069b10a-d42e-47ed-cea3-96ddfe2b9c19@samsung.com>
References: <1502191352-11595-1-git-send-email-andrzej.p@samsung.com>
        <1502191628-11958-1-git-send-email-andrzej.p@samsung.com>
        <CGME20170808112716eucas1p10a5069ad7ddad2eae5b8dca4f466feee@eucas1p1.samsung.com>
        <1502191628-11958-4-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1502191628-11958-4-git-send-email-andrzej.p@samsung.com>
Content-language: en-GB
Sender: linux-media-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Thierry Escande <thierry.escande@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/08/2017 01:27 PM, Andrzej Pietrasiewicz wrote:
> The value to be processed must be first masked and then shifted,
> not the other way round.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> ---
>   drivers/media/platform/s5p-jpeg/jpeg-regs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-regs.h b/drivers/media/platform/s5p-jpeg/jpeg-regs.h
> index 1870400..df790b1 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-regs.h
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-regs.h
> @@ -371,7 +371,7 @@
>   #define EXYNOS4_NF_SHIFT			16
>   #define EXYNOS4_NF_MASK				0xff
>   #define EXYNOS4_NF(x)				\
> -	(((x) << EXYNOS4_NF_SHIFT) & EXYNOS4_NF_MASK)
> +	(((x) & EXYNOS4_NF_MASK) << EXYNOS4_NF_SHIFT)

I'm going to add below tag when applying this patch.

Fixes: 6c96dbbc2aa9f5b4a ("[media] s5p-jpeg: add support for 5433")

-- 
Regards,
Sylwester
