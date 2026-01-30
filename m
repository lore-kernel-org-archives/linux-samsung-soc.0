Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4870637107E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769751605; cv=none; b=BhT9mi8zJvvUn+5/xhgVWBuykvX2izssNcc4/iz8bgVNOaH7MqcD+KsRPbb4DSrFOW8VwLJ9P+Fu0t131f9pURqFNcQOGHbrM9EKh6LPLf0ybGBLMVOFX1vfpniVdxKVaxsJd6Duc2GMsjCjH5mAGWqKH5yBgWvIpdZLoVrMDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769751605; c=relaxed/simple;
	bh=yIe21WmmCRBGpfamsaPD70rXSAEdEefxukZI/kZ3IRM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OUtnYBpJvMOlbawVZjvbdLSz6Ng/M/7eV+56x2AZCGyYWinBpHb5LCX/2Fg7uHUccODM5p6pr6KI9aocrsV09jO1PTMJGetVzsZCfxbieAjKhQ2AbjZj48VmHY10BKJbJrQCLjhyRc4pkEuFtClkAzgQC/TnTepTT5Pld0XXpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVIw/bUd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVIw/bUd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43591b55727so1505857f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jan 2026 21:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769751602; x=1770356402; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nlTV89wrXWzzojHmqRNsNeMryN5g+8W1Ft/Vshjb7sg=;
        b=WVIw/bUdxqT1oqWpnmRpFYppKxYztU8EyoAnLyfuG7E2LrdIWowtemVyn3USGtFoNA
         1Im3rDfBYSfmaqgxkXz/j8jJNNaCjQgiZg4r4+1nkAElnOsjE2C6C9bEPCkvKvn7J4hk
         JrOi5Ryi7oO0v0b4BJ+MROGirLBryQnT0XeuxfxJmGOh2e48fdBhLZesJMUeDgyblY3k
         khtlZ3Tgdwj3YNpDx1GgyiHU8dB7lxDtvWriSsvyWL4CiE5jdwHHVDzDVFVOLB6YrnYY
         F3dCQkNDW8iwh6Dd+7i2zvevacV1bOEVKj7/9xfbJKCQS+xNJKAFhIgJNkbJ9q7Ocu2p
         ezpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769751602; x=1770356402;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlTV89wrXWzzojHmqRNsNeMryN5g+8W1Ft/Vshjb7sg=;
        b=ChqKcGji89Xv1shk3/dPQtMaRGHSTKQlWlMyH4Eq5/YTxTlYBxouuCwPo6yCZiJ/gU
         lIT5uZGJXkpWKsJG5bxJWE6iuzdrBl9SmnGUr/mMJsU8Cf+rzcgOO48ukwiV8mqpLYyQ
         /j8nEujTkNeotVN9P+qdvcCLg/QOnJRSPXLBY+5eg++/d2YA/Ib/N+isx5OJHQ5+bsXW
         8tnM8vY5L/LTM3nMchqZ5WXMwCyFvypQ9/XPaq85OYe3SEcN5mQi9+uqBB9GsbzTAQ1W
         1UeQHkkgOTmBDGIKpPHa1ShcxDUQuXfzUxiyjqDuwzX4YPyXWCtrXmZa8AiuAAf/O3VI
         nC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEJ12L1khhMIeqKp/B7ioFvp3mDDNtaMmQccoR+UtkdwXXoDdzKTnGaDfTdo9CAP/I3/4jiQXgI7Mi2hFDzq/ZZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSCfP2M/oUykkRP5jTYyoj2mc+Izi/x8XlmjneV+u8JHG1ZQA
	O1ZxK8dUvSI6eMMUEJufO6JL+KSw53k/tzn9FSBCJKrHYK1TQDFDTnffXzlmtOhx3+g=
X-Gm-Gg: AZuq6aI8vCrSGNKNM9Ep3tJWxbT2zJaXZdo0yt2kypjQvXqlZ1tWQRy+bQj6rIThmld
	isjs4c8okSdy4hWHJiK38CiXhe5gho2BnrHJQ3G8VkPtd7SyBxd64kaJ6/QSuZ55BsmJ5tTGuib
	KAGUNfJQEispkTHk5JlUJ/v98yF1VVv+U5RcJZgTuw8d6HLjFIHYdXUuxPuvAfswab/10MjskFb
	p+IK66lrnk0FUwQ6XQ21+EzEuzx5ZMSXcMqlwA49ELKrULouPk/GeYGUlssG1neY9ThqxiuyUou
	3bla//b8evP4A/m/tUAjlVDimeWpgArIxcEmjbrxxGmwYWec4pXUpE/WqeDz+TR63gNSUo3hJg0
	a3F9HfsvJms1ZFOAj2shdLSqWZ8Uh5GiyrSEvHwaPe2+EoUHkIt2dNuHaJ+IwjltlmQW+210/7k
	pCceOGUaYq+tdZ13JvzQ==
