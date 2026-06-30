Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F59923392E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 06:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800720; cv=pass; b=IM2EmDS0fXzC/ZRutqmMzt7GfvO2u2EgkvWWDYcwC9JD58cgPtcug/WzAj+NkZpCzrfwVEbXMYRpo4Hb1utGaTGkyhZdu9uNC/4PEBCeLkNn9FOvMrdgrfH0ikWCOZP9m3tfovsURfzLngkDbzAor9Q26QXJYdCTTXLQEthjweA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800720; c=relaxed/simple;
	bh=YR8TEWa3NBs1iV5eTd0zvf7X8/rj7WTIduH4oMGoeXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArKEhS9yL827vTscjgzM3rAlQtx892aEhrANX2OPlw0VHnrgQhGvDXvqkuIyQ0sojatHj1HdbeKzZ1z7YKw4qW8bKhXeEiaevG9NVpM/6EmW0I4PUq7jsQPbIFCrZUNf5sejzokrtSWHCzJULbGwNHsXQCha6JDx0ILUM/ACNdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRxbRrFT; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRxbRrFT"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6b5737bb2so4466810a34.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 23:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782800718; cv=none;
        d=google.com; s=arc-20260327;
        b=VrHb++p/jrG2qNmQhYCEvjC2jjpDjCOXEnwanjppiyJPI6gUwHj5kFu59iewCTlbvv
         LIVHvLfYh0l3P2cYXO1UGln+m/5YA0zHKz/Unzb8Ul148b51pjaxmjRKJzDrmUqkbXXY
         7xuwV0FXIJE2Gg8rpnA06g2uKRNLqYfJRxmbqV8drGQef9VwkCOHwlBRXc974uJ4UneI
         P4RK1KnK5H9t771cbtwPxTp9BErwNhToHo6nW9hk/cPYJRfwDoOGHAaC+smnPglOVPvp
         vVvAHSyUoYBuBjvYUwSa3sOBFy7torB963GaRLLmKJfgFjdQ34+u8BH+/XTphif6FXJ3
         bfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pZZE9+o7hc6DdRG9AbRlJ9+v4rQT+RFk76oPmbGAKdk=;
        fh=CTo0LSLy/9HoPyLHhlBlxAk6lhXfdrxOuGdBDhbJf+k=;
        b=dV8z2kcst27k+PJYldg4OS7K1WROK/EMx56A/F97VNNils/7G2ecIiJMjNpGjy+5Uo
         i6JRpiLWYbw20Oz+qq8sUUmy/XOLjjF1zZjToGV9AyEg7g5ggILmgkaSK7iG9lBKSyUk
         Tt5UDRVji+8KeNri6xMUMNjlVZE1YIB05OBwvY7eP20gqPHSe/Gf/d2livrvynIQGEdY
         LyLLlC/g6eRruQQdRd7ToFbMziiGvx9DBHoOLEXT7M+JJ57tHtEs2RwvR3+EbvNQzULG
         VNbS4LB65mQYE+D3F9lv96sZNCg2+GBpFYtbwD7KXLbs3xe8VZX0S5EmWkTsGs+a33SS
         J1eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782800718; x=1783405518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZZE9+o7hc6DdRG9AbRlJ9+v4rQT+RFk76oPmbGAKdk=;
        b=eRxbRrFT7t+iigqpOY8uV5K1nHm6R+xM58/ScFZ2UnlDSDO/CMzqiBxhDkaaAL4I3l
         LTT5XKarvaJ+l/knutABUG0lhVcwWCP8KqY6m9csoKn+V6RqRfNXj9+3oKaqnceXpQVA
         BDlJvpwze4SuYkxuKgvH2aWCqXrWHtCSjUVB/HhwcIMEBEKNf1Owg4rk9Bqmz/3Inplk
         +1IJkG3QZgfetnP++un1VADx0F/IeI/Tw/syzEiNac729Qv0MzUAJD3EsKbqm6zMV0ec
         i2UMyFSbIetKf+17zLr6H9s8Sr4NmYdrty3QZhSERlbw2p/aY3A1t8bopH9ytYRHCi3G
         GENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800718; x=1783405518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZZE9+o7hc6DdRG9AbRlJ9+v4rQT+RFk76oPmbGAKdk=;
        b=jh/NliGdBj0i4g6toQNZR+5OGSNWeDlv6kBjpJiVHmT//aE4egZG5go2Il6GmuSHyT
         JU7m56HyeknzMC4sWnS/iO3THHlgji/i8I2Rcss0gN1t9ZVxTra1r8THQ7w4cCirkObG
         SFEF/ZAiWZr7Wh4g2Xdb6F1u9c7NDjpY5H/k5rP3SKuYbBz6G77km5Z3ixgpXo4q+XyL
         UwrIlkvNw/xOFxnp4eoS3sabf3tjh8CUovKg5VGuOgZPswWQFfvS1QmEn4kgkNWMYlxc
         8q+zmLR5lxslGyj7D7QWsB7HElEiO4SkgaZl4lHtNsPOtTO7pB/zkHkwRZWGDIXD003z
         qBhw==
X-Forwarded-Encrypted: i=1; AFNElJ/rOekba+ktKMwVRC3giDuHjvZdPGywxJJ+nvEiV8z0j1NVFrlt3U5vYPYw+Ck1U1X4ttSTm+9R2NeBVaH/RmbM1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQ2MLTRflHHdTFh6xGPaOWIzCQP4oHrJ7BWXw7oZqShoyd5AX
	Eu2zveHTtNo+5MOUqEOF7IdpgB9LL8Euj6UyIFkIyJ2FhojFgErAcNcdMGA1yinoohTw+ayTn+X
	P7b/+UBfSmVCYr9R+AuaZ0+Nr5xP3Yr4=
