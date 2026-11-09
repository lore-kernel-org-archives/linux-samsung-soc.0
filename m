Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202398;
	b=vmFh8k625sJAV7XcveWFjTU9Ljoj61ox7pwHffXGXD3X8nS5wt3qEbXki2SyDtxyfQTu
	 //SCWwppZpKmNChg9YRTsl8itykn591Gzd2FdPMWBroQ7PKgygWGJB3nZcYYtJTfvCjNp
	 C9nSlgQsENorE9e6BTImb/eSb1Fusdh0xsz5HStfA5BMguaGYu63IZh9xrQuzkwqKoQyR
	 GIhTh9lx/sysNnMm5a4iXdXI8FEgp+mtlmF7Gbts8TMaxw2VEJBOhrp4V/CqkI/QyLFNu
	 u1x/rvMcHYzoQdXI+DM+Dt+iWShcdr/N3ICd5/vcoYsbZJLSARTDA9dagi0iJsiWR8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
	b=vTz4PxKjZSJ8kf+Wjl9s0nORnG0s2ettbhadAyU6rtPNlAiOZY1+u6kwcIZUTRBkvDum
	 kkjsGEmJbOk/asoPktmNO5spEu0IEK2qRyt3Ga7f8XBjNrwdrD8dJjkuUPN02D9FDH12S
	 sac3OJ4nPO66F/BViMDuSu0LgNuWrMVmCX3P8L6Pkv+hn3o+zDFrgdMmwgjxAQuAiDKmo
	 7VexOad1H3WHt9LVwH+Y7rCH1PCBU6Z6dl8F7/Fu/jUbQdV3OWCVr2bYPFzgBMseR9H+6
	 uhsMgrdlQsiZktxCVN6vs0EpzpGNsUpxUpIv4wTLo33nPRmQ+jRJdhui9/TwC6/qCuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKRXQ1NE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04701606A31C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 05:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04701606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKRXQ1NE
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d30639709so49707866b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 21:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202396; cv=none;
        d=google.com; s=arc-20260327;
        b=ohzkFfSQ8hhKnQ9qRMAH4uqaJXKxXZDCUe1XQULb80oDwDn+PtU/lYSyQUWVcePngk
         +Nklo+BTe4HiPCiQnIopnCVjzvogiW5G8rzccOcvw08abcV2HktDlQIlmNA4aeZxxYqB
         0L6QK+PcQQrOHtGIhOg8wR7y/DaZRVOczs2FjVC00A1BsAoRWXtmBRrOfQsWfifS84Dx
         TFn99PbQC79aYmbQtJhNynB5haZxbT4MElQ9BP+o47qn3+ku+YkAbTuwewrRnLqamM4j
         E9sqk+qIhTGFaiQbSAcmNn+9WPgdoeN1jWXGEMtxcptKDn/uPjriJbF7geLGGIcddnAj
         iIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        fh=ke4RU1hLk8UuZi5gT4o36eNOvFFb/EwfBpnd4Ytq4Wo=;
        b=MvZMj3ZB+KkcJXlQA6yCZig5/Gd6L5j2bex97U0AemUlkhih9uzbQM6pJJJpKAMqGm
         HKvWHouXhRokQoxoCdAGSUekQ/urCNZIQM2a2xCaw/26OqIGt2G36XuaLa3veNSgZSpZ
         pmi+J+X0lFpAa/HktuoJHxbhGa0g/5LCMJVe0+0+lwwliqsAJzQzisbwmq6tXQyOxrwY
         RAA5M9/vLqUuCJwf0Z2aHdEejGCm+fy5l24lSQJ7d1JBFH+5NtOljNM8jDi0XinYk0xX
         xUUBY1LcKh/Ci+ys9WfkMMCmg4Ugk0l2drzeIACgILCkhNi0lU2LmD5T4xujNAzri5Fr
         LPew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202396; x=1794807196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        b=MKRXQ1NErW6Rfj0Xmf8qNxehQvtjZDoy1RkbsMJOxB268VqPTbH+oAj8s658rpUsg6
         cUHaYdVep0KePLQeZwOmKE60Ui6EL7NI2iIL/+I4u+BANd8OhLmf2cNGJQ/mGuWz4KZA
         pp2ITyUkVOOQbBDVj0sxaMPIknuIDAUGMKLrvMmAckWQL3vva6DdvBZDiY58XbX98jBU
         hj7W4p6JRyE2UIaTkBjcMkdPeWSjE32wreXJ8DDr7GqGZgnpS4UrhABTZuApVyFkQTtT
         BzXw1v7mFWFL8hjfezYE6qTUAibE8sEhBnkLzytWG+4vUe+RTQkdk2Ir9mmo2pqXhyCt
         543w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202396; x=1794807196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        b=JERxgKu96LnxY5W6D1LPdbdhfdRt0E8g85KAcyOmf7lsZrlEhLrAkZpPJY5AO+Rg+u
         glPnj0B5L/d6CA+9APkQlifHSLXloI96R6AybfMUuXPRKiUk0cAjIafs2akNYtuVFX3b
         ymddJcoAo6CNMI2+W6AfNqKKX3yeH48hOwxaIPMGhVUiKl4NLXKFLjuUlveELEFUjDil
         OuwZd24oG1YTBhlkQwRmtiBnKR4Z+Agb4uIwaEhocBw3sYpXgl9VGmcvPGZti7+Y/5yJ
         35eSVWQYoHUyyo727CdqX3Bd2YEw9rC3d36aQA3Wardg4K/kxPKVZq+CiN8cWguWgYa2
         tHng==
