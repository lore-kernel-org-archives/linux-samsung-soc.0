Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC435F178
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915798; cv=pass; b=ryCm7hL5ocSYIzXENx0/tJCTEF2phyA+rbKbYHKAxte/AYPcSqfy7Wm9UpYYEfXxGH0oRC46JxNVOpOSJoBJ1vTW/xIVwiGU42A1QYO0mAYBCngoqF1phmACfK21EmKIiqmr97N+9jJ8ua8sWx234l4659wWnihed7qPfPdD0jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915798; c=relaxed/simple;
	bh=EjIgRFyNNXPe9BBnAQomjdODA72YnkvuLOdmUBXq2LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeGXHkMOrt9BMfUxsU8FJzK1GagCny/GZeZ8SN1XJyt19GEoPV0zOEGPJ3ZOdgYjLGHCGuxucvYWyBGroj+qzJYXP+yBnZiE3AYBDatAqGEZaQaYt3enSNz/YsoaI5uokC7AYlf57OPEjSqNMNtYCMt7qAgNoIMReQT22lKuciI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TgWxpnMW; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TgWxpnMW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8dc2606a0so12179942e87.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 14:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779915794; cv=none;
        d=google.com; s=arc-20240605;
        b=VUjnJ40vJjUOdUzruAgpg2TycDXYb05NkaP14W6fGm1knEUPTwZsga0o97zkI/dviU
         Vjd3xG8jH9YhzNT1ediUC21gbxj2PosWBn/+yQuilzYEtc9KFR3oe3dLujxaP5AJXbXa
         f3uahlm0l7DlRSxWKT2RzwuTsQJ0ZT2ww7DtPG+cVrk4zMfRfCKYbKuZavrI6S0bE2jD
         RdPtB5cGNF/9YUdCpu47PJlgvYZJ0mB/wHcA0Iji5NhqQtLCZroMN/ds8rHz9EzmrM7x
         +r4CZ3FxjSaGeAgtJBLVow/45XJtCXZ2+lqRGcT368gagLlfF6UDTp+/KQ2reVO8VtFB
         1K1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=;
        fh=qGfBn1uxZPmWsI3vHNLCVFbchTl4CMJDaC+B/Z6ukqA=;
        b=NNv+XIFEEZrPlpkOBsBUeMAzeAFCY2WBvC+Q3sDfvlCf+RQZZCOnG0m10AtIfyAnCk
         UdrFhgg0jm8nwpHKI269YkQR7Qoe1EqEpDltygmhKcwJuWYfLJzsI11VgDzXM9E0sYEy
         eDeLZQ3b2FZdy59W+CnjsDMY4QI7d1hQYT4bVoJykxG0HyNIOEberE77lDLwuj+Bxtkz
         eYiOn2JxlFb1qniUFUtlVRXnhTHXIszJoGpVVV2vR71GCYtphfCDZ7TCIPytxk+rycRK
         YPiSr7WWyfWlts+7WsPGpNGafi/xPMt3UUTsVSWtSHwqZlGBSGC6aD7IjVq2AlkbQlEy
         xEZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779915794; x=1780520594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=;
        b=TgWxpnMWI01uQ4npYbt12O90YH/pRRAR6PM72leAxlhbgQ0umE4b/k0N5lZybyMJdr
         OR5+BFi7Tzo8CJ6zdSZcGZ9UofYDo86Cm6b0jkyVdLJ/z/F1ksyPP8j6zZdlESd0FFVt
         c/6FftAJoh27vvh7HxlE+luhG+bMRd10Tm4a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915794; x=1780520594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=;
        b=kwSjjwGB3X9Qi+sHPCzY46+7SoDLcQvBcti3WObgkflUss2l7Vmr+z01CVRfvjvwNf
         +eXbuPRvPwnb5bCMfwIMVKRPPyji6VkDjOvOFkquhbN7HaM7T8za8oGIYoSfbmdmihYM
         K4/5OxkxRfRRUl5Wrju8SiKKOlp4zN+wLCk284dEALhiZz4Q4gGg3DwiLdNptTGyns7S
         +GYXO5UdknqMsEBRGbDtSw0wEf/mIRGzyJn2jFUfFW89bcuzI7lgfSkZZx3Sf1vYNT67
         WowTI9eK0RYpK6JtG9wk2agpYUi4uKfZuOcr+Y0r1KVrI6NIYqVyQYZtOy1K+Y4y96fH
         IZEA==
