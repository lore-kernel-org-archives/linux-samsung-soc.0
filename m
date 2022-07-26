Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF65C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Jul 2022 07:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238363AbiGZHdj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 03:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238058AbiGZHc3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 03:32:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196A62C657
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 00:28:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z25so21475924lfr.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Zdt9ySwq0hPdZ67K9+M/PVPW+8kdp3QB1/pFumPHXpA=;
        b=M91l6qMTspVOfU/QE5RKoIbOoHEMCNK85ozPt6lLFmcd/CvoYe0DPtqpOS5bCFqUux
         3DH0DFigaQhJfOu7nBDNYzy1skJgAyU15HNxJ3tA1ry3CBT2c/cvgAUWxnlMZ3ZZQscH
         NjGypTFxqGlluw/oyvuZtk6dgeam2zH1h5ozbrnH7tLPNKMnXyu6xPokXK3bkqOXny1r
         mMngoJ1yXkgulmSnR/p/FPEEHpkUJZ4A2vvp6mdvytRhW0mPNNUQUsYvYPF9bODc5fXv
         Szn0ww7yppC1TUBoxaARF602u9r+7S0fpTpTptbHWzRWwlmS8vzbv/TV4iFKD+vXwJNM
         QJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zdt9ySwq0hPdZ67K9+M/PVPW+8kdp3QB1/pFumPHXpA=;
        b=QV7xcVLuzWdqk7vA0TGBDe9l9NyZgEJhLom6ORju+9A5s7P9V1BXdXY5bfaAMBDkw2
         0cP/u97Hr7+OS9wPV7+nhE47wbVWURKiF6R7hchoPsnUyL3lzeT/wGDRDUCPXvMCeku0
         ANyDIRiFBu35wRNuEZPOERO4MN3E2/nb67x20iP6OJ7+/AUHNtjQPnj6Ygo2emaS6RM9
         mqhq32tUM4rygvfI+3sDu6SGNORPk6pFRXCiWWzDdnqYJT65+OIC/85zLYjqZuDClH0x
         PXg/Ti2AJj1AR1xDJINHCz32/WwhmPwwYcUUy/EH7qaJ7T+SAGrrw2c6nPsGIpLu9BKp
         kRPg==
X-Gm-Message-State: AJIora9Hn2XasCi7YrIK75loj3NdILk34v4dR9aRmp1YrtFpe0Lr2QDX
        fwgr/Dsp31UhSQB9Msf7qlAZaw==
X-Google-Smtp-Source: AGRyM1u+v6qf+kgDWnFmNna2NpWRAsIYoKzGer8Xbha4WpFMy5gtGRhzZ3kiPKHMmV8rlfzDUJr3fg==
X-Received: by 2002:a19:2d54:0:b0:48a:91ef:e85f with SMTP id t20-20020a192d54000000b0048a91efe85fmr2408850lft.286.1658820517956;
        Tue, 26 Jul 2022 00:28:37 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id q10-20020a19a40a000000b0047f9614203esm3052812lfc.173.2022.07.26.00.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 00:28:37 -0700 (PDT)
Message-ID: <d39e3398-01bb-d8b7-fc9f-8974ac3ee346@linaro.org>
Date:   Tue, 26 Jul 2022 09:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 02/13] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <20220720155210.365977-3-jagan@amarulasolutions.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720155210.365977-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/07/2022 17:51, Jagan Teki wrote:
> 
> v1:
> * Don't maintain component_ops in bridge driver
> * Don't maintain platform glue code in bridge driver
> * Add platform-specific glue code and make a common bridge
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  MAINTAINERS                             |    8 +
>  drivers/gpu/drm/bridge/Kconfig          |   12 +
>  drivers/gpu/drm/bridge/Makefile         |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c   | 1684 ++++++++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig          |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1715 +----------------------
>  include/drm/bridge/samsung-dsim.h       |   99 ++
>  7 files changed, 1865 insertions(+), 1655 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f9366144d31..d796fa8c7be0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6546,6 +6546,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
>  F:	drivers/gpu/drm/panel/panel-samsung-db7430.c
>  
> +DRM DRIVER FOR SAMSUNG MIPI DSIM BRIDGE
> +M:	Jagan Teki <jagan@amarulasolutions.com>

You also need:
L: dri-devel@lists.freedesktop.org

and probably also at least Inki Dae as maintainer as well:
M: Inki Dae <inki.dae@samsung.com

> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/bridge/samsung-dsim.c
> +F:	include/drm/bridge/samsung-dsim.h


Best regards,
Krzysztof
