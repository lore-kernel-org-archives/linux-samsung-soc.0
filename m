Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFAD126BF1;
	Tue,  5 Nov 2024 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730837477; cv=none; b=dKkDaaeinOgdZexok/lwawChTCUb0dOs83zJKsK6x8R9vtovWdO57Uto94dHINmGDoMi29GuleE5f7YaEx9VjjCdGt5uemUV0ClP6cztWb1BNVzVaS5KwYvE1lY9b120pQZs4U5Z9wflXvGgVBB/RFoTPBrD1Jg/9btdxRC66hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730837477; c=relaxed/simple;
	bh=pUzCR3wb1F7ue7zroROqvIhqYN1kgGH2ohUVUIxI92U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnvNucEEpVhrbQ4m1ikrT0nhrjDM0j3wq9+Pgc7nFKS/lsc2+IcFg7YIIJ1PMcihFZJTC+rcVMqD8dWnI73LK+Sfg40jJU1uuUlnZLVWu091L6jsK3oy9LNqCEhIXa1C5VT6vpqOg9GzKWEPtXr/2fPONDM/wKLYJBkiDa/iKf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXz9sYuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXz9sYuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D3BC4AF0C;
	Tue,  5 Nov 2024 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730837476;
	bh=pUzCR3wb1F7ue7zroROqvIhqYN1kgGH2ohUVUIxI92U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XXz9sYuJAc4SoRb4zZkyF0KvE/yHoI0xQkdEbHA6ow3GEKjSVUwRKuQU9qhHd10Go
	 KIQDVnr1vWd3cKDCdwiZoee3H8dH8y/vNgGgh5I+K/zQi+EQXEVIiJFDN5m71YZ94o
	 FA2U4VVHpUfvPW9+4ftAPCfo/iENEjhdGwE9RqPbbBvasCmgkrppresShuEIq56FHf
	 efbvVMtBaOUUTeEiaZutIlHNqeM+w3WNxkhhwpV57ZhSyLgfGpZjODmw8iXGAqhDPX
	 mtC5ESnnwJKKXrPMTZRlXzQVQm8a7JbMCZF9x/tajIU7yrFmvCdSFfAgj4A+xL1B1E
	 1et6S3vYGoPXQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e3cdbc25a0so65565067b3.2;
        Tue, 05 Nov 2024 12:11:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp1N4p2zxmgHhUvVZS1/xImDfNZSfAiPfXNdTKKbCIPj0Rjmy0coNNhqEhFb2lVTCcYGnNo7rCiFeMzSkumgm+Dno=@vger.kernel.org, AJvYcCWLZeSs6SnrHdFEjt3fIE0g4yRGbqkxYP6JaTUq1sYWhYOd5WotmLfyGYQRE21VdUCJPBhG2ss7clIyKfe2@vger.kernel.org, AJvYcCX32ds08atz+uUJkSWsmZMQoGh7BxGoqSqK5tFK6lSsGdIjz6oJ/r4sfrOXMmc0XK7D+LVZSHBa3GSm@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYalWAFgYdLi22/FitiKKr+tCv+xPgNnKatb3CHpdy/woF1DQ
	KMXKHBkNCYF5VE2tQWEluS0T/Cy7CfS+XI1yZQHlXoWQa0KlokUeg2jhMiEihIx0po3D4McTMf0
	qBo5sBBSFV1P/yC4SxG1RtEYIEw==
X-Google-Smtp-Source: AGHT+IGjBrKey81nl3nx8kOyR1h49mszjJqU8gpqGeS0+ZBCji4nxidLWF6J3Nufn1F4QsUGN28RJnR1wt8dJZyfAgc=
X-Received: by 2002:a05:690c:6e03:b0:6e2:1bba:ed4c with SMTP id
 00721157ae682-6ea64af4defmr187913797b3.17.1730837475817; Tue, 05 Nov 2024
 12:11:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4@epcas1p1.samsung.com>
 <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org> <000001db2c1c$12e86c50$38b944f0$@samsung.com>
In-Reply-To: <000001db2c1c$12e86c50$38b944f0$@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Nov 2024 14:11:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Message-ID: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
To: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= <inki.dae@samsung.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:08=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen P=
latform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Kaustabh Chakraborty,
>
> Sorry for late.
>
> > -----Original Message-----
> > From: Kaustabh Chakraborty <kauschluss@disroot.org>
> > Sent: Friday, September 20, 2024 12:11 AM
> > To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> > <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; Da=
vid
> > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Krzysztof
> > Kozlowski <krzk@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; Rob Herr=
ing
> > <robh@kernel.org>; Conor Dooley <conor@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.o=
rg;
> > linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; Kaustabh Chakraborty <kauschluss@disroot.or=
g>
> > Subject: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
> >
> > This patch series aims at adding support for Exynos7870's DECON in the
> > Exynos7 DECON driver. It introduces a driver data struct so that suppor=
t
> > for DECON on other SoCs can be added to it in the future.
> >
> > It also fixes a few bugs in the driver, such as functions recieving bad
> > pointers.
> >
> > Tested on Samsung Galaxy J7 Prime and Samsung Galaxy A2 Core.
> >
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> > Kaustabh Chakraborty (6):
> >       drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference i=
n
> > functions
> >       drm/exynos: exynos7_drm_decon: fix suspended condition in
> > decon_commit()
> >       drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to =
Hz
> >       drm/exynos: exynos7_drm_decon: properly clear channels during bin=
d
> >       drm/exynos: exynos7_drm_decon: add driver data and support for
> > Exynos7870
> >       dt-bindings: display: samsung,exynos7-decon: add exynos7870
> > compatible
>
> I will apply all except for the two patches below,
> [PATCH 2/6] drm/exynos: exynos7_drm_decon: fix suspended condition in dec=
on_commit()
> [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add exynos7870 c=
ompatible

Now we have a warning in linux-next that samsung,exynos7870-decon is
not documented.

Please apply the binding patch. Or let me know if it missed 6.13 for
DRM tree and I'll apply it.

Rob
