From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 2/4] drm/rockchip: add an common abstracted PSR driver
Date: Fri, 22 Jul 2016 21:04:41 -0700
Message-ID: <CAD=FV=U-9WoyZTyj0weDxVkZjQ7ESc+pwJXX=19JuGrOCrsKcQ@mail.gmail.com>
References: <1468469704-12440-1-git-send-email-ykk@rock-chips.com> <1468469749-12636-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:33581 "EHLO
	mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750708AbcGWEEn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Jul 2016 00:04:43 -0400
Received: by mail-vk0-f48.google.com with SMTP id x130so182115546vkc.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2016 21:04:43 -0700 (PDT)
In-Reply-To: <1468469749-12636-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

Yakir,

On Wed, Jul 13, 2016 at 9:15 PM, Yakir Yang <ykk@rock-chips.com> wrote:
> +static void psr_set_state(struct psr_drv *psr, enum psr_state state)
> +{
> +       mutex_lock(&psr->state_mutex);
> +
> +       if (psr->state == state) {
> +               mutex_unlock(&psr->state_mutex);
> +               return;
> +       }
> +
> +       psr->state = state;
> +       switch (state) {
> +       case PSR_ENABLE:
> +               psr->set(psr->encoder, true);
> +               break;
> +
> +       case PSR_DISABLE:
> +       case PSR_FLUSH:
> +               psr->set(psr->encoder, false);
> +               break;
> +       };
> +
> +       mutex_unlock(&psr->state_mutex);
> +}
> +
> +static void psr_flush_handler(unsigned long data)
> +{
> +       struct psr_drv *psr = (struct psr_drv *)data;
> +
> +       if (!psr || psr->state != PSR_FLUSH)
> +               return;
> +
> +       psr_set_state(psr, PSR_ENABLE);

As mentioned in a separate thread, this is probably not OK.
psr_set_state() grabs a mutex and that might sleep.  ...but
psr_flush_handler() is a timer.  I'm nearly certain that timers can't
sleep.

I believe this is the source of "sleeping function called from invalid
context" that I've seen at times.

-Doug
