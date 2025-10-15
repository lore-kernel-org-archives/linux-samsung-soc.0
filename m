Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533462F9DA1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760550032; cv=none; b=oN2tGyrj79XnlwYFCB/qYmdWVGobYaiUCG3iJSBNdMSseK6JVc1mmOmTZ8cPumjXCdju517cOokOfFXKYgNv30cTe0S28hw/WW26eckOjulx2Ot2SKNdDsTvUUp7ta//ir8Sfifolf0bcld9hR4eq1u9O2lHuuB/CTIpunb5oD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760550032; c=relaxed/simple;
	bh=S1FtdcUcmIeQ998wpbQfLf/uCQbI5Kp2wTYdVUeqhYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWkiiQVvb9OfdgYpAZpVQJ7FVgZ0vtfHOJZdHANHIrsM2dZbO9hpR/bcBOeju8mik9/LC0ZOGgd5qzvBhlZpltHQA+pXhAiVIg4GYJat3jEHbIBJjV3QgiJcy9NfNiBIivfrgeMP9Ovuvuf54BLnrKsaiuL/Kvor/y+FO4OTn7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fj2vMLZC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fj2vMLZC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-271067d66fbso65683525ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760550031; x=1761154831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=;
        b=Fj2vMLZCnTOp+ubOpX09XI3jLcZ90M5IVrMZVpZkEyUltJy/M/XYqI9uK4b0koX94U
         6qXBvyWXH/79qgI3wRcJeADYvR+beO+R2NULk8xTWbjlurBRrUnGfBgdxKwEYnXQOgXk
         R5SapVE7kWDiL2HFrpFkfNumIY96e95PZBt+iI4HlqjKVwTK7/gzuTtkTloAbL8qOMfu
         KsQUotmLq+hDI0B8RpTonoNDPlTTjoVH5MrYX3oMsasHQwPCODhugld5ZAuYORYAJtxk
         QdTWnpgygHP5MEz9RPAOTuZQsNW1GxwuSISGZU8xGn9J+/L5RYVctcvd07Cxag/0608O
         K9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760550031; x=1761154831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=;
        b=N6pZoUq0VpI0JKYdetId1btuJiV0+cEyU3eT807LIEx2LV5ne7q9sI0S643LTk3jT0
         PzAgl05j5DV+exE+OsjyMAVJTsoSi1usMdGUiD+gp+hA2rWYl7zYellmVdqsjwlMEZO2
         rFOoMJj2qpBJMYbFiy5E5XcBGczDnzRIwNwhLAvHWVuhOcbbQjbPByeBfFMpa3yV+fdh
         lMh/xgIXgBIVrMoE99+hjD4Ace0u5pzHTOFk2o3sFwN0aKP0qw8o8bPHMEw7XpdsofKY
         YIAY91X4aLn32m5s79Xg0IelZJxNdGY4HDeoEA6umLjVUGXYXAeKxjnkVjINfLlN/nW4
         2o8g==
X-Forwarded-Encrypted: i=1; AJvYcCWbhKqkAOSem1z+Mj/Ls6hqOG7O4pQj/1O7I2wMPE/26IMuQN6yQCCdU/O6d89vsvWux0o7VJD6EDHPlxYKGCkzfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrFz8rEnPWYUUlqO9FRuOGDzRpSzE5tqdadx/JHgxsIuipLvDE
	eCscNkQGGITRL6lo2+8KR2kY4MxkvHshwTPoRgqfEhw5iutHQ72j4KwdkFlacvucT6fv1j8iEZf
	VtNzM/T6tcQ7fJJJjitd4gPHJKvkk2b1bOLbCD9JC
X-Gm-Gg: ASbGncuJLZgM//YsxO61NLHNOU64WBz7GvE7LpYhDygePU9CDKQEWFWjWN6fmTgf0F0
	mi2wuU/HYr1xTnYpwRiwpS8wUN6OgiUtyHG0uFdec0wbgZOd1aDm9zpdrvugeFIaFfjs0MXTde9
	fho1rbIaA5Kd5PyWmp1EKtMgn/yvVSVtkZOQk1tsG7rWNgSdEMFbPqpDiqEnJS1Bhe76ORMp2iy
	AdQj9DYqZzpCU0FxQZWT9XcFq+ClP2dIl0xK0DNDnjRtHRipHmJ4t1s2abbBEm26g==
X-Google-Smtp-Source: AGHT+IGtM8hvN4lqZlO0WHIvTbL3D48lIHd91NHDkSwH6JM5GHtQa8Pa5RXv0ZasuodiKcuODGfruyjdLC0lq/iK870=
X-Received: by 2002:a17:902:e94e:b0:279:daa1:6780 with SMTP id
 d9443c01a7336-2902741cf99mr376217665ad.52.1760550030102; Wed, 15 Oct 2025
 10:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-3-royluo@google.com>
 <20251015002744.sntua4kqidgusafo@synopsys.com>
In-Reply-To: <20251015002744.sntua4kqidgusafo@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 10:39:53 -0700
X-Gm-Features: AS18NWDkbrVxIDG8dAIZI0TtKFaXgEljVUvTQC724DiczltW9oPtD4sVlkXhIBk
Message-ID: <CA+zupgxbGjU_01JSFR_-2humZAyxwcVT5JR6h6mTVUT=3fFQ6Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:28=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> Hi,
>
> On Fri, Oct 10, 2025, Roy Luo wrote:
> > +#endif /* CONFIG_PM */
> > +
> > +static const struct dev_pm_ops dwc3_google_dev_pm_ops =3D {
> > +     SET_SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_re=
sume)
> > +     SET_RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runti=
me_resume,
> > +                        dwc3_google_runtime_idle)
>
> Can we use the new pm_ptr() and *_PM_OPS macros to get rid of the ifdef
> CONFIG_PM guards?

Yes, will replace it with pm_ptr in the next patch.
P.S. The kernel test robot is also complaining about it. [1]

[1] https://lore.kernel.org/linux-usb/202510111335.oyOAs9MB-lkp@intel.com/

>
> > +     .complete =3D dwc3_google_complete,
> > +     .prepare =3D dwc3_google_prepare,
> > +};
> > +
> > +static const struct of_device_id dwc3_google_of_match[] =3D {
> > +     { .compatible =3D "google,gs5-dwc3" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
> > +
> > +static struct platform_driver dwc3_google_driver =3D {
> > +     .probe          =3D dwc3_google_probe,
> > +     .remove         =3D dwc3_google_remove,
> > +     .driver         =3D {
> > +             .name   =3D "google-dwc3",
> > +             .pm     =3D &dwc3_google_dev_pm_ops,
> > +             .of_match_table =3D dwc3_google_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_google_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
> > --
> > 2.51.0.740.g6adb054d12-goog
> >
>
> Give me some time, and I'll review the rest of this patch.

Thanks Thinh! and a heads up, I'm splitting this patset into
two separate series as Krzysztof suggested; one for the
controller and one for the phy, so the series title might
change in the next version.

Regards,
Roy Luo

>
> Thanks,
> Thinh
