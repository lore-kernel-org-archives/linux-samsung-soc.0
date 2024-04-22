Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D5F14A09D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2024 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713789650; cv=none; b=KM6NUqYbCWdqGlFNcgAC81ld+uO4rwKGJGrTwnNabTYOmPKzgkkd+I5FTbz0ipTitQNxGI0akPFrMCqpEQfl0u7l3YbXtmx9RFIPxS/ABPSaLBiSuaK2+4OsIIxU8OEA5Gf6SqP5+ULZcAxLc4grW7prCfNd+qoTcFVGLhn7OIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713789650; c=relaxed/simple;
	bh=rHwtqOJ7hfOxjOvIBhN3DOgNQntQgRNTBmHT3TVb85g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YImfYO4scfOj6F2rHz/eUFBn/VsFK3EBcJxOQpRcvPqkdY2Ity8J347uL6q2Y1ZXKh9eIEfM48zFyQXOaSUTes4kw8Xsj4TsDAhQhjHGX2sgg9C32IxtQ97pdTw1F5ZoLeZ+u0WAWxmyKTb1gzzW5obg7Xzrc1DxNVX0PHXc44U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MB2WIfh4; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MB2WIfh4"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c70d8bb618so2430226b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2024 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713789648; x=1714394448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG4hPexSWedosu3J2N32I42487kxLi51E4WCYQ7z86Q=;
        b=MB2WIfh4rnpQvPmiUpr5uUnAIHibvLzy+iAN3xVwvrhEaW0XYXtPsUEb+iP/lShDmH
         dtlFEsrvpKGphAw5yaIjDYshejPLgxIQiJYL+WWO4Pdmh2nIqbJoIl2xygXzgocgpx92
         dMH8Oypugo07UY7vrx+JMOtxIHtet4Ecl6Zr1LkMCLo29tX3ypPgmmiTAdNbR/KYB1+s
         KFVky1O5yt7228LjC2k+7AyRUv9N4AyJStrzgWziosLnrhA0Qs68qGgowC2rjSW8x+jX
         ON6rah4tqFo1KZ+8IijvfUGbY8IdSpUl227PawVTzkwib7eyPaHenxFXln/JIl4P9R/n
         O5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789648; x=1714394448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG4hPexSWedosu3J2N32I42487kxLi51E4WCYQ7z86Q=;
        b=LxQKPBcvcBxsvzUPLHiyuVtKEpVXnk3GHE+XGuSGTNdaKFog+h0AkgMxE2EquXpXxK
         Sik3S+eV2iWvQOc6U+fQFkmwkzHNV/TGg3f4OEs/i8w6uJ3f9f0TMU3Yx6nFG7b2uCx8
         V4xJ0+yFmhk20kyOjjAhiabA2zEDg46u9x9BOLbbzzrWvfybz2i7i5wAaLQ5HxdU7PWE
         Q/vRYgjSA8dMJVwKRCgzoVIUQ8vm7wG1SG2bi9jD8Y7m+JnBt3S+Zo13s7POLdqs7N3A
         EkPmHjWAanvOnYyvRPK/+X+HK/UXapr76Ou1fdsWA8qlrZ+SiFyM72PkcR9BYK29R/lD
         jJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+6fKEV51k6cTp9JQOSb7YSo1ABlRE4sA9qvUbdaVAPoGygaqH7d07FwXezLQe4h8HUsvWSPAX9R+6u8BXMRsShqnoycchE3pi6g+7BaaVwrg=
X-Gm-Message-State: AOJu0YxC3AYmQWUify4CWgU6ylPPPQ8RZUKgS3dE0bK0Jx/S5Dx0un6t
	TQVmSpSKb4tFC52fTmpGFBcVXeWQqR8rnzFWw5Cj/ClOKm84Qt+n82WqpX6iyHQuqMGqfh0lHs1
	W7rlqyB+O95yqbscWNDFsKzxMuJ4XjanfykafXg==
X-Google-Smtp-Source: AGHT+IEMfGJHMTEml1VRNaAfoa4qnzNHZkeLKuW9Vl9je272KzGmuVy0hJtkx+vfLt1IPHkVf/BJiDOJlfCqo09Adjo=
X-Received: by 2002:a05:6870:b601:b0:233:5557:c6a2 with SMTP id
 cm1-20020a056870b60100b002335557c6a2mr14543327oab.34.1713789647808; Mon, 22
 Apr 2024 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-10-peter.griffin@linaro.org> <95bcdc942cba564f78a6f2fe4cde892575838d5c.camel@linaro.org>
In-Reply-To: <95bcdc942cba564f78a6f2fe4cde892575838d5c.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Apr 2024 13:40:36 +0100
Message-ID: <CADrjBPrnWzT6raAtuswC0AE6EEwtQ7sTUkm8SjpBh=3nibcmSQ@mail.gmail.com>
Subject: Re: [PATCH 09/17] phy: samsung-ufs: use exynos_get_pmu_regmap_by_phandle()
 to obtain PMU regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review feedback.

On Fri, 5 Apr 2024 at 08:04, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > This allows us to obtain a PMU regmap that is created by the exynos-pmu
> > driver. Platforms such as gs101 require exynos-pmu created regmap to
> > issue SMC calls for PMU register accesses. Existing platforms still get
> > a MMIO regmap as before.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/phy/samsung/phy-samsung-ufs.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsun=
g/phy-samsung-ufs.c
> > index 183c88e3d1ec..c567efafc30f 100644
> > --- a/drivers/phy/samsung/phy-samsung-ufs.c
> > +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/soc/samsung/exynos-pmu.h>
>
> You can now drop the include of linux/mfd/syscon.h

I'll send a followup patch for this.

Thanks,

Peter
