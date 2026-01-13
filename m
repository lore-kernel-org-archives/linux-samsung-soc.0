Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139F23803FC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298292; cv=none; b=JRgpb16zumdWJyMBgPGwI4804HlCcgO6jQ3qsyqXgPlVbfAjtFX8aUHE8i7h6Q6fokq2M36+fkNJL7BRRgf1ZBNzae5E+dTcHRgXw4BnakhPF/xGkIdXnrYRhGu8Wk1GPZRpOt9o4feCEeQ0aluHkJuV7o8o8/qNYZeZ2bJkM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298292; c=relaxed/simple;
	bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VMtMPjxZTYujvBm2TSrS5wZN1jA3G2OUJze2Qqsia4X2ZSerwJKQTqY1P6e4LItVn2iuxhsdT3bIhzHJ6RiMNX8u1gt5GZrOLq2A3ffoJn2u1AUuOuCiwTy1yVtraf6xvEwz/KdLrnYormAA2oBV1ZYfKKKkFuOrSRqP2aNAMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qoXWdqNH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qoXWdqNH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so3177117a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 01:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298290; x=1768903090; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=;
        b=qoXWdqNHFdUMyFePbOBzvWC4BETwEudjHoza0f8rdfQjwvb1lqLbZUJy2O1JcFxkAM
         tIKX4cRzYwcIEPH72FGo/XlkG0G+BPRZ4mvEstbFtp7hhdLlEqf/q8H7X+zAy4hruq7m
         NbYsf7cs3Dt5LJ9gFvZhKntfWxx0ItY24eVCjXClqFpCbTcjuWZCgkeGSncuQ/whrwgv
         HhHqQgYLE5K51eyUXlFrSeXziomHVdwuDW2VF2j4iZ8ct5vmZ6inJRuWvvC6gW0oeYCS
         XNSoddRxGRTrcjGaunHJoOKSvutnmJva/s7hL5/yjyVHE647bFOsbjSIRBE/zfIsfSUi
         1iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298290; x=1768903090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=;
        b=moFPH3qxlUF+87WPtjlC0F/2Ieb0pL16If8t5Ihyh5psXSYthalqadIDmiTXkaYN8i
         i4SVCIrxvyJV2nnNNXReEVzHDpm0lFZgnVZvQek627CnEGVNM5RdWLi9o56mo0sG3ukg
         36uyFoBOgQLbhjdYGzqknOBd7JI7Zer1t7SLfpI+jk6UCFoc9a8VnSpNZee2zndJYRhd
         pZCfBOFnGvOWmV6BBvAwpL+wIqbMyHzNmaorUBEDU1fHG1EGb6Thpe/hwsGTu8MmbxsI
         ho938aM7EOAFSX5JuvnZY7VqrnK5uaEVs6JL6xNJA2pDjdxc4alntPAct5vnrzIM7Hy1
         f1lA==
X-Forwarded-Encrypted: i=1; AJvYcCUgQOFMVijx4KHW3PN6s2Es8qRuDmb1VmNmiefbLwDX1aq0fpd7YtC/H0h8Xci0iC2g/Tfrcv3/5xkbeyWyeWm/TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87TfysFhRjZ4eJ/QvveGS0Fdp97jdpQCXqvDCpXlHUSMtcR1d
	mMQVocj1Ud6M5fG6kaWfwnR8/dJzhPvdnutTs+UbSqQqQze+8zL553U+6z0TN7la6dk=
X-Gm-Gg: AY/fxX6NC/b1z1i+jzDt1SWqZsYR4KDBYoOAQfeoXep+ZAM4x+dHTGbJFU+oOhqBTgU
	mLWgNTIX0sZ+eM7vjoVng40myzojkdqmZ33DOU0DorG5f9+nia3mdOQhWwn5NJsc+eBy5IRVEvy
	g/TJApoADAtk/bCOTOPQwmCTF6qr5xR+ADMYQC5YbOBhPxzSNTTq+BWkeR2IruFXij1bYn21xgL
	xB1aVyPRTj4AB95vUuoeeYDkK/FfoDa/N+1O/K1tnKDk1lMK05OH2mm3q8/M0VpgaWtLL6fAXDQ
	L1ckf1Tzd8G0y/NQsb1MCbBxZ6Vhzu1ru9d1/CUaaVqi0i6he/lGOMEEj3HWdrgqVzDFnokgQyb
	ZdQeVNrpw3Q5IYs8VuwsnAHMQpfzYXdXRQt6Q+beVR3h4t6A+LHO89oV6ic4Z0HwRHbgkpltvdM
	kBTrle3oI81a880T84
X-Google-Smtp-Source: AGHT+IGd8O7bXon4aWxByHwIR+r6yYy/wzypobdk+VV4f1Z0lhI6RmpCFqfxtS7zisBuvgEEiCwJmA==
X-Received: by 2002:a17:902:e807:b0:2a1:e19:ff0 with SMTP id d9443c01a7336-2a3ee4b3165mr186626875ad.39.1768298290235;
        Tue, 13 Jan 2026 01:58:10 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5ceeasm195176785ad.45.2026.01.13.01.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:58:09 -0800 (PST)
Message-ID: <c1045dd2f33ed3a618381448717b0b5d5b28dcb5.camel@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Tue, 13 Jan 2026 09:58:38 +0000
In-Reply-To: <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
	 <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
	 <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peter,

On Tue, 2026-01-13 at 09:13 +0000, Peter Griffin wrote:
> Hi Andr=C3=A9,
>=20
> On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.or=
g> wrote:
> >=20
> > On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > > Fix the places that don't have correct alphanumeric ordering. This wi=
ll
> > > make reasoning about where to add future entries more straightforward=
.
> > >=20
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/clock/google,gs101-clock.yaml=
 | 6 +++---
> > > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clo=
ck.yaml
> > > b/Documentation/devicetree/bindings/clock/google,gs101-
> > > clock.yaml
> > > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b=
9c256bcccebfdef2e49 100644
> > > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > @@ -27,13 +27,13 @@ description: |
> > > =C2=A0properties:
> > > =C2=A0=C2=A0 compatible:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-apm
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi2
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> >=20
> > If we keep 'top' at the top as one outlier, it'd reflect that it is the
> > top unit and all other CMUs are children of it.
>=20
> Thanks for the review. I opted to just keep it alphanumeric so it's
> (hopefully) obvious what all future ordering should be.

One last comment: except that all other source files in the tree place
cmu_top at the top. It'd be more consistent with those files if done
similarly here.

Cheers,
Andre
