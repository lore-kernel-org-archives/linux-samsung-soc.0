From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/7] [media] mipi-csis: make sparse happy
Date: Sat, 03 Oct 2015 00:25:57 +0200
Message-ID: <4962836.RxBJeKxGZM@wuerfel>
References: <cover.1443737682.git.mchehab@osg.samsung.com> <de2ce8fd84f965a270bad28d284932bf20c349be.1443737683.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <de2ce8fd84f965a270bad28d284932bf20c349be.1443737683.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 01 October 2015 19:17:27 Mauro Carvalho Chehab wrote:
> diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
> index d74e1bec3d86..4b85105dc159 100644
> --- a/drivers/media/platform/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/exynos4-is/mipi-csis.c
> @@ -706,7 +706,8 @@ static irqreturn_t s5pcsis_irq_handler(int irq, void *dev_id)
>                 else
>                         offset = S5PCSIS_PKTDATA_ODD;
>  
> -               memcpy(pktbuf->data, state->regs + offset, pktbuf->len);
> +               memcpy(pktbuf->data, (u8 __force *)state->regs + offset,
> +                      pktbuf->len);
>                 pktbuf->data = NULL;
> 

I think this is what memcpy_toio() is meant for.

	Arnd