X-Received: by 2002:a05:6000:1a8d:b0:435:b776:304c with SMTP id ffacd0b85a97d-435f3aaa5d0mr2448740f8f.30.1769751601650;
        Thu, 29 Jan 2026 21:40:01 -0800 (PST)
Received: from draszik.lan ([212.129.87.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm19280607f8f.11.2026.01.29.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 21:40:00 -0800 (PST)
Message-ID: <74eb8fb542966c46d0a8c77041aeef21dd1a7e14.camel@linaro.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: google: add
 google,gs101-dtzpc
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Fri, 30 Jan 2026 05:40:13 +0000
In-Reply-To: <20260129165531.GA1269692-robh@kernel.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
	 <20260128-gs101-pd-v4-1-cbe7bd5a4060@linaro.org>
	 <20260129165531.GA1269692-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Thu, 2026-01-29 at 10:55 -0600, Rob Herring wrote:
> On Wed, Jan 28, 2026 at 04:10:50PM +0000, Andr=C3=A9 Draszik wrote:
> > The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
> > an interface to the protection bits that are included in the TrustZone
> > design in a secure system. It configures each area of the memory as
> > secure or non-secure.
>=20
> This sounds like what access-controllers binding is for. Does that work=
=20
> here?

Thank you for the pointer, and yes, I did consider it, but decided against
it in the end for the following reasons:

* downstream drivers don't actually do much with this, it's only used to
  issue a request to the firmware to save / restore the configuration
  when power domains are turned off / on (via SMC call). There is no
  actual configuration happening unlike e.g. the drivers/bus/stm32_*
  case. Configuration etc. seems to be handled statically in the firmware
  in my case.

* therefore I didn't write an actual driver for this compatible and my
  patches are proposing to simply issue the SMC from the power domain
  driver in the respective paths.
  What I observed without having a driver matching the compatible, Linux
  will defer binding of consumer drivers (power domain via phandle in my
  case) until the access controller driver has bound. Since no such driver
  exists in my case, Linux keeps deferring the binding of my power domain
  driver forever, meaning it doesn't probe.

Maybe this restriction could be loosened for cases like this instead. Or
maybe I do need to write a dtzpc driver with the only purpose to issue the
SMC calls at the right time. Having such a driver seemed like overkill,
though.

I realise not using access-controller in DT looks like working-around an
issue in the kernel, but due to the minimal interaction from the Linux-side
I was hoping for that to be OK.

What do you think?


Cheers,
Andre'

>=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/soc/google/google,gs101-dtzpc.yaml=C2=A0=C2=A0=C2=A0=
 | 42 ++++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 43 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-=
dtzpc.yaml
> > b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a8c61ce069d6910c47753bf=
14a792eb58e6ae182
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.y=
aml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos Distributed TruztZone Protection Control.
> > +
> > +description:
> > +=C2=A0 Distributed TrustZone Protection Control (D_TZPC) provides an i=
nterface to the
> > +=C2=A0 protection bits that are included in the TrustZone design in a =
secure system.
> > +=C2=A0 It configures each area of the memory as secure or non-secure.
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: google,gs101-dtzpc
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - clocks
> > +=C2=A0 - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/google,gs101.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 dtzpc_hsi0: dtzpc@11010000 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "google,gs101-dtzpc";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x11010000 0x10000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_D_T=
ZPC_HSI0_PCLK>;
> > +=C2=A0=C2=A0=C2=A0 };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a56f8f00aebb938aa765a8a6d66dfeb7f062dac8..98b2ef47c809ac0232e6941=
c9483b19d7c798bb4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10833,6 +10833,7 @@ P:	Documentation/process/maintainer-soc-clean-d=
ts.rst
> > =C2=A0C:	irc://irc.oftc.net/pixel6-kernel-dev
> > =C2=A0F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yam=
l
> > =C2=A0F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
> > +F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yam=
l
> > =C2=A0F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-=
intr-gen.yaml
> > =C2=A0F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
> > =C2=A0F:	arch/arm64/boot/dts/exynos/google/
> >=20
> > --=20
> > 2.52.0.457.g6b5491de43-goog
> >=20
