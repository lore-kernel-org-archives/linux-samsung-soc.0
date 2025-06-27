Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9827EFE4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014805; cv=none; b=dUAHDFonGGuCZew3seNb+eHBfcYriY6BhpLXE3QN3oM0TKfxuEAJB7VVKOnCnWZWm7ResfQvmrgTfmIBbTK/G7Y9MXZhJU2MCQKiCIgeEBCHHERvm04SuaisnbEq80tmWpumwuprzdoTsagVsHFWLuINlHwAXIvhYMoT/rfTe9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014805; c=relaxed/simple;
	bh=/rAQeWsCZirzGf2SXML4mEZtRuNBrIJD+FekdVfNmoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0m5TIu+IfoAPlqOaa4kKJro9foMuMx+jdzHAyhsmYzP4inmAu/oPTjD7pe0b1AxF4bZpHwzp/pEXjcU3AFvQ7j0sMSM9LqLdMzAKx0OhZoAWLq8nvLPIUbXfOJt3h+lS8RIJOy9gTXqxOAcuu7qvIN1ND9GX+Ngadt9ngioY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4o0CWEP; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4o0CWEP"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52b2290e290so757876e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751014802; x=1751619602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnsCM6vh1hbia2n0ngkw0JzLXSE1g1GRVQpvRtLRTdA=;
        b=O4o0CWEPXzUX+hudytuCI37eHgBn0ggSRWDS2vU9HCPCcx+i6KrVr0zlwWowF0PecB
         N1P0GoMVyYY6bRhL8UPzYm94KYHBm/IROo43/d5jHDjmUiaIw8y7Dwt/gYokKwsZfGB/
         262/N/fVs8DrrhuYuoDOsI7dtCBOr50KjExwOdo/2PVn8LnG0NaR4I1UED7W6S3ryuDh
         i98710BWSO74zCB87NriCB/FfOCN6J5gpfdqmIv+SN96EBQz0vKVfxfSgEppKmyX5OUa
         nuITMTtudjRY2vx1sVrhm23Q3h+J1WJ7+noTBRix2XoC0MMKe8iv67mrpT+uvc/82v1T
         ggFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014802; x=1751619602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnsCM6vh1hbia2n0ngkw0JzLXSE1g1GRVQpvRtLRTdA=;
        b=NDGYi8drny1ZElnDp3m4BZzG/iRtXil7b6yN80vyjV3vYXBha9kn92LNrRZWFJAL2u
         uMBewYs6MdflZfPLWq6n3OdwA7vFQPfmX+61zdgk6dQLMu4SMW3Up9T0gCWUtmLnxPwW
         IXx3D4v9rI604xo4Mbe+nL1sPj2zAhAEY9EJROscBhEfx1AmiN7wVQqaodrzW39/1xWr
         R8e8PeBtSp35KbN6k6/3VUHDe80FRFFaK8HXlVBm/CkfDgeR0LlY39pb4IgfDH7+1ygg
         o9QmgJHVkKeTdX48i4nmrDAB/wgm3l9K6J4IGNMlsvpmOshZQPJpVyzCAiFDr7mu0RUq
         B+gg==
X-Forwarded-Encrypted: i=1; AJvYcCWiEeHxhIXZmDgEhhhGROJzGOZUTP53eO0xgo9b2DdtY6LRwgouQUpGnsln/ASVgVCjwadjYx6aYuRL6XQnWEkA1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG5RAbj4Q2U941YQPUEVWNBr5zbEcnADBXrg7ADQk4D8yaCkns
	dmuDtKNkeW1FRou0SsWnpKACnFTIArSxBccQvEscBJn9lsHvdTyhrbHSVHgGkxXeHdJXEVxEvx4
	k69ceb/mFUlKckqQo+5m3Z6FR8DOts4TlzMGyllaRqQ==
X-Gm-Gg: ASbGncvH2A+rd4cUh6YEHdTzAewiB0g9lRmLEtp97tr+hqgVI6Js6vgosk8opxovsCa
	9VO0xExBksRv6Kkf2esb5NYXJFA/KQ7Bx979WssiNL4NGX1kjrHT+9/hNI7SI7/OjKO+rsgi4Jd
	bQ9g6mjZxIW5h6W0ESsvtCtJ+Fq6+uTRSLSzE9ptm4wBltkbS/k5uT
X-Google-Smtp-Source: AGHT+IG0giQJgiPaZuODgMaMoAB9XTNdwCdCo2KNw4Z1XIix6KlPI3eNjv42gi2fFl0eXZTrN9Xo04XnwaYsNYTjCsI=
X-Received: by 2002:a05:6102:c06:b0:4e7:bc41:a9ab with SMTP id
 ada2fe7eead31-4ee4fa0bfcfmr1949507137.23.1751014802254; Fri, 27 Jun 2025
 02:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>
 <20250618120626.217023-1-m.szyprowski@samsung.com> <96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>
 <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
