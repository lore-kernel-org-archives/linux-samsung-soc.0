Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06538BDCD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108471; cv=pass; b=STEMZwbtaMWfe5IJ0iv2G52lD6IK6XHkibiY2FXkb36oZUwfcKHQNfOMzVbErOJdNecHoKQhJ3jHRvweXySRYpc2Mt7yWdJq13QUcKHjxf7n6vVtDfDVBqhmT+NrbBZAWko6OitYSDYHsp08fzaDRL2po8hbLdAJi+wpQXearUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108471; c=relaxed/simple;
	bh=0Ixmi6jpGsybrDGlXPUGAtnqkUlMJZ3W/82Th6rNtvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUcSzxjBE4kFYwYaGu4qM7L2n8jkk9xTMxoJXznj3J/kfSXBW6TpRDVEqCaRiNQ+0gVVcEhMI1eYfz7OAk3+x68R4SOF7qQ+nLsdbS4jpItbxQiSsoYPE0vd71mWBbgYpHw0eNwMnfkYN/01qgXPB6yxvfZ009NykJ4bfHICyp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g30oPYGZ; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g30oPYGZ"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f36012fb2so2283183c88.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 11:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769108439; cv=none;
        d=google.com; s=arc-20240605;
        b=kkMMlZVBdDj0UAzpuJ22l2l5yZ9tmzixLWXmejBCIbPMTsRNpGcNQl3COI4D0G3arH
         oOFyjPqmU3hGGMIUO8eV08zoDKZAj5/1OczDfwbLqBDloQY1Iel5tHDsPStfJFHaDts9
         ANlJV9mU4m6NpsENiE4h6Ifwj4UN2d+z4YCHMVHMf+VPJItFc935X7qU7/Hdzqk2k4N9
         lzX17EkVPEj5jaSPBgwiDmloCi2EVVV3uJk42O87P5u2px+eBhpdhNFw8hPVb328CBbs
         lczBbz+Mrk8RuONcoT/hoNIhljzdGLm5sDCqffeWUSqn6hTokWaPlaqh7Eil2Tf4Hp9w
         jhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=;
        fh=HTRCSLDedSuEDJ+8/dpZiZwEeWhoaf31UBZY6uSyGic=;
        b=EhM18+ndxqvnDr42onundBLNLLJAI/079F5CtzDpCaeOEv5Cn92yc6AGPQea3K/dH8
         LJF7EryfR3HKeXNvRhj4y4dCMipstxPJvpoF2C2Ec1kDcR21VQF344uz5YKkImSm57MK
         id9Qy2xL/WLBQ4MTis+c2MNQqYGS3qtELuiTDgkdH6AtwUZQdpAe2mgWpTflxG6pNj76
         hfOcuzBT8gpF0q29iVnM0IpgS19QakY1nytZvANTMbtAKY1cgB0cgtTWSSrvi99dVSth
         V/slAnVfAEQ7MiW374kLQwmfb5KDnW+0vZTpaX/xAPKdtwYEtdiT47PHXLqqmgiXf0lf
         puDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769108439; x=1769713239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=;
        b=g30oPYGZMxeThsamhtMa6pHxYNsNwy4NLZUr5mREiUkMv+rPo1ZJ8YJVu3iF7dh0wI
         jrdPSK3qakV4Z5Mcd3AoPBWnm+BCovLaiM8zVwF1UKFpFYC6FPnHlohfawE0kghMjbHp
         XKMeBfSdTlalQRDcMm5IWLLptA9juTmIH687Zjwrd0956UedHPoIa2QcmfdonhIg7xaf
         XiBzWnQK1mHAP8Nzg9egUzXaZkuhja5c2rHrByd25nlQj60XIrdFEqH4lbc31jq0/HSG
         X4PLjkn0fp5d4ZHAGBGSdnPaTkRGaQnE9N/JjlUaOOpc46IrG7FdNqhGzGRu0+Vl75aK
         3G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769108439; x=1769713239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=;
        b=CON9gsz5B/MvCxK6Tc+Ee6eUUD2dahLnF2rvWxP4gR7R9+tnepK+vkYK4D5kyjZwTq
         WHNGuc0B2aHo+aQjYHYUeRjq1YTq68yiaahVWJabe08S/8YJNAvyQeJ54mLs+AxNFklI
         KNzspY3F9leRHGXQxLMWpsNwIAHzdrFS2DJZ1fj+Mk/IoqtkrPlh7j07MHXhiKe5/+Pc
         XOsFDgLSdnnPtwdYD6iPqPcI5MU45R8/AltcWGUZl7fGtMn9kdcqXPiIDI00JS52Kb5a
         8mHUFfGfFx0cdmCLQVfQ802sX0Ox5/A5BeWg2DpQxg1PNQbyTWS3rLp54EHXJ1XbhnOs
         lczw==
