Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C178C00140
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Aug 2022 11:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236633AbiHXLkb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Aug 2022 07:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236821AbiHXLkZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 07:40:25 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F426610F;
        Wed, 24 Aug 2022 04:40:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ca13so21700207ejb.9;
        Wed, 24 Aug 2022 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=pxKLfOME1R0KZZACiredgYsYKfw4h1/06Dg8Bmv9RjQ=;
        b=DBL6LzztEwGp8X1U8me4Py7MxcKtdBb9YWUi/PURCPdr8iaMAQDC8JC3zxz4qqE0/m
         bKiS9swMJ0I5nPY+WOf/aR2SgT5kiL8AiQEtdNwGVF8bxhUe+HlKjaVE6uQdl5UELpDi
         nOqrp5TCMAWdBs5o5nfC1rfU5e2qXs5dmOvk9/Gd5R+3FZ/hFX5nFrXLNuh4R7eCVAqi
         FCD5iN/WHnPKHbnfzWuSN5G0k1/px6vzxcTx4TMMx7qF3sPYp0G+KwZA99xomnl42Zmg
         JZ7XnaY5aKCjIc5pKnlLhwWDnsYB0uqJ+gTcJALUtFK0Nclz4q/LUoSWJvtnF87WM0Di
         VwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=pxKLfOME1R0KZZACiredgYsYKfw4h1/06Dg8Bmv9RjQ=;
        b=so/pfXSmzyGfC0Wzzzrz4w3iIYD/hKhbygw5+FEU6lltqTsgkI1pDQKTtLofHWbV7v
         /xPmttLl8Ep1BbuzsFvQkbkwwixlfCMRbxcNb+Dprx61iSMNtaot7c0jtsanK+GNvCaZ
         72C6gFCCFPnwImbb74CKe1p/uzyXJr/78wSvhOZEAKIe5CFNyu+thiZbi181MfLcHcIc
         UzfFEyM1g5jVug4Zsynqrwr7Xa8E96CIxrlh7wYn22AToF2a0UJGwjbEv4BhkouNxtId
         adWvDEH/2tZPCNzC3MGAtsxKJGnUv0hYTQDf3crKDe3IHiB33g84LrjNPd38zxcg7sEo
         HZgQ==
X-Gm-Message-State: ACgBeo2LfRZarpA/w8+js0xt9UkjPWiwvQhB1zF2swbvqufbikGR83Xj
        CSq6g+bvvIYTh4mSdBonRZvuHccuZsl0Six/rLfd8PmO
X-Google-Smtp-Source: AA6agR5Ns6sE/CX5NmrAoDfd3/1lrF0pkxRUfma+oBjhnH3A3CDYJX/3W1+0CRi4pSmkQBkj4rL/neE5GM78cX+RuJ8=
X-Received: by 2002:a17:906:e9b:b0:730:a6a1:9fc9 with SMTP id
 p27-20020a1709060e9b00b00730a6a19fc9mr2623390ejf.601.1661341220971; Wed, 24
 Aug 2022 04:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220823122117.15757-1-yuanjilin@cdjrlc.com> <48f4a56f-0586-9e9d-c121-6309be65b803@arm.com>
In-Reply-To: <48f4a56f-0586-9e9d-c121-6309be65b803@arm.com>
From:   Inki Dae <daeinki@gmail.com>
Date:   Wed, 24 Aug 2022 20:39:44 +0900
Message-ID: <CAAQKjZNPBDwEwjL7+rYTvfm7eQ85feXW1rr_P3VCERn3fPPfjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix repeated words in comments
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jilin Yuan <yuanjilin@cdjrlc.com>, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        krzysztof.kozlowski@linaro.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

2022=EB=85=84 8=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 10:37, =
Robin Murphy <robin.murphy@arm.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 2022-08-23 13:21, Jilin Yuan wrote:
> >   Delete the redundant word 'next'.
>
>  From the context, I'm not sure it is redundant - as far as I can tell
> this comment seems to be describing a sequence of 3 commands, where
> "current" is the first, "next" is the second, and "next next" implies
> the third. The whole comment could certainly be reworded more clearly,
> but as it stands I suspect a replacement like s/next next/next+1/ is
> more likely to be correct.
>

"next next" is correct. :) As you said, "next next" could be reworded
more clearly. As of now, the original sentence could make it
confusing.

Thanks,
Inki Dae

> Robin.
>
> > Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> > ---
> >   drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/=
exynos/exynos_drm_g2d.c
> > index 471fd6c8135f..4f9edca66632 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > @@ -1195,7 +1195,7 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_devic=
e *drm_dev, void *data,
> >        * If don't clear SFR registers, the cmdlist is affected by regis=
ter
> >        * values of previous cmdlist. G2D hw executes SFR clear command =
and
> >        * a next command at the same time then the next command is ignor=
ed and
> > -      * is executed rightly from next next command, so needs a dummy c=
ommand
> > +      * is executed rightly from next command, so needs a dummy comman=
d
> >        * to next command of SFR clear command.
> >        */
> >       cmdlist->data[cmdlist->last++] =3D G2D_SOFT_RESET;
