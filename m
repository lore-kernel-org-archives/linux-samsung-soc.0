Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794197858;
	b=4j3YX+POIk6MJu8TpJ1Fl0YRS/oXtiqGJc3SnPE/jQOugI77fnBrbsc+sXBG3fNvoSQZ
	 kqQK1tLXguGp7l8fy0D4Gui+PjPYQDwL92kzKgwXcgzLLHqzTY47eteBH52Sj6MHUvYeJ
	 qMyA8WrS5xTaxfEet5RAXuPQg1IPdlk3QEq64GWc618kvwMTG5rYnGBbOyQtLdF7eKzWR
	 ukU3Gfzwn4wkyV5h2XzxdSjD+3H5HMsgB29BwHaZkWCZVk59SXBC9KPmkID+JzbEGALBD
	 6/X5ClaIYJxO+B2RYkks7U2yX3xBKEFU1viUn/nQ5BGPe984et+5FY1zO79TL045K7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
	b=1U5nU8vmaDFDwzPDjc3wuWDrlKRxD5UFCKFoEyhokCFr5+W+ljH7oJj1aZCBbRcky74d
	 Nw6HUQRIKTEcVieKRO1a/ZauLz4rKPhgz1q9aIBP7dRZad9/i6lBt6iWUU6TrFkeR9Zd7
	 DVa51I5mjYfdXmZqd7fFlwxx6+4BDL5wHritEkrcqbZXz3/ST/P4ep1Uwroq90Wz9cIsV
	 TxURrfTkNEaDH+jH0M7pImRnbTiTqNMe735hfKkyC7EsqPensRmFgCognUbfw+a8ObWyQ
	 PweUSvUWL9RX++RGEpFfItv4fjX9K0Ezg2SyAo3Y64cgp6di5MYZmLl2446TFouC31g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmSN4ObZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1004606A321
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 04:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1004606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmSN4ObZ
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so57340366b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 20:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197856; cv=none;
        d=google.com; s=arc-20260327;
        b=ry7PIrAZRdVfI1kHgmazJVN1XlUk+x5lEM2biVrw4TENKtXjN2vc7FLIILDl/UzWes
         rd0aduHHjuEkQm+9AXzaxJHs/5rX5QGLcZgY+qymfipoJ4yNZk2YlaNKh8/yq2v47moi
         PRfjzk5Jyf40/96AgewoBAux0bvsu+9fG8GTK4Ll6KWfNpkFRp7BctOz4VuOo7iUcYEy
         zIp2woFuMjWI+LeBG4kUSAthydsBIo3GQW+0fH0Q+ginxw+vgtKq6YrQKy5J0bhkuuSh
         chyyYUqqSUdQeoBDWij4xWeQ5xGm4WYv3UYM6HtvD8rBKiFz8uBpWFmwKxexYYOtP5gV
         mUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        fh=BoX4asisLIW2LEy0y0wfZZyiNC4lzw8LihTb2ckV7Kw=;
        b=jWy/tAyXadCdBWrQs7IuOKJrhiMDtqn5qIsbJs2AhyC/qhfgzYAYSVuMFj7HBvU3m7
         n2o8cbg3mefC9B3YmWfszcjcKuLp8HG/6FCzQf/ZtBcjGUJ1NYlhvKgYDvP4mSkjX4pf
         NsSR0AnKkt4e6u172PCP6LAcPQOM/6NbXjidP3VWthmtbqf03xOVLr40LlC+PWgTiv+b
         Calw4fUqXN8mF9cDrbQq3WE8+UvxJ2xFnvMYIbX3qPqrstIKhUZoYkH8xpLneQpDx7gX
         NRXoUL4QWcfB8dkGlpFJz7FEn40qZPOcDbEHN4jDkciHEzi3mH9W6ErdS+oNmpnO9vi0
         Iwug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197856; x=1794802656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        b=PmSN4ObZyYPLpgkLPob3BwxwnjhSSVKm6R4cgQb949Q/3+WwiXY3ZLG4e9hWWLi/9i
         jjMDRJMsyYXPFhPouQqoxSM5R1SdITIPKdU5G17DrnXMpFhT0BEoz7yV4jGeUndhqEbK
         A5oD0TgnUtevbcbdl+X6a6drvERlZQUaetOig8Pw/zuZFNbfOpsVbJFwjjeXw0PVOQdz
         r2CFmSAt4CB96uopyN2+LyaE/g/8eh1WYvK7qoZuWL3hTY7TuWxYXC0rAzpP+/Z0J5uD
         AeznEtoSkPaz8GMYkamMZORPU8DuLMZ5w54cJyxhAqviPtqqigmjejH6S+br6KiejkWM
         uV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197856; x=1794802656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        b=rrRwnbv6xwJ/sXVXLZevvNHRhwPqDWNbml76ZVsKObfFanaWVX3+acqjzH0UMI9T0m
         mwrq0w+h64qU4KO6c3rztITbqJ/Qx0VUOdQtQ8+gJ/SViIFidv9LDU8/HM4fI641ijF9
         Qy3H2uDSiJxKaHqXC23YkNa3XeAkM2wyU4NtsHiBRpvrs7cKMXrMg8l0bmtCSjraGzcm
         EflA1jpcWmpbb/FAhL6XMETRRNTUd1oXpnirEOJ8tWoeSmCKBCYhntFgfhezHihV96SH
         OKd6KGyq7WwSsYNd1/0zmP53dgIE30NKQjqWfViYxXmYTzJhqF4lPyikxbNO4xM0CTiO
         V3Ww==
