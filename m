Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713BC367F3A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050757; cv=none; b=pz7HRYJZPxTZYp3C+IuZ1G0IxjGIhl8G6dbyFZg89pXT0Xw0/PkX8g6MOz8oGx6dvUY31oL3CZRDhkELqYGJGKaRsAFvwVA3YooYyo6Wj07zATwWKrgfufMnzn30eZU+UiwHVh/f3ptELcczyIs7T0d7MCimJ5J9vH0F98jwI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050757; c=relaxed/simple;
	bh=mzEIRikL4KeVeSatrSKuHX7MkAVxwP8TiLE+X+winn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1FoP2ATLq6j8u1+MvfhS9H5g0u0r9k9I5CruVxFNijHi9bbRyejFqOa3ZA43XbsUC4ESIw1G7pwVx7Cd0v//GtbS9+uViWNaHcBDfLnaUmKLS+jNV5GH8T+w0gsGNcHLQPx0InlQVMah5Yu4cq1FH7o1nHerr8Xag30cpPGLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP8c8gCo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP8c8gCo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334AFC2BCF5
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778050757;
	bh=mzEIRikL4KeVeSatrSKuHX7MkAVxwP8TiLE+X+winn4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JP8c8gCoQr7HNTiu4HBZDCn15GBTEcbjITWYn8q2z7CX8cIOidOQ4Y1cU5WZ1zzvM
	 twKk81tVwbqO0I4zWKuorvxH5PfU7R4lQUM09T/bui1zResy1WmxziSfgQ8RmHbD8z
	 ClVitxc/146ubQKmk43UaFY9Tvl1I+pfezBzSTKG755iRqTmgeg6g3rBqDwsv4V7w2
	 pOTQv4/ZqeQpahgBHNWg3zw9WVnWy8S+QWranE616j6XibL92DUmlfbNuXRifPJiD2
	 8n6/tqcj6qHXGLIn13vD7R9eEc3GK+cVBn/CXUmdGL4K0LnoD8uUouamJDSvTdEdZx
	 FXSh39oq6cswg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393925cb1baso39463861fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 23:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dcwJBcfWAZLxbOK0Yj4KCaMVqvuEStlnwATcNyVQ1wQKoyKTNyXP842CXPgCxf3c4OTdOo3RiLtSgdIRViNNSZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9Gft5X/Zf8u0c1WKdngmqXgQQs8vWgUPxWvyOlKulohwjJ7E
	FrlEHB6rqGbKKmUoYt0JI4syTKLzhT1l4HXSQICSNQgvYtdqG9YfnDmyXE+kmr/JlB9omRgzi3x
	ZusZqkT8m7KihKVNZq0fLo5D0U0q9SBU=
X-Received: by 2002:a05:651c:4105:b0:383:7f85:8eef with SMTP id
 38308e7fff4ca-393c4322c46mr5819051fa.29.1778050755563; Tue, 05 May 2026
 23:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423094452.32665-1-tzimmermann@suse.de> <20260423094452.32665-6-tzimmermann@suse.de>
In-Reply-To: <20260423094452.32665-6-tzimmermann@suse.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 6 May 2026 14:59:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v647JoUuNC_SLkm+wuBRAG=mTJJMu64cnFQHiY7w0of5-g@mail.gmail.com>
X-Gm-Features: AVHnY4JlVYdDeg3_jd87Ba7znQvGv9Y-bpIBk7Ufd1RBDiuOlf3UDCo4TI4b6Gs
Message-ID: <CAGb2v647JoUuNC_SLkm+wuBRAG=mTJJMu64cnFQHiY7w0of5-g@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/exynos: Make exynos_drm_framebuffer_init() an
 internal interface
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 5:45=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The only caller of exynos_drm_framebuffer_init() is the helper
> exynos_user_fb_create() from the same source file. Declare the
> former as static.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fb.h | 7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.c
> index ab0e0c74ec47..66dec2b7a5de 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -55,7 +55,7 @@ static const struct drm_framebuffer_funcs exynos_drm_fb=
_funcs =3D {
>         .create_handle  =3D drm_gem_fb_create_handle,
>  };
>
> -struct drm_framebuffer *
> +static struct drm_framebuffer *
>  exynos_drm_framebuffer_init(struct drm_device *dev,
>                             const struct drm_format_info *info,
>                             const struct drm_mode_fb_cmd2 *mode_cmd,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.h
> index fdc6cb40cc9c..aeb6f29eb167 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
> @@ -12,13 +12,6 @@
>
>  #include "exynos_drm_gem.h"

Nit: you could move the include statement to exynos_drm_fb.c as well.

> -struct drm_framebuffer *
> -exynos_drm_framebuffer_init(struct drm_device *dev,
> -                           const struct drm_format_info *info,
> -                           const struct drm_mode_fb_cmd2 *mode_cmd,
> -                           struct exynos_drm_gem **exynos_gem,
> -                           int count);
> -
>  dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)=
;
>
>  void exynos_drm_mode_config_init(struct drm_device *dev);
> --
> 2.53.0
>
