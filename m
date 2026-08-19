Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8482C11DE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144550; cv=pass; b=QunDSj5/FTP/zzILE2y4NcXE4LYhHdeIz9Ilp9o+LQzRDtvGP3hWMbRi1hyKoTRj3spmR9XJjRpy+XfDraVIY8j2hwKEo5hSQUjDX6hVkBLdL+k2zGO+agSVKVCP62V3mHUC2nzeOrHXh1Y8iMWLg3XrVFX81pos2H1WAN7Rzqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144550; c=relaxed/simple;
	bh=G9PHIwTakr3faXICmTpJD0bFX1oHAGO4WHzkOexbAto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdOOGFbOVVvshTKByimtNCxmCnVh7vJZGvLYtR1aKuHfrsdcMyOb0KoLPjs0/SG3AkpIFY81QJQ5oDu4rcSDlWGukfp6wICtlh0i0N7nW6dJ19aI0TIOag3hnY5mJiiNxWUJQ5o68wyPqNcj6WLzYwmDvClJyTbQhw6uyotVKOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D32PE2T7; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D32PE2T7"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so389336e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 06:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787144548; cv=none;
        d=google.com; s=arc-20260327;
        b=WJ85jo1I/72lF9b4pwRWG9zX9ecKORvOjxs874ir8aopAlWYF9qpfQuRXwEqvfTXC7
         jm95FmJTwCEARDth1SrADewd33NrOkdc8FwIRq58Nha4PpVM44WDl4ESTG5L8PU470J6
         drtuWoMvqblN5hLMT0aycJEkfeTfOSX+vSkWKHSyXXjM6AH+k0KtPupH9VkymttWDoR4
         PIgR8joixx0CmALLum9HPnr8Ejn7xfMo61VXQ/dEcfXfx3bQrtV93uq87+F9ZYNPbu5e
         b2pcjX3hMxg68tedDlrsNzsLg4dY9GL+RL4jKK6pBr3surG8bOCuMBdAiVMw5XUNsG5l
         KHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=;
        fh=pRjxktLSRwCwiANIbH9q34otp+owhJ6Buc5aDISmPkY=;
        b=HwiHJetffD1FtZAo0gbMcRjJqq3MkMrH9YCUnoKEINyTxSfb2IX6zovNxk2/689lwh
         Jg5nQGW5t1n+9/x3dwbTnBeqHwyu0nosQMBrvh5OyWoMTS5MIcJHZDDzxIf92RJoMP2d
         n8TqTt1wjbr2abra0fGcDmOTS7cinruDFWs0bSQlpx1gKAtUKK3xPX4LMXhjjaFPF2Ku
         XcCp4IS3CmhBlKuk6/2m90YaXkVqg7Y4ypVgHPSY5PeGm40xkuNCrAGLMHlQWu5Rls1f
         3oU2fI0Pya3abW/k0cKRp84+krN6un3aBeqHBcvL2mwyHWe+Z5rmvBHd45nliDCETydc
         K7GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787144548; x=1787749348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=;
        b=D32PE2T7j+r+Cr7CRSfsBr2NEREcXe+fDeL2inKJV9/5XE6meXJDCOQxvUEVs8mx/G
         HTMY2N5d/KAvN2b6MdrRU1QUBCJRFvCouPzFzSfq5fEI+wA2I3kuWqzHEySqrPFyKL6o
         5U3495AY1eO59ON+gxEfOO2ljN2QGAkeiS/ZUOV5/oEZQOqh9yF+4R+o0Xery/Mq4YHK
         Mf3OM3bwuRL8bHDD1fkhRYa1oV9qtvazdYR5M0QcCWSWvuK8BxiCg8N4YUsauGd19VEh
         dQ3SPzwLwO6z7b8g3Fxgr2a0f02SOxyPiBdLl4o6XjwGHzEHp5oNf65zEdEAtf0WUKXB
         TCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144548; x=1787749348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmuCUeXTSBWTdXqlKd0iubpusTbKWwEzyplHp2MiIhQ=;
        b=plJ7iRJi9yT5RDckjiQm5upC4Y+val32arxkVtNcsNi0x4vrYf/QuVdCm3DUBXE3Cm
         3m/uI+VZwIF/MU2XzO2SQlCkAh9MCzUud4G5PXZ0/0yD3lh6zT/lKZtG17YEYhSKH2Wi
         vrbkmZk7K5RmBBSyPtaj+Df5A8uVP715na/t7WkGZSnvfMqBiJHI6ieGLBJKhYxT6Q3w
         2tWymMfxrMhtd7QbXUM3AF5I9KNXLsu55aTIfsBLeqy/tqByqtSpvl1PFQzYv3A6xJJg
         f45D2w3Idwu/kaRvUi51flMv5Kaz2U69drPLLQH/tw2VMJWK/bpBBtCWWUvJfW+Ezphq
         RnVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOduC4rz0TDCYbkOEPNFxOCJbwBpFrl3Ukikv0hQqRJOxm2TrNtNy6mixPtgT5smVlvPT49kImfgVFNhwI4WkQXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym2f7F/PWcOzpwa1Ry+43DD0vd/Z1KpHG+x/OUB1h8EJhPU65x
	dPAKgp5aM8i5p0C9ue2jZOglXmvfjqi6gBzplnbvz5uUNT8Qmu9qP3aiDEHy7aK3Z/z3Jbun8fd
	HRq0S2GHLdmEzLq9mgaS5TZ1h5sOMU/o=
