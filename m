From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v1 1/2] drm/panel: simple-panel: add the delay timing for
 Sharp LQ123P1JX31
Date: Thu, 21 Jul 2016 10:30:13 -0400
Message-ID: <CAOw6vbLVrJj9So7tJeDtnDnq_+W=ZunPNwRRidfQKmjaj=byUw@mail.gmail.com>
References: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:35083 "EHLO
	mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838AbcGUOai (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 10:30:38 -0400
Received: by mail-yw0-f174.google.com with SMTP id j12so68941560ywb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 07:30:37 -0700 (PDT)
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com. [209.85.161.177])
        by smtp.gmail.com with ESMTPSA id 139sm3351468ywe.14.2016.07.21.07.30.34
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jul 2016 07:30:35 -0700 (PDT)
Received: by mail-yw0-f177.google.com with SMTP id j12so68939941ywb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 07:30:34 -0700 (PDT)
In-Reply-To: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

On Thu, Jul 21, 2016 at 9:14 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> According to page 16 of Sharp LQ123P1JX31 datasheet, we need to add the
> missing delay timing. Panel prepare time should be t1 (0.5ms~10ms) plus
> t3 (0ms~100ms), and panel enable time should equal to t7 (0ms~50ms), and
> panel unprepare time should be t11 (1ms~50ms) plus t12 (500ms~).
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 85143d1..f178998 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1384,6 +1384,11 @@ static const struct panel_desc sharp_lq123p1jx31 = {
>                 .width = 259,
>                 .height = 173,
>         },
> +       .delay = {
> +               .prepare = 110,
> +               .enable = 50,
> +               .unprepare = 550,
> +       },
>  };
>
>  static const struct drm_display_mode shelly_sca07010_bfn_lnn_mode = {
> --
> 1.9.1
>
>
