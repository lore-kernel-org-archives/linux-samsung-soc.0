Return-Path: <SRS0=lSeZ=2D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4598CC3498B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AA2A24756
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cbhnm/ox"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfLMNbI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 08:31:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42488 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727239AbfLMNbH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 08:31:07 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so2628680ljo.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2019 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrvoDck5eY5GK0w6K4AhLmPPIWL1Xrc1xH4Up/JEjjk=;
        b=Cbhnm/ox1I54nuH9njXHzccQrQot6KLJxrMb3XxyvsplUdUL3Q5Rul7FpZFaw6qIui
         KYp2hTrI1d6g+6A/dt3EeK/jyydFWmrzksF0s5cf6LxX401J1UfovmCKuRKzXFovXU5C
         QsI8OLd61zJoOK06uURda9yi4bsvTHAi28Tnrv3Y2WUQG8yz9MVsYlfxzXPwO2QT9YRG
         RsAyEYz1F5CKeLy89t5OQs+1Sn+GSZS1npqdvVHKIH8gmwGE2/La+4ljJz3l0hoayrrz
         IPjK34H/OTvJKUlP1UABm4Vzd9dvTCGe00klnysMonCEbsx3CWRH5rIYuP+ptTWBx8JB
         NZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrvoDck5eY5GK0w6K4AhLmPPIWL1Xrc1xH4Up/JEjjk=;
        b=TQMfMWqZLt4qF1HHWQT2uHnfLoMRlskRZj8Scc1N+ccGQNqe5wsea8XOcCAP5UayzS
         /7R02fWCzANhYVaB1kSyHeIyLy72BucXzflK9KNf8Cuo98NuGdqlXsHHu9va+uVaMW/A
         AWB0eMasGxq42agYXigT3Fr7v464EBV89YiNRE3O6hvh0cg86nibegd1XgJRqGEGi8mQ
         GacnBXCqrkgcYQiQC8zSAv0tthdCBgVYJ27EML4KHwEzYB8cK6DzzM1f5/mIMmWXWfck
         6PpiJHaJ4DRUBlw6pHVJRp26yKtqFFSJgU05mctLPNr+U6wFt1W+aqFb//xNN2ekR3Xt
         LEvg==
X-Gm-Message-State: APjAAAVKXoCmoK1J56VXhUP7bRz6Owj9B+C6EFkSlAPhNIJ56hEcxHSt
        9wMlRiGa7LzbEfpXwXYO4reYuq5y+GgYezWlQmmgDA==
X-Google-Smtp-Source: APXvYqwMLtHFJLKb/OsUbyLvQlBeLa8EouQdhXkxY6ssHTmFd/qwkZ2hUZ7P2vEvqVVUtgkdycvnaAaf3SbpBeZBuMg=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr9207930ljh.42.1576243865608;
 Fri, 13 Dec 2019 05:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20191207140353.23967-1-sam@ravnborg.org> <20191207140353.23967-3-sam@ravnborg.org>
In-Reply-To: <20191207140353.23967-3-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 14:30:54 +0100
Message-ID: <CACRpkdaVYeJme0O8CW-heTmf3-0EHowFwcOAyy3jx13gjfj4zA@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] drm/panel: add backlight support
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Dec 7, 2019 at 3:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Panels often supports backlight as specified in a device tree.
> Update the drm_panel infrastructure to support this to
> simplify the drivers.
>
> With this the panel driver just needs to add the following to the
> probe() function:
>
>     err = drm_panel_of_backlight(panel);
>     if (err)
>             return err;
>
> Then drm_panel will handle all the rest.
>
> There is one caveat with the backlight support.
> If drm_panel_(enable|disable) are called multiple times
> in row then backlight_(enable|disable) will be called multiple times.
>
> The above will happen when a panel drivers unconditionally
> calls drm_panel_disable() in their shutdown() function,
> whan the panel is already disabled and then shutdown() is called.
>
> Reading the backlight code it seems safe to call
> the backlight_(enable|disable) several times.
>
> v3:

v3 looks good to me +/- Laurent's comments:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
