Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F57152184
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2024 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713797767; cv=none; b=Eawwsk7c9X2wdDn3TiK79DIwSmvQ3bGgW98KIfbKwsMUwr7HcoI3Ez9wdkRkuNR+guA8Od++oj3ynFoSoK1aLH3/DD6/0znDV9r4P3ft9OvNIMtBQ3Jb+HAKxYUlFtVpQImVQgw2DGO99F96i+Ph+Va40hdq7wRrgN4WBA5sXxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713797767; c=relaxed/simple;
	bh=imsekkblo55XmgjAaWRpZaTVc+ZBiFNXzC9IucNVpbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9k8Iif+T4gavH79Y55cAdQBMih4efM9KM2+8dNoxzDHKhGwp+WiYqgCvFQhUaJFQ/5SLRd83Kfqim7cwqmGj81lbjAq7ihasFesh7heokWK4iKpqFrt1CV9PAqvGgBK4D7c7nKa8z8bRkkWBS4CDqWJlOPLcEqK/Y1k16p8jvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4HjiUXU; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4HjiUXU"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-22edbef3b4eso1054188fac.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2024 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713797765; x=1714402565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTOg8DkAW/3dkpxikcsk436y8h1eZe1SfUF5lmW3ku0=;
        b=U4HjiUXUk7RxfDBJM02w61BKjrevJJkbVQ4n308mTss7ZrXCgsfziCIwLKxShfByoo
         hWFUPwgoHrnn3+txvd+/dIRdrUyblWZBxXoIwQ7UOUEt5AXEp3fu6NW1YR9Euv3EQx5h
         I1rveApyv3uw4B8KPrC6Jknj+jJkMsDnxzmLngWhjRpXz52q9hKfhn6LfI2E+KADBrKI
         r+uDdkRm9scQAFyNYr+06lPE2DWOuUWWkQvldJVTr7zvmAQ4ictOwHFJ3K+eaL8sVheP
         2p/ckccpkJIi/sQewygszj8wg3710ivlA+IL92IGQ0r+8UQMLXtriqxQHG6s6r8iYUjm
         58zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713797765; x=1714402565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTOg8DkAW/3dkpxikcsk436y8h1eZe1SfUF5lmW3ku0=;
        b=le4EEJlfrvNA3CUDbE20v3UGHuLwgRYDuo/+lds1C6TL8SBwmO1b+WgnoqJW0Zk31m
         LSXm/Byw9lWaYc0QRyV1iewNxIcYzCF+wmZIOQCOgbnM88f1x+Q3YlkhDXOfIXe2Ybr3
         4vFctg0ioYJrEQMGN/KQXO6gdXQhq62XsMNkiVcWg6dYFGtiZKHaOhbmISDBsZ2CCBAz
         u3WfugnI0/uXzJ38Ez268JPajqIaL8PG10k6xPW6PcESoh9V03KDedwZH3EGj+1aOWLK
         GVLwLP6kWf2Q1oGGeCZvncqgCDkM6YF9Fp7B4dHjBxrL0Pt3l1V1yAxZfo3v6N2VyPIq
         HgZg==
X-Forwarded-Encrypted: i=1; AJvYcCUTYRVCus1K6GmwWDUxhlU3h0oCryz4rMXXojjY5RwslsKQ0XUdG2sQ2HLrAaLZgpeEqtQf2ZKoVnYHzWko9Zovm31taZA5AZt8oiZmOCWMxms=
X-Gm-Message-State: AOJu0YwNnfZYzlUqexiZaLnPLPLtEJlDmXwrSwse1Zkbaq7NtpNU1M09
	UgzcrU9yQmX+e1hXlLaOku0hxcmXEzaxkIv4GnwW2XWMcpIIIgVTSInSb4LkvZrFBzjIQCK967N
	jqsiSxUsKiTNGKGGefQ1TwADdZhXtRALBdRn1FQ==
X-Google-Smtp-Source: AGHT+IHTzGHT1v9LeibIhpXISDP5Up0NDJE//bpDlntvJJiW0sMwcyQm0rL5VdwsrhLb5OjnZBVN3sPtCblaMnzwbwM=
X-Received: by 2002:a05:6870:1318:b0:21f:aba0:772d with SMTP id
 24-20020a056870131800b0021faba0772dmr10853360oab.39.1713797765495; Mon, 22
 Apr 2024 07:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-9-peter.griffin@linaro.org> <61f427ab3793def23d80d94457ff1568cae5ee11.camel@linaro.org>
In-Reply-To: <61f427ab3793def23d80d94457ff1568cae5ee11.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Apr 2024 15:55:54 +0100
Message-ID: <CADrjBPqAyWzuw9TmdE1XRQ2BkYojR8r7nnH7JcRWc9_xOpUgHg@mail.gmail.com>
Subject: Re: [PATCH 08/17] clk: samsung: gs101: add support for cmu_hsi2
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

On Thu, 4 Apr 2024 at 14:24, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Pete,
>
> Thanks for this!
>
> I haven't reviewed this, but one immediate comment...
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > [...]
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > index d065e343a85d..b9f84c7d5c22 100644
> > --- a/drivers/clk/samsung/clk-gs101.c
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -22,6 +22,7 @@
> >  #define CLKS_NR_MISC (CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> >  #define CLKS_NR_PERIC0       (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> >  #define CLKS_NR_PERIC1       (CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> > +#define CLKS_NR_HSI2 (CLK_GOUT_HSI2_XIU_P_HSI2_ACLK + 1)
>
> Can you please keep the #defines alphabetical (hsi before misc).

Will fix

>
> >
> >  /* ---- CMU_TOP ------------------------------------------------------=
------- */
> >
> > @@ -3409,6 +3410,560 @@ static const struct samsung_cmu_info peric1_cmu=
_info __initconst =3D {
> >       .clk_name               =3D "bus",
> >  };
> >
> > +/* ---- CMU_HSI2 -----------------------------------------------------=
----- */
>
> and this code block should be earlier in the file

Will fix
>
> > [..]
>
> >  static int __init gs101_cmu_probe(struct platform_device *pdev)
> > @@ -3432,6 +3987,9 @@ static const struct of_device_id gs101_cmu_of_mat=
ch[] =3D {
> >       }, {
> >               .compatible =3D "google,gs101-cmu-peric1",
> >               .data =3D &peric1_cmu_info,
> > +     }, {
> > +             .compatible =3D "google,gs101-cmu-hsi2",
> > +             .data =3D &hsi2_cmu_info,
> >       }, {
>
> and this block should move up

Will fix
>
> >       },
> >  };
> > diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bind=
ings/clock/google,gs101.h
> > index 3dac3577788a..ac239ce6821b 100644
> > --- a/include/dt-bindings/clock/google,gs101.h
> > +++ b/include/dt-bindings/clock/google,gs101.h
> > @@ -518,4 +518,67 @@
> >  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK              45
> >  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK           46
> >
> > +/* CMU_HSI2 */
>
> and all these defines, too.

Will fix.

regards,

Peter
