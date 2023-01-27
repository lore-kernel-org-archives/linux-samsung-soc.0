Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3E4C54EAA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 11:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjA0LE5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 06:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjA0LEu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 06:04:50 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEE013531
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 03:04:48 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4a263c4ddbaso62990647b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtCufjftzRG8lvlWQ1wO1skFf5C5cc2e3diz04sQ88E=;
        b=jfhucjcR/CC4IxF2b6WCyWc+ciiF+Lhhitd8XNp3JNOlUyy3wZT8XKSeVWHsCAhQEm
         UjUBzdvWfLVfTC/ga+WY2MKTvA/YVx3IzSbGZ0ReyWlGlrq64wln0rPhDk5/2F8itOs/
         NLf06A7kwz+XPXLB7/Myq61A5Je0k6xVlOzRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtCufjftzRG8lvlWQ1wO1skFf5C5cc2e3diz04sQ88E=;
        b=BHvoSAAWu5RE2mku99un7Fw8U8XwFQFuTMPS1eyWOwcrhPIRHwiUcSQUSafXnHU86y
         fC16ufVcZQDh7ARoqjwtq7XYMDY0FfUqU0kKjjfuy03H4eMWBCLenD9hazxFKg+VXgLO
         QgknqV7xaRPH+9+jJtWbymPpO+3vYoCUHQuQWm04f5DRCOL1T1+krFUH8bqNP6+fbSNb
         zYyTaPHZJixp6VECp2zNKS8kMr/pCECjFzBbzlWVGhZYe/vHHwTtm0hZGTJRt8SV+67x
         qnZ8TOTupWi9WHpXgg/a6nt/r8TI70S/ilGuvxHcIeuu51LeIfh/YxgyHK7uM2bv9ay5
         Qycg==
X-Gm-Message-State: AO0yUKUWXK6SagB2LvoFR8IkRPdm9tj8K5VGyWdBJnIAhjOAVyuIfqiT
        zWWcmXSa3O27xRS9Sg5Ej6IdaxF1OF2FuPZJtgt86g==
X-Google-Smtp-Source: AK7set8v0lN6UBHY9MeualzWu6LkDZ/SC4SMQIhNB9JsmTFq3XcVeVlTm8QaFA6gZBPVsOQ496jRh0BZreSEXYOG6IU=
X-Received: by 2002:a81:7302:0:b0:506:52b5:94e2 with SMTP id
 o2-20020a817302000000b0050652b594e2mr1637824ywc.230.1674817488164; Fri, 27
 Jan 2023 03:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk> <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
In-Reply-To: <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 27 Jan 2023 16:34:36 +0530
Message-ID: <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>, marex@denx.de
Cc:     Laurent.pinchart@ideasonboard.com, aford173@gmail.com,
        andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
        frieder.schrempf@kontron.de, inki.dae@samsung.com,
        kyungmin.park@samsung.com, linux-amarula@amarulasolutions.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        matteo.lisi@engicam.com, sw0312.kim@samsung.com,
        tharvey@gateworks.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 27, 2023 at 4:26 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 27/01/2023 11.39, Jagan Teki wrote:
> > On Fri, Jan 27, 2023 at 4:03 PM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> >>
> >> Hi Jagan and others
> >>
> >> I'm trying to test this series on our imx8mp-based boards, which has the
> >> mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
> >> full-size DP-connector). But I don't know how to add the proper nodes to
> >> imx8mp.dtsi. My current, obviously incomplete, attempt is
> >
> > Please use this repo - https://github.com/openedev/kernel/tree/imx8mm-dsi-v12
>
> Thanks, but that's exactly what I'm doing, and I don't see any
> modification of imx8mp.dtsi in that branch. I'm basically looking for
> help to do the equivalent of
>
>   88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>   f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>
> for imx8mp in order to test those patches on our boards (we have two
> variants).

Marek, any help here, thanks.

Jagan.
