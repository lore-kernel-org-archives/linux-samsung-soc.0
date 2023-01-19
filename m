Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6030AC46467
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Jan 2023 18:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjASST0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Jan 2023 13:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjASSTZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 13:19:25 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88F55B99
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 10:19:24 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id p141so914240ybg.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9+JdR4fUqo1UuhlAuqmE6I1oSW5mw2XdC5wEc6AgMY=;
        b=XULtkS2gBxQ9Mkcvtm5Zbfk9ZQ4RO2LmsuCBOU78n+Z7HI20SlNkUbyAJgaMfDDrao
         DAY3ypjuryF5UJ88hL6ILpBxk92Fg0G2f3KXLHXYPCBmMFVSkrX6513tMv6p1MxDWik0
         D58fC5zSz/rcxh6vP9t3caYi38WtTRpTFQPzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9+JdR4fUqo1UuhlAuqmE6I1oSW5mw2XdC5wEc6AgMY=;
        b=s2KKvY9Q0GKjCVB65MFg6cV98jc1rxO8liGmUekkMPef0kaMyPGDpXBSYo6lAaOXh7
         TSAclOAxwF6FElDiIvJRa23gUXcXX1rPb0I0nYIh7/rWajQqa5PvvGdXmWVp1rsuU0c2
         TEVv3rPPPQ1I/Pvbarc9P/106SrfDky1O4OCK4fGZlHweLRNYP//15ie/L3xBolKaKYS
         T9wUAA7y8UOLMvDkfjZP0fVz2Evj2Z3WViggptTNzlK7K/fDNza5J26MNveni3PqjDbP
         T1iJxDu67bSq76Uud9rHiUDNvUlfOG1wilGX9zF8+AF9ttBGIxEzdTuks4PkhNHe5u4Z
         JG5g==
X-Gm-Message-State: AFqh2koof27q34cletJgABfTpO5KqD5VF6T5nenA4K2htuTTYWpIfjtf
        PGJiErmnYSsJmZ7Q+cm4NjIzUUMKmwZU78qi5dXVlw==
X-Google-Smtp-Source: AMrXdXtS0SDJC8ptil9wDc1DSnYYbOVzcGK4Sze1A+MmUjUukQPsocY72O0iss8IU+YrBgTei5f7g03dv4iK9eQ0hWI=
X-Received: by 2002:a25:b6c2:0:b0:6fc:c36a:1d06 with SMTP id
 f2-20020a25b6c2000000b006fcc36a1d06mr1050649ybm.462.1674152363966; Thu, 19
 Jan 2023 10:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <CGME20230106175722epcas1p152dacb511ee08d563c51bb8a8deb0bfe@epcas1p1.samsung.com>
 <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com> <000001d9262d$42bc49c0$c834dd40$@samsung.com>
In-Reply-To: <000001d9262d$42bc49c0$c834dd40$@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 19 Jan 2023 23:49:12 +0530
Message-ID: <CAMty3ZD=RDY_NH6rt+ibY_4drEenmHhxKpn=BRD551jRoK=MxQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
To:     =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, thierry.reding@gmail.com,
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki Dae,

On Thu, Jan 12, 2023 at 7:56 AM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen Platform =
Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Jagan Teki,
>
> Sorry for late.
>
> > -----Original Message-----
> > From: Jagan Teki <jagan@amarulasolutions.com>
> > Sent: Saturday, January 7, 2023 2:56 AM
> > To: Marek Szyprowski <m.szyprowski@samsung.com>; Inki Dae
> > <inki.dae@samsung.com>; Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmi=
n Park
> > <kyungmin.park@samsung.com>; Neil Armstrong <narmstrong@linaro.org>; Ro=
bert
> > Foss <robert.foss@linaro.org>; Andrzej Hajda <andrzej.hajda@intel.com>;=
 Sam
> > Ravnborg <sam@ravnborg.org>
> > Cc: Marek Vasut <marex@denx.de>; linux-samsung-soc@vger.kernel.org; dri=
-
> > devel@lists.freedesktop.org; linux-amarula <linux-
> > amarula@amarulasolutions.com>
> > Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
> >
> > On Mon, Dec 12, 2022 at 11:59 PM Jagan Teki <jagan@amarulasolutions.com=
> wrote:
> > >
> > > Split the Exynos DSI bridge chain update patches from Samsung DSIM
> > > bridge driver for easy to apply.
> > >
> > > Changes for v11:
> > > - enable bridge.pre_enable_prev_first
> > > Changes for v10:
> > > - collect Marek.V Review tag
> >
> > Any update on this?
> >
>
> Added Thierry Reding who is a maintainer of DRM panel drivers.
>
> I will pick this patch series - including panel and bride patches - up.
>
> Thierry and Andrzej, please let me know if any problem.

Any further update on this?

Thanks,
Jagan.
