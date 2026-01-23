Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25707361DAB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769149738; cv=none; b=CzqPFNEQCvvmfqq14GhIsbQcg2r/4gud1uLb0ZowbcymQK5hl7Y++JVtcs/22C9aYS6m/v7I9a7mi/PENPXlCH1senIsR2O/lDDswqqju3WKQz0qNSYF2NwkUAQ1/gxTjxHwO0dZqzytdihkEYCjaM5Ljh9yJRy2HHiHl+DGKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769149738; c=relaxed/simple;
	bh=3jT9NZUzEXDkXmWjrnYYCDqk40FJEePHa/GTVTCRXgM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ork/ffxuIkYgQTYTmm9eERntgG2aUGfyT1Dbh/hjglvRNY4jRQEI461r+HWMTp38THWviTk1G6dzyvKYH/ZbknXI69B22JaNxC2bQg2Eul8ChMN8LuYEZw3xuKuZ1yyyexTuvwJ+xdqCUA/Ehkf7+hr1zkg6NNSo0p4EuKQFfkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szwwqKJf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szwwqKJf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1144181f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 22:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769149724; x=1769754524; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jT9NZUzEXDkXmWjrnYYCDqk40FJEePHa/GTVTCRXgM=;
        b=szwwqKJfB7EADU3P1N6Ix7rJz7KBp8Djq7U6rWZQv42tCQTJrQFjKTJL/m+JwtJ3sn
         HL4j3SQK4lA+arJTFEU/Vu4av5EJQ7YSWhDoLhcCT5w/s63GzAyxHy9NbkBZQoQos0wb
         dldkQ7FdGgSHpJrC92j2pIp/A36HpLmj8X2MIfMlGU2y9f0ZcrSurj2QtSR61Ao7yoy0
         QklVMRR0zLHCvodLHDpKdCFD3Y4RD4fdDsvsqVcZvPh8Ip1Yz+eXoTaitYJfi80XJA2/
         ec+lreNqxvalC8VRPVTFXEP74n9L2Txy4pKvH0/L73fJWVjHTho0NUpJQRFkG+Y1W9J8
         hj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769149724; x=1769754524;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jT9NZUzEXDkXmWjrnYYCDqk40FJEePHa/GTVTCRXgM=;
        b=PidvUbvCjx1Zz51obZkCVwDxI8hCCjTs1VOVFOJcONRrrsY8Dp58aTX+o095WwzRq9
         6hmO/1sz01gV4wfidF7BfnTV5P2Y9gjacNcjR5Y8FsRmaCS/JGJz9woDLUwrFXarRliG
         NK0z8Kcj2I4cqUXVuRWe3D0TTpsG4QlMtM4Q4zvpIH6Voi4OtO1w7r9eZdyRX4mVzwLc
         TmPTvtPQws8fD8JhtvMaWQuO3+1JI/rQawUUsjnW7d5IkuhNeRfbc4WXuNllajnkhEIy
         30Cg8peaiQYYeR62aGdwL0HUkX21ubpoIJtDcgCaF+kRlAdbSwpRJpwyTtrvTHsaZp7y
         ipog==
X-Forwarded-Encrypted: i=1; AJvYcCXpiRD1Avd4pt/VznUrjgNE3PMbFWZk5p3IOfheYYv90A3xXruHuhbwpS75xaSLFS5buFZxCo6OPiQ641ZO9rsrBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zDwHiRejB/rLNNEi4aYCQOEEWkGkOf7jF/FSW5OcCScfqlIV
	rqG8F1QceccovPIcxjYwPULRhJWAv1+y8qsNzYZ7HJYxF3Z2p/8aur4jvhDef9qfCJU=
X-Gm-Gg: AZuq6aJmXXpAGucwD0Fmaqd3u3g0in0xmdJdcNEK1dB4RWiv9yO/qbKBnzwNjZxaTAU
	cAiO+NEjdAGky72fNuTN0wSHV0HB+tf+Fp3iVzruNNp/hl9HproiHjeVOIEz6AJox6P5oCCYSHu
	xb/OGVMmp0vd8EqgFfJAqj1y+PqVNGyr2GopzaOfQ6ZjVf0Jnlr/FJEbknmDs/1+lcnNXM9pcc4
	nejIbg44g9khbheSdW094riP4W1ksahD9Jvf7qu/u/v54tQBN9Fg5+LGCohE2wsTUMHUms3mCed
	pQ0f8EW39fKByrpJ36oVBK6yevgovQ3S67EKT/1dBQqqzTpYkrCTMPgrRWymSGh4TUnjmOUTVGm
	iqlMaGxIf1lY4/eNhtRFVVy9W2dMiiqtt+xY0BJWttkjl3hrMGgWdmiiDY+z08+Z4PFRn3osNLC
	2Bo8dH3PbRNVYNdAoJCg==
X-Received: by 2002:a05:6000:2c08:b0:435:9522:2bc9 with SMTP id ffacd0b85a97d-435b15bd97fmr3431523f8f.5.1769149723683;
        Thu, 22 Jan 2026 22:28:43 -0800 (PST)
Received: from draszik.lan ([212.129.79.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74b15sm4214449f8f.35.2026.01.22.22.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:28:43 -0800 (PST)
Message-ID: <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
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
Date: Fri, 23 Jan 2026 06:28:44 +0000
In-Reply-To: <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
	 <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
	 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
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

On Thu, 2026-01-22 at 11:00 -0800, Roy Luo wrote:
> On Thu, Jan 22, 2026 at 2:39=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > Hi Roy,
> >=20
> > On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> > > The Google Tensor USB PHY driver uses the Type-C switch framework to
> > > handle orientation changes. However, the Kconfig did not specify a
> > > dependency on the TYPEC framework, leading to undefined reference
> > > errors when building for architectures or configurations where
> > > CONFIG_TYPEC is disabled or configured as a module.
> > >=20
> > > Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> > > required symbols are available during linking.
> > >=20
> > > Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-l=
kp@intel.com/
> > > Signed-off-by: Roy Luo <royluo@google.com>
> > > ---
> > > =C2=A0drivers/phy/Kconfig | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > > index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32=
e3e52d4a57b26a62d8d 100644
> > > --- a/drivers/phy/Kconfig
> > > +++ b/drivers/phy/Kconfig
> > > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> > >=20
> > > =C2=A0config PHY_GOOGLE_USB
> > > =C2=A0 tristate "Google Tensor SoC USB PHY driver"
> > > + depends on TYPEC
> >=20
> > Can you make this
> >=20
> > depends on TYPEC || COMPILE_TEST
> >=20
> > to allow some better test coverage?
> >=20
> > Cheers,
> > Andre
>=20
> Hi Andre,
>=20
> Whether to add COMPILE_TEST for build coverage was discussed in
> another thread [1]. My takeaway from that discussion is that
> COMPILE_TEST is intended to substitute for ARCH_XXX in build
> testing and should not be used without it. Once ARCH_GOOGLE is
> present, we can add "depends on (ARCH_GOOGLE || COMPILTE_TEST)".

COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
compile tested even if the current build doesn't enable whatever
option (like TYPEC).

See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.htm=
l#compile-testing

Cheers,
Andre'


>=20
> [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPhJ1=
6xExgko7Dw@mail.gmail.com/
>=20
> Regards,
> Roy
