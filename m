Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CF1F3FED
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2026 05:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774590256; cv=pass; b=dCga0/oZrroQyC8vf4pG55OsmdZExfKmpS+YxJAcArMu9wM3zRbHejAwORmh1uDMBtTy/epr1skzDL/JeMHUZnh8r6owhYMFRVd8FpEIo0ih6ZQgcX2EKj7XpGDn9ELNLV1jGDpbFy82Eo3b6KoQtsGlYlbQ8zzUNPb1xdAsArA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774590256; c=relaxed/simple;
	bh=8RK1T++eGDo44pfAsFeCc9ygxXLTrYUPd5f3lemslCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOYYAIKKfp+Z5Koiyjwq8WRizEurlanjrCC/kW9bOJz9qbqQykwrQiO2EiYPFoGxI+dXcOgAcb2WbZDvDogYTexdr9utJRY/u+GX72vjk2S2Ja9Aub0bsleHf2EFCPEDxD+PjU9D8uw/wV5LiFyLRB034tVLxQa5a/8CmRQklOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RLuoPXTg; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RLuoPXTg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so2286617e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 22:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774590252; cv=none;
        d=google.com; s=arc-20240605;
        b=WvjRUrW1J/SaLmYCBMCQHRm6rtO7grnBnc9u2w+N2aGSnNiTPMzT4/ZpmZHFiCfNay
         w4yC0rZr9KLPCW7qPnQ+cUkXLsSjygchxlWgt4/gL+LeXZbGcM9o+5Vl3yoGekZ+Il6X
         4Wtya73ofT/D7Yb1+s8JDmxHyHKjnzAqPb+8+OantE28/hpentsQ5smPA+wYKiMqLL5W
         T5+DkblRyFlIUI/s76CszQp+C7IW06ZcjEZdRxSZXbvxWU7rp9FgsZxh9Ro3x5SHnwkF
         S4xy25QpllrplHAfuWjYZvcWxlyQuUnJ//vDQJzyXWfzRkN0lP28lhhLdH6z1Ow7Q7w6
         kKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=;
        fh=+4dXeS6Htk7Seyn37nK8Ki7JN7IAUnQviXnhlVxY+c0=;
        b=K7szzzZlAAMfrNRzKAerUI5SHJcXPvJETJf5zBhfp+ZxF9yfHjAZk3j+KqLwGIoz5A
         /Kl53l1GIYBbyjdAj6jzVpxgaghPGrx5rA3pinJPF4rZV3ir5GLmdhBghvQSVjSeksAk
         TXu8hFEnojaU1iSjnXzNPz/siK+n8/v8erHYN/ISO1ccBobIXg1+xzAeX0tMfldQiM/r
         6nziX8bBiuZUvqBuwCsemCEUeLhhtR21w+YhV5us7gvVRg7lj6CX0RMFcbreL7FgQnvZ
         M6rHGzBid6kYecs1hM3QeY3Y2wtu/SbggjwGcsY+9DJT4qhksQ+MhK+wA9C+stR0Pw8h
         0q1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774590252; x=1775195052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=;
        b=RLuoPXTgiP3M6lMA7SBXA+OAC6QIHXBD2Kk9tpBxMMHLqN2oszfa0ceWe9koxqtymi
         M9EphK6BYY2etjLWZauIjdbWQm/IVYG9TzfhedOwKn5E43E9KIWldE8w4WH/28D5iKiM
         C8iFRFRz9agEgVa5nK415EDSWAu6bPD3Bs6TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774590252; x=1775195052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55gQ8UIqNu/4Lu8sOqkpH3txb+MxNaA75AvyR+3jJZk=;
        b=BHCBSvrnXpmnBRbWYrlfm4SU4lPqi+Dx5znVnHJ0VkihNnQvcgfaHuHa55vmraGFx3
         xElwmNIfrrnOrcxFOBsgMGvv2IREsFxtGKWEK54NWm+zEWasZWCcLER4E9uDsqsvH4KF
         QrSpxX0xMSPOojWm4vevAwI41U8jGgzH/Eaf99xLbfO0IGqdKGP6+uIJLY8c36fVtUFs
         3szhXINPshun5ecTHyqAFDUHjQ5RHlgX/oVCWIG3bunQrfwixP5c2CXJ+n92alxaH76a
         xjfppbasMkI7zekCTta7t4znXbnNiKx95o47Cb3pq8EZs4UxzvakMdZuuKas+4XpzC0w
         aYzg==
X-Forwarded-Encrypted: i=1; AJvYcCUMlaHWgXjjdAe1Np/30Dw0aJmFi0KjnrDoR8UtZ6srMVudIx/sCdvTjpEInPO6QbyfD0x7LImR8zeDiQnKwhm90g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNJwNbYEiagGqZhUC1Mx0fnmJErmkXd0/d3tcn+BdeTdDxsl9
	DBNMu82ZsJHCevvyRFy9BnhWGrOy/P2sakNeelZcRB7P4/OqD1QVtYPHocRI7pxCmW3hM27BNv+
	lbHteuPeh7x8pMUdtKVCDdmmtXAXdEJgIYzEcy1M1DHAdfBveDfM=
X-Gm-Gg: ATEYQzyEU/93EAqlFpqu+aAc1wEwZlRuyZqZ3O7J2AD4caAR3rbGnhXujrcgSJwr4Bf
	3PFtH7mM7rCsa5JCdKFpR/cSrD8h/WTZ/oJiMoKBHJfMHJnD41CqckRZqZQ1JzWtLsUiYPvzlwm
	grpEQgDAuRIndqJaJg1UGeVw2dkASb+MTVblA1cBWwUWU0jjuz5AM9ZJTIrXL9wpWHzSuztPOXt
	BKiVO9ujAEqGSK3Rhnkiv3QZirpG0h7RqIvzMs5F+hK2bKlczUSpdEY2lBFihNCvj5Kho0mn986
	tc44A5jh+2KZu2FofJwyJP/4TvD1wtfNvh1XZzlcDhe84K8f
X-Received: by 2002:a05:6512:2242:b0:5a2:a36f:3ef4 with SMTP id
 2adb3069b0e04-5a2ab928fe7mr379815e87.31.1774590252148; Thu, 26 Mar 2026
 22:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org>
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 27 Mar 2026 13:44:01 +0800
X-Gm-Features: AQROBzCaR6O-grRzEn_50j3NpZXhobkBat-wP0370vcp2B9JGLmH6YnTu6gaOu8
Message-ID: <CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/exynos: Random cleanups
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 5:43=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> Here are some cleanups for the exynos drm driver. This was done as part
> of the conversion of the driver to GEM DMA helpers. These patches have
> no dependency, unlike the actual conversion, so I am sending them
> separately for inclusion now.
>
> Please take a look.

I should add that these patches were only compile tested.

> Thanks
> ChenYu
>
> Chen-Yu Tsai (4):
>   drm/exynos: Internalize exynos_drm_gem_free_object()
>   drm/exynos: Use DRM core dedicated DMA device tracking facility
>   drm/exynos: Drop exynos_drm_gem.size field
>   drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES
>
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |  9 -----
>  drivers/gpu/drm/exynos/exynos_drm_fb.c  |  6 +--
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 13 ++++---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 50 +++++++++++--------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h |  8 ----
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.h |  4 +-
>  9 files changed, 41 insertions(+), 63 deletions(-)
>
> --
> 2.53.0.1018.g2bb0e51243-goog
>
