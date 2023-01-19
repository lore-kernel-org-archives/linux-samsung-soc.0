Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB38C004D4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Jan 2023 17:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjASR1o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Jan 2023 12:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjASR1k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 12:27:40 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA39798F9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 09:27:32 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so2435195pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 09:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+yByDB22HCudt49W/UmVaOb7KMALvWI5oNh+3zy2EdM=;
        b=YysEOaic5JVNZ5gOMnYf04BSi94eSQzxcKt0U77fM2sd5uXJM+gIX3K0rZtfNlzJGK
         nLBpzOC8kIYXV/FMbakdlfEqaZliLn4b89TpA6xSCW6+hyt/1RB2zqH6IHmJrvLzvHyw
         8gr13J6nkfOS6bW4VzfthYQX0v+0698pOvCfdtjFsTaN/1dazGKEbDShKdt6KE2MXcxQ
         PzSsEPUmbbxMgxFwloIi6BLaMf3Es5/UVsb08Lf3fn34gQJn29+RL8U8TZAQzCk5/cZ9
         9zsv8LtzYh8UFNPI9AyaeucIXSevdwuwNpB6MAZjtdX86FE2wrLFzMWjLkah3+Wmrf31
         HT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yByDB22HCudt49W/UmVaOb7KMALvWI5oNh+3zy2EdM=;
        b=fSdlIwqT1D4GIN+WOK0U5VVdis0T7Cew66vzxEOa7Jr1ffUQlWOw214cPKS+OtBha2
         LwtHB533RUKnjGx032MwasXUt1FCReqj4+w+5UPyww1lFrZramBb29UPXfIC/eow/dMu
         f1dCkaYkzvhF5MFESZcB4Jq1K8R248P/Zprs71pWt/y8Y086YR13LmLPneGBaiCP0iYF
         nsYtcpX83A612MupRYPnR0R66JvF6IiYTBuq+39fBZEvj6nm6DGsNexUdZxHjHabfIJU
         YtMRUiWy2uz3n+1vNzw9wciF6B1iHlhf7foZl4vmAQMbD3FdsbAWbxn/rP31RTlfb0kO
         XoaA==
X-Gm-Message-State: AFqh2kqjO6uGg1v2E7rcV3zfLYIZ3ms6zEv/2XqfCvIE5/wsNPx/a/j+
        TzVR6VpAiDB3sdzuNFMnu2w7IDdGl6kQPfrXzgw=
X-Google-Smtp-Source: AMrXdXv/g8vYV6jhwbL6XrS6ExuEFvgvSA5QzaUfxtJGoTacWqzI+vDaZ0qiUZmd9vjmvVKxQXXMvEa6kSgqIXSflos=
X-Received: by 2002:a17:90b:83:b0:229:5037:d9 with SMTP id bb3-20020a17090b008300b00229503700d9mr1197103pjb.195.1674149252291;
 Thu, 19 Jan 2023 09:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com> <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
In-Reply-To: <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 19 Jan 2023 14:27:17 -0300
Message-ID: <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

On Thu, Jan 5, 2023 at 7:24 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> Does anyone have any other comments on this? I would like to send v11
> with a few nits on v10. Please let me know.

What is blocking this series to be applied?
