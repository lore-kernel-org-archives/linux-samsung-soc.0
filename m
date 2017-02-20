From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Don't return -EBUSY when
 msg->size is 0 in aux transaction
Date: Mon, 20 Feb 2017 11:40:35 +0900
Message-ID: <CAAFQd5AaCQNP7M4a58Y03y2uY5vQeRfhm5jkyUgJcyQp9SYB4A@mail.gmail.com>
References: <1486978066-5351-1-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yb0-f171.google.com ([209.85.213.171]:35305 "EHLO
        mail-yb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751833AbdBTCk6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Feb 2017 21:40:58 -0500
Received: by mail-yb0-f171.google.com with SMTP id d128so2194470ybh.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Feb 2017 18:40:58 -0800 (PST)
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com. [209.85.161.181])
        by smtp.gmail.com with ESMTPSA id b124sm6684017ywd.64.2017.02.19.18.40.55
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Feb 2017 18:40:56 -0800 (PST)
Received: by mail-yw0-f181.google.com with SMTP id q127so6296227ywg.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Feb 2017 18:40:55 -0800 (PST)
In-Reply-To: <1486978066-5351-1-git-send-email-wzz@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: zain wang <wzz@rock-chips.com>
Cc: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

Hi Zain,

On Mon, Feb 13, 2017 at 6:27 PM, zain wang <wzz@rock-chips.com> wrote:
>
> The analogix_dp_transfer() will return -EBUSY if num_transferred is zero.
> But sometimes we will send a bare address packet to start the transaction,
> like drm_dp_i2c_xfer() show:
>         ......
>         /* Send a bare address packet to start the transaction.
>          * Zero sized messages specify an address only (bare
>          * address) transaction.
>          */
>         msg.buffer = NULL;
>         msg.size = 0;
>         err = drm_dp_i2c_do_msg(aux, &msg);
>         ......
>
> In this case, the msg->size is zero, so the num_transferred will be zero too.
> We can't return -EBUSY here, let's we return num_transferred if num_transferred
> equals msg->size.
>

Please see my question inline.

> Signed-off-by: zain wang <wzz@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 303083a..5384aca 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -1162,5 +1162,5 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
>                  (msg->request & ~DP_AUX_I2C_MOT) == DP_AUX_NATIVE_READ)
>                 msg->reply = DP_AUX_NATIVE_REPLY_ACK;
>
> -       return num_transferred > 0 ? num_transferred : -EBUSY;
> +       return (num_transferred == msg->size) ? num_transferred : -EBUSY;

I might be missing something but, looking at the code, I don't see any
possibility of num_transferred ever being different than msg->size. To
be honest, it doesn't seem to even make any sense keeping the local
variable there, because msg->size can be simply always returned, as
errors are handled by jumping to aux_error label.

Best regards,
Tomasz