X-Gm-Gg: AfdE7ckYQIOdcnPVUnozcHtmwNTIvhwFIUMpZ0iPzeiYj/UQUyOO4zgpleXfveKWqS5
	TmhltpV/aXrt73ENU7Z+1ELEpolcLFdFPpdS/GHPahw22aStX6Xl+jt0pc2a6+2ljYxdBfw1Iq3
	iRRunZ92c2loe0Pj8af7YFTZfMm1fV1GYts2reGaOKSweNGs5xY2TtyhhhH45G6Un4meRRSSv+L
	oG5eZSBNxjQLqnJzaJfG96eFrI2JlqPfkaiM+Mffh7cjKORGU1wf9FPl/0upGIQel7p9Pen
X-Received: by 2002:a05:6830:b15:b0:7e6:ef1d:4aeb with SMTP id
 46e09a7af769-7e9ec724aadmr2488848a34.15.1782800718376; Mon, 29 Jun 2026
 23:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-lima-alloc-fix-v1-1-16d3f3b7b780@axis.com> <CAKGbVbt6NtBOrnE-ijV2cWLdFcHZTK7tqL6Wxoz9FTS5Sz5H2g@mail.gmail.com>
In-Reply-To: <CAKGbVbt6NtBOrnE-ijV2cWLdFcHZTK7tqL6Wxoz9FTS5Sz5H2g@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 30 Jun 2026 14:25:06 +0800
X-Gm-Features: AVVi8Cdqfd6FV3N7-J0Pn4yz-PNReDW8OjbwiJqooEAomfZU32iDqCm6ZR_lbIQ
Message-ID: <CAKGbVbtxGOw1WQcmV-_1aWQpHGZp6yvDPcyVBYYCRF7z8UGwhg@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: call drm_mm_init() with a valid allocation range
To: Henrik Grimler <henrik.grimler@axis.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Eric Anholt <eric@anholt.net>, Erico Nunes <nunes.erico@gmail.com>, Marek Vasut <marex@denx.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andreas Baierl <ichgeh@imkreisrum.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kerrnel.org>, 
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	lima@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied to drm-misc-next

On Tue, Jun 2, 2026 at 3:16=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> On Mon, Jun 1, 2026 at 8:04=E2=80=AFPM Henrik Grimler <henrik.grimler@axi=
s.com> wrote:
> >
> > lima_vm_create() is currently run before va_start and va_end are set up=
,
> > meaning they are both 0. lima_vm_create() runs drm_mm_init() with them
> > as arguments for the allocator, and if DRM_DEBUG_MM is enabled the
> > DRM_MM_BUG_ON check in drm_mm_init then fires, as seen here on
> > exynos4412-odroid-u2:
> >
> > [    1.736297] ------------[ cut here ]------------
> > [    1.740370] kernel BUG at drivers/gpu/drm/drm_mm.c:931!
> > [    1.745574] Internal error: Oops - BUG: 0 [#1] SMP ARM
> > [    1.750697] Modules linked in:
> > [    1.753734] CPU: 0 UID: 0 PID: 41 Comm: kworker/u16:1 Not tainted 7.=
0.10-postmarketos-exynos4 #11 PREEMPT
> > [    1.763372] Hardware name: Samsung Exynos (Flattened Device Tree)
> > [    1.769446] Workqueue: events_unbound deferred_probe_work_func
> > [    1.775261] PC is at drm_mm_init+0x9c/0xa4
> > [    1.779339] LR is at lima_vm_create+0x144/0x17c
> > [ ... ]
> >
> > Fix the issue by moving the lima_vm_create() call after va_start and
> > va_end are set up.
> >
> > Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
> > Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
> > ---
> > This is a low priority fix and can wait for v7.2, it does not cause
> > any real issues as far as I have seen: drm_mm_init() is re-run some
> > seconds after first run with correct parameters.
>
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> drm mm in the empty_vm is not used at all, so no issue caused by it.
> drm mm of a real per app vm matters but they are initialized properly
> after va_start/end set. In fact only the PDE page matters in empty_vm,
> I should only create it instead of the full lima_vm.
>
> > ---
> >  drivers/gpu/drm/lima/lima_device.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/=
lima_device.c
> > index 0bf7105c8748..7c873e62c16d 100644
> > --- a/drivers/gpu/drm/lima/lima_device.c
> > +++ b/drivers/gpu/drm/lima/lima_device.c
> > @@ -368,12 +368,6 @@ int lima_device_init(struct lima_device *ldev)
> >         if (err)
> >                 goto err_out0;
> >
> > -       ldev->empty_vm =3D lima_vm_create(ldev);
> > -       if (!ldev->empty_vm) {
> > -               err =3D -ENOMEM;
> > -               goto err_out1;
> > -       }
> > -
> >         ldev->va_start =3D 0;
> >         if (ldev->id =3D=3D lima_gpu_mali450) {
> >                 ldev->va_end =3D LIMA_VA_RESERVE_START;
> > @@ -387,6 +381,12 @@ int lima_device_init(struct lima_device *ldev)
> >         } else
> >                 ldev->va_end =3D LIMA_VA_RESERVE_END;
> >
> > +       ldev->empty_vm =3D lima_vm_create(ldev);
> > +       if (!ldev->empty_vm) {
> > +               err =3D -ENOMEM;
> > +               goto err_out1;
> > +       }
> > +
> >         ldev->iomem =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(ldev->iomem)) {
> >                 dev_err(ldev->dev, "fail to ioremap iomem\n");
> >
> > ---
> > base-commit: c453c60fdba437f69209e027b418c4a24143605a
> > change-id: 20260529-lima-alloc-fix-2cd5408f6493
> >
> > Best regards,
> > --
> > Henrik Grimler <henrik.grimler@axis.com>
> >
