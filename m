From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] i2c: exynos5: add support for HSI2C on Exynos5260 SoC
Date: Tue, 26 Nov 2013 16:59:42 +0530
Message-ID: <CAK9yfHz1HL65megQ9vDZovZr9oBo8UsrgGS+umWiT9FmHrnK3Q@mail.gmail.com>
References: <1385100726-32165-1-git-send-email-ch.naveen@samsung.com>
	<1385439977-19077-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385439977-19077-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 26 November 2013 09:56, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds new compatible to support HSI2C module on Exynos5260
> HSI2C module on Exynos5260 needs to be reset during during initialization.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
[snip]
>
>  Required properties:
>    - compatible: value should be.
> -      -> "samsung,exynos5-hsi2c", for i2c compatible with exynos5 hsi2c.
> +       -> "samsung,exynos5-hsi2c", for i2c compatible with HSI2C available on
> +                               Exynos5250/5420 SoCs.

This string could be made more specific ("samsung,exynos5250-hsi2c")
now that we have variants for this.

> +       -> "samsung,exynos5260-hsi2c", for i2c compatible with HSI2C available
> +                               on Exynos5260 SoCs.
> +
>    - reg: physical base address of the controller and length of memory mapped
>      region.
>    - interrupts: interrupt number to the cpu.
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index da39ff0..497ff91 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -184,14 +184,35 @@ struct exynos5_i2c {
>          * 2. Fast speed upto 1Mbps
>          */
>         int                     speed_mode;
> +
> +       /* Version of HS-I2C Hardware */
> +       unsigned int            version;
> +};
> +
> +enum hsi2c_version {
> +       EXYNOS_5,

ditto.

> +       EXYNOS_5260
>  };
>

-- 
With warm regards,
Sachin
