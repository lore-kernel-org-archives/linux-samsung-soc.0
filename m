Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04D22425B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062132; cv=pass; b=Pz9oqKhw7NMJeCP7e7TbP2ryKMdoAaximPHN82ui/xkRQPJ9xXetbAbzGlvg1BqCzgBD72ZzfYYxuUyDizcN6YQqDn5Y3NRE3NbhwT7XnINiD593bbAZ7HsWCW9KtQpMGN1vQQVTvxvUNNyfKb4m1KMSvk4zV7DQRoJEXIN67CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062132; c=relaxed/simple;
	bh=l0XxQrPqWM89ssOkBf/9GMEQQv8cT7NfcFMvlEnS5WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBM+Ia6wlAmdDn6g5L0fDejJqRmp7bDBUgphvQjWeP5nkUKAn6LbEwrKTWAb0iLNz4e+7+QY11jiCFkn+KQKmx3oX1rrt810sD1ZwYtpPeauGEEJACA+CwAuOUgrvFd3+IiWgoNuP1K0phPG/Br71C5vkei5SFIQLmvNkJqbhvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bg52T+T2; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bg52T+T2"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c449ac3588so92158137.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 06:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780062130; cv=none;
        d=google.com; s=arc-20240605;
        b=GqQ8vrrMmFwYL4OZF8V8JPUqRLbkV3sqiLVWykweS8OYM/dk5mML6/by925JF23ue9
         jkATG8DCfRbXiHoU3VLfTd8q7s09L0f0dSvgdy3GQCQYbgo8gPuYIJ5f68cGVJjd8HPQ
         wmpSA5helGVeXLbNLdHg69BlyCAYgNTl2ihIapbUfR1gknrz1mhoydlI477P/CqNn2Al
         L2cLlzCtCnbvrJuKqs7GxsxVyfuShoiuhvkKUuL5fL+0fRNPjoEz/Mz2Oie8aWMGdk7h
         +4ovf7cptQA/d3gxGVqbLo6o4UmMHkWLgs2TufA5iyftJy2v/CerYmrqahUZrGwUnTNs
         l4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=;
        fh=l06lH0wHeYxKoBn8qvf2OpPTyXSNXPujqQ/jELHrCWc=;
        b=ChDE1Ah+L2NxLCQFOeUQdPm60snUtA2RV8CuruH9LNfJfkJY/rFJhwSBEhYMIS9E5g
         VahgTYJ8BpbrIKMS/9hSau/dXrfI/djLaCL+tBZba2MiGFi9MYjpgOyqvN24g3lpj1Ws
         0PQxVyw/Ie7aNinjczID6gdBdbeztWaA1Ar+aCZbJ+LMsWWtFxyFQq9l66Cnu+REr5mY
         0ZOjIN/GaDBi/JWe46aMRVKBz4DoTEInWxhSrr8g/MuaE4nTly+6cVD2LSESnDujmyn6
         2Rg2vqAzyrUutmhNlNS4/ggHFQL6Y9jSRt5qNK5U/lTA8FZD3x7KTyywXB3c/WUb3XOc
         1Eyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062130; x=1780666930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=;
        b=bg52T+T2NCOy0AAlCKjCjDlahHmWf6gl0TxqwvNXsWEOkcpQo1rmOz0klNXw86f/N8
         ue5Qzo+yNhsylzbAoud09c8rdzfMNYITcYu/YGUgT9Md3Fea/I9Hdn4C3/Q/DoA+qcg2
         NKVrOd8L9CLC3B/IpESHXn3sjv5lbVUeTJ4W6sBI2OHJ3ZZT0TyFllOmnN54NFfvmPkf
         FAsrC/g5wOpcKV0l7xmnCeoo6ryelOdMbKRDmI4tplIzicdCoTaqwdoRHi3Wp/Nuz1JQ
         NgyMH1Ottn6VlbJ7KUiOLTGaUr+YpDu0zCsetKs7Pd3GcK22FrYDrfSY9HGG4ZwlBiY6
         ndfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062130; x=1780666930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=;
        b=UQSq26zyqDLYh9Wg1jyiRl59y8sKrosi9SE0P539p0/AiftJONynotBvK/efTrfsn1
         Sk+NytRX9xB1lF4OYQp5WHym6yxifJ+6rG4kc0Er1t3xArZyb9bGq4cvyRy3B80ZbaO2
         XHBAFN8HrAiOXjZmuOYnkm04qLCyyB/eQYZkGbJKakKV7opkXWtnXxB+hy/mG27E7fQV
         feUmb2rFdEG2cSj8XMTDAT7cpP+yfcOqDL52enHd1nkNO11vkZCV3MMJaxVbvr9lwrgv
         651hk7JkFZOGPFSbPnYCufkJkf0/FmO2KC9tU0S6ET+y1HpsWN7nhKJlOgQmcOkTGPln
         eZww==
