Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C077262B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999093; cv=none; b=oKtg0hwFazgrlaI3hOnQA4HpZoxX982ep7hbEANOZC52Gxb7WP4MiXqdJxBn6NKrHhYuj7sI0U+2bP9UP0CceW1ID3M7GmsZFJIGecH7qYJpLcMDTtw4PLa52tRK67mD+WZVQLklGEUTZTIkn27vnTcBIg0Or4pi7ZAvwsLuNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999093; c=relaxed/simple;
	bh=sNs96snLpe2mrQ+PhaRwK1nZjmBa7OCxvHBdhl9wWQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjMIn0b/zXLr/8L/SNEFA/duOVjCIASaTMxmcIY3JAJF1gJTs6idNsyFDPHBQCprikzIO5uEzoMWpACvfLMwqI1scVcceVxpk++xQq1DeG3WcqKdJWHbDDdLlKQx+QM5RlhK+pTrTI2WjXmW1HaL7OAziahZW+Cv3bYzIJ9Y0Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDmwZyIk; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDmwZyIk"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4416394b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 11:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765999091; x=1766603891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=;
        b=qDmwZyIkFAWJBsfp9bORBpVBSb2lVPoY6gDukgqBvR5JYi5CA1PHIkWR4AtukWBuWg
         j/ewA6Nc1ydzcxwUPGquVLXJmUjsFUb6uBnAE/ZCQRcEzuukCgEcxyplExxEQimHPM63
         QphRgWHtqNe0N4sBtosqFONdv/ET4O3RN93Aw1SWjEj06+tvk4V2ypCNlfjRe4Wv1+OH
         cG+K5dGJRgDyhnQVcBqEkBAnFzSaKU62b+WCiA3fQZOIIo5zvWViAt4NrqhxjerxlN8Y
         vxrx9dwoXFnAOzjskP3tuF72GBQZhxnGpkU+KJRNdFPRkD/SPAmp1spW3Hv2oxMVWpMY
         Zzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765999091; x=1766603891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=;
        b=VQQrlO2tRUI6Wffv1N8/S9ue9JR4hSiwEPxhq26qlx9g3L3qX54q5vOkssTerc4HuN
         20XH5eK5OIficfsGz+icG8IcRWusskrK41K85hGz3+5IoXlT9HiHfFWlKzEi85XrTN5/
         pAktWbTZrapm+GgSxt5AS1WN6OLnchrZGyJX5OgMX2YbyAurgIAXce7n6AyYiT4m2rCf
         aHveNaPl9faawUYoPF/bmutW7qmtLmqzB2kGvmO4iVNSO4qiKlE/VFRUNgAhd2AYDxDw
         phgJhSXpOnRy9VWRQ38uDxyaYilihdOyo7YNjmyOUCZEZDyL7eL3oY5A0Ra6Z7ybMpWa
         Mf+g==
X-Forwarded-Encrypted: i=1; AJvYcCXoRBfNf6fgjySbLzugIYJFRsVtSvmO0EjQZ1fSB0UDfBg9WLpDNch4zhFsm3tICuNA/FMYuPPVJUX94Rax/g7ELw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5bt0joERrNkNX85sz5Cu7nFbVrCXN+A5f+ErL6dNkp22G7FZ
	qCSp87VEBhXeTP0m4hixKOdusfdanQY61/mH9u6W2ivHn0m8x5VkGWSvTtcnUa8HfF1nJt38cJt
	D/qhmvSyEbPS5oH4aj4SyNnaq8rIKj/r4wzKQhfys
X-Gm-Gg: AY/fxX542c6g0G8nTDsJ6RI0gxtKkkE2jkX0W1QMtfNShKfVY8bL0ReElIN1TvzYVtp
	QPF6h5h6kPKdhwNK6tx/VKnSw6EMy/tXtyD1t8f/sbXF/ivVjTbZwlyPzOscwzbOh5UptMUjFi2
	HCQTwXP/aKD4ZY68qKYchpKyZzl3b5XWWJACdxdDaZEs8+sepUZPFLe4E5slishoi8d2BLFP1cE
	fKr0MpCCjoJyzjjPXO83jpcbtSXBgneOgL4V0agC3H0NRcQS1Eulj8qywHx7FU8JSPhr4zh21ER
	gl/gJKN06I67BnsnySegt8K5gg==
X-Google-Smtp-Source: AGHT+IHU2vpetQSDEWGYm+Y16+Q+hMrDA20ASiwjGw22PJF4oOT0FZWKdk6jDg2jAFGB5cCqYCpdKNR8qXBpSDUqoaU=
X-Received: by 2002:a05:7022:7e09:b0:11b:a892:80a5 with SMTP id
 a92af1059eb24-11f349c5953mr12769514c88.13.1765999090603; Wed, 17 Dec 2025
 11:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com> <2025121728-reliably-crabgrass-2601@gregkh>
In-Reply-To: <2025121728-reliably-crabgrass-2601@gregkh>
From: Roy Luo <royluo@google.com>
Date: Wed, 17 Dec 2025 11:17:34 -0800
X-Gm-Features: AQt7F2pRcbJChuQijr6nIYQ6eCnDyo-nRUDl_79j5YJBIy8PmN9l851-QlzkUmI
Message-ID: <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
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

On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> > On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > +config USB_DWC3_GOOGLE
> > > > +     tristate "Google Platform"
> > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > >
> > > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > > work?  Shouldn't tools that check for "invalid config options" trigge=
r
> > > on this?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > The menuconfig looks like the following and it doesn't complain:
> > | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> > | Type  : unknown
> > |
> > | Symbol: PHY_GOOGLE_USB [=3Dy]
> > | Type  : tristate
> > | Defined at drivers/phy/Kconfig:104
> > |     Prompt: Google Tensor SoC USB PHY driver
> > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> >
> > According to Kconfig documentation [1], the unknown symbol
> > would simply be evaluated as an "n", which is what we want.
> > "Convert the symbol into an expression. Boolean and tristate
> > symbols are simply converted into the respective expression
> > values. All other symbol types result in =E2=80=98n=E2=80=99."
> >
> > In a different Kconfig documentation, an environment variable
> > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > undefined symbols in the "config input", but I can't find one that
> > catches undefined symbols in the Kconfig tree itself.
> >
> > That is, the tool seems to allow this.
> > However, if this turns out to be a major problem. I think we
> > can either:
> > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> >   the only dependency. Then add ARCH_GOOGLE back
> >   later once it's in the tree.
>
> Please do this.  I do not want to take patches that purposfully add
> dependencies on config options that might, or might not, appear in the
> future.  Please just remove all of the dependancies for now, as they are
> not needed, right?
>
> thanks,
>
> greg k-h

Greg,

Yes, we can remove ARCH_GOOGLE for now.
To clarify, we're not removing all of the dependencies, we still want
to keep COMPILE_TEST for build tests, right?
Please let me know if you think otherwise.

Thanks,
Roy
