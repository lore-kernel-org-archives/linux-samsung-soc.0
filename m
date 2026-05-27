Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65313311973
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915915; cv=pass; b=HzdTdul6NrHzMAnFQAvnEf9LDxWYf+T5xGB62eOQdAJ2LlPzIYlzq/k4I7fJzjlVb1P9shr69qDaTtVchL9tPqVoQEFLqhscG2R4SlqKG3VaI4dGQts40j4i6xd6k6wCaOyPVJngUvXe5EQWxlR1jHlgt8nE5syGCNDeb88JiN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915915; c=relaxed/simple;
	bh=E27f4RGAAl7JQoaOZXDTkv3ghReBMrvcB5HdyB37Exc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHqNzSi9z8uN3DQ/426O5pW+6/RCblWSWXqHaMB1FzSN4zjgxiKterDJxLjBQ5JEp99mJJ0wEmeGQnIfu0r/bo5gDFYYrY5okX4wmUJ1xbvuZgXsuIbOGrZ1n9Op7x5Mw7nuXyLFyJTQ2LGzuyC208hS5+wIa08qRf9kaVhR9Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gPuDhI+a; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gPuDhI+a"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a884815606so13264892e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 14:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779915911; cv=none;
        d=google.com; s=arc-20240605;
        b=ctW5TeB0O1CBPaNhoYg3sWMMoCsGgYPUAllUszAS218mr9jpFQmL1CaI5yHAxllKok
         v5KcznjxpimDWADrbYnuVwgrPYOPtJTWV+0dv+02IAw5b5Ay1iP7kX68EFTVzqxhptB5
         jHJTJFw42L3qEYCHgZB9DT33oMV28GMy1ML04pi7p1eunfSWn9or76T0tuLEfGg+H+6d
         spc6HZrnvNgPJds4HLjz4nHRY85N0rpdZYBWU9aR4OYAC++FcI7sCJPqMIFdeZG8Z9+J
         BHj35M0M24WOT/xkjJca9KzHMKtcAfz91GAFH5qwAFWEh5ZEOilsdJRPe2c+LgmneIqn
         zn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=;
        fh=dDcrUInopf/ALpHobsKTPaQ/YKFmEH4IhC3A8xIlvFs=;
        b=IGazuPVUUxrECqVDedUFljOWJnnKYhhrYAQCiETwii27OK4P308IuSU6Cb8yt/0J+M
         W5NlOi75zb4vrnExoG9Hqfx4TAbMhh9two7LwHCFQg5rbzzzO4n4Zot9EhaZdWY5NaRp
         kd1lSMDdB+RCzkbxZxnltTs/QMuz6dlJhKI6VGOPMRFRYHQi/7BqINX9baD91SbkS66A
         +wOQZ0luZWw38JQ9EjP0X7oRHjLRYK90OIDnJ+sUjays5D2HckaTEURD5fxA8b38rY5N
         K6g56Wb7L5y2yngoxrxyYBSYobgnkghEmw0aspjWugkSgI1fmhA805bo5PsO62B+awoT
         +zfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779915911; x=1780520711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=;
        b=gPuDhI+aQKZKnNniZB45f41hWB1MQyHO7FpzjduCXi42ri+0Hw1i3mkg7bNES3y+Fj
         m4LEIGM3/kqegVMO2SPxvuiv33tnUbjh1xWhl7B/wdf0mcs5ey5PvsXUO2XNj9eQ4cOO
         FzgA8p0AfUJ6gsy40I0h243NJO880iNSAm4kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915911; x=1780520711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=;
        b=WfcWvjuGRWL9PfvjAINJXWJ/GvX3JX8R+RTgP7T6bcBiVq5EKs7/qojN1m81tF3NS7
         6jy0XTz/i5DArjGuoP9+fj9TUGcmqpzh0KP9EqSy9zUCNNO8Jb4ynOGXIzlg8dbsXKNd
         uZtYj6wc92cveQT+iwAIYY2hw+UOEfNcJJqSgypyU5QP1N1+VrYFY8f2zYwRlWSY/i3y
         NtE+TAOvgskKeaw9p2tdsWXY7tHGeP6iPYrxivVAVJFNSeYwvYFx6BQr3+j1hUxY1Dcy
         q7YSO0pnbOSS9NgtjD4HktKxivE1J0Ss6xixC68TxnKAkVRY8O80C53dIZTQI4oXUQOu
         LY9w==
