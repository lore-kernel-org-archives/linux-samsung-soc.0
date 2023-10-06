Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79A6E81DFD
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 13:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbjJFNvN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 09:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjJFNvM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 09:51:12 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F5EA6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 06:51:10 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a6190af24aso387713966b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696600267; x=1697205067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59BqFGPIq+MlLg0nO/rZFvmB+hLKOqd3eB7b4cqnV5I=;
        b=ncXYf8qn0SHY583VUsRC36Np2Xpqp1KC8KQty6AGmjOH7YWAb/ISOxcQWvgr56OF6j
         N68FVvkbm4LxFDwvzBt2fuK3ZFU1BMmp/M7wyPkeYwg366dDBBH27iZ+Jyig+ws/Kdj0
         /WITZxorDhR4hHfRcBTPOp6i8OInIqXpg3fgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696600267; x=1697205067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59BqFGPIq+MlLg0nO/rZFvmB+hLKOqd3eB7b4cqnV5I=;
        b=tMGMOnOUvMoeYsOVeujQGop9o3+F5aH7mzOtig0Kwn6zMVBR6u12b33yd8CRxWYLXp
         hXNxk37t/82yw9rDowjFGo6/Iz79ZkxkNrW9VfKLpIbw7wBfFB6fXqnom738jhNwvtZC
         DSxN+6SdhiyJQqQgXzxdu7g1ICoAkSu/9ZNZ7To1mwL3w5d5kme1Ef5EERNgiPX60cF1
         /IBalaePmEe8cebEv5V9mpEBw4umNy4iWMnZ3LyroFKSIoMoOBt+TiKFrTIrBnQ9WsK2
         uuXF3KAd6At+mvfnoRaki/gokIpA3W2QDZA9wFkcC9gyk0ty7wkxRQwCV9PBOTcZPB3q
         SEuw==
X-Gm-Message-State: AOJu0Yyc+MzcYEiXkDht8LDC7fYX668Ec6ALhqN2q5e4UG5mBsGpa5JH
        BEoL3h0c9ZzfHSIIRIxdRAzZN5Mwblr37GBnjBOQQHgA
X-Google-Smtp-Source: AGHT+IEGSeIPk6Rk4l1jicrQs2Lfsj2cwx33p63Adc7kB2UV4B8e00iKJ3rommznK3fqVtcJVCsPbA==
X-Received: by 2002:a17:906:3086:b0:9b2:765b:273b with SMTP id 6-20020a170906308600b009b2765b273bmr8151430ejv.70.1696600266906;
        Fri, 06 Oct 2023 06:51:06 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id ot21-20020a170906ccd500b0099df2ddfc37sm2914928ejb.165.2023.10.06.06.51.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 06:51:06 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so10898a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 06:51:05 -0700 (PDT)
X-Received: by 2002:a50:8756:0:b0:52f:5697:8dec with SMTP id
 22-20020a508756000000b0052f56978decmr206638edv.4.1696600265520; Fri, 06 Oct
 2023 06:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <CGME20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc@eucas1p1.samsung.com>
 <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
 <fb9cd62b-6637-7bcc-e23d-37f3806f8460@samsung.com> <CAAQKjZNn4RTJ-SHHEugcQoS2U9fzNTOGtUpSLLM0w1V6Pb0amw@mail.gmail.com>
In-Reply-To: <CAAQKjZNn4RTJ-SHHEugcQoS2U9fzNTOGtUpSLLM0w1V6Pb0amw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 6 Oct 2023 06:50:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2JSHsrTfdxP4=-nU4GGZB999iAb+NU3en-4o3-rLmYQ@mail.gmail.com>
Message-ID: <CAD=FV=V2JSHsrTfdxP4=-nU4GGZB999iAb+NU3en-4o3-rLmYQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 09/12] drm/exynos: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To:     Inki Dae <daeinki@gmail.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Thu, Oct 5, 2023 at 7:20=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:
>
> Thanks for testing. :)
>
> Acked-by : Inki Dae <inki.dae@samsung.com>

Inki: does that mean you'd like this to go through drm-misc? I'm happy
to do that, but there are no dependencies here so this could easily go
through your tree.


> 2023=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:00,=
 Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> >
> > On 21.09.2023 21:26, Douglas Anderson wrote:
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown tim=
e
> > > and at driver unbind time. Among other things, this means that if a
> > > panel is in use that it won't be cleanly powered off at system
> > > shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart and at driver remove (or unbind) time comes
> > > straight out of the kernel doc "driver instance overview" in
> > > drm_drv.c.
> > >
> > > A few notes about this fix:
> > > - When adding drm_atomic_helper_shutdown() to the unbind path, I adde=
d
> > >    it after drm_kms_helper_poll_fini() since that's when other driver=
s
> > >    seemed to have it.
> > > - Technically with a previous patch, ("drm/atomic-helper:
> > >    drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> > >    actually need to check to see if our "drm" pointer is NULL before
> > >    calling drm_atomic_helper_shutdown(). We'll leave the "if" test in=
,
> > >    though, so that this patch can land without any dependencies. It
> > >    could potentially be removed later.
> > > - This patch also makes sure to set the drvdata to NULL in the case o=
f
> > >    bind errors to make sure that shutdown can't access freed data.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Seems to be working fine on all my test Exynos-based boards with displa=
y.
> >
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > > ---
> > > This commit is only compile-time tested.
> > >
> > > (no changes since v1)
> > >
> > >   drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> > > index 8399256cb5c9..5380fb6c55ae 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > @@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
> > >       drm_mode_config_cleanup(drm);
> > >       exynos_drm_cleanup_dma(drm);
> > >       kfree(private);
> > > +     dev_set_drvdata(dev, NULL);
> > >   err_free_drm:
> > >       drm_dev_put(drm);
> > >
> > > @@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *dev)
> > >       drm_dev_unregister(drm);
> > >
> > >       drm_kms_helper_poll_fini(drm);
> > > +     drm_atomic_helper_shutdown(drm);
> > >
> > >       component_unbind_all(drm->dev, drm);
> > >       drm_mode_config_cleanup(drm);
> > > @@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct pla=
tform_device *pdev)
> > >       return 0;
> > >   }
> > >
> > > +static void exynos_drm_platform_shutdown(struct platform_device *pde=
v)
> > > +{
> > > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > > +
> > > +     if (drm)
> > > +             drm_atomic_helper_shutdown(drm);
> > > +}
> > > +
> > >   static struct platform_driver exynos_drm_platform_driver =3D {
> > >       .probe  =3D exynos_drm_platform_probe,
> > >       .remove =3D exynos_drm_platform_remove,
> > > +     .shutdown =3D exynos_drm_platform_shutdown,
> > >       .driver =3D {
> > >               .name   =3D "exynos-drm",
> > >               .pm     =3D &exynos_drm_pm_ops,
> >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