X-Gm-Gg: AR+sD13athIq7yEdG19xX1+CRj3q06CGsBGs8ytMx8ZolNtvMBt1Z5kGv633lTdAbD+
	4wotm5U1aqTHTw0ijZDbU2kG9zKXbvmW3dHF+wDTaaelT8zWfYQaWuQxCOLE0AOUt0qxtYzTKfY
	ne0tU/vCWPCdLjqGO1X3eooyCQFvc0zXcAZKiIfvlvfozwYKl5+fhmncsz9sRzu/tjb1RX4h0M1
	bq429hAl4C7PNkkflUan30Fhb9qBYWl0qhiQtZoGoxqJTt7Ppqjv1Y6q67brcvJ6t7wtknvdP0x
	99IF3slUhkOLy/VAt+LRLeCH49veXBAqDbVvA2+I/GCA0CH6Enjj3quNY9dIDgem5obb1i5Y4Xg
	=
X-Received: by 2002:a05:6102:b0b:b0:74a:b1ee:e034 with SMTP id
 ada2fe7eead31-777f958372bmr1298668137.8.1787144547953; Wed, 19 Aug 2026
 06:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_989057BAD94EB58027BF7E9528F59A458608@qq.com>
In-Reply-To: <tencent_989057BAD94EB58027BF7E9528F59A458608@qq.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Aug 2026 22:01:49 +0900
X-Gm-Features: AcwNN1Uag8K76WBZkAil604Sve_-nPS221p9PD--DnEWCdbR_HfRd-PUmUZjhKk
Message-ID: <CAAQKjZM_Vgx-MGNP45-yQhZzV-H2ccLSP6pWYaykU5KxLMVKfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: fix clock leak on resume error path
To: Jiawen Liu <1298662399@qq.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 8=EC=9B=94 18=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:46, J=
iawen Liu <1298662399@qq.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: jiawen <1298662399@qq.com>
>
> exynos_fimd_resume() can fail when clk_prepare_enable() succeeds for
> bus_clk but fails for lcd_clk. The function returns the error without
> disabling bus_clk, leaving it prepared and enabled.
>
> Disable bus_clk before returning the error to keep the clock state
> balanced.
>
> Signed-off-by: jiawen <1298662399@qq.com>
> ---
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1325,6 +1325,7 @@
>                 DRM_DEV_ERROR(dev,
>                               "Failed to prepare_enable the lcd clk [%d]\=
n",
>                               ret);
> +               clk_disable_unprepare(ctx->bus_clk);

The analysis and the fix are correct. exynos_fimd_suspend() disables
both clocks, so leaving bus_clk enabled on this error path does leave
the refcount unbalanced, and clk_disable_unprepare(ctx->bus_clk)
restores the symmetry.

Merged. Thanks,
Inki Dae

>                 return ret;
>         }
>
>
>
