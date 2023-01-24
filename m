Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43847C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbjAXVCC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbjAXVBz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:01:55 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70D8518D8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:01:48 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4a2f8ad29d5so236254737b3.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3G0KBOpll5yzaJduvaF+qGkdsYlRvm8JqRhMLU9isTo=;
        b=CSlQHmq9300PGQqIBUvS0MxrxWJDOmqpqiXWpi29J2zDxL88tX4vxwxYM53gG/Vwj1
         3aFrym0TtCdWSUUS8XW354YMxkHosDktcAi7Ty4OOOFfTKvZN3ad4PsScO0NccUNEa/b
         Iw3gR+tXs+sBRfk7HS6MTPkvjTzMQSl0IJTZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3G0KBOpll5yzaJduvaF+qGkdsYlRvm8JqRhMLU9isTo=;
        b=Y4w01n14gbFm3xYD6yRmn8+Hai5IiawQkRJFkxSzy+TYZQHVYPtQNZmO+vNIpU4Pa+
         exj8Bmf2jYrnZqP2/81QDtv6oJoYn3E5DQuU4TpX6GHfA+zRKBNsYuSjwCMsNMQ0/Cxe
         hEhOxnfcPAT2m6PbmcL/8ocfelUOpYup0iiXldBb8xV7RRnJOVtC8UQogHqSu0ORhNlY
         VhBTEuCOX4Kvlu0+ymDkpYhQ+mld/fVJMhUJXd8X2EiPkgyv/C6WLvgxamQaAaH/0REZ
         cMSL8c/BXpI0rob5EyLBoSKXUkINKiXLXoRyIzZZ9UR5nO4pYULwmEuLT3lhUI0gCqgy
         EPZQ==
X-Gm-Message-State: AFqh2kqeR9w8vaspTKyPljFPYBCQm3QS/2AVZb1kuCwe+EAjDQBJjJ0C
        F9FbLn3yWqyYL7Cti8DYeep2AFYJd/vNZ7QGW+bRCQ==
X-Google-Smtp-Source: AMrXdXunOp69Qe+oGJdmhaszyj6MV1dHwRWxkQhSpimYhYvfwQSniHZ8LGLXrEB1TVKNLAUTxlgXSOccy0JXdgFsCXA=
X-Received: by 2002:a05:690c:852:b0:4d7:eb11:6bf7 with SMTP id
 bz18-20020a05690c085200b004d7eb116bf7mr3490967ywb.235.1674594107810; Tue, 24
 Jan 2023 13:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
In-Reply-To: <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 02:31:36 +0530
Message-ID: <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To:     Marek Vasut <marex@denx.de>
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
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/23/23 16:12, Jagan Teki wrote:
> > Enable and disable of te_gpio's are Exynos platform specific
> > irq handling, so add the exynos based irq operations and hook
> > them for exynos plat_data.
>
> If this is just an optional generic GPIO IRQ, why not keep it in the
> core code ? TE (tearing enable?) should be available on MX8M too.

So far the discussion (since from initial versions) with Marek
Szyprowski, seems to be available in Exynos. So, I keep it separate
from the DSIM core.

Jagan.
