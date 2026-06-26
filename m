Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8E3E7BD0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479518; cv=pass; b=N5wEO38WOTOZzU5snEZ85EmuHfvVE30BY+1lUo/FTe59fQBGLxVD7JV0kefoAPE/Sqi5jwzpjaSTfB9ttSsUZWs+ySIOBRKBfpiZseT6zAP2nArIoyVRYEbE1lIowJ1Wsu+fI5/kX06NmtdkTk8Brpnepb9rmhinh3W/HDG9gIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479518; c=relaxed/simple;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXdafx2Jo85jSzK+lASDH7MjBmAuIBqQZVnva+/4IKW7qyT51xw2ey4AVZvPmpv7IuIgvyW/9wthsZF94ZtX/xvP5aLBr15mbBciJ2VbQ8nlSCM6IjNDIXjryZA0p/WE5UUKXUOjqIL4wDP7XJLK2HlJEH5waiEEUzOl0HDdZHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLmglm0f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgiDcA2I; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLmglm0f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgiDcA2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782479515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	b=cLmglm0fFtdT+tIAZb6uKVEXMr65V0gMWXMmZyYqtbeIF6nMdAu+bEKeh2VZ+R1JfpLlrc
	pU7ZGeCtvqzRnHmVrQsaAAOCvrSNFIjeCgKSqIqGo84Yq7T70fQAU4eNrDSa/MAhN2vjmY
	3rFzQKQT3MKDDLHfxYtEgTvV8Ku8MIo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-JGGI49eMNqKB8swiqfuirQ-1; Fri, 26 Jun 2026 09:11:54 -0400
X-MC-Unique: JGGI49eMNqKB8swiqfuirQ-1
X-Mimecast-MFC-AGG-ID: JGGI49eMNqKB8swiqfuirQ_1782479513
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7ff58c89959so21319987b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jun 2026 06:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782479513; cv=none;
        d=google.com; s=arc-20260327;
        b=L6ejVQCWKEJDUlAXmlLX7Gcl3RoxXnHV9tGUDjm9YrrL4qSphEJ3uoRRHrEaAkEUht
         1nZ4J0Q2tD5+aNyqsSxtT2p1gNYHsSAKyurYWqgSB/19+WU5P7y7emUALh/gfGa9zcLa
         RSjoOw0Jw3LHIjWLD0+fXkvjksD1V8gcB0vTZJug/Mng+s8EomO/+E3waL4CK5ETV06B
         Y7OzJchbRYUC+h1GsTo0mMbqmRHLNuEj2XxJ0xmJWThaH70cVPPzbU5qCSodtSNQwMgN
         BSdHeRJ+G3Yb7YfVzK4uofWfVN8GB5Onk+oEqefVy57K/q1DlOBIiURBocTEMnfa9Sb1
         vBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        fh=nWxrZKQbaxMrTw9Go1DdF61zHcr+Ehs7+F3cgLTqBqc=;
        b=BcAS/cdwAVvFsPF3uHSJ8BDcFPULaFXX2JHy4V2fXq62h3h9lb3QjWsiWyGaSl/GW7
         OteVAYV+MT2b1AFt/ABxILDvKvRjc0OOsTYctqFwYNGApKmFfwcM0k/A9wyvw+G1Ci1q
         tpjjzZDONH53fudPC31de8U2Tbsha8ECkzsnTA8SbwveJpuUI1tWzu12etT0uELP6FpK
         rD4ODKjshatJ7mqko5X4hTVYJiIcpYdIW8pOw+Mc3A+X4DGuXZ8jdU5XWvMf+rEqyPAe
         ogiDTPxGobvzHcGXzCtPam5Kk2Z5TCdSlGZYxvsvM+Cri6h64g0SeyM6Hkw4jkqsW7+H
         ylsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782479513; x=1783084313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=MgiDcA2IyareaUA8F+1bCR7ftoqsrzWDFpj/gpuOfEOqoQPeNn42ZtbsRBhxd96I4h
         KWAQtmWsLUa62XFLjckKGf55gTDDeM6hEcNDKfBw2VsHS+lMHjFvYm9SMMeWPQdy1DH7
         8nvtHcJKtEmzvz3ziDLdNO4xnwMS7DoiJsvf1ZG/CWZIVEIx0tARXyN3tu5LaM3W7gkq
         C4Uw0hk539NerXaKHjW6QeyQ1A5enFtd8XGchAufxt0XH+2WbgDbiBooZB9KKcxXYgGM
         nWZMRERb2hEYXxG/68R8DT74ScM2JnjBlsEV4H5Auwsf2+LhCNy4Q1rDCEMvz6/qOeMn
         rN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479513; x=1783084313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=l/YwBm44mgK7rJMomMOeruPgNLBFXG28kVo5b4LH7SLmWocDHA/T5lyLGOIKlOSmbg
         EY5JlnPHCJepuexVymFICkYQs17acrZBssXUpxKtnPCLlJQV+KftgkEZNtHane3swK60
         /scCFG78F2xxUUxrcOWfD51bxNxyB2R07A6SrLvgR2l+pcFXyOHWHwfH2NUhEpGmuYlG
         0HfgOxM9PGYF7kjdn7SyeOGWRrHiPIO2rkxQhf+uEEEtWl+pWQXlXH/vCOn3OgLNjzB5
         JMpbkaXJs0TIwmTyPldtOu7Gsr6zfotbd0NMNYHrpBNbu36B2qeHO/0Is2sK3sAPqrt1
         CObQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkoTIaVrVzyjodUukLP/pX/2kl0KYCBjoPxt/dtjG4GJ/OvygoYU0RVyDhmW85c/uvlP6S/f9HS9Y1Ir4Jn65qfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdpCHBVkz58Hv32XMYsP9LZTWiFSj26XQmU+YlDQLyOyJiNO9
	GJa/OIUnQ7oBOl9rddI2n1gvUSeF6LdSZXnbfuxt0emn0QmSaI/oyWRijTbHBYnnuKCwWtZ3TL3
	yta8SYRzae/wpSf+rvSp8MZGkMEBfeW0FSwYyq0e1IKQ6qfaG4KgG7ZMYk0QtJ+pOXKNF5GkogP
	AlAv+yNFbB8oxfv2/ktcskvxRK/95jBebbE+mZch22zXsxC9M=
