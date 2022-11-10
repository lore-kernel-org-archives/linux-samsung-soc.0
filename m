Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEE5C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 15:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbiKJPys (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 10:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiKJPyr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 10:54:47 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428942B1B3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 07:54:47 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d20so1694379plr.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 07:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5cY9qUsRqtE8TrX9YkzMKcdKUuXawtOb/S7+iZPyZhg=;
        b=ZkgP4TzeZjynPYYUd2OYz6AQRc9SKLkDMpRKeeezyHWelBe0m41B0WyMRGx7iIMrk0
         WSa3/rhSox2m5RimkbZ7okXs9Uw3q+ASfZ7xA13pfLIrn0ipKvINK3y25HdG1jHDEhcD
         ig85+y8y3qCWtu16PZHWYfUSJ8Azdh6UFcniqnlNvhgI9Em0dZXwK0B0PXyXZ7WWLuqk
         4ryCYiHRHmfHwjuyTzxcQjSQDY2iKFmORTt37B028vZV20hvFE9MfJu/Ely92lB5Ca4W
         X7lAs5uOqxGLuZlOI9Ey8AH0uMfYtS/IsmpOdij9IU7EizU6DK+TiCR3lS2hAMeVKC3n
         Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cY9qUsRqtE8TrX9YkzMKcdKUuXawtOb/S7+iZPyZhg=;
        b=kjh8Lu7L46VTFq6bpxvNVMOaq26a7AL5GlndLY3Xz13wsGaBaLmeLypmuh8I28LuJ/
         a6cQei83r1WI5djkvhRKnHTl9diJtn7457qoiBTJQn30C64kG/v145IDU/mDizfMQRqq
         pTEd8m2SmYrIWCNKRm/q0f3Fi77v1d4URB/9pNYPMNj/DXgU76HvyWePIU3fmtX5Yvpp
         AYW/q79yPSqOoJrt4PKiUNCKzLW1lcjzvHmOLGlmAQruyx/tN+G0LNEDTIK8nH4Xqny2
         ePMzPimhg8xZLLI5aT0A3qkGxvjedOESFc9C0VEhtWoA4+gV6TqnZrn/f8vdTB1jzgAW
         Q+4w==
X-Gm-Message-State: ACrzQf1xg612b/Ix/Ec/i6aejS11K5LciphdXV/jvZamo/OhN1ARU7qo
        JasF8xb8f4fn1+Xt6Adb5BNkm+ao3v84vCirkeI=
X-Google-Smtp-Source: AMsMyM4MKenHQEpL5igM9bIJh+ijqHRMrG+VpTH9rZPo5TO0pW7paW7eRNDw9JbV9SvME7k+EyGiFEF2uvsWbkywwGA=
X-Received: by 2002:a17:90b:1056:b0:212:dc2f:7ee7 with SMTP id
 gq22-20020a17090b105600b00212dc2f7ee7mr1325884pjb.172.1668095686643; Thu, 10
 Nov 2022 07:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com> <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
In-Reply-To: <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 10 Nov 2022 12:54:32 -0300
Message-ID: <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
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

Hi,

On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
> and a Jenson 7" LVDS Display.
>
> Thanks for your work, Jagan!
>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
> i.MX8MM

As this series has been successfully tested on multiple devices, is it possible
to apply it so people can make further adjustments?

Thanks
