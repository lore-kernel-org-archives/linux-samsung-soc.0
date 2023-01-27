Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65512C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 10:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjA0Kjq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 05:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjA0Kjp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 05:39:45 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B73524E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 02:39:37 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-50aa54cc7c0so33821237b3.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 02:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+UJopeyyxAviHgbfTKRe0a3GHBuVXTQ2ZS0wdQedRMU=;
        b=NSzsKWR55MLIj2BwSSAY7xu5odSWc8Wpa5I2UzBnvWkkUbEVm5BNyo/qqs32doZIND
         U9oY3uygc2XSEIqnJcIv+b9jsGhEinu+KykBsWg0XRI4YGQ/1cS5FGI3A1Nw4gZ+J85z
         TJP7EuF+xLG+YBGXibi80d9Sca8pD4Dh8N5XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UJopeyyxAviHgbfTKRe0a3GHBuVXTQ2ZS0wdQedRMU=;
        b=NxHF2LCelVzH6y/vct0lQkQ4Op0o/tGu1ot0Xprn1ufappA0OJKVrCyhIFEHKBAuBa
         MRw9JjqVUWqdhCa3+zx8066sTqvaCCil+V5M5IqccpztiFewYM7X8oYYtkuhF74MDjMn
         5yhV17jJ0RQtjErey+bnkfxCFeiE1QYcjWIqnh6E2KA//BWPyJkB2ogEdZuNeuUz0g/J
         YPKfm9cAvSZErtwAsfm0Ol3FRWCTa1qRsJUJka/LjGo3xui4MGg8CHMaF0UsM4Ij+FNq
         pojngOIc7RYw5+M0sWAOFwRLraokDJUl6M0jIaa92pvJJwK8bCL5khnBN8kRbgv+Byfv
         GlQg==
X-Gm-Message-State: AFqh2kpgG0Spm6zleAtTWpXqrGPj9umXYfRpGMu6qXF6/MpQ2CdkM/D9
        GvlCEnCvpfkDtloKCsQX8dFfUhZeATOHnT7dX/lNhw==
X-Google-Smtp-Source: AMrXdXt7VHM5i5gwr/v0SJKIzXfWwXeopdfWws0tbqOqzwabBR1mb7WiM96wbFyqUwYsoxOIXsr+LjvOPeA9Sz+98RQ=
X-Received: by 2002:a81:48c:0:b0:500:fbbd:a4d2 with SMTP id
 134-20020a81048c000000b00500fbbda4d2mr3279206ywe.186.1674815977087; Fri, 27
 Jan 2023 02:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com> <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
In-Reply-To: <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 27 Jan 2023 16:09:25 +0530
Message-ID: <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Laurent.pinchart@ideasonboard.com, aford173@gmail.com,
        andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
        frieder.schrempf@kontron.de, inki.dae@samsung.com,
        kyungmin.park@samsung.com, linux-amarula@amarulasolutions.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        marex@denx.de, matteo.lisi@engicam.com, robert.foss@linaro.org,
        sw0312.kim@samsung.com, tharvey@gateworks.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 27, 2023 at 4:03 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> Hi Jagan and others
>
> I'm trying to test this series on our imx8mp-based boards, which has the
> mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
> full-size DP-connector). But I don't know how to add the proper nodes to
> imx8mp.dtsi. My current, obviously incomplete, attempt is

Please use this repo - https://github.com/openedev/kernel/tree/imx8mm-dsi-v12

Jagan.
