Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C362C2349
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Aug 2026 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785650120; cv=pass; b=ddFAG381jJYU+wni7V33Uf4N4JZ7JuppdP5dEK7DYGkaMUEQUQQ045VyAAEoARbRlHrGkoLywisXaB/S+3bB3uHygl/9wm88Ek/ynv5lBC8jZGILX8sGOcf34ROq+LywqCCf21TVPU3Y6VyxrB77SLh93uDQuLldxnQ5zFrMb+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785650120; c=relaxed/simple;
	bh=9oKaYlOJNDKHpvXnlsz518DDIJdBNfw9fZDItnKMTSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSIOWQJILPaarz/foN/9OR3Zo5tE18/QLrXCPVocnKqWLpxBP9W4bpIZdBSs2Imfcsp3absdUvAY9fPac4UCQYKkn6MXVmHhj2/8SHYIpj4EI8CGE+OfPMhNPeU6BuxEvY2+giJ4tx+q2ES7aoXEb+IUodSyjNkkAZ/IBb5PyHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnRprd76; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnRprd76"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-75609e844faso1401131137.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 22:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785650117; cv=none;
        d=google.com; s=arc-20260327;
        b=gjLN0JMj2F4ECPmQac2+vJoXMmW8d42TfCulWn+YYqoZeaN9XQOsQoEVzV9el8p3Wt
         V4/pBfO2nCyii54/KuGaMysmjhvrayjrmlEBZKyzlsTGcm9Txw1KqcT9CSqkeZEneG5v
         DIsNL5h+EU3JF0ic71JqfeNgs1B+PCk6h+h+7pOn3E4k3lOeR22fYzb53vFrjoS5OOZY
         5JyILD4XsY2kVIHArWepKGolsVH6grc14XCMAwX9PY4BtyR8ClfQEihqSjNz0bWFV+CR
         ZMDc9LNTQvfR8UJGPhJfLhisVXAknLKv+vv9cR3SLmauHVaEtf8jitD1u7VbEIlITyZp
         3s+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Vs1SQCwA2eulFFZ+BXHMpPyX24h7ndFKDeTGaZkolU=;
        fh=Y8PJPYhl4PF2qWcFB94XwA7F2fLeNlfLaOIZS1/DOSs=;
        b=Nwlz5b9l628p4A07t88SgOyAlnliA549Q5DFA5X35M514t83cSOVeKO9ixycw3D45l
         tmMug4QSRwu0qkb/ekyme806WmGn/UQrfOgaCCVyExoiyFYQmss2C1HUVZ4Yz8+eMd0j
         YjxweR3bVtaNpOSLWz+7yWxgVhIJ6ej35JKeRFwD2rG4stj1Vq44WC+YSMZsfYQnY2kK
         KUUImxQK8RUmmp0G+XXjQAsI1CiOfO/rgbrSv+hbw3BIGMSrYk9CfbystQS6WHa9tWPZ
         a5P0VUzYrXl0wtIhvbI6kcVgMmzAL5JYNB5mB9rCHrT35Y8lKb4fTxll+DPghtUprCHg
         3Dow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785650117; x=1786254917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Vs1SQCwA2eulFFZ+BXHMpPyX24h7ndFKDeTGaZkolU=;
        b=GnRprd76G21NUYkhfwK8Ljr31JEyue4wW1iiXawSCP0yy8PaTA9/fd2beN2SMsXAbA
         RXNpBRXjAA2+4Q0y73gVirs/X3k8Jk25f963Uoi7bKnnstJXj0VE6mIa0F/643sUgBO5
         KI/4PeOr3eKSNYVvq9ETxz/zRRZPvosAwqQyMFFl1Ndg1lOEqLj6MRr1T1Wi1TVSSTz0
         CZQ41Lbyn/+j6r1icXNbvo63kzohbwO+PqwhjETlqRuggpzFT7cqI433TZlEvBJWjK5p
         cUd8t0fHL90DhZv+1xhVjtkSMxsHZ+xT7MwaD0BY51aT/Y3ib5BSoNSwdeCTt+Rfgm/6
         pPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785650117; x=1786254917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Vs1SQCwA2eulFFZ+BXHMpPyX24h7ndFKDeTGaZkolU=;
        b=cUDReACSc15PTsJVtHWRZPDXvuwmIgzjPZ3G//wl1TPRnR6xOzpEJ0i5laQq7X+8dZ
         n/ESS7AwnYbnO98HZ3593UBfo951IoxyECZv1mCEXwxgFtzWhXDTP5BCGy1fw7E77dGG
         hP1plAyh/JuH49iltod85BRlzMvW2+yEOFIVWYnkRhvfD0iQOtzs7Em4RuSyPxAmjYfM
         qQboBDw/dkv1BwSJ32ixbuyKQG85RNFamRU7s+n75DzJZiF1wbE3390SXHT5Lp7QG2U8
         bmRfhxlj7Fz7aR9S10Pv1l1YYDdZIbIfAqhipYs7PAPp7bLmhMCWqppYesPNMTv1YrZ+
         69eg==
