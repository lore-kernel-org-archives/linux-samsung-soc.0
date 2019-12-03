Return-Path: <SRS0=FBR0=ZZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06916C432C0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Dec 2019 13:23:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D30F420684
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Dec 2019 13:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwcHFup3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLCNXP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Dec 2019 08:23:15 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46441 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfLCNXD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 08:23:03 -0500
Received: by mail-lf1-f65.google.com with SMTP id a17so2889829lfi.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2019 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
        b=ZwcHFup3L1FGPGk2xtvdRZFPmqpjl+1VvQLCjzq0rimrVIVqaG32x7PCDfBwRBdhIo
         wfFVMCzt/nwBpmmu726MfJIBszKsNjFvMWKcURMFeYoJFnyFPvGbWfNUAkjmA0arprAH
         xxbwDWIJo9nDwD2K3RFDnub+OayDe800qVEItuex48rNok6smlLWT62Pp3P8wxG/YbWQ
         q5dde7mJTd61eoUyIeQ0PMpdo8DxM6TZOnmuYEYlu4eIbFMQ/aYRNjWF4Qj24lP7V1JO
         X4rGteLiKCtTpowk5xUuEB1HkwUeJ5Mr5SgOtJornUUaf2Dz/nR/O6sc39dTBk+hVW6X
         1kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
        b=Ia5IptD9E9GEVeTSVCerEvkC26ZI0FlCSKKhN3SltoLA8sfl13j7hzMegrLppITULO
         OZ50JstCiPO1wO7ggnRh0AkcrRX1+RY0ZudGPSqULVCMz0q3lE4VQyLyhL6u+8jSD9dg
         /5GtZzCyf+4VDDZRtyumKTOImXXwfSngXbIslPhvLoGxY3aBp72qcrAe8ax4mNMWvKru
         EVQM8CfYY1FndHd1P7B+K3tRJmxuDlZ3OSFNpYmU/TP1ml7AwkDVo9ov+2XgK2MDxpH7
         XC7shcjJsgj+5YnM/IWd+WBUXpGoejZls0Xs62QyczqbWaYIOENyHv/s48getVMUi6Uy
         UPhw==
X-Gm-Message-State: APjAAAXhEoftkHKDniCQXn1jw0xBceXhX6YTC+JX0JwPZ0m7D46PrNVC
        MXAEejKQwOyH/W9VL0TSZIVP/T9bliD+5wZvXbwCFg==
X-Google-Smtp-Source: APXvYqx22ebZnmuYdNzG9TrFSZg4isgk95/zsKEGLemAt431mQBCED4F4+fJ5lhPiKhrPXI40LsyMbi9cYOMTmUUeRQ=
X-Received: by 2002:ac2:5083:: with SMTP id f3mr1970416lfm.135.1575379381560;
 Tue, 03 Dec 2019 05:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-5-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-5-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 14:22:50 +0100
Message-ID: <CACRpkdYT8u2Liq60xtTWeLc2q-R16XWtE1YstGp2WTgM2Cc6CA@mail.gmail.com>
Subject: Re: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
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
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Eric Anholt <eric@anholt.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The drm_connector created by drm_panel_bridge was accessed
> via drm_panel.connector.
> Avoid the detour around drm_panel by providing a simple get method.
> This avoids direct access to the connector field in drm_panel in
> the two users.
>
> Update pl111 and tve200 to use the new helper.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

With the little issues found by Laurent fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
