From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] [media] exynos4-is: Add missing 'of_node_put'
Date: Fri, 24 Feb 2017 18:19:17 -0300
Message-ID: <2357ef6e-8d90-77d0-0399-21fec41389a1@osg.samsung.com>
References: <20170123211656.11185-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20170123211656.11185-1-christophe.jaillet@wanadoo.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kyungmin.park@samsung.com, s.nawrocki@samsung.com, mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Christophe,

On 01/23/2017 06:16 PM, Christophe JAILLET wrote:
> It is likely that a "of_node_put(ep)" is missing here.
> There is one in the previous error handling code, and one a few lines
> below in the normal case as well.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index e3a8709138fa..da5b76c1df98 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -402,8 +402,10 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  		return ret;
>  	}
>  
> -	if (WARN_ON(endpoint.base.port == 0) || index >= FIMC_MAX_SENSORS)
> +	if (WARN_ON(endpoint.base.port == 0) || index >= FIMC_MAX_SENSORS) {
> +		of_node_put(ep);
>  		return -EINVAL;
> +	}
>  
>  	pd->mux_id = (endpoint.base.port - 1) & 0x1;
>  
> 

Thanks for the patch, but Krzysztof sent the exact same patch before [0]. There
was feedback from Sylwester at the time that you can also look at [0]. Could you
please take that into account and post a patch according to what he suggested?

[0]: http://lists.infradead.org/pipermail/linux-arm-kernel/2016-March/415207.html

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
