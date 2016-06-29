From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 07/11] drm/rockchip: analogix_dp: correct the connector
 display color format and bpc
Date: Wed, 29 Jun 2016 09:57:39 -0400
Message-ID: <CAOw6vb+yEdgx+qxNh7xBjtwEi3cYckqKYqAp4ytb+qUwjdQY1w@mail.gmail.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
 <1467191739-17394-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1467191739-17394-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 29, 2016 at 5:15 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Rockchip VOP couldn't output YUV video format for eDP controller, so
> when driver detect connector support YUV video format, we need to hack
> it down to RGB888.
>
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Tomasz Figa <tomasz.figa-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>

Reviewed-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


> ---
> Changes in v4:
> - Using mask variable to collect the YUV video format. (Sean)
> - Add reviewed flag from Tomasz.
>
> Changes in v3:
> - Hook the connector's color_formats in .get_modes directly. (Tomasz, reviewed at Google Gerrit)
>     [https://chromium-review.googlesource.com/#/c/346317/15]
> - Add the acked flag from Mark.
>
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0755573..0a0fb3a 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -110,6 +110,23 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>         return 0;
>  }
>
> +static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
> +                                struct drm_connector *connector)
> +{
> +       struct drm_display_info *di = &connector->display_info;
> +       /* VOP couldn't output YUV video format for eDP rightly */
> +       u32 mask = DRM_COLOR_FORMAT_YCRCB444 | DRM_COLOR_FORMAT_YCRCB422;
> +
> +       if ((di->color_formats & mask)) {
> +               DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
> +               di->color_formats &= ~mask;
> +               di->color_formats |= DRM_COLOR_FORMAT_RGB444;
> +               di->bpc = 8;
> +       }
> +
> +       return 0;
> +}
> +
>  static bool
>  rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>                                    const struct drm_display_mode *mode,
> @@ -310,6 +327,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>         dp->plat_data.dev_type = dp->data->chip_type;
>         dp->plat_data.power_on = rockchip_dp_poweron;
>         dp->plat_data.power_off = rockchip_dp_powerdown;
> +       dp->plat_data.get_modes = rockchip_dp_get_modes;
>
>         return analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
>  }
> --
> 1.9.1
>
>
