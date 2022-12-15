Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5436EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Dec 2022 11:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiLOLkY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Dec 2022 06:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiLOLkP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 06:40:15 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29C82CE20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 03:39:59 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s187so5027630oie.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VnmODK4SGL6uxq3J63LFoLUmm+Foh4kGZyItA+1wS2c=;
        b=JdV/o7xGoVvKiWMhcWyCGkQaWeETwNRmNCcjVNgydmXWDt7oxsR6FYU2KfEMZE7qsx
         CbZktnYlQ4wRJNzOW/Ch40iBHAQ3DLeLHddvI6Ar2HWe4FT3VojgjaeIRnnYlSjUEh5k
         yWinetfTzcG1Pal/IuZyXB+OryuT29et9zTufCefI2yI4HRQQ/kvXllbFIfAnGKsgKe7
         rZA8b5gDhIFhybFck04QGE4PduBvPuakNLbgtFRmFhICrUuWt+riA/6lQeOKaDqaGMtF
         eQs+CI3LQufsmuGNwtw2n5hTfp4awhQzE67XFKV/k9D4faODs+AIbYIkxbG/mV9OuyVb
         R1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnmODK4SGL6uxq3J63LFoLUmm+Foh4kGZyItA+1wS2c=;
        b=T5IaNwJ6mK2WKTe0rlsWTWRjBhGYsos2FKRvXB9FnAP6iX6SkPkxbAr+py0/sqeF8M
         FLI40sO41+5moMAgNNqn7Zd5liP5ZWyefSKj5NQ4r7YqZL5UC+hX6RgzYkyNre+nHJpl
         c3fGAV8bO+nb0kUO5vDa7Il2r994Gb17O1pGFuea9ZaHN02E0DmqkU55DBZbEOSd0m36
         MSGUxraPgx/PtEpJXMgr1t0INbVpRZlGq7csAgpxQ1C/rW670Gy7LJZQ3w/VGyUakwpo
         44opCaeac0JSyLvIQVb5ALixUH/+wMTO+YOH/m6mP6DtN2fNv2Us6lJE+sNuYl0H3Fv7
         JH+w==
X-Gm-Message-State: ANoB5pmOpGgfk/IqxDTfcVl8gIU6Zz89tfDQ1QXVYvx277gkLKY+fO81
        GLHpZ1NEBifi/7qZ7xeDvgXU6S8uIGMHKUSsCXL2ZA==
X-Google-Smtp-Source: AA0mqf4vMq3wsumwJ9cIOvn0MpOlVRGNwIA8MHbfI4mHfpzn/Ht/89T4ZdD7VU7zukH8n7Pc76DeCxaAYoxLo2pDh+8=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr311355oic.14.1671104399198; Thu, 15 Dec
 2022 03:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-19-jagan@amarulasolutions.com> <e0556056-aa8c-d8fe-a22f-701b8f44936a@kontron.de>
In-Reply-To: <e0556056-aa8c-d8fe-a22f-701b8f44936a@kontron.de>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 15 Dec 2022 12:39:48 +0100
Message-ID: <CAG3jFyshueF5y9zjiRr-=k8a0AS_mhBorhB1AapzFbMwTnAahQ@mail.gmail.com>
Subject: Re: [PATCH v10 18/18] drm: bridge: samsung-dsim: Add i.MX8M Plus support
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 15 Dec 2022 at 10:23, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 14.12.22 13:59, Jagan Teki wrote:
> > From: Marek Vasut <marex@denx.de>
> >
> > Add extras to support i.MX8M Plus. The main change is the removal of
> > HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
> > the implementation of this IP in i.MX8M Plus is very much compatible
> > with the i.MX8M Mini/Nano one.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Robert Foss <robert.foss@linaro.org>
