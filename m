Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31342857C7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861319; cv=none; b=MNyJQw9f8fe9LEcRNZEkjou+Iy/bSA++/LM9CU8VoxF6CoC04EVxsTkxlvzkiRDmZLCCrrZMe+ncIpqxOWUFKCaQEwUu0Cef6qyDHLHbxV69bDOd4QKjdaiuh0mGdyQEI8YbxbBu9B+cfCYpCpI/xK3lwozM4QktApklnsN9acg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861319; c=relaxed/simple;
	bh=A/qIWFBkRC5u64F37HPk9LuwjC3hvCa9vnJTMMZhOqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqIegjwHFI3pHu5zS5iRZmwjb32Q/otlHjBtqSjGJOM85V/rtOKrFpLLvg8zyGgQLopGFZyMfbKp4HouVjnH3K9JaBqo7BvRdK9xWepbOUcg85wDrunB3UUopYIjZYCG+PAHyX9ddzn7qrzyoschChI0MWGwFSces0x8DJsGmbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pkk88GZl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pkk88GZl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so82111525e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779861314; x=1780466114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c50mz8/OMleInqbX4ArLESamRXgTiGj9hU87miF2NLk=;
        b=pkk88GZlCMsjz9XufNLv62jmjuwaDlr9VoYcIebZr87dGUKhAbgEHDvdXvrjI/deEN
         bZsfVEEaTKs0Q6WuiYpEKwyZaz1q2lKI4povTjs9f6p6Yjc70C+U+nwTyAUQd+iAd10Q
         +f8mNKHO4stvZQWltqt1L4pMwUUpoiZ2trbm1ElTlbkrPjLfxh4O/MZ9/ppi+QGjMtZK
         dgu6UGRM56XRRMjlJ6UI+AJc2ZWiwOaZ8Z1WPjHtXau69NkuWHpYyJubLzeTozAovDva
         ifoWBc8p0bp/SXOThg2EHQ/Izon4mH6DWzjJHU5VkdELG6Ndge4gZgW8rHw0LeWjnJEt
         Tppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861314; x=1780466114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50mz8/OMleInqbX4ArLESamRXgTiGj9hU87miF2NLk=;
        b=tK2ou2tityjw3BlvCQyZeY1/NE2ECn859hk8t6byBEMMWYMA8QWlpSds88tHQIffhe
         rHVkTk9hk7Gc24bR0Gl53VN48YZkHbgi6U/jQzm6DLEsjGC1lEGgQ70TwWNoovmrBzr8
         rCpi1aCPegYZU0CWSMehRLE+89LoCls4AjTZIhJvcJqC0GqgYXEfc7efjK7EIdKWZ1Y2
         5t1/y4pveNoE1mfmv7xwgrKBOkbV6DwUtu/zqTYcqTSiYv+0KIPtaXkNNdb9gzmywFlc
         oVBLhtEQt2sC+CONAh1nPjY5bYuYnncJhtaxcRjyPbPCJSllXA+TmZH6spg7EOt+1KA0
         Ikqw==
X-Forwarded-Encrypted: i=1; AFNElJ/khE44dnHJSZF4trQtbU0U/2Z5Hd7jtE83PMlwes3pGNZe5CScVOMV12tnNm1aAaS7zVE0/l1SxxkDDYkjgHW2aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNIcgbFUatlxNqjz65LvM8+5VDxunReVA1q0hXYAaIHZCSZQ+
	uhJO4ztQS/3ezQCdpjPvkP6zF1QGdPMfVeJT5OyLxld7Mp8gcua6ecIr6Slgi+Y3mQY=
