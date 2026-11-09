Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794197304;
	b=E06IG9oMrLrvaxnA+CpLRSEdf6vp/e2X0+RrZys+sPI7TahHqBiAWAoXopHHP8gMM9vc
	 OfTSqSteCtGXEZ0kJh5e8MelhbEt7kAsaiwFGI5ORE7oa5RJXooeaWakw2mDIwwaNuGtW
	 Ynby8wQONUeQib8FYGOgaqQLn0nzZhTloMZvJ0nnSAb0R/B0MUmXkt4VhyqTc6j2tAgFX
	 9KTG4gvZQ2o0toLeLK18XrE/QnHblY1DmfQsgb0tYt4rHfu+k8wSKSPsVFjPkCwHuRwTv
	 PsUu4wnaGdPIHjmBTgcofXgRdMUnklolBjdv+uCzmIQK2IkttsT2f7jcHTMeJ5Hf/nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
	b=HjXLANQQX82aISqrIvLpi/r9EMWKk8lul6EB8zCo5WrHRBZNbs37lReKKrXXRcRYjL9g
	 k9rLVn7qszUA1Q6s9G3C8dgLIJdT89jj2thcTx8IpIK/qzrASArE/dcfKpCpdjU0wwL77
	 kF1xzyfcjZZyTSbm6kaCUgZMmvO/va66O2wLIQdbyr4foS0/N7FkYj8cddYcE1aekxdar
	 Z0BF4P7XoeNU3cGXa/6HmpXnRufRBD6+LA2K5DPLD4oZ7SJ/43PAtDAf0Fw1XY1rLANQZ
	 rshd8J/m5nihHc+oj8EY0XLHvsHQmiv4Vx6I94nGzzfYJt5LYNT7lMF/Bpxowphr2DA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PZBXTZev;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE441606A335
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 04:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE441606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PZBXTZev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so620455a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 20:08:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197302; cv=none;
        d=google.com; s=arc-20260327;
        b=D2gqQCIh5qocZwr7t2+5bOvjshrrH2BLIbvRwQOXG/LTLZb6aj+g4TkQDkms12zV+l
         //cnIAIwzP4F8oD6apHM6Du3ewnzSUYa5OzpEifIuD1CIzo2MRx7SfSSEWzgz3KHkzwQ
         B4N/IjrkePRqssVzKIrHZxVaycomNKuPocGXf8mxzxDA4zKVPmyj1sHgUccxzI/N4zuq
         88W+piTXLUQFGbsJXkXVBK6wRKLDVJBEyNH59WADLS4obU7bKBM9kZemHNWG+os0PWg/
         KKlb+AOLCw8b8d7jOUJcCq1yLJTl/sDe6TcthJzC4W0KhZxLaHiK56yYvmWoA8RWNVUV
         7Cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
        fh=C0l7SONU+SMYEYShXYyAGUQTz7XWEwqSN2ivaMDiYOM=;
        b=ndyzImPvbVjleC2RgRmMoKf3H5GL+xKND/+Xvx8wGymMfzg+IGHo1y8DhBB/+Y74z6
         KW1RtjQ62VjzjKWge0bS2AOQinHwRygULk8G/aHQ7JiXhqvZvOel+bg9FMxOhiItNyG1
         yji6BlnT4JmUOm6Cn3KNRkKbarDBmvLjKOWlRghrE1YXfgVUKXLwmmZtTYag6sZ9QAYg
         W25BgrF01Pi3oxoOBM1M9iKlFpXyPjFTopRh1g/XtyTNlUMDiJ5aWM8mA5wY9gpoYxp8
         XfTRx4h/e3+yzN+NoyfRBCi3vJT48jtX6EkB+ReasmCBOWnDr8uli0Zmi9F8drvzmmDD
         kdaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197302; x=1794802102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
        b=PZBXTZevTJRcpEqxhnLcKwEKgU0sp12tcupiabyP7Ks3Iupa8aIuGCUvv5+d8YlgzK
         XA0cwI5d8kvekvoN9CTbFMUwNPv+QFZX3dUYsqBddXimPmVlBErCjmNlWzGaQc2NIC9j
         sAN4ZrXFdEJqqvoTrKHlnHJFZawpugZ0jHLvM38LlHa9JvzSky7CqCNBibY0TyKNsWGp
         4VHZNcHbGtGcvCBcVjUquDXcEQidUacnrPTCp+FwY2/mQuTk3HpYOdL+/hb9uFSij9mP
         zctW62FDZrWJ/NNgI0PPyPyWpn3ZpKBpPFdHxx8GQt9eDaA8vXpyY2Dx/G+g7Sid4scE
         Duvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197302; x=1794802102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
        b=kjSxhp8eXPDf1CfdECp4G7FOlUnQQPFc9qmzrosPgkfMNTZRrR14q/AwZtfTKyVhCD
         lfrU16NEI9+HcnUFv9ZBlP5ri3MjWPV4URQ3HPB83UPHk2gUy0YeKeK11HViuVrSQZUh
         wqHod/qB3PHVQ0Xt5OfkpHz/F1yASpdaDofA4a/d+SyC2ugVZWgF/Tv8QBizncAgvY1a
         xSf6x8CRmX8CBEHknrVSYR8TnVHAuHoS+IAV3VcKdyib1AUsmwOLggb2vHMko9sI3RoI
         q7ZJctCU2vp1wgFHw0/O/tnlA2vfs9N8jha4aEAgyfYXq+NppbG6Toi93qcDk+TFtaRC
         ZS8Q==
