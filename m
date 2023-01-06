Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B67C3DA7A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Jan 2023 14:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjAFOmb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Jan 2023 09:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjAFOma (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2023 09:42:30 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A145E651
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jan 2023 06:42:27 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so5362902pjk.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jan 2023 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RccYbfVcssWI8JrbnkcP0iz0oYEwSN4A0FSBKTl5QUw=;
        b=XgO8YsS6101Qjh+VG5PC2dkE/6AfmrgOyOa8YZ67wya6AahFAFNmFLmQQCcKNDtX+U
         AHDXsu6W33dqhO/odm8vdbrELgLeL6Ho4GZiJ1SoNUerynSPufGKBg6mE6IFwzjhMKru
         y9cDxurHKhgMJVlDLI9A5GnoFrcGdWuH/Gem5IDTaIT/udlI9GEQW6oe4hi++q4nNI97
         a/o9AFgQPfVy1y96BGO4N3v9tnOwceH4Yh1j3hGwrYNcrWl4Jr46ad6ohM/hif4sj1Na
         4H1FUA3uq0OdGEKfIhLS29bwSeOEbMXcvterqgK7/aP0QHOn8EwW81L4xNO+BGm95xPs
         iBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RccYbfVcssWI8JrbnkcP0iz0oYEwSN4A0FSBKTl5QUw=;
        b=xFPU9/WlhDLWxgR/IfWYfDKOYBa3MvVVdf7FnAvTEW+hMRIS26yl5/wb6bM62yQ1ph
         cgHN69rn+a7bL6QbMMUDeBXt2/b1qXjYCHBHuYsqbZrsEYTs6glD9IzCEgZKy4UJYkFj
         slPAeL5eDSRbiWyz7U49BZA2VYORpJqT7P5B1GvuWquPEdCez2nopW2j9cYZrMx7POHo
         i9ZvN54iZmo3yt2lGpRE+RnLneistn/+5ViSvnExIwAXwxCDIHduaI1yZ+lDQbTVZas6
         upDzCnPDNw9bbMBNaSbxzkrnpCGNgXKLg6KTF8qmrY5Uxsd26xjQW39SeSPz/fJrfN6E
         61IQ==
X-Gm-Message-State: AFqh2kqFpdQTQFb0AlwER00tqCUaQ2ZW3/gh0RlvWmcx4ib0cheX0NKA
        ZlPJ0Ftf6qseObt2ImlgQGF5FxIhO2g49HDKvVg=
X-Google-Smtp-Source: AMrXdXtGC40H+GuM7hhnexrloMQ0F/5MohmVV5bpTfWwFpnf5yzM7NP4MroBenM7KLoGeQBq0Ds8FOeqRDDAaanC+6E=
X-Received: by 2002:a17:90a:6942:b0:226:228:3e44 with SMTP id
 j2-20020a17090a694200b0022602283e44mr2179725pjm.172.1673016147057; Fri, 06
 Jan 2023 06:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com> <CAHCN7xLyS8Jr38gNSyaRMEU3zYg04AhyC79owpTrHbbLf8cL5A@mail.gmail.com>
In-Reply-To: <CAHCN7xLyS8Jr38gNSyaRMEU3zYg04AhyC79owpTrHbbLf8cL5A@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 6 Jan 2023 11:42:14 -0300
Message-ID: <CAOMZO5ASNzpnosgNLQzwWbbGwOihWxCung0W9dZbdfyg-SPyPA@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Adam Ford <aford173@gmail.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 6, 2023 at 11:34 AM Adam Ford <aford173@gmail.com> wrote:

> I got it working on an LVDS display that I have, but I didn't get it
> working on the HDMI bridge.  Since we have a few tested-by people,
> it'd be nice to see this integrated so we can work on ading more
> functionality

Agreed. Hopefully, this series can be applied soon so we don't miss
another cycle.
