Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0IOGF/9"
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B1ED5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 21:39:26 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7cac4a9c5b5so1228413241.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 21:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702359565; x=1702964365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/nfl6+GaD4Qn3MjtsV3jUS8ZLKPlwsaFZp1B5lXgg4=;
        b=Z0IOGF/9r3pz8CEtZPaT8z2ygFvk91+XKlANK6Rrp7MVq1rKKhKDRFXwh9tHJlfS7f
         j1R97FZQxh8QKT8/rY06j2r+BRcR0NbB1N2BGFMTaTuDWgdjlv0/YcV+JrboMJNZlGB7
         hJTFOs7PW5FDDFxl8fsNRQFp6qIwb1pD9aoyrOwGmz17J0LyGGlbXypfOpSe0kWLN3LO
         yX2yTvz/6SvI1PxXHYAHtsLOrdrfKayGXtSAdn/a5nkRFoGU9ve55QFSyz/vo6O3UH5h
         nH6pMG4KmpcvBCzjQwDFEznRq2s8JFsF0IMynt/UnBB5lrb00VE/UarhYJZd0cYLlb8S
         uAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359565; x=1702964365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/nfl6+GaD4Qn3MjtsV3jUS8ZLKPlwsaFZp1B5lXgg4=;
        b=rXgPDWq1iQUvCKCtvQGZvZnnVbXpWcU2zSKXQBIfP/hecFd6HXZevMhRHogqDR3q7W
         EhBd3rN4j9CCw+4aFA4pvKjWKy8usUwLzakhZAkC34qiHOyW6gG5HmGEyTQjPD/7hDEk
         NpoC9pP0Al70Nj2YqiqsSmQOFHsNB/XfPQO086Yx0rc4+qY7324RKsnqkJx9F5kyq40O
         S4a5rQ570BHlj+KT7OgjMGKseBmDbmZ5NsUNTy+riaeQcF2yK+2Fwnu2nIUtmlAiJFhC
         d1bWn7PQ6Ao/wspyuhgu7bCnxeV48OzCPll/g6xHI47VCHwzJ1ASIuJAtNhaY2Nd2Mf1
         CzKg==
X-Gm-Message-State: AOJu0YxNrWlyxTI2hb1Qcyu0+EP395kW1axHUTPdFYbwZkANuJYyvLhN
	WNW928P+APLf1RY3Dp0Kcl2SRZGLagL71kaEMBkYhT8unSRMEw==
X-Google-Smtp-Source: AGHT+IFuA4Vm1xOo/b5ypPGswpsFKKTLBm7xwx8r3F1B1AErinJ1oK7Hecn7PcY7E+X+v3iVTp01WBsEaCLlCnxwXU4=
X-Received: by 2002:a1f:f809:0:b0:4b2:c6b2:5260 with SMTP id
 w9-20020a1ff809000000b004b2c6b25260mr4273038vkh.1.1702359565475; Mon, 11 Dec
 2023 21:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
 <20231108075454.3aivzrbvtr4en22e@pengutronix.de> <CGME20231128165521epcas1p4993f7d2fab0723130a4612d810d254f8@epcas1p4.samsung.com>
 <20231128165505.wm4xs4ktycswthkt@pengutronix.de> <048901da28b6$5be8e700$13bab500$@samsung.com>
 <20231207080338.kcjx7uixxjw2axtc@pengutronix.de>
In-Reply-To: <20231207080338.kcjx7uixxjw2axtc@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 12 Dec 2023 14:38:47 +0900
Message-ID: <CAAQKjZPxatiZG+HJeXW9UYFiSOuGD0EgvWKiOrYCuhk27x2AwQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Uwe Kleine-K=C3=B6nig,

2023=EB=85=84 12=EC=9B=94 7=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 5:03, U=
we Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hello Inki,
>
> On Thu, Dec 07, 2023 at 11:37:44AM +0900, =EB=8C=80=EC=9D=B8=EA=B8=B0/Tiz=
en Platform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90 wrote:
> > Hello Uwe Kleine-K=C3=B6nig,
> >
> > > -----Original Message-----
> > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > Sent: Wednesday, November 29, 2023 1:55 AM
> > > To: Inki Dae <daeinki@gmail.com>
> > > Cc: linux-samsung-soc@vger.kernel.org; Daniel Vetter <daniel@ffwll.ch=
>;
> > > Jingoo Han <jingoohan1@gmail.com>; Seung-Woo Kim <sw0312.kim@samsung.=
com>;
> > > Kyungmin Park <kyungmin.park@samsung.com>; DRI mailing list <dri-
> > > devel@lists.freedesktop.org>; Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org>; kernel@pengutronix.de; Alim Akhtar
> > > <alim.akhtar@samsung.com>; David Airlie <airlied@gmail.com>; linux-ar=
m-
> > > kernel@lists.infradead.org
> > > Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove
> > > callback returning void
> > >
> > > Hello Inki,
> > >
> > > On Wed, Nov 08, 2023 at 08:54:54AM +0100, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > Hello Inki,
> > > >
> > > > On Wed, Nov 08, 2023 at 01:16:18PM +0900, Inki Dae wrote:
> > > > > Sorry for late. There was a merge conflict so I fixed it manually=
 and
> > > > > merged. And seems your patch description is duplicated so dropped
> > > > > duplicated one.
> > > >
> > > > Ah. I have a template that generates one patch per driver. I guess =
this
> > > > is the result of using squash instead of fixup while putting all ex=
ynos
> > > > changes into a single patch.
> > >
> > > This patch didn't make it into next yet even though it's included in
> > > your exynos-drm-next branch at
> > > https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t.
> > >
> > > Is this on purpose?
> >
> > drm-exynos tree is not included in the next tree. It was previously
> > included, but it has been removed. drm-exynos tree is merged into the
> > mainline through the drm-next tree, but when the drm-next is
> > synchronized to the next tree, a conflict occurred between the
> > exynos-drm tree and the drm-next tree. Therefore, I had requested that
> > drm-exynos tree be removed from the next. Perhaps I was inexperienced
> > in managing the git tree at that time. :)
>
> That sounds more like a reason to have your tree in next. One of the
> core motivations of next is to find inter-tree conflicts early. If such
> a conflict occurs and you only notice it when it's time to send your PR
> to drm-next (or even later) the pressure to fix the problem is higher.
>
> Also for patch contributors it's nice to have a "complete" next, their
> tests are more expressive then.
>
> So I want to encourage you to readd your tree to next.

Thanks for your feedback. Requested to Stephen Rothwell. :)

Thanks,
Inki Dae

>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
