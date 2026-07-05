Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F95242D97
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jul 2026 06:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783232653; cv=pass; b=fGDXCrWY4AjayfcFsvS0w+0hIPGuH29qihBiVd2ot1OqpP9ISZukPjd9YyUEwyHgyH4YMCWusGkZIMazMIWb/UeVp8u8Su6EMt2V8SHXcnNK2vlMxSsNig0dcofJGrDJBVdVfiitwnJR26bcfnpzC8Qz7YXCCtmdn1XeVHZrvno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783232653; c=relaxed/simple;
	bh=jiqBlSu+2R2ZRFHLebF/Txe0bU+4uWJ/wgd6PGiZfOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcPnz4Wy4IBWQKm1QUcB4A+itQeYnp+cbcZi6tMkRRIDGseD3Oa/b0AnoGZBJ5WkTTmUSDw3t9Kqy5mnh7fq2WpffjfxURKWnHGP/FEyKC+LDybkzaVWWpBJ7SQt2qZWOa8G5fM/2mUYgW354Y3EOuFLcRNRYMrn/RN0kvYXrrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtFL/WuT; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtFL/WuT"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-725cf9a923aso1815628137.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Jul 2026 23:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783232651; cv=none;
        d=google.com; s=arc-20260327;
        b=hT1t8JIjs9BPkBKu4xCMjgpGV8SC0XkUSEpufhbAnMmJlwiYp+pMhI/xSv05/Ox0a/
         iUs82JR/hudaJR3HRktQbkEQOesmmWKF8bFZsuVYiwxU+HvsEJQuR7d3s5EwN4Ng9RNy
         G09FPvFEccRYCrfADC4mtoskIuOVWArdDkQOh2xZMVfiFn+mN1YNTHDkCZ/h/gC+O+YL
         76jb5FpEWboUsH06GITfy8XmQSEZcYxweqXBTT8UyDl8PUyvm9zfOyqPtWMkFV4Yeqez
         PmbWVPeas4naeMQMdlfMNMNy0pPedA/m0aCsFocyMDWDBXBjDrYbQ+EjmzezGjEG350+
         AUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=;
        fh=EMmcVDYKaVSMh+QpXSODYaPE2YFBOFOLzKBQ7a/7hy0=;
        b=Y2CxkAvb9m1NhJYFxmq1T66jjrCTPPNOB6VgdDXoLvZ+1NR9i/rO8/WQZPKA/iE7XN
         uzEaiyqI1YTrXjRFupPHvY4Nrp15F+eGD9ugJon+6V7W+eitDKPOUeQ0yzkewZkZxdwZ
         adeatHS5+yOFJXpsFWHTIn6RxX2TkO95WC5yBjTh6nm6QMTH6vRcbKbJ4mzOXZHEVVn+
         SW0FbgDS3Ki9Df4LJt/xtZ8qPAXPAL3NQWRmkFAsMq1aZbt9aKFuQUJJiKQJsynKd5LH
         Fe+wWv8tBI9GIeDKMqHr4iX0z1QQ5vZFsm9bKTox295nvS4ooLRTop3QhuKmG/bw4s6G
         UqNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783232651; x=1783837451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=;
        b=WtFL/WuT80YZ2VJLCi3tnQg3yyFTZ4ZB3+ydzuP0lOy2cT/RCbFrpOnHBrGQWExzwI
         z+tHj37rMfQrQIL6tB7kefm03tNrSETwO7jW5TGw/4Gkzk95WCN+3Iht4BBAWoJrSuvN
         N+hosrUQ5ka5fKlrxf2h4Y+yekl/wbuuTF33fcO5FsRUvN/cAjtDGJFn+hQllnUuwKYl
         f5oozFWq/d7aK6gtAsK7z5/dQNs6iuBIX3UMCKIQNwqjHkWHys18oUsIpkCaulqAL/lo
         zMT0t+2HlGcZQV5m9ofrJEy7vtqiIDWrZHmFK5Zhp7J865cAn+jwDn4/7WaMQi46zXVN
         VjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783232651; x=1783837451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cy2Jt6lny7j/yQ3c78NTqavzrjxuBgUkufs4x1Ayla0=;
        b=Uj/sttM03UeMFnpu7G0yD3PvlfExNrzzAAM5Bg49guQh3QYiBeCBxyMixLDs2Bg6iJ
         A7JZUMIz3XjjUVmBX0TrBzrScOB78mRb4M9zhBISPYrNTat3cyOKMB3cLDIXNeN5YI7b
         0ovOC/BbYHHTVqRExIUpsBAGfnwh/f7SU9vfBG7fQyspT0C5qF92+AAwC045KE9m5ct6
         W1+3bMCMDSN5XFzNCK0lcSEXfDOD5Rx+wgIyM7SXQ9ynKqhQA5/hhLjmtOhtkGja0Z5C
         S7fsrN2hiIATobxoPCfqx0tK45wist8fyNtP+5djDYhPj0lPsnApB2tEMttnsyEJIjTG
         uoPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/CNrEHc2sCSBxOizuNkjCN5GzsALEcs92scAmP/PxeAuwx7Oo/JU00draTdPAU1Z3HZrx6VnTBlO6CQhBi8/SLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW258lyeslSHfwOXvITjRhLaGaINGogvhXitNlLXlniV7QnZP2
	0VwuoH4wSCJ2Bc8F9ENSBT1du1Zv/FIHvVc+GOPRjR125fdOI7Lm5g+9SHpTysQAzY5OcEO0yzY
	NoIwpRJrxwjA8rhP04nr+L0DdVrxs++A=
