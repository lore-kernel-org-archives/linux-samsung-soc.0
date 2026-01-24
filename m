Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80ED86329
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Jan 2026 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769237535; cv=none; b=Sj2AWxggxEo8PFaERsVt5DB32LRzWiLrvgyClMAnu8FwANkVyI5WONDOXe8HA5L57CJuAGfOiT1yFPpz29PF9LJNcOhJ5n/I1svtRiwQ/J3/v7z8Z4qDoy51pc/oflS45QGDrNO1+BF1uVq4FZF8P6jIp2w/+ZLmW7kiJHiK8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769237535; c=relaxed/simple;
	bh=KkIWaqEHvViGcgC+2kqW7/inf40Itk/ZRb2srHuSmpo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ud9S7y3FgfA/JYtmTN8xquuD0pwr6TQbeLs4ginz6DGeuA5IrFPNOr7brSTata4iryPwH9YGOOZcVuuGzrN8sXmd2/76S5TpfEEzBRpmLSXs3tCRF5/RSZUhJ4lEi3MmyrSir7psVZEHJkagQnCfskYvvhA1by7tWeC0joBqjmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D32upSKf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D32upSKf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso24232705e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2026 22:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769237532; x=1769842332; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KkIWaqEHvViGcgC+2kqW7/inf40Itk/ZRb2srHuSmpo=;
        b=D32upSKfTG8iW7hsnlLxkLoXRuX72I38hPKHEGa0yGgwrAa5W3d+DTlC7ReIh8B9U+
         1UM+eiSAOvnmGbbbdZ+O75hZLjXV0C5GpGZLCX6R7c/oRfFXaIYJ3jg1TFLsApSzX9lQ
         9Yh2s9RNQh9f7I9gQhI2vAGgYMtrA4OiS8ND/p+Q93FnVO8bXvX1sdOFKHUPgvsfn+MB
         OKuME7h/KNodwG3RaDidyZXOOSycqp619SNQdBWU72sxDXpCLf5Z6mxMM6zESrfj6vpv
         IF3tKIdC0YTX0CbLmJzsKCZl+ol2Q64/VXDmKmxeGbgd5RSVLMuNeVknD+Ft1Wz/l371
         BEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769237532; x=1769842332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkIWaqEHvViGcgC+2kqW7/inf40Itk/ZRb2srHuSmpo=;
        b=eRlVE2mLRvkM6jVinqC78jlPef9vtbzipIFNCwKhi59Gtl3knwnNl3q5ACC1PNeepb
         CmoOAOE/WGl1CLukrykgf53heVnEBgGoIuo9n5NPfHU3k4sGR3uOPEvzF29PYG3Q2cRu
         IUwFgVbwuU2JJOyC0/nTaxCwIp+ZqRAc3qDml5fKzMxj6GqTTl+z/fU9eNFBkvWH63CA
         Z5QPZ6I+JbuiiX1HfRYqpKNoZ/JoekHMazVN1yoCpVDxppbky7iIJ0cqnk+cWk9zd75U
         43TVhGcf4iqRESyDelKtAW07QqbiW2KLSrBszPQn2N9+lji+3hm4qjarBkX/OFEIwNiw
         C0LA==
X-Forwarded-Encrypted: i=1; AJvYcCWH5JB7owrbCrQVfvGPrVb1SoMtwYnMz9VBRBwYG1pjhybGLdwSbz6kuHiqlMBsmTFEOZ+JkDTXxL5bkP76dFzRjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytK0tjo0mstxw4IxOPGF3CpIIVihrRz50/BUFJErjo9f0aNUAa
	pTMBXELhhxx/R0/f97K/Ld+yMm0SkkhWsnGDAEFhRCxOoIWxghF9WtmRGxOnlgFZHSI=
X-Gm-Gg: AZuq6aLgnjTDatTQytmqBq6uGpgUoUlsev2J93tyOp72SoW3+WZ6jHyYutkHCuuhmVo
	Nd4z/YlPXm0uaJkb7qUDTN57gs9RPDbeUGcQ0cDo6epjCYdbXJ2xmJenbYR0M61Oja8wC+rr5bq
	icwjitpkV7eSoR2+I0wUeTazyQNCYVdhsq4WdUzRQUdNNJD1NkvfBQqm2pGhPSDYpRyOx0rJt8t
	wAjPTYS7uiOEYODBOMKjJgJE3b6gaDFsbTgUVdOJdCNRbN7UKfcH0bP51KZOdbfPWOIxI3+bSiE
	2hjtS+Zs/HcOI3+ykhYppbbV95gVTnFI1FE34VBu+sWF0AoJxuaCcSofQbSvVeAT8M0QxMPwjag
	NWcJBZXuFisQQuLfGrkYmRhcXrCTqBaEPj0oAJgCEk+XFBVxvs18+zn4ka0FYJtOFDeWCw7YGCV
	Q0MjS90h1lebQws5y3Sg==
X-Received: by 2002:a05:600c:45ca:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4804d2b151emr92947725e9.2.1769237532137;
        Fri, 23 Jan 2026 22:52:12 -0800 (PST)
Received: from draszik.lan ([212.129.87.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d84588fsm107102385e9.2.2026.01.23.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:52:11 -0800 (PST)
Message-ID: <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty	
 <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot	 <lkp@intel.com>
Date: Sat, 24 Jan 2026 06:52:14 +0000
In-Reply-To: <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
	 <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
	 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
	 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
	 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Roy,

On Fri, 2026-01-23 at 15:51 -0800, Roy Luo wrote:
> On Thu, Jan 22, 2026 at 10:28=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszi=
k@linaro.org> wrote:
> >=20
> >=20
> > COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
> > compile tested even if the current build doesn't enable whatever
> > option (like TYPEC).
> >=20
> > See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-language=
.html#compile-testing
>=20
> "If a config symbol has a dependency, but the code controlled by the
> config symbol can still be compiled if the dependency is not met",
> TYPEC doesn't fall into this category as it's mandatory for compiling
> PHY_GOOGLE_USB.
> With "depends on TYPEC || COMPILE_TEST", this very build error
> would resurface when TYPEC=3Dn, COMPILE_TEST=3Dy and
> PHY_GOOGLE_USB=3Dy. Please let me know if I missed anything.

No it wouldn't. If you look at the build log & .config from the reported=C2=
=A0
failure, the error was because:

CONFIG_PHY_GOOGLE_USB=3Dy
CONFIG_TYPEC=3Dm

built-in code can not link against code from a module.

The typec APIs are all stubbed out when TYPEC=3Dn.

Cheers,
Andre'



>=20
> Thanks,
> Roy
>=20
> >=20
> > Cheers,
> > Andre'
> >=20
> >=20
> > >=20
> > > [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJ=
PhJ16xExgko7Dw@mail.gmail.com/
> > >=20
> > > Regards,
> > > Roy
