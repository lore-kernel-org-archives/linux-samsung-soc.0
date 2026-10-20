Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792473036;
	b=wgc90RIac33yc1SzSedbLzRvBigHPDFOIbPXyvZaaNcVXr0vgwWiHW42MahR/83XpLr/
	 2JyUVpTmvKUGizhyCO3THtC8IVAMFrFDHQb+p4ok2Bzan8/w1BXBXqTA91/tsUS6SS4FH
	 QbRr3CeYucTkZbagj+BaPSWZAJfpVkd0as3tdOWJfZyZehDjYD1/X3Msy2ebBHdug9NAi
	 J43JeM9tiScboNCUqG9DtKKAFeMyVb+68eauPZryT6I1fbvhLXYoZAWUzTh9zuDUyBjwx
	 igluk8AXqKPqIL4JSGt19C8CVq7q3pG5ceezEuM5CubQu3LphsRHi2kBHMndVN21sFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
	b=om6vqyG2auk0R86T+poYkeYSZbNXFiNMTwBQoyh01AxH3TK2Hzrst2Mi8DsIJD2NEkeq
	 kfiDz+G8AgGs7AWmeJVD3fns+ceynqUjf2KNSxDkKbDOc+bVqldypiBbGv2tNde6aKjBw
	 YXjj54oz05q20ft/DjB/Mxgym2GFEeenUKOPDbFrvcO1ZKF0rAS8FMOZJc2x8qCHEb+ai
	 iwizC0jXHEhMiHUYaKq2OJdilqrk2Z7oXd5+gNrZVI/HfcSqIyNwfVKypRDkrDExwskiQ
	 rJHGup52sWVXbRZ4Es+p9jK1bJVxDBei5mLRVHilNHIhHjzoNZexIjmA9/iR/2Hs7ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pytTP/4R";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5AB606A319
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 05:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5AB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pytTP/4R
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-705cb6ceebaso1039197eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 22:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792473035; cv=none;
        d=google.com; s=arc-20260327;
        b=g9jZY4aJdPJZofI4ith0Yp4DDlx1j4vJyKHdDpK8KnysyjA/4MwJDqBn56j4jdzrKd
         mU4tZE6zPpHsePSWKmJejI7j59M8Z7ioChlcEFHoPYfoHdrlZrpwAbzYkl3oRZYbnHCR
         2zp3mdeShSzbDHlz2GHLkTWZYCormtlMJtgt53x+zxs8JUD1WdhU+UtszalmdUQFB0UF
         x8sa5Vi2oiFG3WLiXDALN6wJYUkMQArro2m6fYNhPMy90d3UBwbkOjxMVBslpxNoefTD
         Geklu6WVfdVAwMUdDB/QOx886KYT0BAXFypTV6rZ2XcLOFBqrBleQnDGckm/hB9JQhPT
         8Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
        fh=hgl/Hwif1gQ0gectTimbJYg3jx+08mzAOzzzUChUEjQ=;
        b=X1fE3gTHp01BJvmPhwhaScUyAmD7zPej3HN/Cm2ypnOJTmQMb/jhqlUmou+/3fg62B
         d+9LAOFU/iwxBnwWwp+EbolK7wUt+uWYPyoqU2lJ4bfNNXtz6vfxbEjnU0hBr71D2Ydt
         su9lhd63+NP5SJ/b5DQqY9mRSz5cOUiXGzq2eug+vnGhQgd2bx6cZq7SNeIJi4DhCpcc
         gVA235PC1PqP8zNscKaZhoZAW1n/epcoUJZvnk4GUUqlciVbbNjsR+ANHTJ1kEEabfsa
         SYevUSiqS5iQO4vcTcI+r+FaXjOyNIsadgkZNvCwuV88kH7z6g9vJfM9ib5kir0KNr1n
         Oszw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473035; x=1793077835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
        b=pytTP/4Rh7SmAx/CKFDNAi8LaobmCAXlvQL1JdlxPty6f5IIq6mLaH2U9NHXSSuR/k
         XZ7XI31FTMRByBHYvrvzc/N2otu3D0h/zXjh12m+X1V23txMyn8HFGJZufA9ZcdhHree
         drZxVdRKiRN/bgy63yEduyFvjGxPnve5PpT75i4gIBhScLOcMCqpAaWZ99y2QHCMZbCX
         UyLs1xXkt5A+c0ZkRE9DlWCn40Bm1+9kGOwLB2aKX09OLvREd7yl1qPGR7mria4d0xFN
         TDQsz/6dKY3rn826W1XpQ1QPoWPc2gANEaGtHx+rnGcP6Evdj116wiAzTrAknE53hk6P
         LAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473035; x=1793077835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GiXfA5+zF0NeMfbHqqL9rF1nabmZUfUnh+LSjoOt3J0=;
        b=S7eXDjEH3To3N2EPIOTtdIP1pGhBvZOpHHfVIfwliIB51tFjM+jmd9rjW2HpZjRnk8
         PFF5ujbEe0veiyq/w6eh3hK8VS2KWxWBcJ4Upul+fvQc+e7gEDUz2psF8g8tXCYanBDH
         A+0iwR17k5OxSusfq94UEQG22kHoCkTcLNdyIw0kyxY7iH0bUws6+IbvfooNcSN7hZAY
         9dG5pM86K/+LBvHjN0lr1xDgFBgesm69WHNx3iOeOpN3e7U3GaprVYt/oGQzmHJTIfnc
         Zk7Kc1LRlSFj+ukKonN6PXBba+p6oPt3RfZ5nDyPB7CJNeZ1GFJT3nfZr61V0N1r4ilj
         TB8g==
