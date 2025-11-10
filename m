Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C08B3F9FB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 02:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762741503; cv=none; b=Sv2gwrXgY/gnMWjMwyk5SESBKsy6aySEhZrHy1X/yubbl82AwtPVJHoKfLQaRzj+50vd3GIIuPjB+lPslRgfuh7cp28kmtqz6Xsb14/vv682nApVHtZ6mFa9kVHHI01S+MNP7t11yJpHBEzGTxTXs4Pyt2koWRH5sEVa/1CppBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762741503; c=relaxed/simple;
	bh=zMmWG4XTZZReZm7Z4Ca/2dbr/V0sWN6r2sMwECjTims=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7S0HzUInscL+06CSOijt9ReZSkykckyNq3sWV/bMibQn4zUrFt128Y3mOx6vjVmYiFDw6l3gBj+aZapSg74cZN+HMvG1xmBn7yf6W0nRioNbofk78Rh9l2FTy3d0yzSW67yb490W1Vu50IIPajwgPT3w2xlBIvMWELX6mzjem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/Xhksbz; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/Xhksbz"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93526e2842dso559632241.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Nov 2025 18:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762741501; x=1763346301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=;
        b=M/XhksbzQXf8ypeeUTl4LQxB3ErXz1inESIfPKgLDtnrw/3h2uenZzO6MP2vw38JyC
         qo9721Erm6dJqr4xPWeUKrgMfZCmjuWiTf8I85nqOiq+6JtMcg1QguQ9TxRWIzxvqccR
         7H/fI6+57kjh1BpwNeEtId02pg8jg3k1vyU3NxdOQZA72VOouh4Yk9BmGAxSNQ3Uhw+W
         1Hfwd8ZLHQOb6GgO6WjerrR2h6XRcc9cWcrkJTGKf1pp+X7AjQZLXEvubHUjNbbz0JkA
         8YhW5R0IBHz3+Uzi7L+fshYZrkDu098kpBmv7T4IlogI+D/IG8jqcqv49HJjchd2zwf1
         7wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762741501; x=1763346301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQYjb15LQkUsCJVby49O7R+AcuVLuxsTRLE2IcB39qA=;
        b=MR387u0wbF74TAmGtTb7qG6U52hcHUN4uhWlCk9q1Oe9qGo/xLPOiCLoask7lvEyx7
         laje3Du7YLom0lPFmdbbszqJVPwKzbvZyNBZz74sau3GgQdVqutuiTJ5GMl0D1sxB3pg
         FRI8LT57olGH6EkDuTCS7H+1a4uCS3FHtfg7vup/AnuXYlYBwwXrrL4T2M6JUUdw/UiB
         7Ucc2km7M6hI98ZvThO/FlCYFoLhcAsfALUY5C0XRxM0r4etGz0DgPjBrIZA9gNKgvDL
         9xmOZ6Gqot8c5x9KKZux6lZN9MFnbf8fEfutAqEbvE356WeoazknoLf6EjiC6IVGnrGs
         G13g==
X-Forwarded-Encrypted: i=1; AJvYcCWMZGYwZrkFvAi5cVztXalCHKBLEtNdmGvVcCVXfWAvWm+aIkRObdLaI8MGRTiDjWQ1aI3LZUsX1VlcMftFdxGlGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqxPKD81pxguTW2qhjGIpXD6B88xNbABtPMtttinN6tDiphaQ
	8uE3P6Z6gFSMPG9aJWU47d8TMZWe9JBcbo4y5xebm+JrukT/T+3mM/sFP8Cuca3ieFOCnAH6QVl
	PxvcK18wmcrPDSH6etSBB4m+VQw2zZ70=
X-Gm-Gg: ASbGncviUJOhiN/xUUD0XmEynb+HVEDF5VfPbTFDYMz0w7E2/lZ0Cf1Mjy8iwhYgGAq
	4xKf/odd+INPFJKLMrawRf0w3tnxxwhDRawfHWU1OIM8z2lbd4QVpLSqCXdazRt61uxhXprWudk
	KUk46GmueSvgUShMG0gkO35emsREWM4y541J4p+P6tIaWa/Mk8UEoltMY6pppVDcM0oeA4Swrek
	wexsvys2NyA5BtZz3llBglj/Ks1qGKxAheTp+DKP95yoB7Wq2zy9cBEKnwYk4X858gQjw==
