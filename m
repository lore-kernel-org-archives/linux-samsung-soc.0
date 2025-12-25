Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BEA17BB35
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Dec 2025 00:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766622841; cv=none; b=nNDffSSWljmfbZf/xbrhgGbTaui6S3KNFGKhomBRaxexJ52U+9UpeZy8ZbZos51jj0/N/4J6Xc3czAbS2Ksvm8/ddtQsJ7QbivDaPjle0UjJPmHMuXaOWtGBKp5QJHI/zHYNyU9aHpDZBmqme1qJyLq7gsi274fFejkMbSmi9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766622841; c=relaxed/simple;
	bh=kO03mbmo1xEkfWjpxV48uj2a9mMY2tA3P1oGiyydh+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0/iuQ3QudnD7tQjKXraKgYRKqgVulDgkObG9yNbUleSc2qnXsL3U0GfUWDEPAjYtcMImJotknYO4UQNstuSNL1YAN02WmKUlqSsRjPrNU9nda7yF99aoeDn8sllIncskq9xVgePvmaKKof0TwK9ZD18l3Ll4/v/cVC4Fo9/l/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4y8UWOc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4y8UWOc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f0f875bc5so92449945ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766622840; x=1767227640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvJrGIx5xr6bd4apb7bOhjYC7gT8f2fehBHgHwpjp9Q=;
        b=P4y8UWOc9UK5JmNWhQ6m1XsUgIYxZQXYGLaDGpdix1a9PGukIg5LYBHPJFGRSFFIpY
         k+7rjOOiIOX433O+IISewCZol/1VNpjgYXIb26uAxFzpRloH1+3lFCmpmxxg4DCx+gg6
         D4DYQla+VmhNJsm3us/l85s0SqOD4dRqLTT5zdaTBsCCiKD6Sw9wFQTeARHyDDwrLrS5
         U1WPSczSMMBGeHepjcSJLK09Yjn7vfGp72eiVFxa371NsXMsGldxqP/Dd5dkCU/b5rdS
         WNVB89+oljN0mKAFltvWdzhWg9NYFsLZbWgXoMH2w/aH+GExf/ldknHk91A2vL8Ry+zz
         o1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766622840; x=1767227640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvJrGIx5xr6bd4apb7bOhjYC7gT8f2fehBHgHwpjp9Q=;
        b=vKE/Blx/Yv1FDLE5z+6+kMVh9tfss59X54+ohY6Uktr9NU2tjl9+ljZFXGsKeqLrUN
         oujtFdQb0EVjn3hmXMxhh3QNmybCGRGcjKEykeEkwwUoikKGA2iKhLP4sPOU9AYlr5Br
         o6LQdHrz+SpXFkMFiFlgex8UqZSRIGdd/giAH3y2Ui68ftwMwbEHnQgwtqy5kI4j0nHG
         pU+eU7NJtZ+shIt1gTPOJFYJapMIVWA/jsSSH9LDR3OOVLkccOUr/YO/QVT31MbVkNrc
         RDwOLLoFeFwEAw/dA7kqQKKOEr0abfTCiCrpecDWJI+EQ5tWYB9NCrxky6W7t8RmkS1j
         keFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOerm40Qtf0aMKAm/4BbhjvTTmik+iCJC+fqDBNqsWfB2MrfwU+h/Ui9fMcpsCjr0D/L7aBdLmByqabmNOtrqzQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQc9+bjpR2LC1YO9KuP7CRkq3LNAzAFoilDTM7QVNioSIDKGgj
	A9zbNqhF9S4CjlOQihD/AONaUBXJqJ3lHHEUdUls0HklOVmAcbVM6gWywXcCqZWrdorDveTzpPn
	7msmHu/19FHtAqh3HFyj+gOnkUZFDpvDc+/LSMpLD
