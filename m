Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708CFC61DB3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Jan 2023 17:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbjAFR4b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Jan 2023 12:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235581AbjAFR4Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2023 12:56:16 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9567DE09
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jan 2023 09:56:12 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id e21so2669475ybb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jan 2023 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vItQQ+zMnDwfsgMtdm3lD3jSvFhQW7H/nT05vLZBQiw=;
        b=iI5AG1vyOStZrKfFxQwHmDCqxNrU7VJNf5NYNk8XqSUhrkCd1e4FDj57XzBBz6ndp0
         jiBj4TjR7/ZNhl0IN5kpXmVU2xlrS7897Vn//buTZH45QG8/NwHSbXVFmkFMJyob86/c
         E/5K/F4NBgU+9a1raDLW85y7dU5vrpTcGu7uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vItQQ+zMnDwfsgMtdm3lD3jSvFhQW7H/nT05vLZBQiw=;
        b=Lzw/HNQ4qFv+NGUsxk6CgT4ULjmt5pgvgnqxEzaRNcBgoDW05nsn9ltCmhSLnIseT1
         NKt0LpgqvyadiYLk7rB1rYnsdPDNYUOAX7SY13s92r/G86Ni/OZm3ZgTSNTkhp3gpXxt
         7LOXs8cOd4TY1E1D3TBXK7xyW/9sMOFBmO8Oy4EyHIbvX2qsRyPLK6kYe+jEfcE304zO
         zkuo8qn/tklflOiaZ3itFZDwJk1d9GnPnzjbAnLtdwDKs7Iwzo2rd5i7uc1J1PbTUSAm
         acwIUcfLn7xO3q3AyAUAzV+sE1dYaeY0M1CC24dgc/r7pE9iRIQdehKFr+tFBOHqNTyA
         cLuQ==
X-Gm-Message-State: AFqh2kr6qfRnyfhFT+I0ZpHMmdoFhBwW1+z/EBZjmylG3p67f6Ddm5vx
        5DDa9+1VCTNuXz2M1Er2UVmiHIvg/7J78sAhWSu7Aw==
X-Google-Smtp-Source: AMrXdXtbxQ5Qnd+6GL9kE3w6RgWRGntC645ZmfKD8igXwb6TlzMS9itSg1rb2khU9FsUgQ/BuUX72VSfm3IVcT0i9d4=
X-Received: by 2002:a25:bc4b:0:b0:6fc:c36a:1d06 with SMTP id
 d11-20020a25bc4b000000b006fcc36a1d06mr4080020ybk.462.1673027772089; Fri, 06
 Jan 2023 09:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 6 Jan 2023 23:26:00 +0530
Message-ID: <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 11:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Split the Exynos DSI bridge chain update patches from Samsung DSIM
> bridge driver for easy to apply.
>
> Changes for v11:
> - enable bridge.pre_enable_prev_first
> Changes for v10:
> - collect Marek.V Review tag

Any update on this?

Jagan.
