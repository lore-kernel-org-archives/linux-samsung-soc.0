Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A03422541C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062672; cv=pass; b=W+6rqVsXbLigjdjnHCbHXbsBnYnikjGVxuPzdU+bbZ/a05EJrEGI+7MJSEuvt86l92izYNhlJ66/0e+v7DRtoVeiKANHVZy4SZ4BZ3cCup3Y5HrNPzCEiyZ+A1RzKJ182suQoGIxcXDI6IC5lg82pwpOoYOL1uC910yRHmSLU04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062672; c=relaxed/simple;
	bh=vwkxPYILgN/6NhAbkyzZwurULL5luKgvv2OtD8JvvMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0Kpu+QmHPOq7lroCUql1X9H0nGfxSPlnhN+XHyWDYq2/UfmPbLQeCAuwo75WELGjxsP9t6AYHSKVvuvh0tm3z53FZouhAgV1IP3H0LPyI8X0hOYQJ3gwmRf6BlHhhrnRrHEGZ+b5fdatq73rogLLhfADbgGLDPsXCEeG5nG+z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6NZg2JJ; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6NZg2JJ"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-96387977596so1054096241.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 06:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780062670; cv=none;
        d=google.com; s=arc-20240605;
        b=MQEWAaY/uDnsvlV4+r98z5+lVLnEAP9S1RR0oUe3YqdS4rHnh+BoqeFgHhDvRhUO/G
         R5jl4MnPtcxVK4G2ngv5Il7Em9SI3UurTKJCCdO4ODrNNni1reXfRbCepAd+WmquehtR
         0tgm0Dsi20LQonByU1jZQPPIdWRasFCBZiTFJS9JtmosZUlP0lZ8xNLNEjOeo9iFB+VN
         hYMP6O78y2plTpFVvlPMmOFQa9JrCaKL8ujE5A4SPs9Rh2yTN68yy4H9zf74foiOTIqe
         sGnl50Bvvp6aJPEyZH3KylJjlesn+2lrEke90wCDxYThh26bTk18h+UMCQdVmgHWoAji
         YxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LOcRuPJ9cZVqNSppauK5QHxQ5QLMrIqs5Mz4GmASRBo=;
        fh=A2AIknq95RQe9LaiFk0WTAqKlAPMfcNdCQv4jpocZx4=;
        b=cZQudmH8PCtafKMRttzta4ycL5vQnfF/MIa2OHOcbn9uel6pqmGdosUJ6SyptwmuOB
         tm8GOa+nBQYMVeeY/k5oU0ESxslSnxHzAt9WXNk3VSS4eJaaINqkyeKxck1IG15I3VkG
         WODSLWQrfCKsV/ezFpCA3TSEgf8aEJ25PGaa4R015ubpm2KgWObfbLsvizfuw3eToWG8
         SW8tp4yswhW042J9BiSjQPcH0qDFOuZs/Vg6XRXackvQus4LIyJJZoD6/RIRM0x1gP4D
         uEk5GoXuyQ8x2hgX7auVbN8jmTlPPKRGXUAp48bfFu9QJPDDq+MoASU7LP35JD3z5jRk
         dOMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062670; x=1780667470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOcRuPJ9cZVqNSppauK5QHxQ5QLMrIqs5Mz4GmASRBo=;
        b=T6NZg2JJKFNp0H987637G4hqooIgbgHPObvWrKkyYg4CPm5pdn1ZdCdOKEvcSf3E8K
         qJV23sfmW/I5KVlXUqqPh3JisND5Omb5vtECetJKllPNnU7jx/pCldjh3YBylNhMkm1F
         TcVit5/vOVJKztoGuu0cySgoJAAjuRwWXV1s6fCPf/B3+2aguxLfz06y2reRc1ycMuKv
         3enHf4mE3KMOj9O1EQU+GPTxN70U5UdTV63zgk9iPzeXth3gNdkO8EXIO5sUIw/yDTsU
         NmqApez+jU0KNHEHNzcv0SHTqK2DK/7waTG9KQe/Ayn06JSw5/PlQBfv53x1raAQwgoS
         PW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062670; x=1780667470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOcRuPJ9cZVqNSppauK5QHxQ5QLMrIqs5Mz4GmASRBo=;
        b=k6IXFvaMQ6rcNeckIVVTupAn0BR5E+beQLiAa04DwovNg57fHAPBFCe+hQUpFb8OCF
         vcaENzryYkDnZvjF9X+IWqmfGIS2Cj4Djl+iOY3cgAAnhnrgABrV6Ba/xN54ggWIHYtT
         nLRZ30eN1fQjcgEe2IG5XB7BO1z3fAhuzaDA81rm10BvqflZrV7/VTDB0/DEzLCWJYJ7
         x3Y8Mb7DaB3lpwXxWFCfxGQR46Tjy/5Bx6ZlphlJ0vKNJD/HaasVs9bN71JKeNqxSVr+
         eFQL9Fm4qFinRmoE8XepH1I5GsltbOFtPd5ph9C+7evVUteWvXFKgM1Zn0l0rUfQclmy
         KEjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9h3CN2vc/ApYK+HDiU0C7HGS9jsJwamTFQl7DbmFI1A0O3Znc4+o80ZdUM2+YyyRkk6tOrN8Up9mOpnjWIdGlKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdc9xMQv+WZ2AHK3TolMXx5Xi5Qbii59jIKZU6fNmQeHiZurrI
	R3sTjDlV5Z4i4HmwEKpPEvSpsAImSc0E5OFAPDV4iTOp3h3U2frv/9/QEeIHOkar1PK1NvOJIHx
	zya6r2n4scjxvrTfo3cJwyrlfR1ZQ7w8=
