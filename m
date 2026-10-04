Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AB3B83FC
	for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Oct 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130673; cv=pass; b=q5WYojj+hBv0j++PeKsQO4ahugZ4Hu+CeWETPPkKuYYyDdzMVGcyDlYSQMDKbtL7PbtoYiduvM7E+zGfI89cYPkR6E2wdYMswBAcqi8b8/UscFCtaW/QST/0rnSg1TaQZbui34rpdF6htjeflF2SHw4969KdFdsj4elGLQl6MrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130673; c=relaxed/simple;
	bh=k9pXf8maS+y9Iv2VCxa5Upxa72qTSFtba18SXktEYbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbnesSvc6gDFFmScUvgleYDqRmqW8EqQ3X5azxXV5EYRZpLj8Jtj6f9WKGLfq9QqPg+mfs3qiJtLxOlt28ACHEzT849xvNZg9bf3A6rvA8vFQI9GquRSKAfNnpVybz+E7zc4kPLRanHToE6FpJl4QYflGeIHXKg68OR1Q/xjtmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cwJra1GA; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cwJra1GA"
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ac502960dcso7465787b3.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Oct 2026 09:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130671; cv=none;
        d=google.com; s=arc-20260327;
        b=imTy6cFA1bJ7bzu9QG4gsl/vLZs5ejK2g/OsNpxngRlPhJiTLNMnFzCGr1xObE0Pm3
         gUk/dWTmxSbyDoESmPRYSia3+UrhxbUZA++QmoFxrHDc+DMrkoQKXjppaCheObbq64lz
         bMSzK7rPu69FbtwmQTjcXlYt/p2Ad5897nToIYLAk1znVCH1zIpfV+DpHiw60eOuWjKl
         z/HILkAPxU6wJ+f/lseS9dZhNmDbt0hO+Rn82gX7V6Fe1bK8K2A9QCkTnOoliRkZCYkF
         GMZVXMvXkvhAwY7B8vi1zvNc7P5Gubnpp9crqYJ2pNpacn8BA5fUXA6vx8V29Cj88Onj
         mimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        fh=k3Np3JcmjZOnvZal2SYr8sW8Ejm56F0kP4vOVI4djzw=;
        b=ewC4njhLwfRwZc0M7hdq5XDKJh1s0FEqkfoTkVUKm+tjzX3F3a4TYxYoevfgIkhV3i
         aLLY1HloxpaC5cvzmR8ylYVDs6wZlT2EC/VU00P/nTil/WUV2bfw7wAl/lKVD5Eq006w
         Ago/iUQkQdJxqR0fRsDBH1CKSZaD2rx5TAmhu5h1APKblLqZ/xRHlHu+FhvnYWfYQ889
         kleZdzoJZg5u3GZ8F0kEeqZF2GpInFA7hM614Wthb7X2LDJ0pX6TI3s+1vsDepTSqkeU
         ldc2vA817blyNWHFDHdL9vlbGyqQ4spppVcO7LQzGcCA+iU4OfgFKyAHe1eRxGYP83Wq
         G5xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791130671; x=1791735471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        b=cwJra1GA195R8dJWHGy8COxD5ZGQ3lGCG5IyYeX7hX2ipTjZiOCWF5gAS1NEW1Yf5n
         xmX4OFs1nXHs5RRdjYXM2araVuMn/+MfdP3xnYWQwFZ2uCddsP0ZMixxO1gV4jc+QNA4
         L/0qUPt+30mhwpXb/CS1B2CUraX5PchOByfZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130671; x=1791735471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        b=HIkJIidqZaQ4ioFKVyUKPrw6Z/rwENRtPpO4F/1vdMQfh4gMLtLlugX+pdHSZ65Wbn
         R8Fr8mg3CF1iK6KPjyyYCIbMBHZXCZb3SgO4trldb4/faZMzwElFtRSc+SXxOmKJ2djf
         ygI4/+wdkaXeJ4ON+aKeqJEHt203GZlRD2WMvVZs/uWelmOkY9JN+R3CkQNJ9o1Kb3fh
         kaunovnHyQcUVooT8UQoAUJSPW84SgvX7vJCcReXcwlbnyNIY5s/pjuiAMtOik7C6IxL
         6eN5sQAssY/0K9tSDTeQFZC85Byfwfolp8mLSzBivZ/uy/stNvDWUG9L7KbKKrVTxg6I
         LHeg==
X-Forwarded-Encrypted: i=1; AKwUvBxBGLKGqA8VkXl3N2j8skiQO82eNiYvmszoYgXWThQXUiwSAvVt2jh3UhApE+FqR4i+wUGwqlnL2kPZp1daqhN5CQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTw4fUrc5+MlDq8Amljst15vvqZuiIxL45orIdgg8EESkVjVA8
	DvdUFUhhf6hXDsV+tGmm6tRp95b9lInoSqgn9A9i1eJhroMEEPxD0mxmEZ/SBsmZrBkq5ndRIV/
	pXsT6nTQ+ClrHEC608aGrGn+eFRbeK97/NTXheli2
