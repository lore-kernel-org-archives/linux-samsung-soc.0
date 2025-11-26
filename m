Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90574246BD5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142585; cv=none; b=aszJi8L8oxeSKhkrjosHQ5u6/hV/EKZs3BX8Tc3Bci7Jjkfen2tGs5B8YQeQG+4ueNoW/amLt/grDr+H30rsgCisY40hptkcimvQwhLKnkiZiDFDWgdr/ohmTw/BFSGZMcLS1MDqfNbwWxRDnhxoH1HgCtwgLvciz/l+HVLoU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142585; c=relaxed/simple;
	bh=+NYZTcPMfQw8EVvM4OhMcZhhk3laGmdMxWTa5PItr74=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cxYW8OUTE3beRuXoH7/88XHcB0G56A3TAT2Kh1Ic0Giuwm3G8SM0QN3YOK0E6yGdhr30w4Gs5jsjMId5e0qQ/OGJW0bcUVV9/+9nwb2HRmXn5mX8eK0Rlip1p1t/V9iR5DtUr0MT4ZVD2eBsWHZqhD2PwG1u/iKFglMWG/iDSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFyvzeeW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFyvzeeW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso3823320f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2025 23:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764142581; x=1764747381; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=;
        b=nFyvzeeWb9JDcvgVDAYupEKe6ZHkm4uagrSkxVy2oqcywFoW45d+53JI8Nr5+qYYk5
         E//hPD8GXgnK0x3i/VMddEYgSaHT3RVgkIU99oOD27WsgW2yYMqTfzD5ZCSoPEChDHqx
         bGqRS9VW0ZbCXoIB3PShKO1uljkgYEPFZyVglhtvpNYP6YDL2/oYOL26xBnBB1zeQMk7
         toOfRW7KauApdiCrw7EGdjcPufAEEJvL+bg3gExLqk8LlS+0NgPcDpByO2u3L93zgjhD
         M6qx7s1XLLnoV6Z4k9Nk1LD/mNWQX0EDxBfESv0dTGZ8AkTjN41+5c+GKID4dkZOAFzN
         1r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142581; x=1764747381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=;
        b=aVHZSIZ11n9jjsP9GiA2CrkPcfrnR/hXR27eBg217+k+TD3o8IXoKtH1JaRMGZB6KK
         8zLP/RG6h/8ZGuUNYBaIk6sCBECBf54jtVSC5X7WH0rLPC9kRzWxjHqTu03+i5uXH/Yt
         hsQwl7TNp77ivL4zruRQ0bxrcoacXClCy7xtBhbESkarHdu3KgVV+Qze1GNY2Tbfg1ON
         e6Yws9LVW2OumFOemEELFfMxUbiwLEomqijyqV8ydOuSL+iR2bJlx9YQbOg69exPF0oi
         Z+IChSWUO+KLSNXAe/oND8Xnd/2Ft7pe6g+1DuqJv6QdyMPJbQqc2MrJ0HUUHuW1jMs7
         mPoA==
X-Forwarded-Encrypted: i=1; AJvYcCVHS8PtjT4DgluJXPgKsXlP7RuBAcXTGN/jMuyrjxF0C61lRQpMrECtjSdlh0bbGfSwmLsPg5wplbpMk6uGpz1NKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQOqRl8YMq0bRke7Xu5cVJyX2aQ0xiL3qvRs26oenhHvJUktf
	dx7/PigpZdV6Z8btVy0TNNjBCBOETBsooW0/ooEXOIDXzemYkI9Ka8LralNQKpu4qh8=
X-Gm-Gg: ASbGncv+fnygG0p87qhK4ZeqgIKxPTqCbSSLf+KDPgcGTvjhLBjlmDauL5gSCo/sbVc
	/0AlGUB8yfgsMgUTzq1sTjQUhEJkWdAoQRoNYytZltDVIe9Ynx4ufnb189yUtT9/ynOzs5jJwXe
	iU5BQPyN6SLU4hoIypF8zqoymsu73BMN8v8jfeW2EcDBo9kbN7hyqJ36w2IJvHT67ELPUm735gZ
	dr4nD+X7en2wkL4jADqxopftaf9fPAnApG36cILmm1bx0R8KWbeRr+kbFHUz1GLxsbidysZ3DQf
	i6BAY0eHnxuuADH0nlpHhpTya5LRyxXhVzNvuwFyC4H1wY+o9QO3KRvajXdtLRw0SvhqKcasni7
	LMDZzjHrYbdxDdQXVuiI/B4c4qjcvdKNcNPx87KGWNjQdrq9A9gvZVrqopktSGKmhrKAjvxHVY5
	0gOVx4jwZmi1eByRZv
X-Google-Smtp-Source: AGHT+IEkJIVmft0K1+fBvK9APlqevDyQqqLhuiwQwAv9PNhWzAVjw6Cn97feu3xnWTKXQ+ps5Ed2JA==
X-Received: by 2002:a5d:5f91:0:b0:42b:3bc4:16e9 with SMTP id ffacd0b85a97d-42cc1abdf6amr18484142f8f.4.1764142580820;
        Tue, 25 Nov 2025 23:36:20 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm38547158f8f.34.2025.11.25.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:36:20 -0800 (PST)
Message-ID: <1fafb9117a9faa32222a55efc77794156635d105.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri
 Jagan Sridharan	 <badhri@google.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 07:36:35 +0000
In-Reply-To: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
		 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
		 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
		 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
	 <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-26 at 06:44 +0000, Andr=C3=A9 Draszik wrote:
> Hi Amit,
>=20
> On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
> > Hi Andr=C3=A9,
> >=20
> > On 11/23/25 10:21 PM, Andr=C3=A9 Draszik wrote:
> > > Hi Amit,
> > >=20
> > > Thanks for your patches to enable the charger!
> >=20
> > Ack!
> >=20
> >=20
> > > > From: Amit Sunil Dhamne <amitsd@google.com>
> > > >=20
> > > > Define specific bit-level masks for charger's registers and modify =
the
> > > > irq mask for charger irq_chip. Also, configure the max77759 interru=
pt
> > > > lines as active low to all interrupt registrations to ensure the
> > > > interrupt controllers are configured with the correct trigger type.
> > > >=20
> > > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++++++++++++++++-------
> > > > =C2=A0=C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> > > > =C2=A0=C2=A02 files changed, 26 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > > index 6cf6306c4a3b..5fe22884f362 100644
> > > > --- a/drivers/mfd/max77759.c
> > > > +++ b/drivers/mfd/max77759.c
> > > > @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys=
_irqs[] =3D {
> > > > =C2=A0=C2=A0};
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D=
 {
> > > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_A=
ICL |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_C=
HGIN |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_C=
HG |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_I=
NLIM),
> > > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
BAT_OILO |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_CC |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_CV |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_TO |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_DONE),
> > > > =C2=A0=C2=A0};
>=20
> You should also add the remaining bits in each register here, so that the
> regulator-irq can mask them when no user exists. It will only touch the
  ^^^^^^^^^^^^^
  regmap-irq

A.