X-Forwarded-Encrypted: i=1; AFNElJ8LSrfOT5reGK+35p+/HQsdX01wD5eMndk5nLFETcrEVZne3tCUf+YFG9v7ROhAiIUUcdVxWiq8SuEWHBM1OjOHcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMozP0uhDoTStJWEMNX+nj4ZsVra193RjOuXopKsySt0BL25/X
	wenZVZa7BrTkhPsnCCg6NIuSmOEjVxENQEZDexr9coSydOItiaB32cT8Ad4Q2vq3EYg3EaE7h6o
	W/JPZYJonE3W26OpA4nxd7GEGGeTzgxs=
X-Gm-Gg: Acq92OFYDNBliuNQf+Gkh09GuF0rnPwZaGTUzjiQWDukKK9mtd+C0kl6PqGq4hWMF4O
	+Pd+NlP+9UVLFYcOSgPSvLPWerJTuZKOz9j3/mAvhuFBY/im/nLVRj0vEPVj91vzAnRouR2SV9b
	kc0V42dhXpQe902QZCq+iXqIw46Zo/HZTt0gTQUHCXxK+uDO+uwpHqnnPuvYMjwZarW/XA9oyNJ
	Vh7qJnT/Pd1QffGhzooRg4je+TgAjya44NbycmO5i2lXflXAW9EMjkljIGUrmh3lX3I4e1D917X
	gaW9zpl/ubuJ/8V2RpnWHk6tdoB5Z0Pcatcdlwz9JNV9nsBi
X-Received: by 2002:a05:6102:3746:b0:636:c0c:4d91 with SMTP id
 ada2fe7eead31-6bf41448d48mr1182976137.28.1780062129815; Fri, 29 May 2026
 06:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527194525.45762-1-arnd@kernel.org> <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
In-Reply-To: <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 29 May 2026 22:41:34 +0900
X-Gm-Features: AVHnY4JvF7WCaYgOFVyNLTbyQStc4V3bgFlseC90wq5uN90mEmMwAwiliM8N3JY
Message-ID: <CAAQKjZNoGC_9ratL7+FjNiQk+MkOE7p=yg5ECQA+ih1trGw8cA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix size_t format string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 6:05, C=
hen-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, May 27, 2026 at 9:45=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The exynos_gem->base.size argument is a size_t rather than an
> > unsigned long, so adapt the printk() format string accordingly:
> >
> > In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> > drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_=
buf':
> > drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expe=
cts argument of type 'long unsigned int', but argument 6 has type 'size_t' =
{aka 'unsigned int'} [-Werror=3Dformat=3D]
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx=
), size(0x%lx)\n",
> >       |                                                 ^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
> >    70 |                         (unsigned long)exynos_gem->dma_addr, ex=
ynos_gem->base.size);
> >       |                                                              ~~=
~~~~~~~~~~~~~~~~~~~
> >       |                                                                =
              |
> >       |                                                                =
              size_t {aka unsigned int}
> >
> > The dma_addr in the same line is already printed using a cast
> > to unsigned long, so change that similarly to use the correct
> > %pad format.
> >
> > Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I posted the same patch [1] one and a half months ago when the culprit
> patch was queued up and I got a report about this from the bots.
>
> Inki hasn't picked up my fix yet.

Really sorry for this. I missed your patch.

Thanks,
inki Dae

>
> And it seems the exynos-drm-next stuff was only merged into drm-next
> yesterday, now causing the warnings to pop up all over.
>
> ChenYu
>
> [1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.o=
rg/
>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/=
exynos/exynos_drm_gem.c
> > index 297a93b087cd..8e357f2beb9e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem=
 *exynos_gem, bool kvmap)
> >         if (kvmap)
> >                 exynos_gem->kvaddr =3D exynos_gem->cookie;
> >
> > -       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(=
0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem=
->base.size);
> > +       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0=
x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size)=
;
> >         return 0;
> >  }
> >
> > @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem=
 *exynos_gem)
> >                 return;
> >         }
> >
> > -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem=
->base.size);
> > +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size)=
;
> >
> >         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exy=
nos_gem->cookie,
> >                         (dma_addr_t)exynos_gem->dma_addr,
> > --
> > 2.39.5
> >
>