X-Google-Smtp-Source: AGHT+IF2EMlurBzuMt0qOjdQBCv2IFE0TWGHtCo4RfIbED7bE2bHbiRvxWtYQJUkcmfpI0qEQHMqGsLRQb6EJAlUMEM=
X-Received: by 2002:a05:6102:2ac7:b0:5db:fb4c:3a8f with SMTP id
 ada2fe7eead31-5ddc485e4edmr2017252137.39.1762741501079; Sun, 09 Nov 2025
 18:25:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 11:24:23 +0900
X-Gm-Features: AWmQ_bnpaBAd4D4AdmA6qBIjSKlXa89V9KyU_fLfaAFw_TI3ApflT_I8g0W-s48
Message-ID: <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for contribution,

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:29, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Some configurations require additional actions when all windows are
> disabled to keep DECON operating correctly. Programming a zero-sized wind=
ow
> in ->atomic_update() leaves the plane logically enabled and can bypass
> those disable semantics.
>
> Treat a fully off-screen plane as not visible and take the explicit disab=
le
> path.
>
> Implementation details:
> - exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mark
>   state->visible =3D false and return early.
> - exynos_plane_atomic_check(): if !visible, skip further checks and
>   return 0.
> - exynos_plane_atomic_update(): if !visible, call ->disable_plane();
>   otherwise call ->update_plane().
>
> No functional change for visible planes; off-screen planes are now cleanl=
y
> disabled, ensuring the disable hooks run consistently.
>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 7c3aa77186d3..842974154d79 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct exynos_drm_pl=
ane_state *exynos_state)
>         actual_w =3D exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay=
);
>         actual_h =3D exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay=
);
>
> +       if (!actual_w || !actual_h) {
> +               state->visible =3D false;

The state->visible field in the DRM atomic framework is set to true
only when the following conditions are met:
- Both state->crtc and state->fb are present (having only one of them
results in an error).
- src_w/src_h and crtc_w/crtc_h are non-zero.
- The source rectangle does not exceed the framebuffer bounds (e.g.,
src_x + src_w <=3D fb->width).
- Rotation and clipping checks pass successfully.

However, this patch modifies the state->visible value within
vendor-specific code. Doing so can be problematic because it overrides
a field that is managed by the DRM atomic framework. Even if it
currently works, it may lead to unexpected behavior in the future.

For example, if the DRM atomic framework sets visible =3D true after
validating the above conditions and begins processing certain logic,
but the vendor driver later changes it to false, the framework may
still assume the variable remains true, resulting in inconsistent
states.

Turning off a plane when it doesn=E2=80=99t need to be displayed is a good
idea I think. You might consider contributing this behavior upstream
so it can be properly handled within the DRM atomic framework itself.

Thanks,
Inki Dae

> +               return;
> +       }
> +
>         if (crtc_x < 0) {
>                 if (actual_w)
>                         src_x +=3D ((-crtc_x) * exynos_state->h_ratio) >>=
 16;
> @@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struct drm_plane=
 *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> +       if (!new_plane_state->visible)
> +               return 0;
> +
>         ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
>         if (ret)
>                 return ret;
> @@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct drm_pl=
ane *plane,
>         if (!new_state->crtc)
>                 return;
>
> -       if (exynos_crtc->ops->update_plane)
> +       if (new_state->visible && exynos_crtc->ops->update_plane)
>                 exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane)=
;
> +       else if (exynos_crtc->ops->disable_plane)
> +               exynos_crtc->ops->disable_plane(exynos_crtc, exynos_plane=
);
>  }
>
>  static void exynos_plane_atomic_disable(struct drm_plane *plane,
> --
> 2.34.1
>
>
