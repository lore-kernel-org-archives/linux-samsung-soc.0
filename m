Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FFA2E6CCD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2025 23:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607331; cv=none; b=ePI12tnu6mcDSRhbECp9Am8U901eVTCzi2lanlK46q0q9f2vmZQj76Ot6PrKQFw0/DxS1QX6X94uHVJbv//PXXLBVGeJuN1tj8h2bV83VTvB6vCQOxrSA7jIAlUNb/+wPhMqnrfDVIX92vrQFrqOQMJI0J5NuSBF7s1gLtqxHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607331; c=relaxed/simple;
	bh=P7ysm4/FJD4mR6EucRcT1c5Y9QYG15DBwqirU3YA+CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYQYGOWTQxySk/GHHkQvDH5UdLI8AZAwWYRL6B8/6Hgzhnr0D9LQi5NjnaNv9OnRgd1+rzEw6UJXX77GBrtnBJyVjsD5m90yxM8Gx1aav8879kYv1hyHAaqZrz/LLzbeNJkykFtfxbp5K1w1gApo5oJwyWKf4gSckX386wVvrYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ux06wiQM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ux06wiQM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27ee41e0798so75273905ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2025 16:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761607330; x=1762212130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiPQWeIHeevsOV0YNnrSX+B9LNP43U3Api7ejFSH8cQ=;
        b=Ux06wiQMhR90R7GZzc6ZESmOZG04sDLPUxaS4AUbGNgHfP9FNgWI4K/Cgnfer83yL+
         3u/rWp29WSs2Y21ZTsf5yYMurgrBul22soGUjPAFI5+XmWStkD+OOAxFZzHNErfvWQh4
         CYhq/C+ubgGBoiSOa2x3OJ0o4e6Ls7l5UgwwqWSGWiIrV5Zu/27aUQjUtP8BJFW9GZ4E
         XLQlOFE7sTqCmMf+kIduyAXUw5oZElhYKTrSTtxiNNstk836PDxZ+pp8myWSQ1u9dbla
         kQkEnlLgp2ScHBXssg/IwoPGprMe6nFvbamzG1bz4tzSdz0nKPHKKqVLMdwGrWr7quBL
         UvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761607330; x=1762212130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiPQWeIHeevsOV0YNnrSX+B9LNP43U3Api7ejFSH8cQ=;
        b=JT6aMMGxj+yxTvMVZkg3RuLj+p3A5YG+iCizouxjPvf9SOrAavrg01sw8NVE0COdtd
         Ka5TykZxdHASQisAKauKCqXq+iKXrnRz6/XmZ3lxFyj/kdC6WAjvCvs59XvtFbfm4+eq
         nwpl3qa+bAV1BPmlfKUungMYILXO/+gqCAShBBN2goJhVGqK5a5vhRQM8klfK1QdOA4V
         wk3/3jOFho/D0iwJMA7PJlozH5qPdrhblWx3DIhLXLI/KkvXyDza5A0HTSLOvHNcqoP9
         Mg/ATzx1OeB+xSJULJMjUEx1orrX5+HMeP9u+gKrTUTlBPyvhS/kVjllOillkIeALqGd
         G4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWssnzk//H5mFXr2VNOhwpeXtxUzGgk+YPLnciMW7CVv+jBTf18cxh6/Zgx0yIbRRrpOYRi/aLyPC5oqN5czarIog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJNyNT7uQolfqPzmfEYOuU1vUHLpfgqXDq++pAf32tx1y6kZB
	bLfXtVQcPh8a5iRiXdJMzl8ufI2V3ry2RPRxcOm0IWfus8CxLAvYjaFNA/rUJ/fivuOicWTzNw9
	1z9B6toASA3DSFKof1inI8Gu4k3Gt9Zof2sQ5B4kz7RdR2E3SAW9sR/Vh
X-Gm-Gg: ASbGncsKhPyVZPDPn8SHvMLh+35MBtP+3gd4f6eRYkmSm9YshIcXKkzjhFSXkKg1Tuw
	4MsujbZ3JVPIXY50GMAo8LoBfKSlFTubm+2qnj5QAN+SwcEsQcQmtECBeGxybCh+95VcHMq75sA
	xCx3e0IzrVjjtxidwx84QArneirAz0fI5yZhT7lTQP6kwSwHTGs5bg+zdmXvsp90I5S6slNuZuY
	4DlDySv+QC0L0IY6rUknh6ulMGC5pLmH3IWHTLJV9DIVVRGbYXxBeFAkx4DWA019Rot5vzXjiuo
	8eSPqkcmXiNthbAQCQ==
X-Google-Smtp-Source: AGHT+IFw/jdLBZAkI7aI48cv68geMt8046dhZdRqyhbPorbEN5vUOHFP9Zbu6h+jTvEqQPeotPAALO6GhBMyaapG0Vg=
X-Received: by 2002:a17:902:f609:b0:290:ad27:c1fc with SMTP id
 d9443c01a7336-294cb6893fcmr16828025ad.55.1761607329339; Mon, 27 Oct 2025
 16:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-2-royluo@google.com>
 <20251023-collie-of-impossible-plenty-fc9382@kuoka> <CA+zupgwQTLEs8_7i-VsGbGV7O2Y3XFA1C3aV7iuv2HLOwKns3w@mail.gmail.com>
 <8e4c8875-10bc-4f4c-a675-a7cefc68c863@kernel.org>
In-Reply-To: <8e4c8875-10bc-4f4c-a675-a7cefc68c863@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 27 Oct 2025 16:21:32 -0700
X-Gm-Features: AWmQ_bnZfP-h63jIJfnjGht1z_4tHKDRepUQGmMIkJ_dLhOGQfclonH0qtun2RU
Message-ID: <CA+zupgzzkX2CEicrLaW7oGB08qNVqF=5Jpfgcw5HWS1kDW72qg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 7:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/10/2025 00:22, Roy Luo wrote:
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: USB2 PHY clock.
> >>> +      - description: USB2 PHY APB clock.
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: usb2_phy
> >>
> >> core
> >>
> >>> +      - const: u2phy_apb
> >>
> >> apb
> >>
> >
> > Just to provide the full context, these two clocks/resets
> > (usb2_phy and u2phy_apb) are specifically for eUSB2 PHY.
> > USB3/DP combo PHY has its own clock/reset that hasn't
> > been added yet, we would have to differentiate them once
>
> That's confusing a bit. You must add all clocks, all resets, all power
> domains, all pins etc. Bindings are supposed to be complete, see writing
> bindings doc.
>
>
> Best regards,
> Krzysztof

Ok found this in the writing binding doc:
"DO attempt to make bindings complete even if a driver doesn=E2=80=99t
support some features. For example, if a device has an interrupt,
then include the =E2=80=98interrupts=E2=80=99 property even if the driver i=
s only
polled mode."

I will add all the clocks and resets inclusive of usb3 in the
next version.

Thanks,
Roy Luo