X-Gm-Gg: AfdE7cntSIENP8D1WeXdIhoJx0uoj0plFOwvXE7hg6OZLAu4FoDOVF64Z7azlkrbMpf
	wQra86KFYEYlSfd40qBbDyDaF3p4A24jujjQvZT95sE3fJ+pdS07hFPLBUEQULH7uM4MnlAkWEe
	hSrf27vszXPOgolT+AHeMr0L4dQvhVr5hTr7umMe1hbo+cHkN8bQhhpOD5VswGh4QQRPITGBxL4
	wNdFMEZVgpC9e9BrFrRp7NLTNHcoocQ6tnxK0XzUcpcvCgYWTFoFkGPn2NHjveqj7dTRFP3YS+C
	4LUJR9tz+l21MIIzOtCqDFWzBQg=
X-Received: by 2002:a05:6102:e06:b0:643:80f1:350a with SMTP id
 ada2fe7eead31-7427ce18c0dmr2135936137.2.1783232651081; Sat, 04 Jul 2026
 23:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 5 Jul 2026 15:23:34 +0900
X-Gm-Features: AVVi8Cf8yc--a4qZ7FOXrm9j2w5KabYozWK2_t--A7TY5sNuVyS73aMpX1qw6v0
Message-ID: <CAAQKjZN12OSBg+ch+xf+-uO6_Sbrtq-o8AkLdLA3mFQ_ubiLxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos devices
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It looks like you may have forgotten to post the v2 patch. Could you
please check?

Thanks,
Inki Dae

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 10:19, =
Diogo Silva <diogompaissilva@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> This series does two things:
>         - Open-code drm_simple_encoder_init() since it is deprecated
>         - Handle the error code from drm_encoder_init (previously
>           drm_simple_encoder_init) to prevent silent failures and
>           cleanup of uninitialized encoders
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> ---
> Changes in v2:
> - Fix mistake in exynos_drm_vidi
> - Fix indentation
> - Link to v1: https://lore.kernel.org/r/20260623-exynos-drm-simple-v1-0-b=
b52f098b1ee@gmail.com
>
> ---
> Diogo Silva (2):
>       drm/exynos: Remove dependency on DRM simple helpers
>       drm/exynos: Add error handling to drm_encoder_init()
>
>  drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
>  5 files changed, 57 insertions(+), 10 deletions(-)
> ---
> base-commit: 60326b17f877e12846167bf8ef83680b9875218a
> change-id: 20260623-exynos-drm-simple-bb5386d64597
>
> Best regards,
> --
> Diogo Silva <diogompaissilva@gmail.com>
>
>
