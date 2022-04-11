Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96166C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Apr 2022 12:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240458AbiDKMZd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235625AbiDKMZd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 08:25:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF3542EDD;
        Mon, 11 Apr 2022 05:23:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bg10so30507150ejb.4;
        Mon, 11 Apr 2022 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3K7UtkaAmdhk912uS6+rgvTEva2rfQRiBVV1ZuGdMU=;
        b=HuRiT0ANWZP6UjYHsieS+X9qE6PsH2PKM2SYytRq+JFCv0R5RmnbZtuIb92jaMAoA1
         CU1bYkB3vNDTzZhz5mTVdtOwAz/kBMmW2V0WjEB9KnIF7nsso4pHx5fe6Cf+2yas0d3p
         12eO3FxEv3QPW+wOKls+pOMVwIyanCa3i8T7cECKjMQdHGPXPSppHr9Ujv3eoq4Qnn4i
         vjK2BWfvTsuxFdfa/au0BoitJtj8X4J+WNwPbS9JyHoZm6goW06I2+5LHI6YzJn+AFJO
         Ro1+PhAntdQIxLZyVewl/V4cB2fXIAysnGi1g3KAJMTD+SWNbYmxOsapExdpoPprZ8uJ
         fWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3K7UtkaAmdhk912uS6+rgvTEva2rfQRiBVV1ZuGdMU=;
        b=lOa3EowOwoWWlB/J221Brj2P3UM53mFSyXxXlYXKZBKpLt+0ayqZntI8j5rAIPmcdw
         j61yoBVRiL7lAhXumhJF28WOd8+MUXRF7oKodsHKAfl8TKMCTfyZnm2+dgp0qMyXFo7h
         qu2xsvdgq1XmNHZTOzLdL62lCBNK/Hy7TiRAVHZ0zUy6L972q43PjFiIE92M2oUJU2Oz
         2yus5QlYeS8+dPk+/8Sy9rkkB/NZcsQ+ois7EiJkZNVs41Tm5IMPksX4LpZSgri75xMR
         1l9yLvVrNWzMrSOc2nOmOQdsuymUj4BoEx4YXSjDFlF/SU5lZvE1Hl0Jnv7iX5m99ckd
         cgGA==
X-Gm-Message-State: AOAM533hTset1y/Rgm/QEJHdynpQrwoJi56i/HMbL9uQgChoRx62TTuH
        K0Ywwu+AsbbX5OSM+c2joxClauWB/iEJkRUgk7w=
X-Google-Smtp-Source: ABdhPJzsx8ixnvvwZcOQCCytMaslcnBviduIWhYCyNcWaDzDXQGHfmdS2Pi2TSFE/QDGHSZVNBuOgw3JW5mhtnvztq0=
X-Received: by 2002:a17:907:7b8b:b0:6e8:9dd9:59ac with SMTP id
 ne11-20020a1709077b8b00b006e89dd959acmr1655923ejc.588.1649679797613; Mon, 11
 Apr 2022 05:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com> <20220408162108.184583-5-jagan@amarulasolutions.com>
In-Reply-To: <20220408162108.184583-5-jagan@amarulasolutions.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 11 Apr 2022 07:23:06 -0500
Message-ID: <CAHCN7xJmiEBsbZRepsM0FLd8YDSQj8GUwwyYm4M_ViJFPoU8FQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Apr 8, 2022 at 11:22 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Host transfer() in DSI master will invoke only when the DSI commands
> are sent from DSI devices like DSI Panel or DSI bridges and this
> host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
>
> Handling DSI host initialization in transfer calls misses the
> controller setup for I2C configured DSI bridges.
>
> This patch adds the DSI initialization from transfer to bridge
> pre_enable as the bridge pre_enable API is invoked by core as
> it is common across all classes of DSI device drivers.
>
> v1:
> * keep DSI init in host transfer
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index ff05c8e01cff..3e12b469dfa8 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1290,6 +1290,13 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>         }
>
>         dsi->state |= DSIM_STATE_ENABLED;
> +
> +       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> +               ret = samsung_dsim_init(dsi);
> +               if (ret)
> +                       return;
> +               dsi->state |= DSIM_STATE_INITIALIZED;

Out of curiosity, is there a reason that  dsi->state cannot add
DSIM_STATE_INITIALIZED inside the samsung_dsim_init function call?  It
seems to me that if samsung_dsim_init returns successfully, it should
set that flag.  I don't know if it's called from other places or not.

adam
> +       }
>  }
>
>  static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> --
> 2.25.1
>
