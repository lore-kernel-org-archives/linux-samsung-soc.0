Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6A8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Dec 2021 16:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhLIQoA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241166AbhLIQn6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 11:43:58 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DE2C0617A1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Dec 2021 08:40:24 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so5270397pjb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Dec 2021 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XjBC6XUZJtPnhjTwfnkF808Zuq6NSOID5LVmEgkaOSQ=;
        b=w7Km7X5aTXVv4afJepuvvxUzlxaeKJkB6sKRFHDAPKphveY5UYuehMBl5Zgkz0c48s
         YW0+gmxf9V2Rn4oBHSkEY+MkK/J2o8HT5yUcBuotgbi/x1Odki/kiCJhSyeB7riY6+MD
         cBfNgfvIHQD33UUdIa9M2zULndAZv97MPUEOdlV7TLd1uqfCgKd8ipQkXx91qxCkq2xg
         17Q20lXqHkjWN3telzgJhms20L7mwI+EZUmNZXX39+EIZPqVOcZ6WeWf+nI+oApi6cvV
         jcnrdiMnASvfcpGnePC4rZ3bsOYr82BR5kCL7XWML42AipHPxITYKGmEekVIaU2dYZBx
         9byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XjBC6XUZJtPnhjTwfnkF808Zuq6NSOID5LVmEgkaOSQ=;
        b=vzxpDrVV4reQ4u0ogDtbrFCAPDy+4dXG4Ms2fjlGLxjLDM6JiOJZXw7IHlMQGAeLPB
         h4GoFuWBeLqHFIn9rfV9MV2XjNKLJeFUmqIi7Yuq7+kUlySNsh/6IDdlr5ZSU0OQM1fv
         0Df3kroV3tyTHzx9ng3cjVpG8N3HMUf5heAjJ1AJSl5DPPkLmdizlQm+f0rbq/TN0crR
         9Qzmn9pyH2wTOCOnDckYdLOyadv8Y+SZh8u+E4LWMP8O+XUbChI5RX9rcEf33eUWui0K
         4hPEiXYgwRRX7sx0Ulem9D2TJiNW8fye/hp8HMy9h4vbVGBA9uy0ZAsiN6rltHLrYBof
         boPA==
X-Gm-Message-State: AOAM5315IQzKLUNSlvHZrp3KTSyHmsjx97tjGywHSpB+71zcWUsE/OyN
        EBLNtNARwkvJMrf238MY7AsPspkUM2uMuSMa6Xnn1w==
X-Google-Smtp-Source: ABdhPJzx3c4r0U+1q6LMafUGVo/WqdHyJSDJX1lRvhv0uEvpW1qCUNrk01ja1Jr5pkapoYydNfefkbMsZ9ornAF1028=
X-Received: by 2002:a17:90b:4b4c:: with SMTP id mi12mr16962368pjb.66.1639068023870;
 Thu, 09 Dec 2021 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org> <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
 <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com> <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
In-Reply-To: <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 9 Dec 2021 08:40:12 -0800
Message-ID: <CAJ+vNU2pQCHqnyNJnz_rhczGRwcU=9XDFG1ix_V=Sc-1oWvhjA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To:     Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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

On Thu, Dec 9, 2021 at 12:36 AM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi Tim
>
> On Tue, Oct 5, 2021 at 11:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Hi Sam,
> > >
> > > On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > >
> > > > Hi Jagan,
> > > >
> > > > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > > > This series supports common bridge support for Samsung MIPI DSIM
> > > > > which is used in Exynos and i.MX8MM SoC's.
> > > > >
> > > > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > > >
> > > > > Right now bridge offers two sets of implementations.
> > > > >
> > > > > A. With component_ops and exynos specific code exclusively for
> > > > >    exynos dsi drivers and it's legacy bindings.
> > > > >
> > > > > B. Without componenet_ops for newly implemented bridges and its
> > > > >    users like i.MX8MM.
> > > > >
> > > > > The future plan is to fix the implementation A) by dropping
> > > > > component_ops and fixing exynos specific code in order to make
> > > > > the bridge more mature to use and the same is mentioned in
> > > > > drivers TODO.
> > > > >
> > > > > Patch 0001 - 0006: Bridge conversion
> > > > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > > > >
> > > > > Tested in Engicam i.Core MX8M Mini SoM.
> > > > >
> > > > > Anyone interest, please have a look on this repo
> > > > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > > > >
> > > > > Would appreciate anyone from the exynos team to test it on
> > > > > the exynos platform?
> > > > >
> > > > > Any inputs?
> > > >
> > > > I really like where you are headign with this!
> > > > No testing - sorry. But I will try to provide a bit of feedback on the
> > > > individual patches.
> > > >
> > > > I hope you find a way to move forward with this.
> > >
> > > Thanks for the response.
> > >
> > > We have found some issues with Bridge conversion on existing exynos
> > > drivers. The component based DSI drivers(like exynos) are difficult to
> > > attach if it involves kms hotplug. kms hotplug would require drm
> > > pointer and that pointer would only available after the bind call
> > > finishes. But the bridge attach in bind call will defer till it find
> > > the attached bridge.
> > >
> > > Right now I'm trying to find the proper way to attach the bridges for
> > > component based DSI drivers which involves kms hot-plug.
> > >
> > > If you have any ideas on this, please let me know.
> > >
> >
> > Jagan,
> >
> > How is your progress on this series? Looking at your repo it looks
> > like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
> > branch but you've got a lot of things there that are likely not
> > related to this series?
>
> I have a bit of work on those patches and tested on imx8mn. Basically:
>
> - add the dsi timing calculation
> - change few difference with samsung bridge
> - fix crashes of my dsi panels
> - compare with NXP driver the final results
>
> I found that I have one problem that gives me some instability. In the
> NXP original driver the panel needs to be
> enabled in bridge_enable before out the standby. If I understand
> correctly, our standby should be done after.
> I would like to have some feedback and help and testing on other
> boards/devices and some suggestions on how to handle
> some of the differences. Another big problem is etnavi that is not stable
>

Michael,

Where can I find your patches?

What do you mean by etnaviv not being stable?

I did some limited testing with etnaviv on imx8mm with 5.15 + dsi
patches on an Ubuntu focal root filesystem by:
apt update
apt install gnome-session gnome-terminal
^^^ 2D hardware acceleration appears to be working (dragging opaque
windows around)
apt install mesa-utils glmark2
glxgears
^^^ ~160fps on IMX8MM
glmark2
^^^ score of 39 on IMX8MM

I haven't seen any updates from Jagan since Nov 24
(https://www.spinics.net/lists/dri-devel/msg324059.html) and am not
sure if he's been able to work through drm/exynos issues that have
been blocking his progress.

Best regards,

Tim
