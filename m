Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7988DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Dec 2021 17:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhLIRND (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238921AbhLIRNB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 12:13:01 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE96C0617A2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Dec 2021 09:09:28 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id h24so4933572pjq.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Dec 2021 09:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SVQ+YMlt28Ir8xyFyWE5Df0gZJmNCYigQmtRvCGp//o=;
        b=X11M2TlDgjJ6Jnz85pZfgXoUvRxyk1Ep1uRScdCq8JZU3KIc8cO5QEBB/cAjCTfQc1
         swVoiOjEgYcQM3REh+hW80fuK6KE+lXnItAif+OK22UB0KfXph/sZ/Y/dkDPMNf1HmpR
         B31RZ2iWJuzDd3YfQRhYWY/j2Vi92o3+q374Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SVQ+YMlt28Ir8xyFyWE5Df0gZJmNCYigQmtRvCGp//o=;
        b=NgQyWmECSeV+VRrTsgViyEb8qZuVZ3DN075w5+sWn1PpsFyYe3m3374vf5fgbgXHzQ
         79tTUAZTlQF4xvuUndKggx7Ukx8SW1R6V0mgd02Lke1FnI9tZgZIvxq1UM3M8qTAQstk
         ca0hRyM8KwtBFlY5UWYP3SOun+0Qn4a56KoVOSI7HVyX55PY94F0Mcb8xM1tA79uNiur
         +rfhd1/ywydJ06xrYJc7RRd9r9BlgP3kXhQHtyQf14UE/TI9xGMxH6UzVtaZOblaWL/m
         z3aqaNNbT3loG/kw2WyrkDudybHLiPR2jsexHnoRUXjP4xcpupfOwVBw5TOhD42c8Omv
         QXCg==
X-Gm-Message-State: AOAM5307k4bJMIsC/Ro6ZOEtdsn2IciHALhx4WeYYezrLgPXtSU5fId0
        X6Tqq/zRalaUyMyyWowTX4wLeDXR+A23Lto2LEriGA==
X-Google-Smtp-Source: ABdhPJyCX8wQ+HUvA4s6g4Ya2TOcMuKHFO5FqSEOA83hPmJ1hZu9RpPCK5Uynse9z8q6es/uaeEeJTvXzf2twhi5B5E=
X-Received: by 2002:a17:90b:3758:: with SMTP id ne24mr17081019pjb.59.1639069767405;
 Thu, 09 Dec 2021 09:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org> <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
 <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
 <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com> <CAJ+vNU2pQCHqnyNJnz_rhczGRwcU=9XDFG1ix_V=Sc-1oWvhjA@mail.gmail.com>
In-Reply-To: <CAJ+vNU2pQCHqnyNJnz_rhczGRwcU=9XDFG1ix_V=Sc-1oWvhjA@mail.gmail.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Thu, 9 Dec 2021 18:09:15 +0100
Message-ID: <CAOf5uw=Cts+V+amSrTzVyRyFZA=eKSVtRPtXae40-4M0bu6pwg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Tim

On Thu, Dec 9, 2021 at 5:40 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Thu, Dec 9, 2021 at 12:36 AM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Hi Tim
> >
> > On Tue, Oct 5, 2021 at 11:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > >
> > > On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Hi Sam,
> > > >
> > > > On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > > >
> > > > > Hi Jagan,
> > > > >
> > > > > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > > > > This series supports common bridge support for Samsung MIPI DSIM
> > > > > > which is used in Exynos and i.MX8MM SoC's.
> > > > > >
> > > > > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > > > >
> > > > > > Right now bridge offers two sets of implementations.
> > > > > >
> > > > > > A. With component_ops and exynos specific code exclusively for
> > > > > >    exynos dsi drivers and it's legacy bindings.
> > > > > >
> > > > > > B. Without componenet_ops for newly implemented bridges and its
> > > > > >    users like i.MX8MM.
> > > > > >
> > > > > > The future plan is to fix the implementation A) by dropping
> > > > > > component_ops and fixing exynos specific code in order to make
> > > > > > the bridge more mature to use and the same is mentioned in
> > > > > > drivers TODO.
> > > > > >
> > > > > > Patch 0001 - 0006: Bridge conversion
> > > > > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > > > > >
> > > > > > Tested in Engicam i.Core MX8M Mini SoM.
> > > > > >
> > > > > > Anyone interest, please have a look on this repo
> > > > > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > > > > >
> > > > > > Would appreciate anyone from the exynos team to test it on
> > > > > > the exynos platform?
> > > > > >
> > > > > > Any inputs?
> > > > >
> > > > > I really like where you are headign with this!
> > > > > No testing - sorry. But I will try to provide a bit of feedback on the
> > > > > individual patches.
> > > > >
> > > > > I hope you find a way to move forward with this.
> > > >
> > > > Thanks for the response.
> > > >
> > > > We have found some issues with Bridge conversion on existing exynos
> > > > drivers. The component based DSI drivers(like exynos) are difficult to
> > > > attach if it involves kms hotplug. kms hotplug would require drm
> > > > pointer and that pointer would only available after the bind call
> > > > finishes. But the bridge attach in bind call will defer till it find
> > > > the attached bridge.
> > > >
> > > > Right now I'm trying to find the proper way to attach the bridges for
> > > > component based DSI drivers which involves kms hot-plug.
> > > >
> > > > If you have any ideas on this, please let me know.
> > > >
> > >
> > > Jagan,
> > >
> > > How is your progress on this series? Looking at your repo it looks
> > > like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
> > > branch but you've got a lot of things there that are likely not
> > > related to this series?
> >
> > I have a bit of work on those patches and tested on imx8mn. Basically:
> >
> > - add the dsi timing calculation
> > - change few difference with samsung bridge
> > - fix crashes of my dsi panels
> > - compare with NXP driver the final results
> >
> > I found that I have one problem that gives me some instability. In the
> > NXP original driver the panel needs to be
> > enabled in bridge_enable before out the standby. If I understand
> > correctly, our standby should be done after.
> > I would like to have some feedback and help and testing on other
> > boards/devices and some suggestions on how to handle
> > some of the differences. Another big problem is etnavi that is not stable
> >
>
> Michael,
>
> Where can I find your patches?
>

