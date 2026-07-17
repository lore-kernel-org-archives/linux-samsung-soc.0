Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F9E3F39E0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2026 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287596; cv=pass; b=CyMvlZYZ96eEOyHS/RQKkJQI0A6NayN/L/1gBainSRy9J1tnEWcQgLAnQthSJ3yjtcEMrz5tzKo7x1KeCY3rfblUDPSSbtTmBPN7GhCO0/fgmFoKS77toCtAblrK/ikaISpeYC22RPBUaIcRnA97DxZaRIXL3ZJ4+fCjMPICOAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287596; c=relaxed/simple;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z19mZAfC0bn5TJgJe6o+J9Yg/E0MBPeS6qWLav4N3NhWjPXQm5uY/XBOOrv4naeC+UeNIlaBD2lLz+A+OoUJn98+U89uSW4oVlp/k56ifRuIG6uRy5ZO+HSknpEVhb3T3xFZ4uO64jwY8yYlLMVH211b5TTHuaVqaw2lLKxV8Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbuaHMNf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkPuMfAv; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbuaHMNf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkPuMfAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784287579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	b=hbuaHMNfVh/BTlEUtqw2qc88EQ5YrQJttUseyY/ZW5fbk68bM7/2J47/ytW8GSVyPUZu+F
	utec4FzXZOTpv9YvNnvpNMNs41+i7FmLqC4iNgxM2JMow75DMd0/6Zsji/ErK4zVNYS+sw
	LlikvaofhxxezrDsxgYQkKZPYSY57v0=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-opcwyzOnNFu0HhHp091Z-Q-1; Fri, 17 Jul 2026 07:26:18 -0400
X-MC-Unique: opcwyzOnNFu0HhHp091Z-Q-1
X-Mimecast-MFC-AGG-ID: opcwyzOnNFu0HhHp091Z-Q_1784287578
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66807ba1ce8so4228153d50.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2026 04:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784287578; cv=none;
        d=google.com; s=arc-20260327;
        b=nK0GhmVHgGT+bF9ayyEopbUtlVm7Nh61/FKBRgNTps/flZwwANWPxJBDOUJpUQKMmI
         we0SIcWC4cxrO1/w8YiI8TXkR2umm7LzM9x1zLrryWmFLBDD+i6xw2jUmn00jOluScjI
         UICreR+SjwnTcgCYetqLokvetzKwJyD2sh3oSkx4GorXmKefS6tOMMLgAp+1NgvhfHot
         SwCXzsHAs/vA8R4Wv5GHyh75xUYncPPDGO7GHYhYrpfsaHAvp7e4K8bZ14/z8QOV15Kf
         pQ4atyoXlDVSwnBrFMvU5GbXnHPY4muGrjeh49xUOcdrIQmVY+KVxo2wn976hmQ83SY1
         dang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        fh=eECA7BPRwebJVmRtrWZbwFrlvk3ATGZYmqJwTp5Mk6M=;
        b=pb60CE8yvDsgnujTsi1hk5PYrUNtEjj9kO/9fJqluJEcAnfWbORMKaw4PMa9UXLr6z
         mC3t9qNzkbnrqlbu+vBq41goPyCKEcB94lfUzvBY3KCp346JEpgSprOhH25gg08EeA7x
         7Y1b+EdP21BlSA+sdORUu8WvW4N2YjBNjRPxMA/FelYtPbjEokCvAmFANjOzgl89FKPQ
         XKjGjrG2EOkjQ4RGVsL0QOqYzvkV/6TXNNB8+bHSCXBg2hn6bydiXcoH5czfCmE7N8XA
         yO2ravc4v72l/gUTe7MOSV+NP0K1c2XOe3s5MI3lpKWgVj9TyYEUjZu6mqeXpDb/QmQd
         k6pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784287578; x=1784892378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=dkPuMfAv+k2E9nBvXL+bKAaBa+jYrnhdMsC2bR2eUwKZ4mnbrq3tiJekZW2hxFd4xa
         6eicuVh0uCaFzJ3BDWToJPYoCo2rsWg/YOK30OwvtB/KNUuGQIpqRUIpratcRfUUb8z4
         Dzsp9jw2Y1wfsThjrVG6Vy9kRlMayacB6owIbhaAY7yV9ph2adsHO5Ostz8FNn8l6qNJ
         h91KbJB4Fx2ocuedxZ5IsMwuKs/dPvJqaX3JrTLTOwo2mEKMxytUmS/QoGngM61YghBA
         piTMMKauhYhsHa56zWIi8jBr3KuuaFcQzlP4h+UHhMWbrfGgPrgdSY8VU91HtCvduo10
         VPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287578; x=1784892378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=qfAoyIg47xSAvy6y/kkRAhv+OTni/3D7LhHh8tL+LwWyVQ7JYry52bBCYRy1ERIM06
         qNgFPOhFUANU/XqkMyWtbi5ak9Nxy2Nq0H3NRP1+m4F0avqQ+Ji8jYBUFC/0+hDy5wLu
         lkHED0uvoHtorhIR/UV6/EIHSv+hPLikydM6izHaN9a2ITTNe8FXmxZwKRVffKIXD/xo
         p0a2ez+gpiGukB5uWShcHYqBBJa7VlaWrAoX13QDRsvwp9fIpQdHg2YHFX0nPh1GKRw6
         yRt4llUYSz1P53fG8+robyrspMryhNAasRrJlChlwF+A//xPSG6cNPIS1hq1nXe3/nOW
         25Ag==