X-Forwarded-Encrypted: i=1; AL+hErGhBbQhub16abhwcHOSTXrKN1mQ86xt1xfrt1d3PmaTjSZqIzI3Mw5Oq/XnoKNRjFYf4r3eV0oAB32/AdM7P5emlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8GKoFANeZSYZnpfkTAF4wTUn9r29SKUN4P253z7ORtjVqifFNI
	hS0pbIRiJ0wxfxhpi9FO+gCvunMaG7Qfzm6E+VOZ8N+qzvGUPff7x3lcZ/T0oQNzLT/LScym/FL
	EM5trmBT+7cMDQ/bZwsxIZ4wxdJUHqxs=
X-Gm-Gg: AYBFou2lvm7VtTQFxkpRZa/RfpsNAoP2m0BD+OFWWVTx7m93TM/MxzWvl8NUPYPH97r
	EEFBVdrrFZcsTk0JjHADsDTjp5s58HDBQzfnhnbSuP4VsOV0bphJOLP7vXa659cVUH0JqYSg2vr
	5S/n6Pv8h2f6gJguWjmkbAoMOkCmAjPuLnxs4udqeE+wxhm55+BcGtSOj2x9P+q6TN/283cPq8U
	ZhJ2NdeRM24VmTLyyRveom6GSgrm53kNzi6XDKLTnuO6gRIG+hfd12F1q8G6WdFe2n9nqUU1xNH
	qd1ZvwFmPEJLZJy49bNpTuMEJoSFBp+h0cxbh6P84+WwIgooj4zLGdPmVDc9M3wAMOqZ0KV1L/Z
	xl/wSUeHhYbWT8NvaPpvz0MLTCvN74LcTKWe9JZh4mVHUGie+XOYQS6lbgiW5G4mra9c=
X-Received: by 2002:a05:6402:274d:b0:6b5:76be:62e0 with SMTP id
 4fb4d7f45d1cf-6b722480872mr1993578a12.35.1794197302011; Sun, 08 Nov 2026
 20:08:22 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260803135249.2898083-1-wenst@chromium.org>
In-Reply-To: <20260803135249.2898083-1-wenst@chromium.org>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:07:45 +0900
X-Gm-Features: AclHuK_ZmjCHtFzSMtsaBOPEyrbrKGy7XikpiPUkajiV_K7VOdZCVHHguZRFD24
Message-ID: <CAAQKjZP+W0_gByaDAv8DrtxFgSDdtw4AMd-=tA_Pr8gL30z1iA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Set supported modifiers during plane init
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for late review,

2026=EB=85=84 8=EC=9B=94 3=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 11:22, C=
hen-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
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

The VP plane advertises the tiled modifier for both NV12 and NV21, but
framebuffer_check() accepts it only for NV12[1]. Could you add a
format_mod_supported callback to restrict that combination? For
example, the callback could check that the modifier is present in
plane->modifiers, then reject DRM_FORMAT_MOD_SAMSUNG_64_32_TILE when
the format is not NV12:
static bool exynos_plane_format_mod_supported(struct drm_plane *plane,
                                              u32 format, u64 modifier)
{
        unsigned int i;

        for (i =3D 0; i < plane->modifier_count; i++)
        if (plane->modifiers[i] =3D=3D modifier)
                break;

        if (i =3D=3D plane->modifier_count)
                return false;

       return modifier !=3D DRM_FORMAT_MOD_SAMSUNG_64_32_TILE ||
                 format =3D=3D DRM_FORMAT_NV12;
}

This can be assigned to exynos_plane_funcs.format_mod_supported.
Checking the modifier list matters here because DRM delegates that
validation to the callback when one is present.

Thanks,
Inki Dae


[1] in drm_framebuffers.c
static int framebuffer_check(struct drm_device *dev,
    const struct drm_format_info *info,
    const struct drm_mode_fb_cmd2 *r)
{
...
        /* modifier specific checks: */
        switch (r->modifier[i]) {
        case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
               /* NOTE: the pitch restriction may be lifted later if it tur=
ns
                * out that no hw has this restriction:
                */
                if (r->pixel_format !=3D DRM_FORMAT_NV12 ||
                         width % 128 || height % 32 ||
                          r->pitches[i] % 128) {
                       drm_dbg_kms(dev, "bad modifier data for plane %d\n",=
 i);
                       return -EINVAL;
        }
...

>         },
>  };
>
> --
> 2.55.0.571.g244d577d93-goog
>
>