X-Gm-Gg: AYBFou2D2I0guejm5kMWcdlwD88NZZhmVLvrdeWWGeJqMOD4n5ip+5+Mi7yx6aSQJ/W
	xGHORpuD3oqSgd6aGdNGmMqcxmS+bGAPhJKE9O3KJh8MPMky3CgSo4y35bhTgKqDgaUB9M0oRYb
	YQBZud5TsI8HZSrEuTB4rKqBzeFHXMw06vaVtZkjbw5QzwcO/2q5w2xf5MN+StgM5mjMxFd/Hkk
	9sqiDbqAioKYTlIBwbz6Hq+7KF18J8ND0+b0kMaMr8YYo30n2T/FTodLzGbYDUOVVfpBMRjaLan
	reCaefZ8xehoWagQw8auv88HNiempezJT3azN2pnlZ/8f3oiFrhNEzRw
X-Received: by 2002:a05:690e:168a:b0:677:af43:e268 with SMTP id
 956f58d0204a3-677af43ef66mr2978859d50.113.1791130670771; Sun, 04 Oct 2026
 09:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803135249.2898083-1-wenst@chromium.org>
In-Reply-To: <20260803135249.2898083-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 4 Oct 2026 18:17:38 +0200
X-Gm-Features: AclHuK8AbiOI1d3O1oMAtq-YB9tfgZCN1siOUfw9uTtQBVIHV68l-lLxUKSjvHc
Message-ID: <CAGXv+5FS7gLB7-koaPKMqjtMPjOSWguW9NN_tS+8Wi2GTSHYEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Set supported modifiers during plane init
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 3, 2026 at 3:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The exynos driver currently checks the modifier in a helper called by
> the plane atomic check helper callback. This check only concerns whether
> the selected plane supports the tiled format or not. This is tied to
> the plane's hardware capability.
>
> Turns out the tiled support was added around the same time modifiers
> were being plumbed through DRM planes. The latter provided a way to
> describe per-plane modifier support.
>
> Add a field to the hardware plane capability struct to allow adding
> an optional list of supported modifiers. This is passed to
> drm_universal_plane_init(). This also allows the core to generate
> and pass to userspace a list of supported modifiers for each plane.
>
> EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
> check is now down by the DRM atomic check.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Any chance someone could take a look at this? This drops some redundant
code.

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 30 +----------------------
>  drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++++-
>  3 files changed, 9 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index b126cd129944..ab0edb826261 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -92,7 +92,6 @@ struct exynos_drm_plane {
>  #define EXYNOS_DRM_PLANE_CAP_DOUBLE    (1 << 0)
>  #define EXYNOS_DRM_PLANE_CAP_SCALE     (1 << 1)
>  #define EXYNOS_DRM_PLANE_CAP_ZPOS      (1 << 2)
> -#define EXYNOS_DRM_PLANE_CAP_TILE      (1 << 3)
>  #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND (1 << 4)
>  #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND (1 << 5)
>
> @@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
>         const uint32_t *pixel_formats;
>         unsigned int num_pixel_formats;
>         unsigned int capabilities;
> +       const uint64_t *modifiers;
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 5c04ef87e400..31f5f0941154 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -174,30 +174,6 @@ static struct drm_plane_funcs exynos_plane_funcs =3D=
 {
>         .atomic_destroy_state =3D exynos_drm_plane_destroy_state,
>  };
>
> -static int
> -exynos_drm_plane_check_format(const struct exynos_drm_plane_config *conf=
ig,
> -                             struct exynos_drm_plane_state *state)
> -{
> -       struct drm_framebuffer *fb =3D state->base.fb;
> -       struct drm_device *dev =3D fb->dev;
> -
> -       switch (fb->modifier) {
> -       case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
> -               if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
> -                       return -ENOTSUPP;
> -               break;
> -
> -       case DRM_FORMAT_MOD_LINEAR:
> -               break;
> -
> -       default:
> -               DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifie=
r");
> -               return -ENOTSUPP;
> -       }
> -
> -       return 0;
> -}
> -
>  static int
>  exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config=
,
>                             struct exynos_drm_plane_state *state)
> @@ -245,10 +221,6 @@ static int exynos_plane_atomic_check(struct drm_plan=
e *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> -       ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
> -       if (ret)
> -               return ret;
> -
>         ret =3D exynos_drm_plane_check_size(exynos_plane->config, exynos_=
state);
>         return ret;
>  }
> @@ -312,7 +284,7 @@ int exynos_plane_init(struct drm_device *dev,
>                                        &exynos_plane_funcs,
>                                        config->pixel_formats,
>                                        config->num_pixel_formats,
> -                                      NULL, config->type, NULL);
> +                                      config->modifiers, config->type, N=
ULL);
>         if (err) {
>                 DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exyn=
os/exynos_mixer.c
> index 69dea5049309..d74e605a452b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -93,6 +93,12 @@ static const uint32_t vp_formats[] =3D {
>         DRM_FORMAT_NV21,
>  };
>
> +static const uint64_t vp_modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
>  struct mixer_context {
>         struct platform_device *pdev;
>         struct device           *dev;
> @@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_con=
figs[MIXER_WIN_NR] =3D {
>                 .num_pixel_formats =3D ARRAY_SIZE(vp_formats),
>                 .capabilities =3D EXYNOS_DRM_PLANE_CAP_SCALE |
>                                 EXYNOS_DRM_PLANE_CAP_ZPOS |
> -                               EXYNOS_DRM_PLANE_CAP_TILE |
>                                 EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
> +               .modifiers =3D vp_modifiers,
>         },
>  };
>
> --
> 2.55.0.571.g244d577d93-goog
>
