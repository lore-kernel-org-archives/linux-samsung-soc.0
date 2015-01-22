From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 9/9] drm/exynos: add support for 'hdmi' clock
Date: Thu, 22 Jan 2015 11:00:47 -0200
Message-ID: <CAOMZO5BSvxvbM0nOHk2ogY0j23PwazFCMikiiEv-XtHae3=L_g@mail.gmail.com>
References: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
	<1421756219-21037-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:55286 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751177AbbAVNAt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 08:00:49 -0500
Received: by mail-lb0-f182.google.com with SMTP id l4so1337207lbv.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2015 05:00:47 -0800 (PST)
In-Reply-To: <1421756219-21037-10-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, Tobias Jakobi <Liquid.Acid@gmx.net>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Daniel Drake <drake@endlessm.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Tue, Jan 20, 2015 at 10:16 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> +       mixer_res->hdmi = devm_clk_get(dev, "hdmi");
> +       if (IS_ERR(mixer_res->hdmi)) {
> +               dev_err(dev, "failed to get clock 'hdmi'\n");
> +               return -ENODEV;

'return PTR_ERR(mixer_res->hdmi);' would be better.

> +       }
> +
>         mixer_res->sclk_hdmi = devm_clk_get(dev, "sclk_hdmi");
>         if (IS_ERR(mixer_res->sclk_hdmi)) {
>                 dev_err(dev, "failed to get clock 'sclk_hdmi'\n");
> @@ -1095,6 +1102,7 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
>         pm_runtime_get_sync(ctx->dev);
>
>         clk_prepare_enable(res->mixer);
> +       clk_prepare_enable(res->hdmi);

Better check whether clk_prepare_enable failed.
