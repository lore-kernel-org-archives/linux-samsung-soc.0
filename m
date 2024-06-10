Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C56F2E7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010182; cv=none; b=UyxQICtVqjpc7kCP0eIYN3n0Nu4UK/DhjodhtQhEmZ8o6TgLgr+fSEExJGGd9KNR5dboWH0ivs0a/UIXaMZHclYZNrLgHns+QkzS9azTqGO7ydNpGcBZajLKYemXknWbgF90eQ+plaKjl3SrYzZLHCjaUSZb8UTGevZJ+iKaoTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010182; c=relaxed/simple;
	bh=VFhC+nJ7tBR/FwPycVePgXsl7Q/xJeh/CTtJVVU5o0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRra8OPE3TswLVKE41NCEZVQE2Gcvtq4A1DmTzLeqazRF4mUfBDeIIvlt3kMMIBWgRZ7dvdQH4MlodPERbLd9z9YYLmaTn7BWOH7XGSiPzYe+N+2OrSyvEc75e6uZPYrn/NBINipwklFBJbKFwgczYXeTiwu/FUhfF1t1Uc6Bj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3HRyt1y; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3HRyt1y"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-48c5133a2adso262634137.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718010180; x=1718614980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D1xRI+i6XbOFe1nGV/VEBCOouzsGHQh9VuVWaJeScE=;
        b=G3HRyt1yavdODLYSi/SComPoZmuOHeAdbzyv/duKLPo54hyuKpSEack+uholQWFQm8
         lztowRw8NTnbQYsU7zv1aLncmtAM+N+dChkFpm2p2FpBgWNe+Nks0UT5k1ENf5CJEJXm
         IJT29LlNs+MZ5BKDyW3OVXJptF3yWs3QvrhJ+nPqiIZx8XUgXHD1d0PRmyg1OBlxgkID
         YGeg4AefaSF0mH6xbbq2bJx8ypVQ/+R6ORxccIY7IX59mG27arBU0En3kJKUaQgomSYr
         fmaaGjDGE8d8etHpXMeeXJSZSJem7Wv29baJHzWGQE4P6rscvayxnXisyVpU0d2V3igN
         d6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718010180; x=1718614980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D1xRI+i6XbOFe1nGV/VEBCOouzsGHQh9VuVWaJeScE=;
        b=ttBapTfVN3Al1uzAwTexpcHpein21b6HykLgB+xSl5QB45/+2Qf+6VELJhedUoR99U
         IdOGQLqz1COBy0XBhEJ7sdP51JOfOgWMqchC022s5uzYkVzhPTv6KmFc021OtWFfv/zW
         LUh5/By9W536L0ARCjFpySLzfi/w0ndtW1GBBeRXkwCxacUxfdwXqBK7Mk32f9tQxmEK
         M1C0u8M8Em7u+Cw8+wVmVKCXBtwlqfG2xpSexdNoPFXqunmH56LElBHrytLlmfK5kfwz
         Hn3CA11ul36rbDkOFaR/SRWQqxK73UpYJdA6eFXxtq+1izVuj6oxV916U/2PZCreNEZT
         ZG3w==
X-Forwarded-Encrypted: i=1; AJvYcCXF4Re5EAkeTnTt6bRo3E+sxY2oWzeZjCbYWnvK5NJ0L8AcG6GvgHE2MefJbp1odnjpbUc8zubvA2HLwqiT8efLzWYuccOhfNUq3+gMyH4bEvo=
X-Gm-Message-State: AOJu0YxtwnznOca2Cd7MR16Yw+gxiRoOpkpH6lqxYyCzF8Os3uqR22zX
	kSN5nnLiEbafbyaRy5ZZOaRPlHc2ggmA2xQDb45Yr2kC5ogYue+CnqqROarC5dJRLMgpmaU92CX
	/lUXwS5mhi3PJk9Li1DUbCsTrzTU=
X-Google-Smtp-Source: AGHT+IENq9kzQ6aI4IYLBQaNTUgvTVHL49Rkm7/5OoofhYSBaeobfRJ13I1Ha1fqNTI1Enwb179CJpHpoqTO6gDCSS4=
X-Received: by 2002:a67:fb49:0:b0:48c:3514:2f9f with SMTP id
 ada2fe7eead31-48c351431cdmr6607984137.23.1718010180219; Mon, 10 Jun 2024
 02:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com> <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
In-Reply-To: <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Jun 2024 18:02:23 +0900
Message-ID: <CAAQKjZNhUzyUO4rjPZGGrp=0MsTdQvT2ij3bVV91oDcYjk9EDg@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/exynos: hdmi: convert to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jani Nikula,

Thanks for your contribution and sorry for being late. Below are my comment=
s.

2024=EB=85=84 5=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:57, J=
ani Nikula <jani.nikula@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
>
> The functional change is that the CEC physical address gets invalidated
> when the EDID could not be read.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index e968824a4c72..9033e8b66816 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -883,27 +883,30 @@ static const struct drm_connector_funcs hdmi_connec=
tor_funcs =3D {
>  static int hdmi_get_modes(struct drm_connector *connector)
>  {
>         struct hdmi_context *hdata =3D connector_to_hdmi(connector);
> -       struct edid *edid;
> +       const struct drm_display_info *info =3D &connector->display_info;
> +       const struct drm_edid *drm_edid;
>         int ret;
>
>         if (!hdata->ddc_adpt)
>                 return 0;
>
> -       edid =3D drm_get_edid(connector, hdata->ddc_adpt);
> -       if (!edid)
> +       drm_edid =3D drm_edid_read_ddc(connector, hdata->ddc_adpt);

drm_edid_read_ddc function can return NULL for an error. Could you add
an exception handling?

> +
> +       drm_edid_connector_update(connector, drm_edid);

Ditto. drm_edid_connector_update function can return a negative value
for an error.

> +
> +       cec_notifier_set_phys_addr(hdata->notifier, info->source_physical=
_address);
> +
> +       if (!drm_edid)
>                 return 0;
>
> -       hdata->dvi_mode =3D !connector->display_info.is_hdmi;
> +       hdata->dvi_mode =3D !info->is_hdmi;

Above change wouldn't be related to this patch.

>         DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>                           (hdata->dvi_mode ? "dvi monitor" : "hdmi monito=
r"),
> -                         edid->width_cm, edid->height_cm);
> -
> -       drm_connector_update_edid_property(connector, edid);
> -       cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
> +                         info->width_mm / 10, info->height_mm / 10);

The purpose of this patch would be to replace edid with drm_edid so
how about updating the above change like below?
    drm_edid->edid->width_cm, erm_edid->edid->height_cm);

Thanks,
Inki Dae

>
> -       ret =3D drm_add_edid_modes(connector, edid);
> +       ret =3D drm_edid_connector_add_modes(connector);
>
> -       kfree(edid);
> +       drm_edid_free(drm_edid);
>
>         return ret;
>  }
> --
> 2.39.2
>
>
