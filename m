Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF809C6379F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Feb 2023 11:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbjBNLL0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Feb 2023 06:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbjBNLLH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 06:11:07 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0A427D6A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 03:10:13 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id bg2so5461888pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 03:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YV6VJE7WrIiVKYGNmWA3UqKcU/lEHYr8sr/5rV6yN4Q=;
        b=UVI5lcmYUcXnV+Ym1kZVTpGvI60tl9hm40lokSNkXH639b0LI+XWpZOGW6IesL8n4K
         anOIsDUFeoXK1mN9AG+xec16EfFnck2cuIR8pA0pniPnTa6DAS5tziiA8br0ZRn7xfwf
         ZgosuYU9oNEvIqf0FQNOssQ7X/AHrbDQy+ibg+cn0DAnDQCWoLu4sLdFxEkqhL15YOx4
         oidD5VcPcvdyQ2AzGb/HbAzuyhFo4tf8ovdksorwMj4DYZ53KXGBgPOqaHJmXy+ouEeH
         gpXEL470sm9FCWZSra3i+vsQjm65LarkoZiKYFgRHaPYShjqNtTyr57bFvStvU2qecuR
         cN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV6VJE7WrIiVKYGNmWA3UqKcU/lEHYr8sr/5rV6yN4Q=;
        b=0Ysi0+SOEG52EfJCc8e7dPMINf9naPA7FO08mfqStxM+hzbnQHaLTr/9oiQ560LvMj
         VNj+rb43q9MtiK2rzg1AXZOV0TZb6KE/QdIJybYS00nINY9aZpGtDIW20d5pREVClmB8
         bGoTgvo9tESAbDQ8ysD/1EAY3jGypx3lpGOsnHiyfdeBP/c97kM+RSIEku2wCrs0H8LG
         M3vtejdKB1fjmmNSlSM4uRF63qEJ5wzyBtk7gfC9MdTFctBFMrnCxpmFsT0SYPU6qPyP
         xP11aViCkmzOF0aAJuxDovy9Z8yyEAS71C5bkDYDv0uGhW3bhs85xWB2/hjTlKKSZnRG
         RqZg==
X-Gm-Message-State: AO0yUKUe4DNwdIddlZp/oW4oRIEiVDBzT3a/uPxJ7vHRzB2CFcxBuE+Y
        4aNGY3J3G/h0+J0+nCG3BKpLBt2BiHM3UGI6Z1g=
X-Google-Smtp-Source: AK7set/6exmanuIDSEZac7sutaeaZiv4wudKz90YgkooBOyBlwl8OwVUuEyIWeZSeVkDQ9A6w5kW7sNw2jVunnWqny8=
X-Received: by 2002:a17:902:c942:b0:19a:9605:b958 with SMTP id
 i2-20020a170902c94200b0019a9605b958mr570666pla.32.1676372983572; Tue, 14 Feb
 2023 03:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk> <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk> <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de> <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de> <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de> <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de> <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
In-Reply-To: <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 14 Feb 2023 08:09:32 -0300
Message-ID: <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
        linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
        dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
        Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
        m.szyprowski@samsung.com, aford173@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Rasmus,

On Tue, Feb 14, 2023 at 7:55 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:

> Well, the data sheet for the dsi86 says up to 750MHz DSI HS clock, and
> if the value specified in samsung,burst-clock-frequency is twice the DSI
> HS clk, I suppose I should be good up to 1.5GHz? I have tried many
> different values, but I never seem to get anything through; I think I'm
> missing some piece.
>
> So now I've tried to use these patches on the imx8mp-evk with the
> mipi->hdmi accessory from NXP, just to see if I can ever get any
> graphics through the mipi interface. And there the story is the same:
> the adv7535 bridge gets probed, and can read out the edid from the
> monitor over hdmi. And while the mipi block and the bridge seem to
> attach to each other, I still don't get any output.
>
> Do any of you happen to have this working on the imx8mp-evk, and if so,
> can you share the .dts updates you've done and how exactly you test the
> graphics?

I don't have access to an imx8mp-evk, but I tested the ADV7535 MIPI to
HDMI daughter card on an imx8mm-evk.

Some extra ADV7535 patches were needed. Please check patches 0020-0023
and see if they help.
