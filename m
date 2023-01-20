Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5E1C25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 12:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjATMG1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 07:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjATMG0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 07:06:26 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BE49D2AE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 04:06:22 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id w2so3762628pfc.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 04:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0fHoLFugivtMZ86kgSLqMbkMyqartt/N4bdBqj9xnEE=;
        b=EDQ3LbZIORQv6Wc6NXt5iUyV4RuaokaUOgR77k1Aa/RMyX/8Y5U4RwLjSG/K6XkFWP
         rhFm1GCcdTA+Q0BXiAKOY0Bxh5yQede1Occ/2SSErgBbcnS3xWcilhSwZx1AU2+/nAg8
         uqdZooE11ryi6UPO+/rAAjZMQST0xvB2xZc9zI+XgeYp1EgXXkswaO3NtVuR/9cpM9Yv
         BdC46FAv2X7txfFbeb6oPEGBVqwlx4NJLPv7tvaLUIAgnysFuyvTJJJVoki3NrpCOezS
         NUELWOty/dGfgX1jYEbg7BiYaMQH1ckN+Js0KjADAJ313RtBPyZIqlnX5jpNItnzkGJr
         pTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fHoLFugivtMZ86kgSLqMbkMyqartt/N4bdBqj9xnEE=;
        b=PD7CIXa8/Ps6V6qzsATPwrRhNVcJpTBJWycuF6RDkW7KZeVexNXZHJijVBaEA3uS7W
         DbiInbvdwHl1ae2G5YNpV/LusurWGO4HSFSBNjzpoCfbwubBq5seM7qFyPLJBxeSeyEH
         r2QsFGcZz/3oZdX13dnoqJ1OTdwouyv5sxI5kTEkji8PUNUvMe3nIiBX5JD+reP6L3sZ
         kIBiiOVIyYfSiqvJesOUd+//5B2SBNE9gVnnasGopIRJoOQqaug+EBUR1avGM3Dk0CYq
         frLAD3Qajht8wOYyOML9jzhwPCOYt08L6UHd6PDanH8ySBZjCfCqNJ+wzvSHq4qbDs7m
         tm2g==
X-Gm-Message-State: AFqh2kq98IPbKHmQ0NCqqx+pqL3Y3fd+NrCiGP6iaCMMQOpJZjw77GQv
        AMwjaETEKpC+wDNG/iZ8ybezO/t8yPmtWu4nh3GIXpfe
X-Google-Smtp-Source: AMrXdXuRpBSOGSkq99Qq3DZEX5OA7nhrBDuhQ3ECyo4J1HInmfP5JWg/z7eNUFrp4cEL7c4dz3gFndCovBaeoHW2mdg=
X-Received: by 2002:a63:e23:0:b0:4cf:122f:2102 with SMTP id
 d35-20020a630e23000000b004cf122f2102mr1043434pgl.98.1674216382168; Fri, 20
 Jan 2023 04:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com> <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
In-Reply-To: <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 20 Jan 2023 09:06:10 -0300
Message-ID: <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
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

On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> There are two patch series prior to this need to apply.
>
> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/

Would it make sense to re-submit these two patches as part of your series?