X-Gm-Gg: Acq92OFXr2I0RB6qPywVM3tIUZbucZAFpahWWIgIUSEiWfpa5s1gnUUR5VaaXztBVNg
	dThNrKxTvjH1m7G5AwYp8mHTKuOZ3zYAc+qYymSlFDh3VYmhD1f2iknR+D4UheAw8cwYm37NJcY
	NEsETVN2yAJZy4b966BVDuU+Yw2AbtSpTYWmeCoQvHFUFmLtUTG1Am6q3ttD3HD6pgpLb01a0UY
	c+eHfrO4yw7Dz3Mw8wvoBaIyhly+4CN4Xzk/4dWspUkO95MMa4vqj2TEwBl9PFw6N6jc5OpzM1o
	iSys72DzGLS8iZBDucu24a08VKZK++WmdKQiNdfZhVd/LrrgSnLttOO6Cxcz5ILbOmSiMAZZJgm
	dzUGnjdiY4iuYQo2gZT7ywAoD0Hrcy7HwX0QKlxrZcKPU2/f4Rd155kuTNtMz3wIdTuBEPRd8TA
	OQ/cwufDo75/Ro3kcbftYufQq5CkFdxVTbcLE+iM3lUiYrXN7hguH/v9IUq8Hus0nrTA2p3RkH/
	3s9/Jn51hT6sxc=
X-Received: by 2002:a05:600c:8599:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490424acb4cmr286306315e9.8.1779861313464;
        Tue, 26 May 2026 22:55:13 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4907e69dc39sm11042195e9.4.2026.05.26.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:55:12 -0700 (PDT)
Date: Wed, 27 May 2026 07:55:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/exynos/gem: Fix printk specifier for gem_object.size
 and dma_addr
Message-ID: <ahaGfhW81fcW7h2u@monoceros>
References: <20260408064936.1342321-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="matup4lkrscj23am"
Content-Disposition: inline
In-Reply-To: <20260408064936.1342321-1-wenst@chromium.org>


--matup4lkrscj23am
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/exynos/gem: Fix printk specifier for gem_object.size
 and dma_addr
MIME-Version: 1.0

On Wed, Apr 08, 2026 at 02:49:34PM +0800, Chen-Yu Tsai wrote:
> In the recent change to use the GEM base object's size field instead of
> the exynos_gem object's additional field, the printk format was not
> adjusted for the change to size_t type. This causes a new warning on
> platforms on which size_t is not unsigned long.
>=20
> Fix this by using the correct "%zx" type.
>=20
> While at it, fix the specifier for dma_addr so that the cast to unsigned
> long is not longer needed.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604081331.jSJQSVmg-lkp@i=
ntel.com/
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is only compile tested. Build for ARM 32-bit confirms the warning
> is fixed. Sorry for the noise.
>=20
> The commit hash used in the Fixes tag is the current one seen in
> exynos-drm-next.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index d9d42809a1a9..f264e170bc26 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *=
exynos_gem, bool kvmap)
>  	if (kvmap)
>  		exynos_gem->kvaddr =3D exynos_gem->cookie;
> =20
> -	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n=
",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
>  	return 0;
>  }
> =20
> @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *=
exynos_gem)
>  		return;
>  	}
> =20
> -	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
> =20
>  	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem-=
>cookie,
>  			(dma_addr_t)exynos_gem->dma_addr,

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Still fixes a build warning in s390 allmodconfig builds as of
next-20260527. I can haz this patch applied please?

Best regards
Uwe

--matup4lkrscj23am
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoWhzwACgkQj4D7WH0S
/k4YJAf/Sa0klbijQQ3e2afYyNHdRBpeOnuHnt7DkXbXMETQbXPOVvHKTlQXDYOk
j8FttwSGQyKq70nn3di59M5IaFgKtvg4ZH+9ZdN86PBdvz1vYjE8YOKpPQo1NvaU
u71+tkIZr10dm4lqwrFQOLz9wKtVpGWcwLOJOx35dE4AhqDZ2t7d4qF9aX2E+M5K
nSCcuxYGYW9PQ3JOqjhP2DYAkFspPYKTF8ekZiEoPBxYQI8AQtzanH5urgTL5yPD
MMLOIYjAeD1LxDUfUx6uxATzDvYTSAA0ZG8iuOIAALaYa5j3M0GlQGeOZotyr9Pi
NWZH725YiRLgpEpNRqbc5hhIji3Eaw==
=AuW5
-----END PGP SIGNATURE-----

--matup4lkrscj23am--
