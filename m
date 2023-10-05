Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42043E92723
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 18:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjJESQ7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 14:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjJESQb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 14:16:31 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A63C90
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 11:16:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-533e7d127d4so2257638a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696529787; x=1697134587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eAmFswOZzw3jH3oWLXVAcDuqGgICG6iPkOHsm6WtUk=;
        b=ND07rxMkwPzxeylX8E9u66T7yv0HcdCo4+2HT1bF4fUuXk2qNMZuPhuRGq1kWu49im
         pAmhC1UiIBjCXSZEf5nLPl16EidmXggCh4KjqtT1OTmS66tim2ia3IejNbBs0g2rM+xT
         fZtBrBRd5e5HMoZuSZANq3/xBJvdvTzNswLcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529787; x=1697134587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eAmFswOZzw3jH3oWLXVAcDuqGgICG6iPkOHsm6WtUk=;
        b=hUi9KHeUClG3tE53bwCQMaeXb3uuQV6FrDV4m7yB0CKtbNAtxHIFY3txULvlmdRQ0+
         vpwhqIO51xim0LgeZaxcu4pOpz6K6yl3AhtdlyyUS5jYnH697S77/NlY0GgnD5lod4or
         YN2ZoghorIlsuavQhNIaarx0AGO1mTSP/O0xSlVfuSAiwZEWiDAnoUkIRNy7Bmqf6iX2
         mwFn9aGdmPiMppvLiboemAw3SCVD6szjA/YkxUWI5zH4+lewgPAeSnbAXgMtCbrwSu6Q
         BPxE502vQwfzusYfvZ++as2ke6NOBi2kR/G8xGwvFoquhn8kKgOxzBX+iGaAy3ZnSYN4
         3EBg==
X-Gm-Message-State: AOJu0YzU/Vwk0DCsczX27LBBYwZVnZiLSk+8hzLz6y2UH0fIufMe1hYD
        3PxQ9SNY8QIJabTCqKp5y4KhqkwO75koqW/vTwxHHsc3
X-Google-Smtp-Source: AGHT+IFIxNB8qeUHi2nKi9zVx0kX+Bp7BKkTx3bPDRvQ9Eztnbu3xCdipuBvZbki79fVxU5zLruORA==
X-Received: by 2002:a17:906:208:b0:9ae:2f33:4ad0 with SMTP id 8-20020a170906020800b009ae2f334ad0mr5067621ejd.71.1696529787507;
        Thu, 05 Oct 2023 11:16:27 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id ca9-20020a170906a3c900b009adc743340fsm1553055ejb.197.2023.10.05.11.16.27
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 11:16:27 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4063bfc6c03so14225e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 11:16:27 -0700 (PDT)
X-Received: by 2002:a1c:4b18:0:b0:405:320a:44f9 with SMTP id
 y24-20020a1c4b18000000b00405320a44f9mr82899wma.5.1696529473685; Thu, 05 Oct
 2023 11:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com> <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
In-Reply-To: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 Oct 2023 11:10:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
Message-ID: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to panel-simple
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>, airlied@gmail.com,
        daniel@ffwll.ch, jitao.shi@mediatek.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, sam@ravnborg.org,
        Anton Bambura <jenneron@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Sep 26, 2023 at 7:01=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > > panel-simple") I moved a pile of panels out of panel-simple driver
> > > into the newly created panel-edp driver. One of those panels, however=
,
> > > shouldn't have been moved.
> > >
> > > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
> > > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > > panel is hooked up with LVDS. Furthermore, searching for datasheets I
> > > found one that makes it clear that this panel is LVDS.
> > >
> > > As far as I can tell, I got confused because in commit 88d3457ceb82
> > > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> > > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> > > downstream ChromeOS trees, it seems like some Mediatek boards are
> > > using a panel that they call "auo,b116xw03" that's an eDP panel. The
> > > best I can guess is that they actually have a different panel that ha=
s
> > > similar timing. If so then the proper panel should be used or they
> > > should switch to the generic "edp-panel" compatible.
> > >
> > > When moving this back to panel-edp, I wasn't sure what to use for
> > > .bus_flags and .bus_format and whether to add the extra "enable" dela=
y
> > > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > > backlight when power on"). I've added formats/flags/delays based on m=
y
> > > (inexpert) analysis of the datasheet. These are untested.
> > >
> > > NOTE: if/when this is backported to stable, we might run into some
> > > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > > jacuzzi: Move panel under aux-bus") this panel was used by
> > > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > > know what to suggest for that other than someone making up a bogus
> > > panel for jacuzzi that's just for the stable channel.
> > >
> > > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight wh=
en power on")
> > > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-si=
mple")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > I haven't had a snow or peach-pit hooked up for debugging / testing
> > > for years. I presume that they must be broken and hope that this fixe=
s
> > > them.
> >
> > We could avoid backport breakages by avoiding to backport this to any k=
ernel
> > that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi:=
 Move
> > panel under aux-bus")... because creating a dummy panel to get two wron=
gs
> > right is definitely not ok.
>
> Sure, except that leaves us with ... a breakage. :-P
>
> Although I haven't tested it, I have a hard time believing that
> exynos5250-snow and exynos5420-peach-pit will work properly with the
> panel defined as an eDP panel. That means that they will be broken. If
> someone cared to get those fixed in a stable backport then we'd be
> stuck deciding who to break. If you have any brilliant ideas then I'm
> all ears.
>
> ...then again, I presume this has been broken since commit
> 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
> on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
> things still limp along and sorta work even though the panel is
> defined incorrectly?

I dug out a exynos5250-snow out of my pile and booted postmarket OS on
it, which was shockingly easy/pleasant (kudos to those involved!). I
found that it was booting a kernel based on 6.1.24. Digging into
sysfs, I found that indeed it appeared to be using the "panel-edp"
driver, so I guess it is limping along with the wrong driver and wrong
flags...

It wasn't totally clear for me how to build a new kernel and deploy it
for postmarket OS, so I wasn't able to confirm this change. I've CCed
the person listed on the postmarket OS wiki though to see if they have
any insight.

In any case, it sounds as if things are working well enough on older
OSes, so maybe we can just skip trying to do any stable backport on
this. It still seems like we should land it, though, since the current
state of the world seems pretty broken. Anyone willing to give a
Reviewed-by or Acked-by tag?

-Doug
