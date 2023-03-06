Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD720C678D4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 08:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCFItL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 03:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjCFItK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 03:49:10 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7403CCC22
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 00:49:09 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id t4so7285988ybg.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GtbYZNGHC9OG/em8LL7OjKhJVuS4kO26d62qIDYXYI=;
        b=NnsoZeNTHmUEHQhNevMja7R9F15XSmY4P2l9hG+U62xDY9b0hNtQzCUYSjzqlF59xg
         vPGWYPeyVtLlOpOw+zbtVNh1En+npDGonQ35A/V66prlNZEFMVTDgLS5NC/XtAgOnthK
         dSi11XgdRVhsK/30F18fP8e+oxJWv9Bmf8n0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GtbYZNGHC9OG/em8LL7OjKhJVuS4kO26d62qIDYXYI=;
        b=B7kMCz9d+ZJukuPgLNmt8RtxJ6KOY4jVNIMbth4Ex7rujapL5nRCqEHInIo1tj+/oi
         noujrWjYmiK4X/z5483zXu8c3NzfrXDXYVA+t69lMVRWxh6ptzA3xV5xTLw59RXgBNf0
         0hKBUODplt1H0WjJLoExJVYNDFUm/GfXMHshBgPir7o6piy/pTC95Kt+pU5G2W0h5h1m
         Nmb/mn2R669NvvmM6zEol3RUn2/hyMS3SEpjtAugf959SOZW8cvDvPpbKlUSUszSj+Yl
         adXkAJCetf2pXADb6heFti7MBGgko4BGMfzM9vs+5oOSGba4K7f86M60GZKLG6nuLi5D
         qR+g==
X-Gm-Message-State: AO0yUKVWTKkPT/jGwxSrv1U42TWTEmpjsKCreXAVL7XKJ5L2zMtDVWGa
        D1onZkOZ8+cfKZwTSIqaWp4GNyc2sO7ogUICfJT79g==
X-Google-Smtp-Source: AK7set9rICjWfZoA7wXooedrv/zZHgvLYiJ04JIwAbDgtQsowOKoLuFK98s0pP3K9IfwxVDppUW8fJm5nKBNyqCr+e0=
X-Received: by 2002:a25:938c:0:b0:91d:d6ed:6bd2 with SMTP id
 a12-20020a25938c000000b0091dd6ed6bd2mr6093105ybm.1.1678092548604; Mon, 06 Mar
 2023 00:49:08 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com> <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
In-Reply-To: <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 6 Mar 2023 14:18:57 +0530
Message-ID: <CAMty3ZA3y4UgVSY5cYfAjksyp6zJaRWgEfkmc70K5qtWxBOMHQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To:     =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki Dae,

On Mon, Mar 6, 2023 at 10:54=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen P=
latform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Jagan,
>
> > -----Original Message-----
> > From: Jagan Teki <jagan@amarulasolutions.com>
> > Sent: Friday, March 3, 2023 11:51 PM
> > To: Andrzej Hajda <andrzej.hajda@intel.com>; Inki Dae <inki.dae@samsung=
.com>;
> > Marek Szyprowski <m.szyprowski@samsung.com>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Marek Vasut <marex@denx.de>; Maxime Ripard
> > <mripard@kernel.org>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; Frieder Schrempf <frieder.schrempf@kontron=
.de>;
> > Tim Harvey <tharvey@gateworks.com>; Adam Ford <aford173@gmail.com>; Mat=
teo
> > Lisi <matteo.lisi@engicam.com>; dri-devel@lists.freedesktop.org; linux-
> > samsung-soc@vger.kernel.org; linux-amarula <linux-
> > amarula@amarulasolutions.com>; Jagan Teki <jagan@amarulasolutions.com>
> > Subject: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
> >
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Inki Dae: please note that this series added on top of exynos-drm-next
> > since few exynos dsi changes are not been part of drm-misc-next.
> > Request you to pick these via exynos-drm-next, or let me know if you
> > have any comments?
>
> Seems some issue Marek found on testing. If fixed then I will try to pick=
 this
> patch series up.

Okay, I have a few comments from Maxime and Marek V pointed out. I
will send v16 now if you are okay with it?

Thanks,
Jagan.
