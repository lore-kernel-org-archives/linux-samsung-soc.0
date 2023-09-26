Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A17E7E639
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Sep 2023 14:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbjIZOCY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Sep 2023 10:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbjIZOCY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 10:02:24 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC3DFC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Sep 2023 07:02:16 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50307759b65so14530974e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Sep 2023 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695736934; x=1696341734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=;
        b=QlTIuPGJUwV+exApiZ4B2+QkGTPuWsRTgzqym1nUxd4dLovvz+OWg4TYKU1QBHAfBD
         TNmGVQHqibsyiekSR8WqmG3dg0e5qw34miSQFJx1uB5PgSm76iZcmZOZ/XbKpVqi4/oS
         KCAem1sYeHEAMqtEWQ8fnvDWF5THBJwNl2Dmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695736934; x=1696341734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=;
        b=aFN6q+Mip4bQp8ng5PPt4E3bdJOdugQhYcsU6HhiERjhnAx/X7R3McBiDJIRzNDErt
         +iqFNVqcgst8CY/HoXQ+Yk/aS+FnKucOCi6tzJm9wafqMuQN1FE0ltf2wEKuG0clbaK0
         CIw/iu6O59Lyi954/M68q4srGJBDmNV3dASQzIe5+kIRtsTQpJ4HaG/NDmy5Sfs33WeU
         BB1i28ZlYmyM5jCzqgKPo9dhSt2p4DVtb4dYL2epc6Omjeg29zTtUD0I47hxsLAYJqmY
         /e5LoDzWOhrsef4RhbqOIuxpqr1ZLKmqjMhQ+3U5ZLrdw/f2szS9acM1fcwW+Ro4jE7T
         U0Yg==
X-Gm-Message-State: AOJu0Yz7lDhWsCoMlmd0rCLt5UJ5pAIlMh9Jh+5fmCKjZHMnr+/F3vpr
        BtMm/hFCfC+dXZSeVyKnLvqjN4zPm4EMtoSDJ3BGseUG
X-Google-Smtp-Source: AGHT+IEy/nqR4nWVHqe44YWODOOtfLjCWtPLWYTWN6jio6m04gfO5i65mdSEof4ooSoJwMAgN0BDwA==
X-Received: by 2002:a05:6512:230e:b0:4fd:d08c:fa3e with SMTP id o14-20020a056512230e00b004fdd08cfa3emr10597069lfu.42.1695736933747;
        Tue, 26 Sep 2023 07:02:13 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b004fdd6b72bfdsm2197293lfn.117.2023.09.26.07.02.12
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 07:02:13 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50348c54439so4762e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Sep 2023 07:02:12 -0700 (PDT)
X-Received: by 2002:ac2:548e:0:b0:501:a2b4:8ff5 with SMTP id
 t14-20020ac2548e000000b00501a2b48ff5mr54282lfk.7.1695736932511; Tue, 26 Sep
 2023 07:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
In-Reply-To: <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 Sep 2023 07:01:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
Message-ID: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
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
        quic_jesszhan@quicinc.com, sam@ravnborg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > panel-simple") I moved a pile of panels out of panel-simple driver
> > into the newly created panel-edp driver. One of those panels, however,
> > shouldn't have been moved.
> >
> > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
> > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > panel is hooked up with LVDS. Furthermore, searching for datasheets I
> > found one that makes it clear that this panel is LVDS.
> >
> > As far as I can tell, I got confused because in commit 88d3457ceb82
> > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> > downstream ChromeOS trees, it seems like some Mediatek boards are
> > using a panel that they call "auo,b116xw03" that's an eDP panel. The
> > best I can guess is that they actually have a different panel that has
> > similar timing. If so then the proper panel should be used or they
> > should switch to the generic "edp-panel" compatible.
> >
> > When moving this back to panel-edp, I wasn't sure what to use for
> > .bus_flags and .bus_format and whether to add the extra "enable" delay
> > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > backlight when power on"). I've added formats/flags/delays based on my
> > (inexpert) analysis of the datasheet. These are untested.
> >
> > NOTE: if/when this is backported to stable, we might run into some
> > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > jacuzzi: Move panel under aux-bus") this panel was used by
> > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > know what to suggest for that other than someone making up a bogus
> > panel for jacuzzi that's just for the stable channel.
> >
> > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when=
 power on")
> > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simp=
le")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I haven't had a snow or peach-pit hooked up for debugging / testing
> > for years. I presume that they must be broken and hope that this fixes
> > them.
>
> We could avoid backport breakages by avoiding to backport this to any ker=
nel
> that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi: M=
ove
> panel under aux-bus")... because creating a dummy panel to get two wrongs
> right is definitely not ok.

Sure, except that leaves us with ... a breakage. :-P

Although I haven't tested it, I have a hard time believing that
exynos5250-snow and exynos5420-peach-pit will work properly with the
panel defined as an eDP panel. That means that they will be broken. If
someone cared to get those fixed in a stable backport then we'd be
stuck deciding who to break. If you have any brilliant ideas then I'm
all ears.

...then again, I presume this has been broken since commit
88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
things still limp along and sorta work even though the panel is
defined incorrectly?

-Doug
