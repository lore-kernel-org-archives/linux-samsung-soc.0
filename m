Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DEB2D97B8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764918922; cv=none; b=TS9Xf4QFnE4kNr7IIjNOotaPTeYOz6Gg/i+mgio75BD6It3fRZG9Sdt3Pc+377bmB57JwPABbWQMheJTnq/HuUNkXP3CpZXm3L5YZUtweSNjI44q4zhhbvd3JCLM11BTEE6N7SMlCxloSq3B+oEFYv3xyFUo416W2ro6TFB7FV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764918922; c=relaxed/simple;
	bh=Y87s2aEVnLW/6Tev1yAD8aRSx5zYQtZ+xk/cGnKy0GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qye2z5mR6Sv3J8NzxVsjmHOzi4zFlhd36KgGDZNfB38JtMCxjYxdXJuVE7MtLoQSm/5BrU+My6sa5df1TlkDE39cc+mm0/uZ5Y6LasoJd7eJcu9KPPMOpTyApf67RIJn2/SQ/aecZLpNAExACb7B9BmTHqtYl1D9R4bFbkL1wx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EiCc+cBs; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EiCc+cBs"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1152028a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 23:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764918917; x=1765523717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=;
        b=EiCc+cBseyNCaA96GV8FVIVg5+Ae7rKXe5LDG3ULZw4/RkIOpuQWg2RLNGjjzXGwKI
         jzwYXG4zcNP/vC1nPVBhi6awu7HTa8GA6rwKMdisam2O5Od5u3DAVnurAqpSTOGp+KdW
         n+O5xEwAU/Klnvap5nHTwbiy2Gu3exUpEYqEzELe77E7WBJ+BJ+4jL8XTY3yEyd2bsrM
         MsbH3tozOpEeI2E3Laa6LmuVlqcMU3gFxInrWr4pWYYlu+CPpwOv+S24AThmEHp5hsIL
         crTLDp2meHNbiLBx/T5Eb0WfmbjJdFMfOPZCS0EeQikV3fMfhLU70VXCe+z0Gjf5jbZY
         WuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764918917; x=1765523717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=;
        b=isUcbFcE9tqSuyqQ3AWfvKqGy8mCsS2ZEMd6J8UP6WFeSmYLKuN97lpGYf5unM9ZA1
         +aFtk164S/PMFaDbLjDPl8yapBGos3ssE8Cvb6EID2iFvpiFh9/qJurnLn0o1SYipk49
         Xt45de0/Ap51NSDAnkpZbOWgh070w0nHnJfrVu4XLuFCeILlaBgqAakluUcXIfzVeFk/
         A75DDRFi0LFMM0bBKGpj/H12CdN+wP7bAoc55eXUmxPgK3bCLssfajso4a6e+gUWN1tc
         Lz00fzORQ5dJaJpl/2gJcfe9pddVSVXEXAbVEeXnjsIoBNamqkUeix/Tyf56VCZNHuZp
         YWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXujIiWtov83DuJ51RW855T5oR4Wj0tv0fOtq85UJ5eSLNJABigleiLuKec3m99MRs9QyulyrjKmZE8zY9gVzf21g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxla2zGWt5Ts/B2jSOHNkv7xbaOCrO7ENzUcr7y1RBQKKSe+wej
	5ItZsaZfHwPsS6ome90G2OZhVSOOd5oD0YNiXHkOAhNvaLUu3G0G+xyJ6Ug6v4zm4AE8BoWzaZ4
	hxOagHd0D1KUVJyQ81nIq4xeZFZpMZhq+qtTj5cQk
X-Gm-Gg: ASbGncsENQFjqT0gnkhw1iH4b5/iflcxPSjxd2HZ/Gmz/PaJ42V6FLvplAM4cwtDKDZ
	T03SgFz/udoj8CQjiz5oi703La77NRx+JyXbLe5kX+anCcJ0iYFDvscaU5ehaV0GFRDA2HjAQR/
	DLXtRd4BySQDOvZ+ulb1QkHqni4Rl7I3PN5OJtvtZr0scyrx6ppoorGpMOaOQUshY6P4xQEwIJF
	sr2yOru0OlR+m3i5Rfuc9425ZXHYAFFuojAcn8Zq9p3/0hTmskpdTdxrmPJQgQhuNZFJPlXgyZj
	MoATwXi/3W4o2zGM2wGXmVVdDFI=
X-Google-Smtp-Source: AGHT+IGT6K0BHHyK+7ApfhiR4AaLaZPBjcT+DuZDOJN2iRJE4JKw2dSIgc9ERTNi77a15Duy+EoIn1JYySe0GVV8zUc=
X-Received: by 2002:a05:7300:5a0d:b0:2a4:3593:c7df with SMTP id
 5a478bee46e88-2ab92ee610bmr5224431eec.31.1764918916332; Thu, 04 Dec 2025
 23:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
In-Reply-To: <2025120553-suffrage-divisive-5890@gregkh>
From: Roy Luo <royluo@google.com>
Date: Thu, 4 Dec 2025 23:14:39 -0800
X-Gm-Features: AWmQ_bkT_bQr6GsRLXiYEii_iEy6B48Me29L8TfZAdXfRwHS8tmUgcF8diylx2U
Message-ID: <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on ARCH_GOOGLE || COMPILE_TEST
>
> There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> work?  Shouldn't tools that check for "invalid config options" trigger
> on this?
>
> thanks,
>
> greg k-h

Hi Greg,

The menuconfig looks like the following and it doesn't complain:
| Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
| Type  : unknown
|
| Symbol: PHY_GOOGLE_USB [=3Dy]
| Type  : tristate
| Defined at drivers/phy/Kconfig:104
|     Prompt: Google Tensor SoC USB PHY driver
|     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]

According to Kconfig documentation [1], the unknown symbol
would simply be evaluated as an "n", which is what we want.
"Convert the symbol into an expression. Boolean and tristate
symbols are simply converted into the respective expression
values. All other symbol types result in =E2=80=98n=E2=80=99."

In a different Kconfig documentation, an environment variable
"KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
undefined symbols in the "config input", but I can't find one that
catches undefined symbols in the Kconfig tree itself.

That is, the tool seems to allow this.
However, if this turns out to be a major problem. I think we
can either:
- Remove ARCH_GOOGLE and leave COMPILE_TEST as
  the only dependency. Then add ARCH_GOOGLE back
  later once it's in the tree.
- Defer the whole patch series until ARCH_GOOGLE is
  present (I hope not).

[1] https://docs.kernel.org/kbuild/kconfig-language.html#menu-dependencies
[2] https://www.kernel.org/doc/Documentation/kbuild/kconfig.rst

Regards,
Roy Luo
