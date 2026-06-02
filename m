Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDB3B2D00
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jun 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384593; cv=pass; b=Ahh+elz21dKT/A4r6N3a6ZKuqTPs2d+bGFhd/ObrF5ki+5e5do7zC2n6PncpzlmWqrq5PfT1hE446zoamHo4MCfbpS48Di/oy6a3ugL3KJrtR1r8rz6i6/gNKJk9TGM1fI7ajeTklkiOWtNHhe6msUkLDuJmsJhmZ3ORskLEvuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384593; c=relaxed/simple;
	bh=3Auo9+tlIPxJEemufW/aV/S8UvWMioUVYV7RZf+xXog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvETdtIc3MrlU4iITPu22wNSgRyDsW4d2CsKzSZ39RfgfOkYWhROgCqfkMFniJ3Lv+MiH/rARLhB9ulCoqJQv5y9dUx8/k/hX4q3V8StcesAVM8ZtMYhWUFusq9W0p8CG1bzOARTQ5ejOok7i+NZFIAXf9fc49yJtvo99jsXXEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZihSNpf; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZihSNpf"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6c733856aso1143221a34.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2026 00:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780384591; cv=none;
        d=google.com; s=arc-20240605;
        b=kcW/PRhs8W4NYmTutXbLSgbDYfWSYFuDgCD9e/29K8ctlFaUiKYqZV7GZ51ONANB3t
         JzaHpUOL7yeJ/cHhWskVCVkrl45QooH1bkDaBIUHjmbzQn807+Wr2566ZZrV6gQMVRV5
         682L6bpTN+yX+YL+F8060UZPiGUCRRyQcXvA5J9kHMwbVQW7z/HowQ4dV1MgWi3PtLWH
         95A50i+fflgbVrlFwefoWRtpa0lUN7PrDZNxZnxLoUiQCcgYvUWdBUKPAavQWvIPtxAx
         mzPds8Y+FFUQfNjlathNrRKK3ng/Nqz9S7XipKjtQ5KneITJwNqGB9DjcJxWxyNmfDGX
         Bb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6QljEUOAK4GhDaCOum5n6uKCL9G0xte2SQqS3q0iDCI=;
        fh=QiBjiiYPXMrxqWKFCSbNhQ5bThA5/vbji33TQzconhA=;
        b=gAYkdRTX96d0lEgcHStoDoYjm6DPULAkVODrrnqgTsRVBVUvoI+qFX0msdVh/+LnP9
         wlkvkMKE0pqCtdWMQ6X8seGW9mvUYheHh3B7+2Br3cLgOlhdgYRtT6YoK2gq/mDlZvzy
         1fko9+7W9qfaZjYfCpoTTwRluNt3niRzzyXCVjb7MwK3LFRaNHiBuTWLg0eIIvd4AH1s
         pjeDuRsH0GO4m1GrtMUx+sQ5J/oU+OH9Gi72P7XOmdaYnSKwzUkAnugTFrV0v+h5EVVA
         FZTgykvPKy9LffeZM3O0IRLRRJRD7rglK1bjTJnjekjmbyYO85E6qvSpvFPKRTxcjZXc
         RPMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780384591; x=1780989391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QljEUOAK4GhDaCOum5n6uKCL9G0xte2SQqS3q0iDCI=;
        b=EZihSNpf+WRNKQcRULsOG2olQcYQtbCYaVsz4y/yvoZQT5nv7xZbPZivLgN6NdkWiA
         l5RnbOeOs9H/3Pp/hBaZ+28IkrB2uS7sekoUftWOw8E2zhTiIegeHP7LMMLIqkpmtWDX
         6g+DzOBYhBvMQ7oDm4F4ctYquzqDqIhMZKTSNOz38w1NN6YyXc3JCaPH2V1NwzWZ2FSn
         2L2rvtBB+JvRnhGHbgFIxnNgAuQ5hYKEv1Fct3k21X2SJU3V10p7HUI+eg48L9jh/huq
         m/hwn2QIySDK38ffqsSCbDIWvbY3vRgWrkjPP+l39rGwu5rknSpvpKNI56o/Z+CWO93U
         P/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384591; x=1780989391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QljEUOAK4GhDaCOum5n6uKCL9G0xte2SQqS3q0iDCI=;
        b=jZYHJm+7ii6r9GiVqqUMvrSnrlWc6qxz9nSyjzWp6yh+ypGRnHpvEQgHbQrVkBN/Ms
         7LjUBfp1HecOrNzMMeElYRcK3jILQbVX2S5ReardgZJHkLjyc9PQhD5UWJJkKStvlkAm
         k4xhKYmIhQKXOJ7+zqtfXqJfwGwYb53XOsFUqIVGldJb85yxTsRWmRZaUkU58Gzf56gE
         O9ugupYkHm0dr80RSaqUkjl94fHwED44UyHnT0gLgJWQgJ882Nay9Gz3j6CxZcUwjpMV
         5MNQzLYv9Qz7dYwHMqEd+jzLpST9ZLvbDEyIZ/b7Z3TlR/s93eyOyuJNArZYPNhFdHbN
         NOlA==
