From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v3 10/10] drm/bridge: analogix_dp: fix no drm hpd event
 when panel plug in
Date: Thu, 23 Jun 2016 10:24:00 -0400
Message-ID: <CAOw6vbJwWCBcj9CsxXnu4S4W94r8TioTf1p-poYH8Tac8hYO0Q@mail.gmail.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com> <1465904802-1164-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465904802-1164-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> The enum value of DP_IRQ_TYPE_HP_CABLE_IN is zero, but driver only
> send drm hp event when the irq_type and the enum value is true.
>
> if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN || ...)
>         drm_helper_hpd_irq_event(dp->drm_dev);
>
> So there would no drm hpd event when cable plug in, to fix that
> just need to assign all hotplug enum with no-zero values.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Reviewed-by: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> Changes in v3:
> - Add reviewed flag from St=C3=A9phane.
>     [https://chromium-review.googlesource.com/#/c/346319/15]
> - Add tested flag from Javier
>
> Changes in v2: None
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/dri=
vers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index f09275d..b456380 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -127,10 +127,10 @@ enum analog_power_block {
>  };
>
>  enum dp_irq_type {
> -       DP_IRQ_TYPE_HP_CABLE_IN,
> -       DP_IRQ_TYPE_HP_CABLE_OUT,
> -       DP_IRQ_TYPE_HP_CHANGE,
> -       DP_IRQ_TYPE_UNKNOWN,
> +       DP_IRQ_TYPE_HP_CABLE_IN  =3D BIT(0),
> +       DP_IRQ_TYPE_HP_CABLE_OUT =3D BIT(1),
> +       DP_IRQ_TYPE_HP_CHANGE    =3D BIT(2),
> +       DP_IRQ_TYPE_UNKNOWN      =3D BIT(3),
>  };
>
>  struct video_info {
> --
> 1.9.1
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
