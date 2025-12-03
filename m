Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634EA238C1F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Dec 2025 03:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764731136; cv=none; b=Dz1sU68RbsJSttIHF5kvNKbDFNGlt9OcAK8r2r2vtNm1U32/fnDJpcd/pj6wkf8IL2kaoZvCf5cG4I3MJRxN8ZSHRRiJbZ2rGnJNou4LZoqSjqNxfKW/0S1Cl7CqM9v4toulzWVJl1tjL3FYj7+jn/QJkekVqQVh+b73EFRVrjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764731136; c=relaxed/simple;
	bh=meSucs6aX2A4XVy1F+K5x4iZpmFlAAKDNrrl/ysjrUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrkluWbtJoMBuUa7dDcRlBURCyhwWWH/8SfjliXu6524iP22qs/1ynz1M3xmm4aMgxGWTXo1eNKufwz8lt60dr+oNFHy7dCB/eCyQ16dlIKhjoNVsBYahBhrrAmq8ATEJ1NoyMuHUhfWCDJPzUmMDSBrntaaoSJTCgJ1y9y1xE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=srPfPMyp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="srPfPMyp"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so7577707b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Dec 2025 19:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764731134; x=1765335934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=;
        b=srPfPMypRXCwgorf23xZa8c9/teEl76WXXtxLaE7aOwS4eq98l3mX6EFsPzf/vXuBo
         d8W/ttOZ3EIX7rN6kkv769aXksjhwBtIGUoYBquOP85o61wciDBptGjjSQSrSIgnYP0L
         QNamnoX4u1oBMRNxaSXXfcZFL4ea5cza15venFMqQENMn3btFTeF4jDWshHwPHj87TYI
         aQt2E/uZ/hFsJ/pG5KxiOEH2hgY3YYS4wVfBs+gpF7xa7IQYmi547d8kXWvzKPJZ8pKI
         +QJ0fonWDgbUE6/nNPhpq2I2LxebKR18SL7nTbCu6EC2/ICP7TYKxe0mpwvOMdGYS8j0
         6RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764731134; x=1765335934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=;
        b=f+ghPb+pVK2NxrW3VY9SPnl3SI8vs39mPKOGGYWY07b3eB5WdanabomvXNJRp0ZA55
         1nZtan9higBCRP2lnPPCno5jExzjx0+B8/pQmbXEQ9G3fLXXGmXXKNBFRLkF4/MzlObP
         0hLkmd18PfkFbccDIn6yvip4L8aexwvDcxejuTCG31ws/m+cXuayKOgpPc0U3cDBukGu
         uOdOIgZtTvm/Vu7CsMaX1txpp0UH1Hr5PUzZVh1Qvufux7ReBKTgmX8bMKPEtHoFyLTt
         wWY5IxdQPb7qdPdKw2qxbdoIGSwyJzCUl1K9Osxc3UV64XRJgG2qzDIPISY/7M9XwHaQ
         hn4A==
X-Forwarded-Encrypted: i=1; AJvYcCWPANAo8xvD1KBlvfscjS2VTKOrh46ecyA5EaiEEd99JqkwgEpp0lGXmdhPXvLfjriSuF4vyvbLVfgSxBndg8mETg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy353qvDDpKB1VXhNpt3YJ+iicmTRet+z6dC4qvQQ3NIloWGWqY
	HEzZqvuXEOQHoaycLdzbOvtmXVWbXTKO7z1uKiiBjqXPMIuFZYfvBSSHEjFNuW95AiBKXVNQF6+
	0UIbtVyT4GS/wx56FgnjQtLzYrdtP9xvAhIqOuzvX
X-Gm-Gg: ASbGnctkzZy1jYNqET73jmHCDqwUarHdhz5CwxMRD8yPCktEP28dzmSddhsBdG9ioPl
	+AbEmIKbT5idSUBLOjvgZwsW+KBJCxfFZM/mqh5b7ZgYDkrl2NFce6sxzgXbGAMc/4/NKzbIAmm
	nvPMxhBliEhINaSP/p8GZ4Gixb0W14DeQyWPi2TQ/ZcT3QzRXKD1jCX+dOAFPtG+Vw7FVteBTey
	IcOzgR0bXArgX5PlMeAm1vl8jVLUUje1F77SJHzpmL2vba/PwdaaDFiM3HwNnUwLTMnMqxkSNSc
	xgKOIQ==
