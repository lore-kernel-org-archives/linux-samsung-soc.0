Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1A18FC92
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757912518; cv=none; b=msiuS5nn4O2nNSFaLz3wQoOtNgqKUv3gN3RnaKA8GimIccQw5jc7+o63nuVvPwG8AWM9RRkJNNaDpc0teLVl1/E14hivkL+bWbiIRqa/csuJsT0Z9gdAQP786PaU+Z8RS6AJBRECoTgjrdNuVmGKK3nQs5M15VUSD0dOYg0LQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757912518; c=relaxed/simple;
	bh=CuybSsSuWIPhRMNpFKlKzYezGqxAQp7fUjyykk/QfSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMCFZYpCJnXVeTTOXmC+oxQTm9kA1PhP+lb//80RVsnox1M71tgGoQYmxpDNtuS5pTQ2hMdMWeDcqp+pisrhTjnl8PNW77BSqjPVjvUQP60YmpQfwL5/MkhouFTo0fsGLGcakP/PQHZCwAgGBQ3oPQd8vv8+phng8a6pWTMvogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBTij7nW; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBTij7nW"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544aa9b536eso2520494e0c.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757912516; x=1758517316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP8MR8Zyb+M1j23tZdMs2golC/4gwmlwntbTcjSvyqs=;
        b=bBTij7nW7Ld8j0xWZk70Apsndc8wojz4rSxJTXCssSiichuxcL04jo6SPrUmAhTgxc
         Ffy2haJtWimuSZo2MtVMyNWXtkf3PzMIYB93iggGcWor0/JAbfISm8Z7ULCMOS811l1S
         gCROdeMuL/HGnoi6sx4ZCrvutTky1ODdl+hKRcBFO+8koq7oViX+VB3vnf8Q08+QRIkn
         9od5ZlqYEaT0i5shSmRDHzSLDxJ6xYP+BY0cvdIqhD/Y/OPFh6cUDk6p6gv9S2AccdEp
         RZL2mEzuVFhpQ0iBYcn9cmmienm0m6Zk2qEElWmoJmNt/PVgnHjXePu2BifBjCRCL4fJ
         /A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757912516; x=1758517316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP8MR8Zyb+M1j23tZdMs2golC/4gwmlwntbTcjSvyqs=;
        b=h7N0lVMbRC1IXqixNrhqeblE941rixyYcYfm3QbTl13ff0BglYkE8fWkCudDvMUJWC
         EvY4GXhG7zQutYPbsrCKcK21UioxV1rRkM+xhD5+VYOFJci9zs3W5DC9goEO/69V1tvB
         cKLRuoSHzwQCOnbgmvitl968LwmPzMKQFEXXdpHI3fbpxZz9lsBkhOeouhlMld87FBcE
         Qd8pxdbLKgIZsbEm8tKxSdbXoel233jWKffcQy5U/uSTxY6AeOeqxrqrffGKF+1+42ML
         txSuaWZVHL3cVWxf42ANCjx6PgMepCIUd/27xCqgvTaUjYO2b8Oa22YQmVmYEGsh/C78
         3cUA==
X-Forwarded-Encrypted: i=1; AJvYcCVBQxdrOY1RyPqbwrD44oIh9GZrg9/I0pI76sz6SkBejYz606HDZiG2vGrG+JO9SKZ2z0cw3P7C/KwGhYW9d2fwxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+uNo8jrujAwd3hWZQVGsm4s/eFchwJ7RXoKRf3Cx4UWIr0gV
	4zMWHxow0IzUoAQeYAykQKPAINk2dOoO8smEhxo0n5tVcGiubVwZgNTo6b/s2viZO90LUDoDb5E
	UOobmCrIYr369X5RTp85UZOIFiiVMLD8=
X-Gm-Gg: ASbGncsrFfhrdaYDvEmGbyN9K1jHIu2a7uNGLf/2lJpk3DAOQ7mZ+Qc1A13rxhL/edM
	CIqQdwVTZ5SbmfU2qJPcR15zXlOb73/qQUTFQ1YKgELGEpLoScU94z65Z43PPTHXGaNyC8Fe7Vr
	Zeaih3BS/4yGvwELbuL29ECFK3VC9xLp7b+kruwi1IbBueVF9epccSxhEAk3ZfIdm3IMURMDC3q
	773BQ3HEn8xyywVWZ+sq/bdyPMjknjTmNQi3FKKw6Si1EepAqU=
