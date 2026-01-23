Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B03226CF1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2026 23:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212315; cv=pass; b=Rv6WHsZ1p23ReUoCm5ZnNSCb1VD5wmJOdP8a7Bg67xxIgHU6MUXNYksQk61r+ikbhGmb5k3VtGab/1Z88hwI+5P4HumDreBHvGysVhXrq/D0IbD0blNfGqmatm2KQsCVcQ3LSb0iMio2Pz2LtlwVKrrm1KsNIK++LbFTSY542xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212315; c=relaxed/simple;
	bh=Fdn+pYcacTZzdcB7bk7NmT0t5Ok3QueHtpJqAoWhN8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUhyMAjk8S9F30IOxz7cINoFqzXCKjPUyGCDtwklpEofzLsyle4QqyHUmom/UGjVhMglx1aabRc+dyzEKIxrrMmnjytzfbiF0VLC9uz5V1LlKonjbMnh0ZlJoes0dduM2OuF3F3DxYWqkjvCv1RyU/FU0p+2JnMiCN+7PVqqBrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V2uzA8i5; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2uzA8i5"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233702afd3so4007099c88.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2026 15:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769212313; cv=none;
        d=google.com; s=arc-20240605;
        b=TW5jp001flwDdhi14nHsNPTblQwhgdsQVAkmGObKYqnVslQ+cf17V3wYXEVD8Ah+JV
         ygnoq7Fwk3xjC1ipWo5hBn71QDb6PMk6KphrNaStzoN6LQMWZ4T9SB7WXCyp4GPuY+Ko
         CXUUj/YhgplnGzNwlSJGdpUhly2ssZUW0lRBZVkSSUFbE8kayPGl6SriLRFJZqUMaZk5
         pSouxFwZEhZG0pIFSESxWgErpmm1eKOxs3Kq+RW1UkHeZ3My5IOriJMPYNl/IPQHJwGl
         PLN1ue6cXVHL8ujwJXSu5eryXOkJWJ4zagnTZdloM6nhJmYws4prLJhONwE06zInFud+
         r2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=;
        fh=x0A/lpykEMd0vaLbWSpIzC0MtTD3ub8AGi889UbK0Yw=;
        b=jvO4AFKpf+hWIvEfD35gqwpYb7JgawroBm2EGEDMB2dqW/M2gxmRt0UISIS3M87Tdf
         aXf4FTpxi5Y099fOZHjHMfr9uYANBg3S7/MLphq2Bt0NuBTplZOeJsME2/B1LgL3v4zZ
         RWFAVkhQgTMHkBUr/GkMSm5OM5RnN8uf+yJ/DV0nT8A3/rbi3b+cNnEWNIec4rBXXrU1
         hb2zbPbkZgby0+Lo418OQ/U2aVAavjlzRiGKnuPCf1/1KtH6iUIC/YsQmbRb2qRBPTEK
         ADNDzFav6CZeuf8A8ecnZCJxG9YZ6Rli66JTo97fogaqAKC6Rx6YXxp82+cIXs+btQl2
         gxAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769212313; x=1769817113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=;
        b=V2uzA8i5cPHA4ZFgZKmr6v0VY25l/Fgh4n4rng2PsEIgtoTbtd7mHewr0QRjPqMFfk
         0iZpCxShGp/CEenp6Ux/yEj/vpSgRbelWfMbWyeTJN963VkibVZJ+uleAmsZtntO3ZUF
         SV8bsRMPog2PKjg0PlAcEIOhgmh/8kMkzFqzPJ0sEL7lUGFVizkXLfsIP/Ib3/lxVfyz
         sumELzGJg+JqFSno6Lyz8jBgPTviErrKjpC37+iaImF1pvxpqt85iVeDWo5VXviRWU/e
         upnCHMjP+UyoinuZuu7pKLANP1ao8NyOXra68x7EY5XMN0bQrWhShXL/0R+COhqsmV9l
         qwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769212313; x=1769817113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMyJR4UL9NXXcbBjQVATLX3KPNH4xZEghdBa9fkK1fE=;
        b=mxDmxPF0JJY0PoLbxGCagLcn/50zT8K/qD+nnr2l7NnYT5hWOlvi68iwAhviurSKRJ
         stb5z9qayMCTgdT0HPk76viSNnDrbCCplT1NEMYXiA29HKdiH5AJndv4xM7hVS+w9mwE
         h7uZN/JoajG6FGCoNk3BFDhRHHJCyExQHNDx/FihoaGCZcdIAMfNCmS3dYhBDRe7Vs1t
         nUe4Nj5heVcBrYfms2573qusHvevLlAbCX6ZtJ+48H7yyN3U0hbHJeNYpl+jVkPl46eZ
         wiutTQQ+9BI3wF9uo3zdADGkBGRXrKaB/Nq4KC+/uyyEzIqWqlfXs7yqB0p9sAXjTQd2
         9TwA==