X-Forwarded-Encrypted: i=1; AKwUvBzpsX3kP1fKVzJdImBGWFsyF1Fafczg06gF8hDlfI4tu+R/bwd8Bg9dK/Jsi/GquP32tgJs5nsAcnoTnKOxGl0c7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKfkyjdbSsO9OX47x3iJO+ipR5AhiOAPH44TpRR8rZx5Ak3M+gt
	x2MDq0xUg2dTvbTtlqiHZLGXM9Jq4PM7zqOn8+g1oJjEPmBmoa0vhyuuIY/uJ8iXmF0CeIaNr1l
	x0rlIP3vgGJ7IGhJqwe1Jjhbv+DdBggk=
X-Gm-Gg: AYBFou1bZdGB49gN2+a0BDSBdXOBfOmN31XB68YZyXlcHnv3CiyfalkrcOzfG8dQsEL
	EBVjNp2UpYVCaBl8UGvpJQfSfMoWxFi1/iRTXnp0sLrDBUGc58Ydap2MZKsyedE178IDnUtUY3q
	OTCLc+hpeBGW9UcRK8kRPe3p1o+daxSKYDJIphVczfpCSINRhdpB3RjDoKHrN+zFfI50GPX9Sp4
	Lo0YRd0Z0PCI5FNMyekpBi6bkSOnX/i5G1sP4YuH5PLQ/B6usMZIO1R/Wdepdh3lyc+/rK//2qf
	uHjqcjuAgHomY2pb1qkznCeDT+7hC5QsWNwxZQndHm33EIktmBD6rYg1PLEOv3JiUDXZNA3TAwG
	n8jdZKLYLxatIlQ==
X-Received: by 2002:a05:6820:808:b0:6f7:384:a09a with SMTP id
 006d021491bc7-7035597fbdbmr6886581eaf.24.1792473035202; Mon, 19 Oct 2026
 22:10:35 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012064334.3193085-1-thnkslprpt@gmail.com> <e22eadd0ada0c8243cfdf7829580984fdf897498@intel.com>
In-Reply-To: <e22eadd0ada0c8243cfdf7829580984fdf897498@intel.com>
From: Avi Weiss <thnkslprpt@gmail.com>
Date: Tue, 20 Oct 2026 08:10:23 +0300
X-Gm-Features: AclHuK-p2nWNOpMkyd_0WG7nPltm1YYmadXikekJFIF4kF3fWw5LAI-0mOwxIIM
Message-ID: <CAKOB7-Y0GTen0gYm-m4ixg8RjHuqEHsNgRTM4s3SbLg5J=vM3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
To: Jani Nikula <jani.nikula@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jani,
This complicates the if (!drm_edid) a bit further down, so might not
be worth it.
What do you think? Leave it, or should I try to rework it?
Cheers,
Avi


On Mon, 19 Oct 2026 at 16:38, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 12 Oct 2026, Avi Weiss <thnkslprpt@gmail.com> wrote:
> > If drm_edid_connector_update() fails, hdmi_get_modes() returns
> > without freeing the EDID allocated by drm_edid_read_ddc(). It's
> > an unlikely error path but nevertheless possible and should be
> > cleaned up fully.
> >
> > Free the EDID before returning, while keeping the existing return
> > value of 0.
> >
> > Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index d4fce39c2b61..386557a7f5e8 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
> >       drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
> >
> >       ret = drm_edid_connector_update(connector, drm_edid);
>
> You could just move the drm_edid_free() call here to avoid duplicating
> it.
>
> > -     if (ret)
> > +     if (ret) {
> > +             drm_edid_free(drm_edid);
> >               return 0;
> > +     }
> >
> >       cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
> >
> >
> > base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
>
> --
> Jani Nikula, Intel