X-Forwarded-Encrypted: i=1; AHgh+RpU6OkdIKTQk/flXFSDUNDAbPJZwkQYQFRIyKWGOx2Ro6eou1u+6NjRTSogGqA8IHuYywqMAC8kJrl6Yn2fR5iDlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFCnCfZKGUbA0com14erXq+xBuTVdJerLc6rlCZoZiH43iPkGy
	svbyux778yQmDxc3DKHy9Hpv3W3W33Zdm77fKDDLQLpBGchch+15tpve1LakNn/c03oaaNV/AgB
	Cy4Ii6SaoMifQahCuEK+oTHofcVrAvx4=
X-Gm-Gg: AR+sD10Q0kYnxSww8rD1bGcJTmNxZceMAsx3tu21o/7hVO/FJOF9yGvX306VOiCJjsn
	CKUJtLBOMxzprYqdo00PI0h32/ljLHr3Lpb/MSU5s8SXBUGytAVZtWwKqaJLk+f2SW9PkAtD6qM
	ZzQb4rxZ4G78QSe4FkC6drwQq59d/+Gaa/pSD+16oHBhQmQHLlXmX1JQYrTGPuWuwmMfQONNO36
	AFYSLUzGHv99KGuPphbS31D629ncX4sP7G5uw3EIwY2d9O6FZJWGd256R9+OdbXAMADdcc/tSVU
	sbFT1Avuc9JNf5YIZ9Gw5ruFFeqbiYF4WVHTKkexLMp2T9vLBChjQD8Q+PQhwoVMDYy1LhzHiXI
	=
X-Received: by 2002:a05:6102:7ad:b0:738:f27:43fc with SMTP id
 ada2fe7eead31-758f8869b41mr1922174137.2.1785650117459; Sat, 01 Aug 2026
 22:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716131802.1564776-1-johan@kernel.org>
In-Reply-To: <20260716131802.1564776-1-johan@kernel.org>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Aug 2026 14:54:41 +0900
X-Gm-Features: AUfX_mxYVom-AX8ugZp9yvdrgZXKEh5DEfjSaw3ZzVclgiqSMtSKQ8CYJUJRy5U
Message-ID: <CAAQKjZPW+mHcXQJKQc7wJL=MGssBf10H_FO0S8D7uCjX48qrKg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: take i2c adapter module reference
To: Johan Hovold <johan@kernel.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Merged. Thanks,
Inki Dae

2026=EB=85=84 7=EC=9B=94 16=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:18, =
Johan Hovold <johan@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The i2c subsystem currently blocks during adapter deregistration
> whenever there are consumers holding a reference.
>
> Switch to using of_get_i2c_adapter_by_node() which also takes a
> reference to the adapter module so that an attempt to unload the module
> while in use fails gracefully instead of blocking uninterruptibly.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index 09b2cabb236f..b971b7098a4d 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1913,7 +1913,7 @@ static int hdmi_get_ddc_adapter(struct hdmi_context=
 *hdata)
>                 return -ENODEV;
>         }
>
> -       adpt =3D of_find_i2c_adapter_by_node(np);
> +       adpt =3D of_get_i2c_adapter_by_node(np);
>         of_node_put(np);
>
>         if (!adpt) {
> @@ -2069,7 +2069,7 @@ static int hdmi_probe(struct platform_device *pdev)
>         if (hdata->regs_hdmiphy)
>                 iounmap(hdata->regs_hdmiphy);
>  err_ddc:
> -       put_device(&hdata->ddc_adpt->dev);
> +       i2c_put_adapter(hdata->ddc_adpt);
>
>         return ret;
>  }
> @@ -2094,7 +2094,7 @@ static void hdmi_remove(struct platform_device *pde=
v)
>         if (hdata->regs_hdmiphy)
>                 iounmap(hdata->regs_hdmiphy);
>
> -       put_device(&hdata->ddc_adpt->dev);
> +       i2c_put_adapter(hdata->ddc_adpt);
>
>         drm_bridge_put(hdata->bridge);
>
> --
> 2.54.0
>
>