In-Reply-To: <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 17:59:23 +0900
X-Gm-Features: Ac12FXy11lwfrAQqrGiTkAgvbq022_Vm3UIn23uII1Nxc8apm6Ln8LIsYR0HYKQ
Message-ID: <CAAQKjZNQa=g=a_sWnhVrR5_9EJx9hVqbi-=HDXWtRwqb18-NKA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: Guard display clock control with
 runtime PM calls
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

2025=EB=85=84 6=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 7:39, M=
arek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 18.06.2025 14:25, Tomi Valkeinen wrote:
> > On 18/06/2025 15:06, Marek Szyprowski wrote:
> >> Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-ena=
ble
> >> and post-disable") changed the call sequence to the CRTC enable/disabl=
e
> >> and bridge pre_enable/post_disable methods, so those bridge methods ar=
e
> >> now called when CRTC is not yet enabled.
> >>
> >> This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
> >> source of this lockup is a call to fimd_dp_clock_enable() function, wh=
en
> >> FIMD device is not yet runtime resumed. It worked before the mentioned
> >> commit only because the CRTC implemented by the FIMD driver was always
> >> enabled what guaranteed the FIMD device to be runtime resumed.
> >>
> >> This patch adds runtime PM guards to the fimd_dp_clock_enable() functi=
on
> >> to enable its proper operation also when the CRTC implemented by FIMD =
is
> >> not yet enabled.
> >>
> >> Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback t=
o pipeline clock")
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/dr=
m/exynos/exynos_drm_fimd.c
> >> index c394cc702d7d..205c238cc73a 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >> @@ -187,6 +187,7 @@ struct fimd_context {
> >>      u32                             i80ifcon;
> >>      bool                            i80_if;
> >>      bool                            suspended;
> >> +    bool                            dp_clk_enabled;
> >>      wait_queue_head_t               wait_vsync_queue;
> >>      atomic_t                        wait_vsync_event;
> >>      atomic_t                        win_updated;
> >> @@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_=
drm_clk *clk, bool enable)
> >>      struct fimd_context *ctx =3D container_of(clk, struct fimd_contex=
t,
> >>                                              dp_clk);
> >>      u32 val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
> >> +
> >> +    if (enable =3D=3D ctx->dp_clk_enabled)
> >> +            return;
> > Does this happen, i.e. is this function called multiple times with
> > enable set? If so, do you rather need ref counting here? Otherwise the
> > first fimd_dp_clock_enable(enable=3Dfalse) call with disable the clock,
> > instead of the last (assuming the enable/disable calls are matched on
> > the caller side).
>
> No reference counting is needed here, as the clock enable/disable is
> called from runtime resume/suspend of the exynos_dp (analogix_dp_core)
> and there are only single calls to enable or disable. The only problem
> is that the first call is fimd_dp_clock_enable(enable=3Dfalse), which
> should be skipped from the fimd runtime PM perspective, that is why I
> added the (enable =3D=3D ctx->dp_clk_enabled) check.

The fimd_dp_clock_enable function is called from
exynos_drm_pipe_clk_enable(), which, as far as I can see, is invoked
by three modules: the analogix DP driver, the exynos5433 DECON driver,
and the exynos mixer driver.

First, both the decon_atomic_enable() function in
exynos5433_drm_fimd.c and the mixer_atomic_enable() function in
exynos_mixer.c explicitly request runtime PM resume before calling
exynos_drm_pipe_clk_enable(). This ensures the device is properly
powered before any register access.

In my opinion, the root cause of this issue is that the analogix DP
driver does not follow the DRM atomic pipeline and attempts to access
the register file without requesting runtime PM resume.

As you pointed out, the main problem is that the analogix_dp driver
calls exynos_drm_pipe_clk_enable() through exynos_dp_poweron() without
requesting runtime PM.

Given that the exynos_dp.c driver, which uses the analogix DP module,
does register the runtime PM interface, we should look for a more
generic solution that ensures exynos DP is included in the DRM atomic
pipeline chain and requests runtime PM at the appropriate point.

Since this is a critical issue, I will merge the current patch without
further modifications. :)

Thanks,
Inki Dae


>
> >> +
> >> +    if (enable)
> >> +            pm_runtime_resume_and_get(ctx->dev);
> >> +
> >> +    ctx->dp_clk_enabled =3D enable;
> >>      writel(val, ctx->regs + DP_MIE_CLKCON);
> >> +
> >> +    if (!enable)
> >> +            pm_runtime_put(ctx->dev);
> >>   }
> >>
> >>   static const struct exynos_drm_crtc_ops fimd_crtc_ops =3D {
> >   Tomi
> >
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>