X-Forwarded-Encrypted: i=1; AJvYcCUcFYfx8QOOFDtm6Cvv60zUi+vU300UM8DyvU1lGEBjLTZ/3t0r35+75A4SOGYPJ6kJV8fJe4cAq6+eOSRNCBxQ2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gC0LdBQmEPmlaJ1ktSNXiaRZ1ps43btKQq5NNmXAja2NJHte
	YeaDeH7g/u20ECYnd/raYkcuraGQyV4zSudBQhfoNwmD2FWuG8ACHs/PalIOm2EqYwfBJHtiGgs
	33GKXneTwLEv7ymZd3buIO9KrmNI85nLmepdb8oMY
X-Gm-Gg: AZuq6aK8AZT7bu9mb4qBuQNtl2q2N1ASv+j38b0R+fUBB7jgnln+Zj3xoHPkZV1R/D0
	HgKsbIAgvFID3z2U3r/tCzqh9frVfBd4+yPqCfXptrXZ72AmKPDHXCXlP4QCa38Xb6TCRfanK2u
	qkbscH61vsxDNlFn+uQ3qZsy88unpEsqk6HAlInP+XUfZjAYQQHJxjgkoyBr9qwNjnKv0BrvIkD
	5Mhdux7QxTPmum1ncqHczBdwoRIPo0xS+zA/SAVpiaATep9GWbgILiOPjSRc/W5YNgHuc0Lxi6j
	k0MfxN9Hj2Uz6YxZ68Xzp9M=
X-Received: by 2002:a05:7022:ea27:b0:123:2d00:1668 with SMTP id
 a92af1059eb24-1247dc1a246mr216084c88.49.1769108438617; Thu, 22 Jan 2026
 11:00:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
In-Reply-To: <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 22 Jan 2026 11:00:02 -0800
X-Gm-Features: AZwV_QgKOjqTrU5RPHxI7qZYQKJOEiYtHxnQrsaa6v2mT5d6PB9OvOkllt6REWk
Message-ID: <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
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

On Thu, Jan 22, 2026 at 2:39=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi Roy,
>
> On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> > The Google Tensor USB PHY driver uses the Type-C switch framework to
> > handle orientation changes. However, the Kconfig did not specify a
> > dependency on the TYPEC framework, leading to undefined reference
> > errors when building for architectures or configurations where
> > CONFIG_TYPEC is disabled or configured as a module.
> >
> > Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> > required symbols are available during linking.
> >
> > Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp=
@intel.com/
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/phy/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3=
e52d4a57b26a62d8d 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> >
> >  config PHY_GOOGLE_USB
> >   tristate "Google Tensor SoC USB PHY driver"
> > + depends on TYPEC
>
> Can you make this
>
> depends on TYPEC || COMPILE_TEST
>
> to allow some better test coverage?
>
> Cheers,
> Andre

Hi Andre,

Whether to add COMPILE_TEST for build coverage was discussed in
another thread [1]. My takeaway from that discussion is that
COMPILE_TEST is intended to substitute for ARCH_XXX in build
testing and should not be used without it. Once ARCH_GOOGLE is
present, we can add "depends on (ARCH_GOOGLE || COMPILTE_TEST)".

[1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPhJ16x=
Exgko7Dw@mail.gmail.com/

Regards,
Roy
