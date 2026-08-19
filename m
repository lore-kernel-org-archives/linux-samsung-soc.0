Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190B2FFF90
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143899; cv=pass; b=nmh5Q9ZTBjlK5kI8thT33CqlgNsUiwDSOR/gq5vGPjePxSX4pHGUTr1EC9WBNNK8QyDeV+oruHITVbkH1/UTsC5FeeONDDnU9bUwxVXvKXAaHZcgOD68GWK5XD7aI2yqI9uKoy2Jeh+QvxTn2FGtmzwCyQ6rWewNtgw7rSOpd8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143899; c=relaxed/simple;
	bh=EjJrwHCol5OOGyWPDEykJ8H8IZKU6aQibgJTG3NN9OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrKGShT/hYg6VNRSv0y2B1RnTvdEk4DEH0b6AhdpzWDys/yq3qbF7zUDfXW9f9HKQLGuwsphDyudnLkk+Cz1uYgKKtJit4eV8FuSVjMu2IUQf+gwy6YBvJV0Dq9pF/OWU4rnzWF9i0A1eB1PmTQ2qt5/g+0fcv1AnV90YSP5cjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpTWB6Za; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpTWB6Za"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966eabad303so251951241.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 05:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787143896; cv=none;
        d=google.com; s=arc-20260327;
        b=d5nRCQL5AbYjDWgakeMEPSVvxT1QXpPS8P7EQzLU7Utv1IQ2Je0ftqrQ0OlL16dwVt
         LgG4N7+fD8Jrrzyc+1nT33kA1KrZOc4nX2Dr8mp71WV6kFahyKYhjDb7x00sNmUGxOLM
         uI6T06SrhaTnxtPmWVQOaHVsA5x/bErAR4NlZJMftBqLpljgQT7X8t4DxBKEZI+fAceC
         PAgDcs0CCVEzKPuEJsaFv/Ph+YK00iSZNDZQBGRTjf57gaF941yos2+8msNAPj2C/Ia7
         GXnYBcFnyVXqBcxyG7Rlqp/o/X82HRKPS/XkCziihGuUvMxlmXzUUMEWfUuMn4LXTvoU
         kBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=;
        fh=sK+KC/KLBZBN5Ms5B77UmE01HQXbvRtTaGcFUO3s+yk=;
        b=myZI4TEouHhmPdQ6aFEyGaJSsw4hQLF2XaJcsMy658sI/OHFE0Gt6VQZp6Pj8yxgYN
         AEpiIpza4xCQdx0RIR7G7RwSn/ctbA7iPXSnCef4RnHNHGp9cKZJjUn+zYItzaFQbJd+
         4u7keuG19+vrJe4GL8mnNZRlSGSgowJI1ekefCrnA79VkKxGO5QZlBLO4h0iT9j/lYbp
         Zy9xksa2mtYIB4gaw8XpWWRwmmK4c+sXwwLWgx0WwuWJTfIKnw2VAZgI9kfIlJSCeJUI
         DjFvrskCR82R/cJLKyGBce2TkNyI1xqsQFs2Dt0uP4y9wLLE577OmKxDcrWQWG/6joi4
         CVug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787143896; x=1787748696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=;
        b=XpTWB6ZafGMX2za6DeULcKkHo4glBdZxlqUpjg+AkZ+QYoEl09JIdONxS9/ogRCLwS
         QOrbDvqiwipNiJsI9S8LzFCMb0wm8m2YSzyPxKSZlH8U4mqbbephxyYdW2Y6xcpAzVCQ
         UY9Eb33j1UZyBxCkpneXOsQv8xmgh9RoZ2TrH83ryUOFtydqw24yqP3ZW5IQawv7BUYN
         Ke7GP8ADEGj9Emp9tmCTywoahu6xK9RmbnBoqQLz2VcAgX0IsFjuWf9ETIIP8lrR18jo
         PbAIpCsX6jV5JrL6ouL3ROpN0/uhsj4+2AyJtMjZqlSI0MsD1dfJ0tWUnpW1Uo/Sitdu
         71Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143896; x=1787748696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=;
        b=NBce2bS3wJD3DGIvGOZbEmc9Wkc2WJ6cI+1e35zpDd/RWv3H4R+j1N5n9Rri+G+1+J
         IH04QlPeyqDsLVWgOO0Kd2rIRrjSTu7QjY2F5Td3elgcBbyQ5Tf8vOBw1UmXkFebj+bd
         JFU9PXzxzOdoVFBL1sX1ttrmip3n3ts4njTl9pjiLmBdAD9d17R4xiD5ApDHk8+mns0M
         /G+LrVZwg7a98UK8D/0qYQ5vXxHE01hAWk2xvUsY4d5jrxLJCqKgyHyj9KSS9mqsZgTl
         NKOCHpdY3D1liahCTN2spKZn5JOIEQH9pSwCBB4vr6nEvpnN0R2BOVqlNW9S0Q1q+1xU
         WRvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGfOLzFVqUBrVl/Xb3EQM3fPP5xJRkpSHaXeRXd+6eUVKwpBWFRjHWoAm/DnYIHq2ightfFS9COV6K+y0fOQu5TA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+U8jdva7Hj83YuEjs2aqn0aX9txJ7hH3YSj9xPZ190H9Nrzyc
	AnUQGMUjDdtml0f43j+Kh3LHI/p681iRjbtAQ0qyuEKSrJJL/g3FKtkGUjDLfwhE4I22UHGOS+v
	OW+xcNZaXCtFZfmJfaAVswSniNtSH3pE=
