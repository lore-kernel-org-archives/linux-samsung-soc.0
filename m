Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F65EEC9;
	Mon,  7 Oct 2024 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728265491; cv=none; b=cQHWr5HoSob/BNa/iE0fnGKFbHhy/kVs4UStUaWuUnFV4jN8ImeG7oIkJ57AMjut3XO+XooIUb6A1jthiibhDIu0VnAalRvJFFNlbIFUSgfugTkR0x0iInnUz3Zc83Fbnm0j8Y7VuEp+++zTfZGj5swnG8EaMULL6SPe39Umw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728265491; c=relaxed/simple;
	bh=iWEtgc3meyPdV0U09IWzeGiCzBDvK1PF1flqo/gk2Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKJISfGgmFS8jBKSuFsWkvv7l21pa1CKTYRbMsShPIcAP+pwS1fjRo9xTTdLtac41OSRl/kvg1QCXaO+Nwz8bGc5RCDMVMpZcs6HK+V5JhshaE8B76BJV19Eg4Znm8lfQNGQZFXU5Qb7K1JnoZ63ZrnPTbpg/J7jnqv+dPsIYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mfxxa8c6; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mfxxa8c6"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-84ea25abc26so1003340241.2;
        Sun, 06 Oct 2024 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728265488; x=1728870288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzU4HApFVdOla6cFpiLhDsurqYX2GUtT9S+gfYoFCVc=;
        b=Mfxxa8c68Iv8T1KUSu0fdBHEuOJYG0hbHMD3v2eG1+3QIwTe/pZa38tieDitG52PsJ
         0mP+1CwnTVbQeNTvc2vwZBFJtQ9LvcwWR5oAj0qcSAXNb656YQ/yYBUHRDGd3oJI0Yxt
         BNaRr8zYW3VqEh6jXAoHaj6akFhnxmkyRmFGtR+XAbltFqHdL42RONAE4eddxNyKsrfq
         oXEekSbIfqWqRZU0hNXabhZwTf/lK+u3ngZ3Zm//kLi1vLVl55hSMbDR/92+jIZmLEDY
         zo5Gd5QQSt20jSXO3OFaaOU7Cx0c6Gk74hg3/WKxRHZ49VndMlYu/TyB3O/SrPd7K593
         7HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728265488; x=1728870288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzU4HApFVdOla6cFpiLhDsurqYX2GUtT9S+gfYoFCVc=;
        b=ftsldEjUNoQtC8UShVQmH0SkxBmGQW47o2guM2M5Fwl7PyG7kFQuDGdB9XmCyS+iu6
         PSqX4dUwszwbzIcthqyz7XN4/aTjFYNhmDT+bbJmMSV6p4v7CnopuxkpyeyKFOeWqFwZ
         6wDUF2uhPyRQiIc8VRR9DUrL4ytiQ2avrw/L6637EWhs82+GQWtmOi4KFF/dk+fD39kQ
         Sj4ysRyOYdpASNjeDvPkV485M1PDF5cBUCSi/Ng71Tukv0ezBm/Gj6U/9SVdf/Npjj2/
         q7aiHITETma04L1Fia31dmB5AH1soR8SD/n+tOxkESlwBbqIKB1ubyTSjZfipFAu3+R7
         iTvw==
X-Forwarded-Encrypted: i=1; AJvYcCUa41mGEBsxYCVDVRG3ZtDQDj+3N+PuQUN5tdjGUiM97yIAwdRHg95g6wB1Yph5e2I8Y1WxUaV4x9JZoPCtD2/OPjo=@vger.kernel.org, AJvYcCXGNMrjtFbD8ZsGF9b8JEy5anWWwe2NZ06hTes2ArQHs3vCnBe4DsoEYExe6pmvX3UapX72cUO+Rknb0fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Rw9LMHh5bEoZpSe0eu7tqpN+QqJTCuOiDxV0yipnpQfwTF7O
	xChxa77dN/cd2si3Co5QAeOdXvLIyZ8sVGL36lSMhQ2tv67Vth/+b4kbqMRLumKOwRea69wL9v2
	nzGVrBjZcI8q45Jic3YOAhe+4CCM=
X-Google-Smtp-Source: AGHT+IGi4uAf0aCu5jsPGNvmsMYcFJYpM9lCgPSIHQQx9wMYlcO6+UiL7uE9lenoS0XrukOWueFat2eiVWWotzvuwQU=
X-Received: by 2002:a05:6122:3c4e:b0:50c:6514:956d with SMTP id
 71dfb90a1353d-50c85583589mr5734158e0c.13.1728265488432; Sun, 06 Oct 2024
 18:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909080620.35245-1-shenlichuan@vivo.com>
In-Reply-To: <20240909080620.35245-1-shenlichuan@vivo.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 7 Oct 2024 10:44:12 +0900
Message-ID: <CAAQKjZN9K1GieEpG4uebJ_ygtpwbVOLD3Poy-+jQePYBwsb7Zw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/exynos: gsc: Fix typo in comment
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
	simona@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 9=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:08, Sh=
en Lichuan <shenlichuan@vivo.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Replace 'initailization' with 'initialization' in the comment.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 1b111e2c3347..fc5fc65823c6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1286,7 +1286,7 @@ static int gsc_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       /* context initailization */
> +       /* context initialization */

Merged.

Thanks,
Inki Dae

>         ctx->id =3D pdev->id;
>
>         platform_set_drvdata(pdev, ctx);
> --
> 2.17.1
>
>