X-Forwarded-Encrypted: i=1; AFNElJ+Wwy7lLyCKfmFe3G3JnKhtyntZVayROT65oiEntgib5iYlxy3r37fOMZyoe+1GZqe81EWE1Dmmzl5HXqWJEp3XsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjVBf7bPvze4lDK21DYqbdy1UAHGLbQH8Iw0QMtJnneCQsLvS
	Rr2lznIAgkUcRpbOzIgk6CWB9y7UVYCj9AFY+whEDtC2VBlOfit08eHyL5UatDoVtFY6FxbbHVJ
	HCaPNS/CwV5ZdcWXNQJs7QCH9J+Sojow=
X-Gm-Gg: Acq92OFb0igJhz4QrC6vcV1B1fL6bDrE8aIUzNhzwWI3p4eW1wCqsKtXQF7cHx1dyMM
	AQ+ewmJq8XgJYJQsnIPFFdTELdD7AhJ8odDtOFpKoKXIV9tNw6d21eI78tUBYMoDg5Ryp06ow42
	mWj2ogLaYzPrZPwvWmKzDAitS/nmkqYgZVQlhZCXb9USfBq4OGRjcxvivhIOwl7qM/iJpi6VM3h
	2b8OQpHc5QttPCoQ0nqHtofZ9p57CmF1K9eTjGKACGuL51htcAovZ4byp984rCNL9Pv4y3VajpE
	db49WJ0fEHhfyrnoGPYj
X-Received: by 2002:a05:6830:4194:b0:7e5:68d0:462d with SMTP id
 46e09a7af769-7e6a1e20025mr8818586a34.19.1780384591168; Tue, 02 Jun 2026
 00:16:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-lima-alloc-fix-v1-1-16d3f3b7b780@axis.com>
In-Reply-To: <20260601-lima-alloc-fix-v1-1-16d3f3b7b780@axis.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 2 Jun 2026 15:16:19 +0800
X-Gm-Features: AVHnY4JMWdde9M5jvz91Ix9Ornc_9nS90uFwDWQRw6lHLBiqcEwZUx95HD6BJaU
Message-ID: <CAKGbVbt6NtBOrnE-ijV2cWLdFcHZTK7tqL6Wxoz9FTS5Sz5H2g@mail.gmail.com>
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

On Mon, Jun 1, 2026 at 8:04=E2=80=AFPM Henrik Grimler <henrik.grimler@axis.=
com> wrote:
>
> lima_vm_create() is currently run before va_start and va_end are set up,
> meaning they are both 0. lima_vm_create() runs drm_mm_init() with them
> as arguments for the allocator, and if DRM_DEBUG_MM is enabled the
> DRM_MM_BUG_ON check in drm_mm_init then fires, as seen here on
> exynos4412-odroid-u2:
>
> [    1.736297] ------------[ cut here ]------------
> [    1.740370] kernel BUG at drivers/gpu/drm/drm_mm.c:931!
> [    1.745574] Internal error: Oops - BUG: 0 [#1] SMP ARM
> [    1.750697] Modules linked in:
> [    1.753734] CPU: 0 UID: 0 PID: 41 Comm: kworker/u16:1 Not tainted 7.0.=
10-postmarketos-exynos4 #11 PREEMPT
> [    1.763372] Hardware name: Samsung Exynos (Flattened Device Tree)
> [    1.769446] Workqueue: events_unbound deferred_probe_work_func
> [    1.775261] PC is at drm_mm_init+0x9c/0xa4
> [    1.779339] LR is at lima_vm_create+0x144/0x17c
> [ ... ]
>
> Fix the issue by moving the lima_vm_create() call after va_start and
> va_end are set up.
>
> Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
> Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
> ---
> This is a low priority fix and can wait for v7.2, it does not cause
> any real issues as far as I have seen: drm_mm_init() is re-run some
> seconds after first run with correct parameters.

Reviewed-by: Qiang Yu <yuq825@gmail.com>

drm mm in the empty_vm is not used at all, so no issue caused by it.
drm mm of a real per app vm matters but they are initialized properly
after va_start/end set. In fact only the PDE page matters in empty_vm,
I should only create it instead of the full lima_vm.

> ---
>  drivers/gpu/drm/lima/lima_device.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/li=
ma_device.c
> index 0bf7105c8748..7c873e62c16d 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -368,12 +368,6 @@ int lima_device_init(struct lima_device *ldev)
>         if (err)
>                 goto err_out0;
>
> -       ldev->empty_vm =3D lima_vm_create(ldev);
> -       if (!ldev->empty_vm) {
> -               err =3D -ENOMEM;
> -               goto err_out1;
> -       }
> -
>         ldev->va_start =3D 0;
>         if (ldev->id =3D=3D lima_gpu_mali450) {
>                 ldev->va_end =3D LIMA_VA_RESERVE_START;
> @@ -387,6 +381,12 @@ int lima_device_init(struct lima_device *ldev)
>         } else
>                 ldev->va_end =3D LIMA_VA_RESERVE_END;
>
> +       ldev->empty_vm =3D lima_vm_create(ldev);
> +       if (!ldev->empty_vm) {
> +               err =3D -ENOMEM;
> +               goto err_out1;
> +       }
> +
>         ldev->iomem =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(ldev->iomem)) {
>                 dev_err(ldev->dev, "fail to ioremap iomem\n");
>
> ---
> base-commit: c453c60fdba437f69209e027b418c4a24143605a
> change-id: 20260529-lima-alloc-fix-2cd5408f6493
>
> Best regards,
> --
> Henrik Grimler <henrik.grimler@axis.com>
>
