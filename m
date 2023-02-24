Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E66C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Feb 2023 15:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjBXPAs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Feb 2023 10:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBXPAr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Feb 2023 10:00:47 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BC83B3DE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Feb 2023 07:00:46 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id y10so1338991pfi.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Feb 2023 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hERXaBdrbg/kcoXnyVwjoNZvmUQJOvwdCRNcwJ2qOrY=;
        b=JzGmFBpmxid2uCtm6tJksrka7vIPdsxqSWIl8ozriR3rPinx0iXndBoNsvrKC7ATxZ
         IyXIr22AVL65D6MkHlhRgVsCBvIScfO3Yrn5P4udH9E8SwRm2YMCpEeWs1y6QnvfYWi+
         xEqYP/Lx0zRQ6jucaqhSksQv3k0YGrBFkGXa1OdW17qVCGELFBfXd8kmHBFn0VSsxZ8Z
         86Z2AdwaVYrOG6WGtiBe642Lr/HHs7DF9qpepPcH4ro3+6zm1yxLePVVSYOoX6OeT+BW
         sX7F+ncyHmIx44lJ0kzCeQVCPsF0hhTgeyrg5xuxRQ0iyVM2Zv2vsf6AEqc0ojkFTsaH
         L/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hERXaBdrbg/kcoXnyVwjoNZvmUQJOvwdCRNcwJ2qOrY=;
        b=n1oTGuEhxVbQEepHHFD8zd8fjGFVMOk7u0XlAQ6mUNhSCG3xDq7E2Y5zyDmyKu83ZL
         QPEMPB+bChYwuNjPvrzHuhHuc6sZ0u+1q3bC0psyCxXpFDtkAqj4x/cBh3rK1bkIsslP
         B3JS4cdv34GwmQLYVJALLEHjqSPCHVvMT79XLOVEzO+Go6CtncngWNPTRSKEzYdjFWzm
         9u82HD73eg1PzMoFmiC/UaAfF6khZbGUg9NVrbvHqerqJ73AXDcxqazS5mIFYStqxPq4
         thlsmSaefg6K14ae01QEyD8gvVx32bQ9cnjamQFxQoFp6xuhTnp/FiP+Z22m4jICl05C
         +Z9Q==
X-Gm-Message-State: AO0yUKVwg2ukpMfbmrfTo7NwsgnA4soiGrVIKb4KI7FYKz06POHxRZNS
        avZLgzBrxaHGbP1Q2xKcNYA7x6Uog+97TTiVKTM=
X-Google-Smtp-Source: AK7set+7HR6//52GT9V8ZRM0q82UfELDR3N7F6B7l1J/o5zabN46bFB1WGHUZzqfO/jZ+87pweelqPmzE1NebSm7hiI=
X-Received: by 2002:a63:7b58:0:b0:502:d7c8:882d with SMTP id
 k24-20020a637b58000000b00502d7c8882dmr2602619pgn.3.1677250845577; Fri, 24 Feb
 2023 07:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk> <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk> <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de> <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de> <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de> <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <b246aae9-b719-02f9-dd0f-305b74611fab@prevas.dk> <657fa528-ca01-0c6a-2c2b-bb7f4a95096d@kontron.de>
 <0483dc01-a6b5-89ac-3ac0-41f85405fab3@prevas.dk>
In-Reply-To: <0483dc01-a6b5-89ac-3ac0-41f85405fab3@prevas.dk>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 24 Feb 2023 09:00:34 -0600
Message-ID: <CAHCN7x+v1xpGNDu11Ks8p9vCzRz8jb+8wbVzxNbbKh6OJ7KiKQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marek Vasut <marex@denx.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
        dri-devel@lists.freedesktop.org, inki.dae@samsung.com,
        kyungmin.park@samsung.com, linux-amarula@amarulasolutions.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        matteo.lisi@engicam.com, sw0312.kim@samsung.com,
        tharvey@gateworks.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 24, 2023 at 8:08 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 22/02/2023 11.05, Frieder Schrempf wrote:
>
> > The NXP kernel is completely different. AFAIK it uses the component
> > helpers to bundle all subdrivers from a central driver
> > (display-subsystem). This is not how the mainline approach using the
> > bridge driver interface works. So you can't compare them.
> >
> > Did you look at this extensive thread with findings from Adam?
> >
> > https://lore.kernel.org/lkml/CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com/
> >
> > It is related to HDMI, but I guess a lot of things are valid for DP, too.
> >
> > Anyway, we need to get this series merged. Otherwise we can't work on
> > fixing all the other issues on top.
>
> Alright, I finally managed to get the imx8mm-dsi-v12 branch (commit
> fdde97c7d553) to work, by modifying Marek's patch for enabling the
> lcdif->mipi pipeline a little. The end result is in
> https://github.com/Villemoes/linux/tree/imx8mp-mipi . There are also a
> few cherry-picks of by-now-upstream patches to imx8mp.dtsi included.
>
> It works on our custom hardware, with the ti,sn65dsi86 mipi->eDP bridge.
>
> It does not seem to work on the imx8mp-evk with the adv7535 hdmi bridge
> daughter board, but that's probably just as much the fault of the
> adv7535 driver as anything in the SOC - it's impossible to get a real
> data sheet for that thing, and there's no end of random patches floating
> around, with the NXP kernel doing completely their own thing. So I've
> given up on getting that to work.

I have a board with an ADV7535, and for that chip to work, there needs
to be some work to do some math on the front porch, back port, and
sync timings based on the number of lanes.  I have a work-in-progress
which supports 1080p, but I was waiting for the series to get accepted
first, since it seems to work when interacting directly with DSI
displays.  I have my patch working on imx8mm, imx8mn and imx8mp.  Once
the base driver is accepted, I'll push the patch for review.

adam



>
> Rasmus
>