X-Forwarded-Encrypted: i=1; AL+hErHJHWrTicBYjr5zdjmCvCsH4RQe8Zt610/OGKlpOyXJ+DnTdo8W5xKPB0k7ORUdZZWq5F7VLJJn4Qc/lAmAi7Rdbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qxuRs+5KXj69egf3B5LmLyUj5EbgEW/Xs0DGc6xuo2W47aqo6
	BFxb2YZk5eo6QUwTqw/87YsJzQSal6VDiaZoXuS2S3IunTdgFVD3ajglX/P4TLD5tukJXZ7heis
	ihI1JXjzAlZgGym/vB1WmWc8vShlhUq4=
X-Gm-Gg: AYBFou3UdTOTG2axfWpH64yLT2b4SixlfF9aXOQzOJ4IzZUUSYsYR6J5Q1ctj4eGSZm
	dDHbtZZeKyiB/K/Yl2roxqAJFCeWQBZ8xpdri6yEiZs/moqMj0HyRWZYFghnb4MJ3USHQXPTjnh
	PAgJQXELw51dt4VhvDce8oZYOF4xgVOmpk2wgpAWuLQz3UCGZmhb7KxlQBSZDvwbKBgIMxn6vaT
	YziCFZVcUo/RhchfltL4pOBF0pQdAkptoNxvjw2+USpOaJZXXYBtWgaC7DX63ej068PtR0gzbuA
	ZA2mT10PvWxA272g4jfe2sEtq8guGVhxO4doAsJ2RXD2egDvbVVDIQkxqFd3MvwqlyHQUP7cFJe
	KcHEd3mJvEopcdgndiE+LcLdEonVZZtPynN2P6WRVPT48IH5GNOrWFRNA4jki3fl9y6M=
X-Received: by 2002:a17:907:6d1f:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c4d6d4a3b57mr182492066b.10.1794197856252; Sun, 08 Nov 2026
 20:17:36 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003080927.430719-1-yaojiale02@163.com>
In-Reply-To: <20261003080927.430719-1-yaojiale02@163.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:17:00 +0900
X-Gm-Features: AclHuK_-J55s4cWgSUjxGa52TLLl1osPNTJb75kFDeEkQ09-Bw0YuPtbJyTYZXU
Message-ID: <CAAQKjZM991J2BoFkqnsyP35Lv91FYmmdpN93vqRVxRsTV-pu8A@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: handle runtime resume failure for DP clock
To: Jiale Yao <yaojiale02@163.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI,

2026=EB=85=84 10=EC=9B=94 3=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 5:13, J=
iale Yao <yaojiale02@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> fimd_dp_clock_enable() ignores runtime resume failures and still writes
> the DP clock register and updates dp_clk_enabled. This can access an
> unavailable device, record a state that was not applied to hardware,
> and later drop a runtime PM reference that was never acquired.
>
> Return without changing the clock state when runtime resume fails.
>
> Fixes: 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with =
runtime PM calls")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> index b6abdc4f2b0a..ea2b961f0cbc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1049,12 +1049,18 @@ static void fimd_dp_clock_enable(struct exynos_dr=
m_clk *clk, bool enable)
>         struct fimd_context *ctx =3D container_of(clk, struct fimd_contex=
t,
>                                                 dp_clk);
>         u32 val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
> +       int ret;
>
>         if (enable =3D=3D ctx->dp_clk_enabled)
>                 return;
>
> -       if (enable)
> -               pm_runtime_resume_and_get(ctx->dev);
> +       if (enable) {
> +               ret =3D pm_runtime_resume_and_get(ctx->dev);
> +               if (ret < 0) {
> +                       dev_warn(ctx->dev, "failed to enable FIMD device:=
 %d\n", ret);
> +                       return;
> +               }
> +       }

The early return on runtime resume failure avoids accessing the FIMD
register while the device is unavailable. It also leaves
dp_clk_enabled unchanged, so a later disable will not drop a PM
reference that was never acquired. The change looks good to me.
Merged.

Thanks,
Inki Dae

>
>         ctx->dp_clk_enabled =3D enable;
>         writel(val, ctx->regs + DP_MIE_CLKCON);
> --
> 2.34.1
>
>