X-Forwarded-Encrypted: i=1; AL+hErFTGCAQrDUEqp5Xg/cqwywegLqf6e9qPX76oh5OFTEMbCgAq62avHlZvdh7vfJ/QDGFsfkTOuSCaAQxs64X0Cd3Qw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FIFHgDk4dPlvN7t2lyLQIl7QdqzGE3rKxM7rLOr6WDsa05UKx
	atoczEU7Tb1mjD0uWuxBxdgjqLrjbq+BT6MTOy7rDFFYmhRq4b+eXVWMbj87kiqeVS4O5QonM18
	qTzaCq/KzF+zkomvtVYPTjpfoyyIZSCA=
X-Gm-Gg: AYBFou2Y8XhdX0wucfpfQVsKvrMMnUxCZoK/xYiOsDSWqzkPP6VGpAAVj4NFLUEXKFu
	NcJGKtuySwVEVs2xNWprajei7G9M4dA1dNyhd4NoYBC2nenkRzvgqbTCiSqArdH31mrgRLib9rm
	e9tC7YdBEzo6yPEbgdFWmvYbHFmMpHmX5EEiaQm/F/H8s/GgfslV/59ZwY3flEFcBedxuEVb4Eb
	/lqrk2xhKmxv3+v0g7wB6ORAofIx9TBXSLJ1h8rJF1yanCXTyl0sfpJhxWCdH6LPgjrCrudFy5s
	TPyrVmvID6mHKqfw0gYJGAgLFzhr42MmwV7AJ6JiXiKpKrb+gYImLxP7KMi1V4SbNZy+9KPxutB
	k8TxGQRUd9eQNtjLjM2ZoYojv8ZxViCOpGSipjWxY+aSf9WvTezH9+DEs3YgKa97C2gyivg5Qx6
	PBuFqKs2hcQ19o
X-Received: by 2002:a17:907:6d07:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c4d6db36f84mr196935166b.21.1794202396398; Sun, 08 Nov 2026
 21:33:16 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:32:39 +0900
X-Gm-Features: AclHuK81e7ha_bd7N8D98DCzYoOYBA4JG5Pa3ARfHZchUTi79ZwM-36h02cCqWc
Message-ID: <CAAQKjZPOqEYe+iabUsdyfoxQyRRWUnX3Fe3eqEN8Uw-NU7vSFw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: scaler: Fix runtime PM reference leak in scaler_commit
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 11=EC=9B=94 2=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:48, X=
iangwu Lai <laixiangwu@cmss.chinamobile.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> scaler_commit() calls pm_runtime_resume_and_get(), but when the
> scaler_reset() soft reset does not complete it returns -EIO directly
> without dropping the reference.  On the success path the reference is
> only dropped from the frame-end interrupt handler, and scaler->task
> is not yet assigned on the error path, so the interrupt handler will
> not drop it either.
>
> Each failed scaler commit therefore leaks one runtime PM reference and
> the scaler can never runtime suspend afterwards.
>
> This restores the pm_runtime_put() call that was already present in
> the error path before the conversion to
> pm_runtime_resume_and_get().
>
> Fixes: 445d3bed75de ("drm/exynos: use pm_runtime_resume_and_get()")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Merged.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index c8a1b6b0a..dc8189685 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -372,8 +372,10 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
>         if (ret < 0)
>                 return ret;
>
> -       if (scaler_reset(scaler))
> +       if (scaler_reset(scaler)) {
> +               pm_runtime_put(scaler->dev);
>                 return -EIO;
> +       }
>
>         scaler->task =3D task;
>
>
>
>
