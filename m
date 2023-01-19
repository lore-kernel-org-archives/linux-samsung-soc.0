Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46F3C004D4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Jan 2023 17:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjASR7N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Jan 2023 12:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjASR7M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 12:59:12 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D129BBA2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 09:59:11 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 66so3580552yba.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FOB72L75kaXcfttasRM4isMQGOgu0vhdc6xDEfltXi4=;
        b=UcZGizbHQPhN5XlWcZLIoend9g0Pd/2lt3awrzLsp/3tWRFHIIT80h1mn1JZWltiBR
         r+LpABSbs0p0J0nSev2xzxqf6/Kdov6cR5Tw7yBjsEYEsS2fhsq55lVhnIROce8xFRNa
         kb2vzkTRSTLZe04GJ03bFPELvLdss6ByDjW6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOB72L75kaXcfttasRM4isMQGOgu0vhdc6xDEfltXi4=;
        b=kTXNUcih/JBRWc/AshpH3BAtSvSv42uwNVxIV89sEKD73d4sOP1ROxbuoAjouS2spN
         7CiwTSBOcVWZuZ3yXOvXNQDyMtvVKzdxahM77Ckhrrxsy4Oa0fXTANNyZHyPbxnsHDI1
         XZFoIutzfzL79+o+xyit22XnmUnjfDMj0pWT4OZS5qCiLUP26s0qprDUgo1eOfmEgO8U
         Pbqo1pOm69Cc/j8BahYZEorvPD/dACE+9U6CXInDbMxNxn/XJ5fR5lWqgvPFG6KxbZS/
         M5XRRkMxrQQ1+mS+ZPckj1JpKfMfAN2DVfo3ls5GI0J6AYiMiCRZOdf8LEFEj74e+spx
         p3JQ==
X-Gm-Message-State: AFqh2kphCl7S//71hpwWNh9q1AQ0Q/JbGDIetD3HkM55R7+MKfHMeROQ
        iGLUc32A79tKIvDopZ/0Z9IlhsUBOE0B918+OzP1rg==
X-Google-Smtp-Source: AMrXdXuF9zrLNubB1uj9LLnW9ShFQMDII+h2HV7IuRhlB+d1jfu3knfPe6TAk54PczHt/7M4DvphFWwgzpVPmg8OY6M=
X-Received: by 2002:a25:b6c2:0:b0:6fc:c36a:1d06 with SMTP id
 f2-20020a25b6c2000000b006fcc36a1d06mr1044577ybm.462.1674151150523; Thu, 19
 Jan 2023 09:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com> <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
In-Reply-To: <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 19 Jan 2023 23:28:58 +0530
Message-ID: <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Fabio Estevam <festevam@gmail.com>
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

Hi Fabio,

On Thu, Jan 19, 2023 at 10:57 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Thu, Jan 5, 2023 at 7:24 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > Does anyone have any other comments on this? I would like to send v11
> > with a few nits on v10. Please let me know.
>
> What is blocking this series to be applied?

There are two patch series prior to this need to apply.

https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/

Regarding this series, the patch 09/18 commit message has "FIXME" this
need to remove.
https://patchwork.kernel.org/project/dri-devel/patch/20221214125907.376148-10-jagan@amarulasolutions.com/

I think it is possible to remove it while applying otherwise I will
resend this patch alone or in series again.

Jagan.