X-Forwarded-Encrypted: i=1; AHgh+Rqk6yubNp2n741NlEhGAlxlR3rmibCPLLN/MTz75WapvAVEsVjMluktMet/jgPMq89qa0MdA6t0JT32BiAR8+2h/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0qN6HKEYSZikmEmQtItTsr8NVZYHJo1OyM7ozKPJM0i/B5tg
	34cIUhX+7m/ttoIVvl1Z0U1cvFqr3JhP0QbIfBzGZprUXg9Fn25PbXbejotzVFei6vH8m9vZUaQ
	9aMpXFwW0t9wGxZNDU54tvbvMxiNnM8d7m04vVoccodYf1ifL7VCcyqgKZoLOPAYtSlyEsesZsa
	TrKTQLd/2Qb4J2A7bFZOSaSVYRc7D+OoUtsvxYSQEDvl+KrJo=
X-Gm-Gg: AfdE7cnK+yK3Xe9V0WUpnLVPpZoHlcJvrnFqMrMiKVSMeeh+pAyfjUBsg1bwLCcpUJ3
	M4e9iJvAFTNKmXQfXnSpVWob1XOx5xJOlAskj7Bi+o8URhF3/3D9+k+viKkPp4FiCljPcNG2d2s
	NY0O2jHNmk+R+8QFXxuwtquyJbkjTz5N8sjSrkmOiI/mzSR/QDXzu0DmOr
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id 956f58d0204a3-66843ce511emr36189d50.53.1784287577990;
        Fri, 17 Jul 2026 04:26:17 -0700 (PDT)
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id
 956f58d0204a3-66843ce511emr36162d50.53.1784287577611; Fri, 17 Jul 2026
 04:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com> <20260717-heavenly-peach-guan-82f0f1@houat>
In-Reply-To: <20260717-heavenly-peach-guan-82f0f1@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jul 2026 13:26:06 +0200
X-Gm-Features: AUfX_my0X2LQ6M_jKeRcxy0r6pG-sYFIFgqEmiZmXcdV57T8jjudIQuMMnSFyJg
Message-ID: <CADSE00+7=2ph4kRQLc7_MFbp_SSt3eYz-bBxWcfCj6_oFPjwFA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm: release panel reference after panel bridge creation
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:56=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Mon, Jul 13, 2026 at 01:53:08PM +0200, Albert Esteve wrote:
> > Update a second batch of drivers calling of_drm_find_panel() or
> > drm_of_find_panel_or_bridge() to release the lookup reference after
> > wrapping the panel in a bridge.
>
> I would have expected this to be squashed of patch 3, any reason it's in
> a separate patch?

My intention was to make the series easier to review. Patch 3
contained the initial set of callers mostly found via the Coccinelle
script (simpler to address generally), and patch 5 includes the rest.
Including all the changes plus the core API update in a single commit
felt like too much.

That said, I am happy to squash this for the next version (fewer
patches to track).




>
> > Also handle the cases where a panel is found but cannot be used,
> > dropping the reference immediately in those paths.

