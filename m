Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0746C3DA7A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Jan 2023 17:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbjAFR57 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Jan 2023 12:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbjAFR56 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2023 12:57:58 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA497DE0F
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jan 2023 09:57:57 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id p188so2661507yba.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jan 2023 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vm9njLv8zSsK/sovVu1laEs0HZNte5oiMpQpKlG/5s=;
        b=iblujaKvE23FC0d+06OXSlVZYClMsGamZ6ZXj7SRyl76Cd9aSRaM//jp+6HUfiAM22
         AGIHlex0uoqVRoi+puZP+udjS1nipXOpM6KjXMOobPSxcE8NH+oX6X7WuDRktInmnAcV
         lnJpU+nya5Uvq0WaQo0OQjZoaxyXMIFKuGhk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vm9njLv8zSsK/sovVu1laEs0HZNte5oiMpQpKlG/5s=;
        b=HTOK/d9+OVt2zpt4LaWYA2SQxE+R82c8N4rzNlIRk+Toh5Z8rOsUN2DSyLmSdirZ6g
         VKa7+P5Pmg9jf+PcpmaU0Pz9ZokPZA4cLZej3pAV4bXF+gzdHW4IwVy/z85qjnYR5iyu
         S4+hoek2ryMUaPgjyn5Hl9vPYO2VJrByfiBs6ILAzh3JM4cYcxu0+Q0oza1iiiYp54E6
         8RBfJO9xksC07mWW0mrMUu/k9G/oyC41hbeB/RbiKt88LG0ytICEsMmzqRJOmMra7Z3q
         DoKg6qE68Y143xVz0cLBeD5Z3/r3cVRDZF7NM1fTOtZNlcDlQiV1KQ3pBOaKrv0VFTIi
         /PMQ==
X-Gm-Message-State: AFqh2krQxqwJCHUa8UGcXsCm3OsLIefGvFBNIHv6k0UABpMepJ5ok890
        IF8EL2xCswTeNhBojKul2wdMtfJIAsbSXcVzvII33g==
X-Google-Smtp-Source: AMrXdXu0obOSob9FWM4o+nQkLY3Z9FDbaDA1nbeYcRSxOcmxYJSLrSyQFqUOtSF2fLLy8N92OKoGhxU6gQg6V5DJ6T8=
X-Received: by 2002:a25:cc82:0:b0:6f9:bd14:f0b4 with SMTP id
 l124-20020a25cc82000000b006f9bd14f0b4mr7181577ybf.408.1673027876839; Fri, 06
 Jan 2023 09:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20221212145745.15387-1-jagan@amarulasolutions.com>
In-Reply-To: <20221212145745.15387-1-jagan@amarulasolutions.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 6 Jan 2023 23:27:45 +0530
Message-ID: <CAMty3ZAvJb-TT5M2PPwDZ29=rmELF=5DWyMAMFLSzKXFcMHmgg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 8:28 PM Jagan Teki <jagan@amarulasolutions.com> wro=
te:
>
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 =3D Enable and 1 =3D Disable.
>
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
>
> This patch is trying to fix this MIPI_DSI*_NO_* mode flags handling
> Exynos DSI host and update the mode_flags in relevant panel drivers.
>
> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

Any update on this?
