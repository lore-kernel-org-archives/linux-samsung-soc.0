Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431B17736;
	Fri,  6 Sep 2024 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606874; cv=none; b=mDFhAXSfQGkj0uABXgmgODu/KfM4DkezLaqjIxed4Kv5+pvyyf87iCEE7J3l2779bxYKD7CRnBUdRvbhhLaCJCUYfhyeDOglFjpRn0h3Ima9Bv/RVhhe5rDN2gHwQhZFhAuvM9D+RV16xF7TjemuOLPElYxoZJKmit6TUNA8CbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606874; c=relaxed/simple;
	bh=SzA8iOQRNWxPji9BdWAxLmSefIflSMx6ONvcZcSSCSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVS/bp3YhPltUMlNQQnxj5GTmDJJ10vgMYMkTPkcOKe7DpxE5ljARTebZ4CaC+qerd6fbKu7eZ8sOpbpD4YogONg/j7I0ZKoSjOsYs/7JG1BU2Uvlztpvek4OZoFF0aNlnuDoCGIyri/Ey2DxMKaKj+DHuxv3QnW31pvkzS8KoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y242QQbd; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y242QQbd"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-846c588fa52so395534241.1;
        Fri, 06 Sep 2024 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725606872; x=1726211672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/DCmDI1o+fFk4wQmseRwj8ZOwz/GsHa2AZ//13hLAw=;
        b=Y242QQbd3Gy0j2wDw6wnE7WJQ/xq+gQ+N3SYWudWYsfVGjOo2XFxcFozPJZE1ymPgU
         8cZNVLHB7i0V6L0I9GXEchSW3Am9xd/lxgrItUMA44OXxxW9uVTQ0u1uFGvzCjxw9qTY
         63ksLI5ljhthmdmTixXYDXTcOTkgyjnuAf5bySPE4e+HQX05Bxpt+iQo6yV/6sMN5KpL
         vrZiDFqFvw7BaEZhFCAJtAJXzmSeD9uG4PiGXTNFRMe+nt4y6V87ytSOncX75n59KWJV
         KBmNbFNxff0aQOUzcWhu9obCX3zy6B0dFRml0605OmSIGc5OO+T6lsdhiciBLr7qkfgi
         /LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606872; x=1726211672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/DCmDI1o+fFk4wQmseRwj8ZOwz/GsHa2AZ//13hLAw=;
        b=fcOnc6rV/ROENTud90WfajhX8rDiWbKDTm0eCTWJ1qDIC6OoPFUkSy7bTkMTXiRwC5
         SboWQ16uskfx6/9ee6ls62BrXL5RuOl8NfbBTtD0t8knof4OVRdPSb0w7PuN3DAIhjgJ
         KuDSuDL8XjXXyNsymJ4m+IcJtCnAXv983b1tytPmkcYrURmyd0H1iBLMEZZOCqrs8JbY
         2zW8bP/W4Ui1QYBQJ5QvMY9/cSsHVsLbJpCL/eQikAVFkidBOmvBQ/ZTeCAnK4LhxAt1
         lckavNQtF06z8+H7GL9H9bH60bWHSBWzgm9AembDcczmaQWIl3EdWkoNZVHXafId4hfW
         UzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE8w0p+F4oWjYJ9R+Rya+v8UwVKlC88HTAGuEtN1gPXxnzt9+SjCt9xv93Mj0FtHkOrKGXr9BwAA9JlPkpFwaRxXs=@vger.kernel.org, AJvYcCWwTC0AzL9Isctr9jW86ogwn46RvdndVjtSCpcQI5q3AxfzXfQlZ504m4WDWMkJBeaG3lu3GP4nkoVawv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmc3Z4VdxdjIBe+92TnAeKEYQYusHA8IzTkimYxrmyI+gLIgZ
	4qO2tsk0KaxpCGPhXkTALMa4UfObeISQyYdywFxYa66KcBGqrHdQMnLcjloCLfqMH1Yik1s5Hgr
	/ZMJD6zO46QuWHxBFPoJSflm6miI=
X-Google-Smtp-Source: AGHT+IGGbVTEwoHdhzSKfRHMEkHTzqjgk4warFBzYaFxdeIwoQssc0zXxseyOQCwlQwRRiZKsoT/OlIzRsYaIqgY6L8=
X-Received: by 2002:a05:6102:390c:b0:497:5e68:887b with SMTP id
 ada2fe7eead31-49bde1dec97mr1723355137.16.1725606871951; Fri, 06 Sep 2024
 00:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822090927.1444466-1-liyuesong@vivo.com>
In-Reply-To: <20240822090927.1444466-1-liyuesong@vivo.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 16:13:55 +0900
Message-ID: <CAAQKjZPAbXDCXafBfrjcxt+=P0C-SYT_NDf5hjeJkpOvawYaag@mail.gmail.com>
Subject: Re: [PATCH v1] drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()
To: Yuesong Li <liyuesong@vivo.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
	daniel@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuesong Li,

2024=EB=85=84 8=EC=9B=94 22=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:09, Y=
uesong Li <liyuesong@vivo.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> cocci reported a double assignment problem. Upon reviewing previous
> commits, it appears this may actually be an incorrect assignment.
>
> Fixes: 8b9550344d39 ("drm/ipp: clean up debug messages")
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 1b111e2c3347..752339d33f39 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1174,7 +1174,7 @@ static int gsc_bind(struct device *dev, struct devi=
ce *master, void *data)
>         struct exynos_drm_ipp *ipp =3D &ctx->ipp;
>
>         ctx->drm_dev =3D drm_dev;
> -       ctx->drm_dev =3D drm_dev;
> +       ipp->drm_dev =3D drm_dev;

Correct. drm_dev should be set to ipp->drm_dev like other sub modules
of ipp - fimc, scaler and rotator - did.

Applied. Thanks,
Inki Dae

>         exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>
>         exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
> --
> 2.34.1
>
>