X-Forwarded-Encrypted: i=1; AFNElJ/FFs7S6wfzHuC8/rOxROXAhXJuPMZBm72V4J9uS8laHZw2UNCPjRAjBKMDUp/2gOV7dA6wR+6NrOEAsV1LG2LbmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0mmLls7RzUXuJyg9qi2hrpF/ivvXWp221M8OHqidsUQoPPeo
	RQrKN4xLiII5FAtGV1TsLk32Kuk8kgotz8RNUC4IByAOQVW0bIh4YiM3ypDKht8VP/KC6ubmKyO
	O+Nz3yHmrnVv5B578Zs+E6ZC4wSNMpLqUIXY3JjGK
X-Gm-Gg: Acq92OFo0pEAH9uMkwYtYNEZy5yqoskr3meYB+eNLHa1p7FiUVMzp3io37+X7DMLphT
	8JeW6ch/2FVp99vfWabJooq7TeMivB7k8JGWnGC/lrqk+lzm0ucv4enzUhV8WPF4bPljv5VaoV0
	zrf6nPKpHoxYvcPZ046Rf4vgYN5nRoNfwL8pSS/4xyDcQfAFv7Iy+ddAdzYXyf7KtqDkK7uwU/o
	51ZUdwYtYNK8zlgrywV3y2adwZY+hNjY3DVSuLTqbbAZyx6pCv0qp0KrHPxN4u8lzREd5w8tU4h
	twjlFC7G8/Bvh721Kg==
X-Received: by 2002:a05:6512:1243:b0:5aa:116c:4127 with SMTP id
 2adb3069b0e04-5aa323a9065mr8608773e87.41.1779915794436; Wed, 27 May 2026
 14:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527194525.45762-1-arnd@kernel.org>
In-Reply-To: <20260527194525.45762-1-arnd@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:03:03 +0200
X-Gm-Features: AVHnY4LRzDDBlNjN91IVgQeLtIl2oIQHuVQ0PjzTLkjbwtceKRBrVHRW4l0ArGU
Message-ID: <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix size_t format string
To: Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 9:45=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The exynos_gem->base.size argument is a size_t rather than an
> unsigned long, so adapt the printk() format string accordingly:
>
> In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_bu=
f':
> drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expect=
s argument of type 'long unsigned int', but argument 6 has type 'size_t' {a=
ka 'unsigned int'} [-Werror=3Dformat=3D]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx),=
 size(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr, exyn=
os_gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
>
> The dma_addr in the same line is already printed using a cast
> to unsigned long, so change that similarly to use the correct
> %pad format.
>
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I posted the same patch [1] one and a half months ago when the culprit
patch was queued up and I got a report about this from the bots.

Inki hasn't picked up my fix yet.

And it seems the exynos-drm-next stuff was only merged into drm-next
yesterday, now causing the warnings to pop up all over.

ChenYu

[1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.org=
/

> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 297a93b087cd..8e357f2beb9e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *=
exynos_gem, bool kvmap)
>         if (kvmap)
>                 exynos_gem->kvaddr =3D exynos_gem->cookie;
>
> -       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x=
%lx)\n",
> -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->=
base.size);
> +       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%=
zx)\n",
> +                         &exynos_gem->dma_addr, exynos_gem->base.size);
>         return 0;
>  }
>
> @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *=
exynos_gem)
>                 return;
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->=
base.size);
> +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> +                         &exynos_gem->dma_addr, exynos_gem->base.size);
>
>         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exyno=
s_gem->cookie,
>                         (dma_addr_t)exynos_gem->dma_addr,
> --
> 2.39.5
>