X-Google-Smtp-Source: AGHT+IEaw/KAaB9NQPn92QcJbyFAkEiHxEvdc+JFEc5o3oBuUZIzccLg55YH3cTE7CxVtrjUj9n7SYHTGXfIZWZDfhI=
X-Received: by 2002:a05:7022:1b0f:b0:119:e569:fba0 with SMTP id
 a92af1059eb24-11df0bee281mr624917c88.15.1764731133682; Tue, 02 Dec 2025
 19:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
 <2025120209-unstylish-john-2a6c@gregkh> <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
 <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
In-Reply-To: <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 3 Dec 2025 11:04:56 +0800
X-Gm-Features: AWmQ_bnH8zw5DfDwDs1QuKD2A0QWVUVTK2D542APdmuEtTsd_99YivSDqmKY8X8
Message-ID: <CA+zupgwiJmS9+MFt8F02HrPkRYPDidjg9dxNUJxd8d_0RM6cww@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Doug Anderson <dianders@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Tue, Dec 2, 2025 at 1:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > >> I plan to add ARCH_GOOGLE as a dependency in the next
> > >> version per [1], so the "depends on" would probably look like
> > >> the following per your suggestion:
> > >
> > > But "Google" is not an arch :(
> > >
> > > And really, the whole "only have a sub-arch symbol" is something that
> > > personally, I think is totally wrong and prevents kernel images from
> > > being built for more than one "arch".  As an example, the Android GKI
> >
> > Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
> > case. ARCH_FOO in this context is SoC platform, so e.g.
> > arch/arm64/boot/dts/FOO/.
> >
> > All of ARCH_FOO build into one image and that's recommended way to limi=
t
> > unnecessary drivers.
> >
> > It's just confusing naming for whatever reason.
> >
> > > kernel has to support more than one of these, so what does putting th=
is
> > > behind a symbol that no one will actually use mean anything?  Android
> > > will never be only building a ARCH_GOOGLE kernel.
> >
> > But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
> > ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more=
.
> >
> > We had this talk in the past. The point is that these drivers here are
> > unusable outside of that hardware platform, so only when you choose
> > hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be abl=
e
> > to choose these drivers.
> >
> > You can also look at ARCH_FOO a bit orthogonal to actual kernel
> > architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. Th=
e
> > drivers should be available for all Exynos-platforms, regardless whethe=
r
> > this is arm32 or arm64.
>
> FWIW I don't feel strongly about the ARCH_XYZ Kconfig settings, but
> I'd tend to agree with Krzysztof that I personally find them useful.
> Sure, it's fine to just turn all of the ARCH_XYZ values on and they
> shouldn't conflict with each other, but it provides an easy way for
> someone to know that certain drivers are only useful if the kernel
> you're building supports a given arch. If I'm building a kernel that
> doesn't need to support any Qualcomm boards, for instance, I can just
> turn that arch off and I don't even need to think about all of the
> Qualcomm-related config options.
>
> FWIW, if you do add a "depend" on ARCH_GOOGLE you should mention
> somewhere (maybe "after the cut" in your patch) that ARCH_GOOGLE
> doesn't exist yet. It should eventually exist when some version of
> this patch lands:
>
> https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e098393=
0a1f1395814@changeid/
>
> ...but it's not there yet. ;-)
>
> -Doug

Hi all,

I appreciate the detailed discussion regarding Kconfig dependencies.
Based on all the feedback, I'll make the following adjustments:
- I will update the Kconfig dependency to depends on
  ARCH_GOOGLE || COMPILE_TEST and drop the other
  dependencies on OF && COMMON_CLK && RESET_CONTROLLER
  as suggested by Krzysztof. This should also address the build
  coverage concern from Greg.
- As Doug pointed out, the ARCH_GOOGLE Kconfig option does
  not exist... yet. I will add a note about this in the next version.

Thank you all again for helping me improve this patch.
I will send out a new version with these changes soon.

Regards,
Roy Luo