X-Gm-Gg: Acq92OHvoXMj8XVW+MMk/LptRqQPapuou3c9V5R+Ha49O5wQK9EHqSQgYSI7Xdc6Lht
	EhNZSYm3nT4vbnDL3ZY+v1pfSFHlcMRT4/4+38RFkFLw5TnxEHOmbLH2jXlQGOigk27W5PBFjQK
	Qqg+EKDXhJQmL7ZHSzJMQ+1ueU6z3kJudCB4t9I+9IT/Yu7XaaiznjhKvL+RpKKftqPXaJWuavZ
	QJ9LLq1nG82wLoan7PVPvCRc9UWVS3zFMMTl0BBNU+LrN8z9nGUna7+V4ZsfbzLA6qoHGrfZy+J
	DmGnW5qE8oGtZ0Dkw8uqd0DXiRpEjjk16KosOhJ73Za4gvxb
X-Received: by 2002:a05:6102:800c:b0:605:ead:8f38 with SMTP id
 ada2fe7eead31-6bf4be6e18amr1045034137.29.1780062670483; Fri, 29 May 2026
 06:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521143624.56906-1-inki.dae@samsung.com> <CAPM=9twLzSJh-rHpNf-JOPBmzFnFevc6v-gu6kWfLCTPeyWLFQ@mail.gmail.com>
In-Reply-To: <CAPM=9twLzSJh-rHpNf-JOPBmzFnFevc6v-gu6kWfLCTPeyWLFQ@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 29 May 2026 22:50:34 +0900
X-Gm-Features: AVHnY4LajPaJPAl6-cQaV5Ud2YXIRPGXwgLe4juQy96j3uayJT0aLKT5BuRsq0c
Message-ID: <CAAQKjZMxtiWv65t1W_YAtwPQdawkDhKVfgywQ83fXTx9mD3tjg@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
To: Dave Airlie <airlied@gmail.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

2026=EB=85=84 5=EC=9B=94 26=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 10:01, =
Dave Airlie <airlied@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, 22 May 2026 at 00:36, Inki Dae <inki.dae@samsung.com> wrote:
> >
> > Hi Dave and Daniel,
> >
> >     This PR brings a cleanup and modernization series for Exynos DRM,
> >     focused on fbdev emulation and DMA/GEM internals.
> >
> > Major changes are:
> >     - migrate fbdev allocation to DRM client buffers,
> >     - switch fbdev geometry calculations to DRM format helpers with tig=
hter checks,
> >     - fix screen_buffer handling to match fb_info semantics,
> >     - adopt DRM core DMA tracking and remove redundant Exynos-side code=
.
> >
> > Please kindly let me know if there is any problem.
>
> Hi Inki,
>
> In file included from
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:16:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:
> In function =E2=80=98exynos_drm_alloc_buf=E2=80=99:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:69:49:
> warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=98l=
ong unsigned int=E2=80=99,
> but argument 6 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> "dma_addr(0x%lx), size(0x%lx)\n",
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr,
> exynos_gem->base.size);
>       |
> ~~~~~~~~~~~~~~~~~~~~~
>       |
>               |
>       |
>               size_t {aka unsigned int}
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
> note: in definition of macro =E2=80=98drm_dev_dbg=E2=80=99
>   563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:69:9:
> note: in expansion of macro =E2=80=98DRM_DEV_DEBUG_KMS=E2=80=99
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> "dma_addr(0x%lx), size(0x%lx)\n",
>       |         ^~~~~~~~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:69:76:
> note: format string is defined here
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> "dma_addr(0x%lx), size(0x%lx)\n",
>       |
>           ~~^
>       |
>             |
>       |
>             long unsigned int
>       |
>           %x
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:
> In function =E2=80=98exynos_drm_free_buf=E2=80=99:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:83:37:
> warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=98l=
ong unsigned int=E2=80=99,
> but argument 6 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
>    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)=
\n",
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>    84 |                         (unsigned long)exynos_gem->dma_addr,
> exynos_gem->base.size);
>       |
> ~~~~~~~~~~~~~~~~~~~~~
>       |
>               |
>       |
>               size_t {aka unsigned int}
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
> note: in definition of macro =E2=80=98drm_dev_dbg=E2=80=99
>   563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:83:9:
> note: in expansion of macro =E2=80=98DRM_DEV_DEBUG_KMS=E2=80=99
>    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)=
\n",
>       |         ^~~~~~~~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.=
c:83:64:
> note: format string is defined here
>    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)=
\n",
>       |                                                              ~~^
>       |                                                                |
>       |
> long unsigned int
>       |                                                              %x
>
>
> Can you fix this up in a follow on PR?

Sorry for the delayed response. I realized that I had missed the
relevant patch. I will take the necessary action to make sure this
does not cause any problems.

Thanks,
Inki Dae


>
> Dave.
>
