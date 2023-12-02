Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TauqwQnM"
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E701410F4
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Dec 2023 17:59:04 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58d12b53293so1660004eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2023 17:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701482343; x=1702087143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKW8AARa2rBh8AkUnRrMxneVAMkSWeexqM6ylc8U14k=;
        b=TauqwQnMh4NaVHRl58ATiMIf9A3xLJJ2rP2aGrEWw2BHrKzvoADbzrD6q2KVJxgBIZ
         UQlSnIqfFZtaiKnJpozVMOUSmL/q2sW4ink9/Tyg3nKyoaB8066lot0nokwn4NFoUXXU
         q7fO+tzYT+3qG15tr57xqft4BDzFxu0LHylNJhWT3vfw/ST5H3UIim0LpiY4b9Vb0XL5
         0beA+kNDatOKmaDbtcluMg8q9oEtgOj5g+mq7yFvPEX1XZdZ+C2b64ZIPILNQn7cxdY3
         /8ncE8T/6N0UfmLeCjyWIY7RSY/uoGTUjEb29AdkLygcNRAuIJ80PPhv2oSDvba4Zm0t
         gIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701482343; x=1702087143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKW8AARa2rBh8AkUnRrMxneVAMkSWeexqM6ylc8U14k=;
        b=bWOxD12d2OZDvbvyRU+0Xkrq4MkEmthOelU60KhOGInPPnKIO0y9dbzOBN9SLyQ+Tv
         KI8phFhb46BQ1q1HoYKSJSG+K78sc5hLs7l4jo2afDK77juQasH5DNUL0sXy+Qp+0B8O
         dpfT7zZzA+5K5+z1tb51q+paoIrQH/CV7OedL04XNzeYp3v7ZnBizIe9tKw7Xz7Pe+NU
         +tvWcNBeAL1fTaC8fkCyRScr//9/rWE6pMLGtEWJEG+4xUke4oOBKDK+Xqkt08RjA3on
         vJab80hU6iHcuF39WbbFw0QtmWoj5xVoWfRXGzlM4E/JDLxlI1QMgb40xz7uwurm8Z1G
         eKIw==
X-Gm-Message-State: AOJu0YzSx18tI1eBQdJlrW4Gepv2mzf7NO5j1pghEFjsE1sFIp0uMRsv
	HAJr6Opm4gkurYWmAH2aTT/OkiWfsvnTwsF/MPIBnA==
X-Google-Smtp-Source: AGHT+IEmaypBUAU4k3Y4/7axsxc8VYRkLEuyHYlfN4wqGcPrNgMS6965Dk435KeJRUEpfpCOlt7Y2NmlbUKeIXQ2kGM=
X-Received: by 2002:a05:6358:2911:b0:16d:bc0b:836 with SMTP id
 y17-20020a056358291100b0016dbc0b0836mr615554rwb.19.1701482343090; Fri, 01 Dec
 2023 17:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-15-peter.griffin@linaro.org> <CGME20231202004026epcas5p4d3947d7bb99e54f70ca37272cfdc5e55@epcas5p4.samsung.com>
 <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com> <000001da24c0$0b83aab0$228b0010$@samsung.com>
In-Reply-To: <000001da24c0$0b83aab0$228b0010$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 19:58:52 -0600
Message-ID: <CAPLW+4mJ8yEwC8iJdhbiDC8sikAb1BMtGs_OLAAHczkE6U+J=w@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 7:37=E2=80=AFPM Alim Akhtar <alim.akhtar@samsung.com=
> wrote:
>
>
>
> > -----Original Message-----
> > From: Sam Protsenko <semen.protsenko@linaro.org>
> > Sent: Saturday, December 2, 2023 6:10 AM
> > To: Peter Griffin <peter.griffin@linaro.org>
> > Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> > tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org=
;
> > wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> > will@kernel.org; arnd@arndb.de; olof@lixom.net;
> > gregkh@linuxfoundation.org; jirislaby@kernel.org;
> > cw00.choi@samsung.com; alim.akhtar@samsung.com;
> > tudor.ambarus@linaro.org; andre.draszik@linaro.org;
> > saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux=
-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> > gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> > team@android.com; linux-serial@vger.kernel.org
> > Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl
> > configuration
> >
> > On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org>
> > wrote:
> > >
> > > Add support for the pin-controller found on the gs101 SoC used in
> > > Pixel 6 phones.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++=
++
> > >  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
> > >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> > >  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> > >  5 files changed, 198 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > index cb965cf93705..e1a0668ecb16 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > @@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data
> > fsd_of_data __initconst =3D {
> > >         .ctrl           =3D fsd_pin_ctrl,
> > >         .num_ctrl       =3D ARRAY_SIZE(fsd_pin_ctrl),
> > >  };
> > > +
> > > +/*
> > > + * bank type for non-alive type
> > > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit
> > > +field: 4)
> > > + * (CONPDN bit field: 2, PUDPDN bit field: 4)  */ static struct
> > > +samsung_pin_bank_type gs101_bank_type_off  =3D {
> > > +       .fld_width =3D { 4, 1, 4, 4, 2, 4, },
> > > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, }, };
> >
> > This is just the same as exynos850_bank_type_off (100% duplication).
> > Here is what I suggest. Now that it's obvious there is some common plat=
form
> > for moder Exynos SoCs, and it's probably Exynos9, I'd suggest next cour=
se of
> > action (if maintainers agree):
> >   1. Remove this one
> >   2. Rename exynos850_bank_type_off to exynos9_bank_type_off
> >   3. Use it for both gs101 and exynos850
> >
> > Does it make sense?
> >
> My opinion is to reuse exynos850 for gs101 (wherever applicable), same ph=
ilosophy was historically followed in this file.
> That way (using exynos850 for gs101) things will be simple.
> Adding exynos9_* is not adding any benefit, rather it create confusion.
>

Yes. But why not also rename exynos850_* to exynos9_*? I've a feeling
that a lot of modern Exynos SoCs have the same pin bank configuration.
Wouldn't it be better to use exynos9_ prefix for all such SoCs than
exynos850_*? Because Exynos9 is a family, but Exynos850 is a
particular SoC from that family.

> > > +
> > > +/*
> > > + * bank type for alive type
> > > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit
> > > +field: 4)  */ static const struct samsung_pin_bank_type
> > > +gs101_bank_type_alive =3D {
> > > +       .fld_width =3D { 4, 1, 4, 4, },
> > > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, }, };
> [...]
>
>
