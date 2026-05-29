Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411233A9C4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041305; cv=none; b=iNAlaxMzomk16z4U1NKJtaLtOOsIBVHUuJtlrA6eKoOVcq/JQRdczrWakzNgf2AQJVBticLHav6x1rRMKREVHmb89a0/UssvdhzFhjGtwIqaFUdo5KpezblU9C4kOvlq2FSvMevhP7kX7s68MBtI1tvEi18JOedWp9BCrGFT/X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041305; c=relaxed/simple;
	bh=RkS7WzdVXZTKNqv2HuQwFG3ciFYmigOpDjNSH5EoriI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRwqPrmus5BbfYM+v0cMUlV0WJqE/uFpk7ZXUWWXKUsCoM8Z5JDmnDWtaNOsNZz3g1kUd6viKl2KuyBRC6CSpymEAOm9Gomh5ZM2vuYRWef8UCjEjIxI+EdRorlIP/DyPApw/qaeTxmTaMSPHZtM7k0G4JaJzFWPirMYl0YAhqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A2X0b66f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A2X0b66f"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4904127c32cso46192465e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780041301; x=1780646101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwrPCj2IqJEcRJugk6Ecz2xdcmK5e89mwdODai47RFE=;
        b=A2X0b66f2auNExa6ecfSSnPqJ/K9Rdknaol/P4/XVGqh2a81HKWwYAy9pkmvIHYdQr
         nbGSuvxvphfQwOLXIEd5qwVGT1MUwa3UY++v+Req/ml7mTausk6zpveVLKt2jm88KxWm
         9SkD/By/2ESECbESTmLPTMoStSPzDhaoa0o2LD6loDPuc2KXf5FR2k5VqQd1Xg1YYbtS
         gwawovJsFTMm4DGpQ1EYYUlEMApcu21CM/ARIu8soNhIv/ISbmiSxeSMHbFmaTXocT/B
         fMTELZN1fMDJRpc65sQTFWvp2ijkVStAZzY4or6k8Bh+gnpEL0l8dF6GBcyD/570foXu
         cphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041301; x=1780646101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwrPCj2IqJEcRJugk6Ecz2xdcmK5e89mwdODai47RFE=;
        b=nL/0q4QaRgmlmUe6O5s9h5ej3Np9euCFTDdmwgddjTXPtHGZrf5f87uRpTvzXw0L1q
         reMQCCiV6PpaKN4rwKroEX+F93O76jhChPmjLcz1dYeTZ8OwYjLPXcN5MoYOCYKlbhMJ
         r4DwA4DbWbj493rpLIPtGVutBG5Py2eFUW+zgg+brHdaXuBpHgVHW/VuSqtvJNWgXvmT
         DyyNEt5SYMAmp3Zk3hUrX9tWPNN4bFZYvXb31pleSsDueGSLO+AQZ0z01b8OsjfsEHiB
         VVz/s5/Lt60XR0JSjhhwEv0TWaDmIFp61+41On6K4ZB1Y7jjcpiG+stWKo386YkNTGaC
         iEAg==
X-Forwarded-Encrypted: i=1; AFNElJ8GswjcZdKBMSQKR43YdfA8zelNGL4iI9rCtKCLYEJIlNyntjLiJMualuEY1fj1oZ/WvUaY5CKnBW/bzvyAdgVkcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUhNq4cq+OW+DB5Em5p2K/3gbhlf6hNyH3NgB6kX0YbcqqDB+C
	rW0/6F5Java8mi11d4+I23cPb+aSysr+6k5RyTDNr17vdK31f9qeynGZ1FA7XS70X7w=
X-Gm-Gg: Acq92OGxyp9X+xefrWP3knotWWeBxxGhQ996w0qoYNoPPjVFd9G3CZpbEbjVMdwKlF9
	71H8ekT+HrRmdHYDrcq3xVie574xSZp6NiAEFcRsIZlpWKx2UDLMSsZAt+9rpIMGEHr/Gz3fhqW
	53VLUQgUi3ZNMSmYkmSNMfbBdkGoYaFws+4TcGXCczWvA0gOblI5MpFqqqPvskK1jfdwa95hzIV
	tlVDO0V5+Q44KSj2AZvrad8nWy/gWylwzAPgF+pxLOnCWhDQ4PUBRhf5NTQhUyp8IeME7UMh+8A
	IUgiy6hVWC2TqANT2imzspi4HxB/Ib32MfSXYKrs16fCKBl+0Qq9S88Mrf7B3BAtuROn9KVdHSq
	czJmfoIG1UKqTlKty9JK/47S2wFq3hteaEcvH1MlDrAPOgHauUZ91AqkwSkI3josSP0oo9Qxesh
	/rMpCOWQycEvkCP2H9hSalc1SVW7JhY3v1eBIVDt3CYnj5+9lbXTquJwi5AjPXDLpCPpYglNP2Z
	WUDfjOtD3UNNhqcwD8mrdnv1H9ALtjIefS2
X-Received: by 2002:a05:600c:4504:b0:48f:be94:d82c with SMTP id 5b1f17b1804b1-4909c0b33fcmr30600785e9.19.1780041300797;
        Fri, 29 May 2026 00:55:00 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909ca65f54sm27221465e9.5.2026.05.29.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:55:00 -0700 (PDT)
Date: Fri, 29 May 2026 09:54:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: fix size_t format string
Message-ID: <ahlFfp-kIqpdPGZd@monoceros>
References: <20260527194525.45762-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jnujdylfqv2kbd66"
Content-Disposition: inline
In-Reply-To: <20260527194525.45762-1-arnd@kernel.org>


--jnujdylfqv2kbd66
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/exynos: fix size_t format string
MIME-Version: 1.0

Hello,

On Wed, May 27, 2026 at 09:45:07PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The exynos_gem->base.size argument is a size_t rather than an
> unsigned long, so adapt the printk() format string accordingly:
>=20
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
>=20
> The dma_addr in the same line is already printed using a cast
> to unsigned long, so change that similarly to use the correct
> %pad format.
>=20
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 297a93b087cd..8e357f2beb9e 100644
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
> +	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);

Inconsistent formatting. The first hunk used dma_addr(%pad), the second
adds "0x". Chen-Yu Tsai's patch[1] was better in that regard.

Best regards
Uwe

[1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.org/

--jnujdylfqv2kbd66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoZRlAACgkQj4D7WH0S
/k4uLAf8CDNBSWkI/8nW1u/hhrBYD4t2URn0LO0re8mpGRHjxAyA2ted0Ag3jvDa
8F55jr1ySezFOkOTycAdA+yW6AiferDGR6YbeeJURQtgw6/OR0QQ/iHO+PC2ZyjC
9q6ls8fHy2K99TM2nwUh2SjbucVfCUhCXYL8iK88guLXcWdOfAyFJMT5Q1iQEhAU
qW8lFER+hwe6VMeTZQk5CyqPhsUcYz0Pt+qVkGs3hOBbIL505NlsnPzSDgsE6kC/
GnmGyW63GGoVoyA6J1C6ybt/geR4ilr12gm+rZqKDU9Wydfwz/kfmA3sc5JzWVZT
xF6rNWt7febUyDzSmbvzndFdKi1DcA==
=vHrt
-----END PGP SIGNATURE-----

--jnujdylfqv2kbd66--