X-Gm-Gg: AR+sD12QMNaO/AZTaA8+wMeulFhGw6Uhb0Lqn4KNEn5YPMCmLOg55gtlzGGwmtxX+Af
	yUtH2uxCmtGCdX4IIgYvnBimMZFqRSWFPmkSOBLJLBuJHt5zd2vxDLdlPr38G7znkLpWliZmiRb
	dPipmXvhbf2/toOg/nglgcGQ5Wd1Ewr0H744D8xXPZT/AVxcIom2HcVtcVpmobbw+kpNiverkeF
	oky62N8vU2u0X2Uu2UNMjTiK+YwF2FSywLfx+gCpMdMcfLXGL1eoyIXg8kmaplzOT7G/dXrn0f8
	cuosom5FX/Q/39aTTZ4cgoVllAg+NY/41HxY0g6qJvPWIt+0oVUK57bQ/Dg6E17Wx/TNOe8/hYI
	=
X-Received: by 2002:a05:6102:e0c:b0:778:5369:763d with SMTP id
 ada2fe7eead31-778536977cfmr777017137.1.1787143896490; Wed, 19 Aug 2026
 05:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705110221.153481-1-mdshahid03@gmail.com>
In-Reply-To: <20260705110221.153481-1-mdshahid03@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Aug 2026 21:50:57 +0900
X-Gm-Features: AcwNN1WZpgbj7Xmht22CXRTxKba8QfE40w5PRb6wQWHMVVHwKvxFfX4oKRnrA9U
Message-ID: <CAAQKjZMKWDqbq+onK9JHejecie0Nh33WQ+rUBa=_0pc50FZU1w@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc()
 and copy_from_user()
To: mdshahid03@gmail.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for being late.

2026=EB=85=84 7=EC=9B=94 5=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 8:02, <m=
dshahid03@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Mohammad Shahid <mdshahid03@gmail.com>
>
> Use memdup_user() to replace the open-coded kmalloc() and
> copy_from_user() sequence.
>
> This simplifies the code while preserving the existing behavior.
>
> This issue was reported by memdup_user.cocci.
>
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/e=
xynos/exynos_drm_vidi.c
> index 67bbf9b8bc0e..183671de711e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -273,14 +273,9 @@ int vidi_connection_ioctl(struct drm_device *drm_dev=
, void *data,
>
>                 size =3D (hdr.extensions + 1) * EDID_LENGTH;
>
> -               edid_buf =3D kmalloc(size, GFP_KERNEL);
> -               if (!edid_buf)
> -                       return -ENOMEM;
> -
> -               if (copy_from_user(edid_buf, edid_userptr, size)) {
> -                       kfree(edid_buf);
> -                       return -EFAULT;
> -               }
> +               edid_buf =3D memdup_user(edid_userptr, size);
> +               if (IS_ERR(edid_buf))
> +                       return PTR_ERR(edid_buf);

exynos_drm_vidi.c does not include <linux/string.h>, where
memdup_user() is declared. It only builds today because the header is
pulled in transitively. You would add the include explicitly.

This is a trivial thing so I can handle it.

 Merged. Thanks,
Inki Dae

>
>                 drm_edid =3D drm_edid_alloc(edid_buf, size);
>                 kfree(edid_buf);
> --
> 2.43.0
>
>