I will push on some tree and share

> What do you mean by etnaviv not being stable?
>
> I did some limited testing with etnaviv on imx8mm with 5.15 + dsi



> patches on an Ubuntu focal root filesystem by:
> apt update
> apt install gnome-session gnome-terminal
> ^^^ 2D hardware acceleration appears to be working (dragging opaque
> windows around)
> apt install mesa-utils glmark2
> glxgears
> ^^^ ~160fps on IMX8MM
> glmark2
> ^^^ score of 39 on IMX8MM
>
> I haven't seen any updates from Jagan since Nov 24
> (https://www.spinics.net/lists/dri-devel/msg324059.html) and am not
> sure if he's been able to work through drm/exynos issues that have
> been blocking his progress.

I plan to push on github

[17:07:42.315] Sending ready to systemd
[  214.052085] etnaviv-gpu 38000000.gpu: recover hung GPU!
[  214.595998] etnaviv-gpu 38000000.gpu: recover hung GPU!

** (maynard:386): WARNING **: 17:07:43.874: failed to setup mixer: Success
[17:07:44.175] Added surface 0xaaab02630440, app_id (null) to pending list
[17:07:44.176] Added surface 0xaaab026172b0, app_id (null) to pending list
** Message: 17:07:44.289: New advertisement app id maynard
** Message: 17:07:44.290: New advertisement app id maynard
[17:07:45.171] (background) position view 0xaaab0261f860, x 0, y 0, on
output DSI-1
[17:07:45.171] (panel) geom.width 100, geom.height 480, geom.x 0, geom.y 0
[17:07:45.171] (panel) edge 2 position view 0xaaab02634510, x 0, y 0
[17:07:45.172] panel type 2 inited on output DSI-1
[17:07:45.172] Usable area: 380x480+100,0
[  216.932080] etnaviv-gpu 38000000.gpu: recover hung GPU!
[  217.476015] etnaviv-gpu 38000000.gpu: recover hung GPU!
[  218.020157] etnaviv-gpu 38000000.gpu: recover hung GPU!

This is my problem on imx8mn

Michael

Michael
> Best regards,
>
> Tim

--
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