X-Forwarded-Encrypted: i=1; AFNElJ8T7NhNEzdfYg7zX+YyPYmbThCKq/PZwt/E5Kt6D1PD6ac6nqavKfdIpdtYvxiGnL2dVcLbVxorSRABYPiKwEkRww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxxQuRzHZPRVKGEKEduv6tihfPFohS1WDSqlog8t+kAQI7VRU
	ZL5etwSFy+C4/Qu1pOZSqoY9lfJgmBKDmHFOGY5DkV39buo+P+trU/eESLaHoMGgUa8zYEs7Ehf
	6julJHubFMHZjreIn7EQVsHQ6CzSf/V/+BYm45DnR
X-Gm-Gg: Acq92OGimS0MwOg8AoUt4zaXJZvjWc+5U5+l3SJXKl8VX614O13HqOhV3RA861reJCH
	Fj3uguMgvlKV19xoMYthq67+9kmfZ63c2eu0MPGL8rBscko8ip6K8k5pI18S6K0afUMON6Z33uE
	ImWgSVPCxlqbwyEqabkQAdw0ir0KFVFm46wn0FmbFeMg0Fe/dRESUtbUEcFTYR7NFt/wYj+PnLT
	+dqjoaeQHMWzQqadB6k0jT9bgV7h11xpwOKWqQqSEFKPcSkZCsE5mMsHf/jTvV6ZJ9M1Kd07EkS
	PindvEuU2mLpDaaMmA==
X-Received: by 2002:a05:6512:65dc:10b0:5a4:1902:3d17 with SMTP id
 2adb3069b0e04-5aa3239b51emr5764637e87.12.1779915911516; Wed, 27 May 2026
 14:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org> <20260326094308.1161335-4-wenst@chromium.org>
 <fa11e295-c3a2-4baf-a7d6-a290a4255ca6@sirena.org.uk>
In-Reply-To: <fa11e295-c3a2-4baf-a7d6-a290a4255ca6@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:04:59 +0200
X-Gm-Features: AVHnY4LEGpZKQecMkzAfBGdO7O4dM-_0AAlkjrus41LuLxUrwJWQv5-AV3HxcEY
Message-ID: <CAGXv+5GC_fxarWMgsAyZ2553codJg4U9A7KChjZpmiQp2NGSjQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/exynos: Drop exynos_drm_gem.size field
To: Mark Brown <broonie@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aishwarya.TCV@arm.com, 
	Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 7:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Mar 26, 2026 at 05:43:05PM +0800, Chen-Yu Tsai wrote:
> > A size field is already included in the base GEM object, and is
> > initialized through drm_gem_object_init() with the same value.
> >
> > Drop the field in the subclass to save some space. More changes to
> > make exynos_drm_gem a subclass of drm_gem_dma_object will follow.
>
> I'm seeing warnings on arm multi_v7_defconfig which also show up in
> other CI which seem to be due to this commit, the type of the size field
> is different so the format specifiers need updating or casts adding:

I posted a fix for this one and a half months ago when the culprit
patch was queued up and I got a report about this from the bots.

Inki hasn't picked up my fix yet. Arnd posted the same fix today.

And it seems the exynos-drm-next stuff was only merged into drm-next
yesterday, now causing the warnings to pop up all over.


ChenYu



> CC [M]  drivers/gpu/drm/exynos/exynos_drm_gem.o
> CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
> In file included from ../drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc=
_buf':
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: warning: format '%lx' e=
xpects argument of type 'long unsigned int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
> 69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), si=
ze(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> 70 |                         (unsigned long)exynos_gem->dma_addr, exynos_=
gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
> ../include/drm/drm_print.h:563:39: note: in definition of macro 'drm_dev_=
dbg'
> 563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:69:9: note: in expansion of ma=
cro 'DRM_DEV_DEBUG_KMS'
> 69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), si=
ze(0x%lx)\n",
>       |         ^~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:69:76: note: format string is =
defined here
> 69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), si=
ze(0x%lx)\n",
>       |                                                                  =
        ~~^
>       |                                                                  =
          |
>       |                                                                  =
          long unsigned int
>       |                                                                  =
        %x
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_free_=
buf':
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:83:37: warning: format '%lx' e=
xpects argument of type 'long unsigned int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
> 83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n"=
,
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
> 84 |                         (unsigned long)exynos_gem->dma_addr, exynos_=
gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
> ../include/drm/drm_print.h:563:39: note: in definition of macro 'drm_dev_=
dbg'
> 563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:83:9: note: in expansion of ma=
cro 'DRM_DEV_DEBUG_KMS'
> 83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n"=
,
>       |         ^~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:83:64: note: format string is =
defined here
> 83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n"=
,
>       |                                                              ~~^
>       |                                                                |
>       |                                                                lo=
ng unsigned int
>       |                                                              %x
> CC [M]  drivers/gpu/drm/rockchip/rockchip_drm_vop.o
> CC [M]  drivers/gpu/drm/exynos/exynos_drm_plane.o
