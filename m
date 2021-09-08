Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91732C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Sep 2021 22:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EB8160F5E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Sep 2021 22:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhIHWhh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Sep 2021 18:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235691AbhIHWhg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Sep 2021 18:37:36 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6BDC061575
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Sep 2021 15:36:28 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id i13so4015803ilm.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Sep 2021 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/dueucM0XzOy1jPT/PQdcqnijwVro2s2Bw0YSR2geg=;
        b=LkipFzU3cjINN/t5kFqm8if/dRpeVPe5N3h3SK1jKCbuJYBNkdOKO1Q1BlRDgpJwkF
         uecfJZnqLEqB4ptN4xZ93fVt8PEUJA6HkO2/CTlBx2dJELQY0APPZr34AZSYfiKYYUzh
         uH+J7IHDcQ+Gf9T4yeyACeE7nz4Tz7it+F8Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/dueucM0XzOy1jPT/PQdcqnijwVro2s2Bw0YSR2geg=;
        b=vFTvdyvO9UHM+vFk5teAXwvcuKyH8YjnJwmSchsF5UA8kAocjhiVnHht0GWieXDOQq
         a3t68Wzk4Ul3TAah62UPJBLYJR0bjRXVe5E+Ae6nZ/8VAb+ZNVxbiYCJ6dGKCL5/D59B
         dP/GVvSXL25QiM+kKJeGJY+hSLI4kbPYc6QJAsHut6CPEXoCcxcmjeTOvg2ioxFbKmYP
         NjI8qluzSNRUxXB8/AoHK2gdEZ5mGOdeu08rzQlc4u1Z6vUHE9n/9sJYXyfAbUzFoasU
         7goIXnX4AbS6FQoRAODWvuxONia1cQmOMelrs57eJSJvE1XLeDfC+i2y+0GT3r/m0H7I
         bbbQ==
X-Gm-Message-State: AOAM533nbBvjVQjr5TtOVAd/dacBXb5ZVZjyVoCxqPTM8PXWG4KpBjdC
        s/dqCWcT/icBcRSQN65I+E5dLdvH/VkboQ==
X-Google-Smtp-Source: ABdhPJy4tFtUxtyOd6oC3O+6+bf0jxm9pqQuXG9J/j9bIjDKvlywHwbki1sSs9lno2F7+syaM2XZNw==
X-Received: by 2002:a05:6e02:1c27:: with SMTP id m7mr398853ilh.190.1631140587437;
        Wed, 08 Sep 2021 15:36:27 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id a14sm231194iol.24.2021.09.08.15.36.25
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 15:36:26 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id b10so5367498ioq.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Sep 2021 15:36:25 -0700 (PDT)
X-Received: by 2002:a5d:8458:: with SMTP id w24mr489939ior.168.1631140574432;
 Wed, 08 Sep 2021 15:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
 <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
 <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com> <163070152582.405991.9480635890491684680@swboyd.mtv.corp.google.com>
In-Reply-To: <163070152582.405991.9480635890491684680@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Sep 2021 15:36:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzPVda==+hkJ8ZJNXz3sT=V+8y4gbsbUik4k3Om_cGvQ@mail.gmail.com>
Message-ID: <CAD=FV=XzPVda==+hkJ8ZJNXz3sT=V+8y4gbsbUik4k3Om_cGvQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        DTML <devicetree@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Core ntin Labbe <clabbe@baylibre.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Fabio Estevam <festevam@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Otavio Salvador <otavio@ossystems.com.br>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Razvan Stefanescu <razvan.stefanescu@microchip.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev,
        =?UTF-8?Q?open_list=3ATEGRA_ARCHITECTURE_SUPPORT_=3Clinux=2D_tegra=40vger=2Ekern?=
         =?UTF-8?Q?el=2Eorg=3E=2C_=C5=81ukasz_Stelmach?= 
        <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Fri, Sep 3, 2021 at 1:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Doug Anderson (2021-09-01 16:10:15)
