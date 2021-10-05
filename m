Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9D9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 21:43:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D39261163
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 21:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhJEVpg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 17:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhJEVpf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 17:45:35 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D409C06174E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 14:43:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so3021210pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 14:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KueyQP1qhZFXjcASjngiU44PCPT1m0q8kUWaGeTu76Y=;
        b=wvHYe1hON2UBjCvCrhb7WUdeFjV8+LdwRxK5rw+KpAZ3fRx2qqaune3ittmGEf2MeU
         JiWAmZ2fftTiR+I8pxszim004hsd0Q13HwxPxDIlHK0i9etQKd1XZljax00sUzDj0b5d
         Ny1Z3nxHB+JiiyN+WyPrHcAklsF0p27YijqpVPg/N3WJG5XXlS8zo71dqUcrYZxmqNge
         NLeBN7SsyrAz7/PO78W+0uuqgHrgtkxW7ZggVbtdvqD25jkEhHYXKuf3qCJxRo1JpycO
         7x/JVnnjWzhW1k6dZfnBYTiI7VFIq3eyJALAR8kGCDfbtrPGEadiLbxVChY5loDXQaJJ
         r5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KueyQP1qhZFXjcASjngiU44PCPT1m0q8kUWaGeTu76Y=;
        b=YKaKGH9raOTET36vuoqdFlDUZwXEeQAWRBOmtgti19cDB4Ly56l9Mdajs+2AO7Otus
         EC9n3LbtWJQmRFp5uYWrIR8vbfHtIaaKmSctNuabnSl8jczUfimLDuQ/nvePwbgOXfmF
         /dLCv2wWklMABjOfUlsyE0hegIfWAnqbNaQ7iC+3YfGZMTnhaPRXLKPORPgbPaOAda90
         H8RZRd2ZsbJOkIQ9KT01B12nokhC/wMhcmuMWQyYd4167MyUyDEl7SYfVQ7HPP4PdAGE
         DQTaSpQtENQTKpWzHb+Hb9w3I0TvsW+MT5yDY9t7Two5GUJWCrTNarLbrP+0x4yimx0p
         6EtQ==
X-Gm-Message-State: AOAM5332CL/pb9F1Y9hjW+mgQ07BvXJVx9454ll7e9tWGN4bcLufMZCL
        ujbw6hjVsfJpuDFnqCNv8OYxJfvqYHgmDUPKrQVwcw==
X-Google-Smtp-Source: ABdhPJz5msu3tpgzjyQlXtcG3TaMTV8djnu63L0f25Gd4yaLGKWeWwPfwN1wloTy8zkkyk9KCPXOpiNDEEm+EwuDXTs=
X-Received: by 2002:a17:902:d903:b0:13e:d890:e4c4 with SMTP id
 c3-20020a170902d90300b0013ed890e4c4mr7512780plz.12.1633470223694; Tue, 05 Oct
 2021 14:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org> <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
In-Reply-To: <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 5 Oct 2021 14:43:32 -0700
Message-ID: <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
        devicetree <devicetree@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Sam,
>
> On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Jagan,
> >
> > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > This series supports common bridge support for Samsung MIPI DSIM
> > > which is used in Exynos and i.MX8MM SoC's.
> > >
> > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > >
> > > Right now bridge offers two sets of implementations.
> > >
> > > A. With component_ops and exynos specific code exclusively for
> > >    exynos dsi drivers and it's legacy bindings.
> > >
> > > B. Without componenet_ops for newly implemented bridges and its
> > >    users like i.MX8MM.
> > >
> > > The future plan is to fix the implementation A) by dropping
> > > component_ops and fixing exynos specific code in order to make
> > > the bridge more mature to use and the same is mentioned in
> > > drivers TODO.
> > >
> > > Patch 0001 - 0006: Bridge conversion
> > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > >
> > > Tested in Engicam i.Core MX8M Mini SoM.
> > >
> > > Anyone interest, please have a look on this repo
> > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > >
> > > Would appreciate anyone from the exynos team to test it on
> > > the exynos platform?
> > >
> > > Any inputs?
> >
> > I really like where you are headign with this!
> > No testing - sorry. But I will try to provide a bit of feedback on the
> > individual patches.
> >
> > I hope you find a way to move forward with this.
>
> Thanks for the response.
>
> We have found some issues with Bridge conversion on existing exynos
> drivers. The component based DSI drivers(like exynos) are difficult to
> attach if it involves kms hotplug. kms hotplug would require drm
> pointer and that pointer would only available after the bind call
> finishes. But the bridge attach in bind call will defer till it find
> the attached bridge.
>
> Right now I'm trying to find the proper way to attach the bridges for
> component based DSI drivers which involves kms hot-plug.
>
> If you have any ideas on this, please let me know.
>

Jagan,

How is your progress on this series? Looking at your repo it looks
like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
branch but you've got a lot of things there that are likely not
related to this series?

Best regards,

Tim
