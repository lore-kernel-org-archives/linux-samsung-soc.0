Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962272FFDF2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766002482; cv=none; b=GvcsMq8Ewm5Z54YbFodQ8YOmYkqPhker9UFQoPR6r1RA8T1LBU8MuSoN58yR71bB7RtYY1Hqh/QOt2UdaBjv5zw5wwn1YZjKbmr78IR8XRuWlgWJ89UHDGEDWsKNtqARAMXi+yq+Tg50Jtb+kEQPjRi0yAwr9u0V2iskffrBZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766002482; c=relaxed/simple;
	bh=3ptYz/wLgIC9dYQ1kM92VS/MK6iPLAxyt07DMgLnkfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfCyiMc4GeIcgLYQAhCY/J9pGEtIB7y9McGiszOvKB8z10H9JAxmsASNXhqBgUhekp1zwsWpIy89UBu++w1dub4H98zZTErKQicDzzK6ovfVnJm1wKl86/4/hcASYeuI44h45AAmgmgb32XqwgiLqZYN4CWsz4cDJvfyYptXMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aKTEqYOn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aKTEqYOn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so11000282a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 12:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766002479; x=1766607279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM/V/k/fSUtW462XR6FXOM+8RdQaX18bynBaXcytSDg=;
        b=aKTEqYOn16v1yXOtEhRQyp9zfAxw8+EeFMR87bJq4GJH3bkSi9gAzg9fl/XKpBpxXZ
         3hknlu6XFsmigt4MyCHKYzUfxTuoKORxHdCUxr2cHrWHV+AhyV7Dm1qwPa9JEbVqO3mn
         MV9G2ynpci1CYr2RFhftofUeYj55t+zUKBqqbkAN1RsrJBCkZrruxOpXTgQEv8uqaUmI
         k198pEKyN6h+/xNIcxwOjt6Dk8p+oZqmanvhChtkg/QPNuwlLjgQmIDK3Ja1pyloZf30
         RL6HHwi/CzHlI8cvpprXfyFwxxEzvow0YL8ZoaYrdGN7/+ev1MckCKuJPFn9D1lgRPBV
         Px0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766002479; x=1766607279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tM/V/k/fSUtW462XR6FXOM+8RdQaX18bynBaXcytSDg=;
        b=HSHB135X2cAxSlh/h50ALOGTZkPqgtmslj4Tjn5jsd7YuXvAXyMrsinUs7CJKLmSWz
         oWe2t84DwfFaMmGjT0jCnKlF7bNzek6hP1XywO97N2RYR4qcd2V7t+9eb+L8BgNR0D2G
         e0+YV3F0H+bz83pJD9hLlZqaeTUhStq6v/9cJsbBkvLaKNBO8uOCsHLHyeEQvYnz/gmD
         d4PiMn39YTQmOR0kxlWwqGoDupHpwmUptFVHVAKWwfM6pqRFEyue65oCkCBTrM6uVeD5
         xWjzCKew7zforSQRxZR91kV5wpY1GinVobTeHELRfb+raVX0qml8aftD6oGE0xNyNS1q
         xzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX23ilgUIy+ikNlDyxsH8egXqexAUqQMpHs4eqtoeFkQOlBDgfXJ6gEFiaql+KV184WQ4td6BNMFqptxVsPz6vh+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3NVVmp12AwJFkxMNOEXM/RaY01hf/zWbi3Zqoux0nFVF6jWV
	zPj7ezWaIObFYfHUeccSMjfCvAZgCTXFyqn7VLlz+A8puyzOKvjTkEFE5RUxh/w93goad3tHWaU
	XMQo+llqBonYmrqjRabLn0XMpC9pZCqK/gmJ2wrp0
X-Gm-Gg: AY/fxX4U+n8PPzW9pXb245s+obJq30WvTVeVIrc1vo4nwWVGwjPVTLcFWkObmAcRFT1
	EC4TL5jVWux4XUBhIfRxPAg8UwZ8PzAXOhapWCAeo3DuW1yepSTL9gvBSdBIjc/KCY9ghnd17Gz
	6B23Lo6stRThvFQzJ4jjOZCKYJSsUsSFNOJJwRIdA/Ko/EOE06EqVDearkXENktl6BY5b8cq44o
	LodnBXCZ8ktrzAbeY4qaAwMHVjkV2ItGVGPLGmJw5DFV01udlf0pVMSS2u+YKgr2JorzSoh1Jg7
	byuPmDzCK6vOekt92DR9Nf2wzQ==
X-Google-Smtp-Source: AGHT+IG4PFt6/xl6TY17qdZDo/fSC5jvUriMDmtoPhK6WjCwoIZvzT7uFwVBMWf3+gIeet+IH6pEPp4HA0evjsAE9aQ=
X-Received: by 2002:a17:907:96a6:b0:b79:d152:566a with SMTP id
 a640c23a62f3a-b7d236ca22emr1906214666b.28.1766002478506; Wed, 17 Dec 2025
 12:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh> <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
In-Reply-To: <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 17 Dec 2025 12:14:25 -0800
X-Gm-Features: AQt7F2r-ws7J5EyDz0pvtMEQpxK_o2RQbdVkWKJTgzdUasSvuVkdkxrUDLQsMMI
Message-ID: <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Roy Luo <royluo@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 17, 2025 at 11:18=E2=80=AFAM Roy Luo <royluo@google.com> wrote:
>
> On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> > > On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > > +config USB_DWC3_GOOGLE
> > > > > +     tristate "Google Platform"
> > > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > > >
> > > > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > > > work?  Shouldn't tools that check for "invalid config options" trig=
ger
> > > > on this?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Hi Greg,
> > >
> > > The menuconfig looks like the following and it doesn't complain:
> > > | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> > > | Type  : unknown
> > > |
> > > | Symbol: PHY_GOOGLE_USB [=3Dy]
> > > | Type  : tristate
> > > | Defined at drivers/phy/Kconfig:104
> > > |     Prompt: Google Tensor SoC USB PHY driver
> > > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> > >
> > > According to Kconfig documentation [1], the unknown symbol
> > > would simply be evaluated as an "n", which is what we want.
> > > "Convert the symbol into an expression. Boolean and tristate
> > > symbols are simply converted into the respective expression
> > > values. All other symbol types result in =E2=80=98n=E2=80=99."
> > >
> > > In a different Kconfig documentation, an environment variable
> > > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > > undefined symbols in the "config input", but I can't find one that
> > > catches undefined symbols in the Kconfig tree itself.
> > >
> > > That is, the tool seems to allow this.
> > > However, if this turns out to be a major problem. I think we
> > > can either:
> > > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> > >   the only dependency. Then add ARCH_GOOGLE back
> > >   later once it's in the tree.
> >
> > Please do this.  I do not want to take patches that purposfully add
> > dependencies on config options that might, or might not, appear in the
> > future.  Please just remove all of the dependancies for now, as they ar=
e
> > not needed, right?
> >
> > thanks,
> >
> > greg k-h
>
> Greg,
>
> Yes, we can remove ARCH_GOOGLE for now.
> To clarify, we're not removing all of the dependencies, we still want
> to keep COMPILE_TEST for build tests, right?
> Please let me know if you think otherwise.

I think you'd just remove all of them. Normally COMPILE_TEST just
allows folks to compile stuff even when they don't want the ARCH. We
can can add ARCH_GOOGLE back in later once the config exists.

-Doug