> > Hi,
> >
> > On Wed, Sep 1, 2021 at 2:12 PM Olof Johansson <olof@lixom.net> wrote:
> > >
> > > On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > In the patch ("drm/panel-simple-edp: Split eDP panels out of
> > > > panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> > > > give everyone who had the old driver enabled the new driver too. If
> > > > folks want to opt-out of one or the other they always can later.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Isn't this a case where the new option should just have had the old
> > > option as the default value to avoid this kind of churn and possibly
> > > broken platforms?
> >
> > I'm happy to go either way. I guess I didn't do that originally
> > because logically there's not any reason to link the two drivers going
> > forward. Said another way, someone enabling the "simple panel" driver
> > for non-eDP panels wouldn't expect that the "simple panel" driver for
> > DP panels would also get enabled by default. They really have nothing
> > to do with one another. Enabling by default for something like this
> > also seems like it would lead to bloat. I could have sworn that
> > periodically people get yelled at for marking drivers on by default
> > when it doesn't make sense.
> >
> > ...that being said, I'm happy to change the default as you suggest.
> > Just let me know.
>
> Having the default will help olddefconfig users seamlessly migrate to
> the new Kconfig. Sadly they don't notice that they should probably
> disable the previous Kconfig symbol, but oh well. At least with the
> default they don't go on a hunt/bisect to figure out that some Kconfig
> needed to be enabled now that they're using a new kernel version.
>
> Maybe the default should have a TODO comment next to it indicating we
> should remove the default in a year or two.

OK, so I'm trying to figure out how to do this without just "kicking
the can" down the road. I guess your idea is that for the next year
this will be the default and that anyone who really wants
"CONFIG_DRM_PANEL_EDP" will "opt-in" to keep it by adding
"CONFIG_DRM_PANEL_EDP=y" to their config? ...and then after a year
passes we remove the default? ...but that won't work, will it? Since
"CONFIG_DRM_PANEL_EDP" will be the default for the next year then you
really can't add it to the "defconfig", at least if you ever
"normalize" it. The "defconfig" by definition has everything stripped
from it that's already the "default", so for the next year anyone who
tries to opt-in will get their preference stripped.

Hrm, so let me explain options as I see them. Maybe someone can point
out something that I missed. I'll assume that we'll change the config
option from CONFIG_DRM_PANEL_SIMPLE_EDP to CONFIG_DRM_PANEL_EDP
(remove the "SIMPLE" part).

==

Where we were before my series:

* One config "CONFIG_DRM_PANEL_SIMPLE" and it enables simple non-eDP
and eDP drivers.

==

Option 1: update everyone's configs (this patch)

* Keep old config "CONFIG_DRM_PANEL_SIMPLE" but it now only means
enable the panel-simple (non-eDP) driver.
* Anyone who wants eDP panels must opt-in to "CONFIG_DRM_PANEL_EDP"
* Update all configs in mainline; any out-of mainline configs must
figure this out themselves.

Pros:
* no long term baggage

Cons:
* patch upstream is a bit of "churn"
* anyone with downstream config will have to figure out what happened.

==

Option 2: kick the can down the road + accept cruft

* Keep old config "CONFIG_DRM_PANEL_SIMPLE" and it means enable the
panel-simple (non-eDP) driver.
* Anyone with "CONFIG_DRM_PANEL_SIMPLE" is opted in by default to
"CONFIG_DRM_PANEL_EDP"

AKA:
config DRM_PANEL_EDP
  default DRM_PANEL_SIMPLE

Pros:
* no config patches needed upstream at all and everything just works!

Cons:
* people are opted in to extra cruft by default and need to know to turn it off.
* unclear if we can change the default without the same problems.

==

Option 3: try to be clever

* Add _two_ new configs. CONFIG_DRM_PANEL_SIMPLE_V2 and CONFIG_DRM_PANEL_EDP.
* Old config "CONFIG_DRM_PANEL_SIMPLE" gets marked as "deprecated".
* Both new configs have "default CONFIG_DRM_PANEL_SIMPLE"

Now anyone old will magically get both the new config options by
default. Anyone looking at this in the future _won't_ set the
deprecated CONFIG_DRM_PANEL_SIMPLE but will instead choose if they
want either the eDP or "simple" driver.

Pros:
* No long term baggage.
* Everyone is transitioned automatically by default with no cruft patches.

Cons:
* I can't think of a better name than "CONFIG_DRM_PANEL_SIMPLE_V2" and
that name is ugly.

==

Option 4: shave a yak

When thinking about this I came up with a clever idea of stashing the
kernel version in a defconfig when it's generated. Then you could do
something like:

config DRM_PANEL_EDP
  default DRM_PANEL_SIMPLE if DEFCONFIG_GENERATED_AT <= 0x00050f00

That feels like a good idea to me but who knows what others would
think. In general I think this series already shaves enough yaks. This
isn't a new problem we're trying to solve so it seems like we should
pick one of the options above.

==

Unless I get an explicit NAK from someone like Olof or Arnd or I hear
that everyone loves Option #3 I'll probably just stick with the
existing approach since:

* Olof's wording didn't make it sound like a strong objection.

* From git history it looks as if config patches don't necessarily
land through the SoC tree and thus I'd by default follow the
suggestions of the DRM folks. Andrzej suggested going with the
existing approach as long as I changed the symbol names and re-ordered
the patches.


Please yell if anything above sounds wrong! I'll probably try to send
out a new version tomorrow or the next day, but I won't land it right
away to give people time to yell.


-Doug