X-Gm-Gg: AY/fxX4OEyi7PpkvbRqMAvCJN5H45NioE0xTNLUFSvIhU/hm+yhWz5BUP6/+UCJF7HY
	K3dK5xJY1+YL+5vwbR/mbhY6pimO9bp4EkXNQ3zC1AxKgDfniybJbU3psD+AekmBF6/15T48Y/x
	kSftgG4qeS105Q8FsnDOB+URqaxYnYJ95EsIk6PxcDCKh9QzfIoksufd0F9MNoHITr8EvF5jcPB
	ewscB9Cy5jt2Kvx4aAjOMbsawAoXqzbZEqfPusH2/VZo19uSCFjDq43IlRXUoVncVPh6BDfwinE
	8R3Z0JmmVBc7VnTts/8FHRj05R2K
X-Google-Smtp-Source: AGHT+IGCFNQwV2B9gW85beRpO1nk7W/XQi6wwn5DJO7Zav/pmROHDw2dRc82S2a7AH7ihqx3VW/rLaLZrRoY8NOchKM=
X-Received: by 2002:a05:7022:3718:b0:119:e56b:9593 with SMTP id
 a92af1059eb24-121722ed87cmr19469821c88.24.1766622839122; Wed, 24 Dec 2025
 16:33:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-phyb4-v9-0-82c0b671b070@google.com> <20251222-phyb4-v9-2-82c0b671b070@google.com>
 <aUqhbVFHczpL9qnL@vaman> <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
 <aUt6hobN9DPUGbpz@vaman>
In-Reply-To: <aUt6hobN9DPUGbpz@vaman>
From: Roy Luo <royluo@google.com>
Date: Wed, 24 Dec 2025 16:33:21 -0800
X-Gm-Features: AQt7F2r_cQFC2N0eTEOR5BjjKp383NkfQ5rWibUZL_Pyz-eoT5c0f_oTz4h86S8
Message-ID: <CA+zupgwX_zN-Mge01Ye1_J+rwy0yEQdww1+bPo8YFWnfx68n5Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 9:30=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 23-12-25, 09:53, Roy Luo wrote:
> > On Tue, Dec 23, 2025 at 6:04=E2=80=AFAM Vinod Koul <vkoul@kernel.org> w=
rote:
> > >
> > > On 22-12-25, 21:31, Roy Luo wrote:
>
> > > > +struct google_usb_phy {
> > > > +     struct device *dev;
> > > > +     struct regmap *usb_cfg_regmap;
> > > > +     unsigned int usb2_cfg_offset;
> > > > +     void __iomem *usbdp_top_base;
> > > > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> > >
> > > so you have an array for one phy?
> >
> > While the current patch only supports usb2, I used an array
> > to simplify future support for usb3 and DP. I understand this
> > might seem like over-engineering for now, and we could
> > certainly wait to implement the array until the second phy
> > support is added. I=E2=80=99m happy to move away from array if
> > you=E2=80=99d prefer a simpler approach for this iteration.
>
> Rather than do array, allocate mem as probe based on how many phys will
> be there and use that. That would be a better approach than static
> allocation here

Make sense, will change it in the next version.

Thanks,
Roy

>
> > > > +static int google_usb2_phy_exit(struct phy *_phy)
> > > > +{
> > > > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy=
);
> > > > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > > > +     u32 reg;
> > > > +
> > > > +     dev_dbg(gphy->dev, "exiting usb2 phy\n");
> > > > +
> > > > +     guard(mutex)(&gphy->phy_mutex);
> > > > +
> > > > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USB=
CS_USB2PHY_CFG21_OFFSET, &reg);
> > > > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > > > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + US=
BCS_USB2PHY_CFG21_OFFSET, reg);
> > > > +
> > > > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > > > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct phy_ops google_usb2_phy_ops =3D {
> > > > +     .init           =3D google_usb2_phy_init,
> > > > +     .exit           =3D google_usb2_phy_exit,
> > > > +};
> > >
> > > Only two ops? I would expect more... No power_on/off or set_mode?
> > >
> > > --
> > > ~Vinod
> >
> > No, configuring usb2 phy is pretty straightforward. The hardware
> > does not distinguish between "initialized" and "powered on" states,
> > it also does not distinguish phy mode.
>
> ok
>
> --
> ~Vinod