X-Google-Smtp-Source: AGHT+IE3jn62oKcgXSavOgunVi8XJshWJWhwQ/NqLWYGRV5pjEp2g/3sg3TnOmQhafFEN8gAAnv9ZuPZTgxOKs6YhQw=
X-Received: by 2002:a05:6102:d86:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-55610cc5eb5mr3946090137.32.1757912515692; Sun, 14 Sep 2025
 22:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250914031522.33155-1-inki.dae@samsung.com> <CAPM=9txNEQXDU6rKHxTVXej7fxgrbbd_X+emHejwA4a7s9aoaw@mail.gmail.com>
In-Reply-To: <CAPM=9txNEQXDU6rKHxTVXej7fxgrbbd_X+emHejwA4a7s9aoaw@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 15 Sep 2025 14:01:18 +0900
X-Gm-Features: AS18NWA8kCkHBSD9xTpctn9ue13u7QfKbO5ABJGpcQFwup3LnmL09HsH5sVhYxY
Message-ID: <CAAQKjZNcAXOLovpsYwhzKh1V-SGhiWTh3xt1aQorQFY9tTBv_Q@mail.gmail.com>
Subject: Re: [GIT PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <dev@lankhorst.se>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Sorry for this. While rebasing onto drm-misc-next, I overlooked that
some unrelated patches were unintentionally included. Since the pull
requests for exynos-drm-misc-next and exynos-drm-next are
interdependent, I will rebase onto drm-next and submit the two pull
requests again today.

Thanks,
Inki Dae

2025=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 12:42, =
Dave Airlie <airlied@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Inki,
>
> I've already gotten the last drm-misc-next pull for 6.18 in my tree,
> there are some patches being pulled in that might be for 6.19? or do
> we want to get another drm-misc-next pull into 6.18?
>
> Dave.
>
> On Sun, 14 Sept 2025 at 13:15, Inki Dae <inki.dae@samsung.com> wrote:
> >
> > Hi Dave and Daniel,
> >
> >    Add DSIM bridge drvier support for Exynos7870 SoC.
> >
> > Please kindly let me know if there is any problem.
> >
> > Thanks,
> > Inki Dae
> >
> > The following changes since commit c08c931060c7e44452e635e115913dd88214=
848c:
> >
> >   drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_fre=
e() (2025-09-12 19:04:37 -0400)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags=
/exynos-drm-misc-next-for-v6.18
> >
> > for you to fetch changes up to 17308ab685acba947fb35e52fada2b97f346b8cd=
:
> >
> >   drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM brid=
ge (2025-09-14 11:53:09 +0900)
> >
> > ----------------------------------------------------------------
> > New feature
> > Add DSIM bridge driver support for Exynos7870
> > . Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridg=
e driver.
> > Document Exynos7870 DSIM compatible in dt-bindings
> > . Adds exynos7870 compatible string and required clocks in device tree =
schema.
> >
> > ----------------------------------------------------------------
> > Kaustabh Chakraborty (12):
> >       drm/bridge: samsung-dsim: support separate LINK and DPHY status r=
egisters
> >       drm/bridge: samsung-dsim: add SFRCTRL register
> >       drm/bridge: samsung-dsim: add flag to control header FIFO wait
> >       drm/bridge: samsung-dsim: allow configuring bits and offsets of C=
LKCTRL register
> >       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
> >       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
> >       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offse=
ts
> >       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
> >       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
> >       drm/bridge: samsung-dsim: add ability to define clock names for e=
very variant
> >       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatib=
le
> >       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM =
bridge
> >
> >  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
> >  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 +++++++++++++=
+++-----
> >  include/drm/bridge/samsung-dsim.h                  |  16 +-
> >  3 files changed, 308 insertions(+), 88 deletions(-)
>