X-Forwarded-Encrypted: i=1; AJvYcCVYjSq1mlsccyFW6nUFS1q67xYvazfEOzGEr1EUDVKd2IZHEEYLPp+nAvUzHk7rafyk1ZQpG3QF2YOP4xVx5+JdvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5FrRgU7E0J1S0GXrt5UiNeuj4xpOuNXJLgFrFnk97EHuuGGd
	H7kXSlwOs+1+p+qKwOyDmgq4oq8yGjjyOpxDacgiCK4ecAIerWF82cMNTHDXv1S35OZ6IyQXHGy
	OMcEOy3lsdD7elPwFK/jsFAzIphXNbAYHbZTEL0qX
X-Gm-Gg: AZuq6aJt7LEGI6cOthDKzDUWBpWYwn7TJYZqVqDUNKMnXbotqFjVtljuyUpfw8lTq0Y
	Tv3Pfp5J27ajcSf3XailLTkO8zJjIJc5y0gjGwHWH0nvehMzcPXkG0Uxj1jGjxQZulPOl9ahCLY
	wa1kj4wk53jfR30MJB8Buwk9rNjpIlEdeNbwdPTF1zLU0tXnDGoPhGYbuQopDwolIEAvrJJuev1
	c8fh6+r91Xc3zriQbkEqcQgc4wAREmKei15rhZkE5rjkNSLoJDTfq4jPuyyOACzMxMguTN2+s3Q
	OXN+wEjQMRPxGYlgYoF2Wj5CCcEK
X-Received: by 2002:a05:7022:a8e:b0:11b:9386:a38b with SMTP id
 a92af1059eb24-1247dc161e4mr2737254c88.46.1769212312767; Fri, 23 Jan 2026
 15:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com> <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
In-Reply-To: <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 23 Jan 2026 15:51:16 -0800
X-Gm-Features: AZwV_QgoFLO5lJ1lQA8XWJ4HuK52CnYXSZ5eL7UyBrfGdR4s2b17ZCPRTqChT0A
Message-ID: <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 10:28=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Hi Roy,
>
> On Thu, 2026-01-22 at 11:00 -0800, Roy Luo wrote:
> > On Thu, Jan 22, 2026 at 2:39=E2=80=AFAM Andr=C3=A9 Draszik <andre.drasz=
ik@linaro.org> wrote:
> > >
> > > Hi Roy,
> > >
> > > On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> > > > The Google Tensor USB PHY driver uses the Type-C switch framework t=
o
> > > > handle orientation changes. However, the Kconfig did not specify a
> > > > dependency on the TYPEC framework, leading to undefined reference
> > > > errors when building for architectures or configurations where
> > > > CONFIG_TYPEC is disabled or configured as a module.
> > > >
> > > > Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> > > > required symbols are available during linking.
> > > >
> > > > Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED=
-lkp@intel.com/
> > > > Signed-off-by: Roy Luo <royluo@google.com>
> > > > ---
> > > >  drivers/phy/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > > > index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c=
32e3e52d4a57b26a62d8d 100644
> > > > --- a/drivers/phy/Kconfig
> > > > +++ b/drivers/phy/Kconfig
> > > > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> > > >
> > > >  config PHY_GOOGLE_USB
> > > >   tristate "Google Tensor SoC USB PHY driver"
> > > > + depends on TYPEC
> > >
> > > Can you make this
> > >
> > > depends on TYPEC || COMPILE_TEST
> > >
> > > to allow some better test coverage?
> > >
> > > Cheers,
> > > Andre
> >
> > Hi Andre,
> >
> > Whether to add COMPILE_TEST for build coverage was discussed in
> > another thread [1]. My takeaway from that discussion is that
> > COMPILE_TEST is intended to substitute for ARCH_XXX in build
> > testing and should not be used without it. Once ARCH_GOOGLE is
> > present, we can add "depends on (ARCH_GOOGLE || COMPILTE_TEST)".
>
> COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
> compile tested even if the current build doesn't enable whatever
> option (like TYPEC).
>
> See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.h=
tml#compile-testing

"If a config symbol has a dependency, but the code controlled by the
config symbol can still be compiled if the dependency is not met",
TYPEC doesn't fall into this category as it's mandatory for compiling
PHY_GOOGLE_USB.
With "depends on TYPEC || COMPILE_TEST", this very build error
would resurface when TYPEC=3Dn, COMPILE_TEST=3Dy and
PHY_GOOGLE_USB=3Dy. Please let me know if I missed anything.

Thanks,
Roy

>
> Cheers,
> Andre'
>
>
> >
> > [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPh=
J16xExgko7Dw@mail.gmail.com/
> >
> > Regards,
> > Roy