X-Gm-Gg: AfdE7cnUUJZytTfR7hO+YXV7N5lFlnh3p3kEYPR7mPUZfHqSuNuICVK55iZvknyc2/h
	HVzuyEXtV/fFwE+2h1XY53MmB9YZ/R5owuf5IxNx/g/JpHKYu5NB+s8EKFNp7Tsf9YbWwC9b+l0
	SM6sPh2ZiE+y5n9k81nj2+YJYcE9O+onZHtLPr4ytYTotiXCgNrWREs7SXDRHSwyKq
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id 00721157ae682-80bef0a8585mr15809447b3.31.1782479513413;
        Fri, 26 Jun 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id
 00721157ae682-80bef0a8585mr15808937b3.31.1782479512984; Fri, 26 Jun 2026
 06:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-4-cca1a7b3bdef@redhat.com> <20260626-manipulative-rainbow-rhino-d73b65@houat>
In-Reply-To: <20260626-manipulative-rainbow-rhino-d73b65@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 15:11:41 +0200
X-Gm-Features: AVVi8CcW-L7vrM5Bm_e3_mA7DiL0CVsM1LDa8FwSzsOcNktoquvN-pr6tbwgp5U
Message-ID: <CADSE00+1m1ASzJzefO2bLuMYAJa3kSmW4py7Qng70VnZSUv0sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: release panel reference on all lookup
 exit paths
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

On Fri, Jun 26, 2026 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:26PM +0200, Albert Esteve wrote:
> > of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> > counted reference that the caller must release with drm_panel_put().
> >
> > For bridge drivers that immediately wrap the panel in a panel_bridge
> > (which acquires its own reference), release the lookup reference right
> > after the bridge creation call.
> >
> > For analogix-anx6345, which stores the panel for direct use, release
> > the reference in the i2c remove path.
> >
> > For platform drivers using analogix_dp_core with a component lifecycle
> > (exynos_dp, rockchip analogix_dp), release the lookup reference in the
> > platform remove() function. The panel_bridge created during bind() hold=
s
> > a separate reference that devm cleanup releases after remove() returns.
> >
> > Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
> > bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
> > then pass the panel to devm/drmm_panel_bridge_add(), which acquires
> > its own reference via drm_panel_bridge_add_typed(). The lookup
> > reference was never released; add drm_panel_put() after each bridge
> > creation call.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> I think this one should be either split into one patch per driver, or
> merged with the of_drm_find_panel patch. I'm still not quite sure which
> would be the best, maybe the latter?

I have spent some time myself thinking about how to approach this.
Initially I thought about doing one patch per driver as you suggested,
but since there are many similar fixes that are mostly one-liners, In
the end I decided that grouping them would make the review easier and
result in a less inflated series. Maybe merging with of_drm_find_panel
patch makes sense to avoid having one patch introducing a transient
reference leak (even if it is fixed right after and is bisectable).
But that will also create a giant patch (harder to review?). Another
option could be to merge patches 4 and 5, which basically update all
callers, and keep the API update separated. Either way, I am happy
with whatever you decide is better. I will take note of this for v2.

>
> Maxime

