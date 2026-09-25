Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958CC4D17A1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353554; cv=none; b=QTPBXzr1kdGF/jiOqiNvTcE2AxD4gOVZcXuBbO6EjzjQNHjz/59aiZ1Q7wwA7K6y051WJotPX55SIhVI7bm9nKG9YqC7HlbTh9wERKmtoqnZGlbA4p8qRPs7sgPYuAMQ+MUd3j1o0geQzj0gptTcRhRbC7up8O40/Eh/iKv8XZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353554; c=relaxed/simple;
	bh=6fYDLPuw7TdEq9beCl8lZHCEAKip/STw7RgtlWkrkg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWBUSf+RynqF/li/F5GcpFQ/7pagPQU/B7+WUyAm8Vd8OVW43UJUqirUwTQ35/nWOO4dwExNLI0xCYJSRx18oB13dWjhDqScQIQ0QtpKChpm+M3zxASY/3Wecx2sQpgOD/V9GUjN/JTj/m0kgtWfO3QohYlSv71XRgQDYtYAy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkZTyo4x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkZTyo4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0561F0089B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353552;
	bh=6fYDLPuw7TdEq9beCl8lZHCEAKip/STw7RgtlWkrkg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SkZTyo4xxfFfIHkKIcVzKt/r6NVyGCRHYPlxBuj/CfdOc5/UiPnHhsNeysafJ83uT
	 PrsApt20TbtzJyRpj/ArQV+ysPRtw70TjqJbVdGUsvZcqDtlWD9Kq6uCr9e2hR5TcQ
	 WqHkFq31PmtukKbdE6y/W8GS9/XSR4o73yuajz9jGmCx6GdhINz2kzewMKYZle40Rz
	 Jc4eglh/tm38aa+rDhaE+rYk23PpYcf8o3TBVaTamJ/idDzDGvcrFiD2suq/GxYFWK
	 zgFkLbpLOozrM5LhUI306UQ1mmZ30ZjqiBsz8Sk4d6Pq2YHLUgL3h7x5LiWU8/PFE8
	 PJ7V94nNq5nFA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so1087233e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 09:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVpi5aIApSN5dGGWZ75Io/7r1LbWLDK7UjMKfkU7mgYTtl7dg0S+gxUsgwNOmQRDWbVVZ1S15PbQ9m04AYiAygVw==@vger.kernel.org
X-Gm-Message-State: AFuF++kLqp3Vmxu32f6lCimodZ8k8TTkimiaZJhc4IZ5i+0OyRDw3VIZ
	Xw4mfofyUUr1Ap3i1YIitqwhv5ykgzBelf9pek5ndtnS/To/GpuDP1Y23CsJyiVUX8PgCtm9cKt
	89WHPIVR2U08A7yAP11qJksNGB6T6/dM=
X-Received: by 2002:a05:6512:1344:b0:5b6:1a7c:59db with SMTP id
 2adb3069b0e04-5b8df0d22f7mr2083445e87.53.1790353550897; Fri, 25 Sep 2026
 09:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat> <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
 <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com> <arTlpd-KAsVpj3UH@houat>
In-Reply-To: <arTlpd-KAsVpj3UH@houat>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 18:25:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmktDoqn2EbXsNnyGRudo-q2NCxUf+9ZjeU+WrY4CBMWw@mail.gmail.com>
X-Gm-Features: AclHuK_fq2ZWJ1A-qMmc6hpV7kHeTfdnkXq9HUzMYWRHIkAmDRIf8rPpfyjUW1o
Message-ID: <CAD++jLmktDoqn2EbXsNnyGRudo-q2NCxUf+9ZjeU+WrY4CBMWw@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 10:57=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Sep 24, 2026 at 09:51:53AM +0200, Linus Walleij wrote:

> > > Linus, unless you have more info I'm going to apply the patch as
> > > is. Removing this special case would be welcome as a later patch.
> >
> > I'd say go ahead as-is.
>
> I'm fine with that, but I really want this removed at some point.

If Luca wanna fix this up (drop this path) that's fine by me,
else send a patch immediately after this is applied and I'll
ACK it.

> > I do have the idea to code up and submit the AV8100 encoder
> > and I have the hardware to test it, but every other user should
> > be using panels directly, and I would be the only non-panel
> > user so I can deal with it when it comes up.
>
> It won't change a thing. All existing "panel" users will be bridge users
> after this patch is merged. So whether you want to enable a bridge or
> not shouldn't matter, the only thing that does is whether the existing
> users would still work.

I know, all it does is create a snag that I would run into myself.

But it's not gonna be a problem for anyone else, that's all I meant.

Yours,
Linus Walleij
