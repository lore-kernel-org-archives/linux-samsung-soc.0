Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3FB1373;
	Thu,  7 Nov 2024 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977478; cv=none; b=RNov8Hla/RtTZapgrsF+59McYLjCcI6/QN3Lt4X7raN44IsgQPophx2H2lkXtTMC+W0K8k3N7ogvyWffqn0HIV7wwMbjdqAXE7LdBjWuOnE/QUTIBenLcsSDJ2PS9a51XgGm4d4UygxmwnZm6XnG7q8NELv34ykuzQoDqV4fjzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977478; c=relaxed/simple;
	bh=cYWoxbYszxhA6l+wnf7RtGXbHRbIcXVZgl3n2vYKQgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRDJYAL/hwJH6nQZkBTAgvk7uNAKBz8T6Iq6CVTIWQ5il7QL0fbig9gIqStBzUkgjH5/ugyPrQxY0+aKTnplMMO7YOE5cLibvU/RUkd3DzygbxaPfhkQFT5KdwOpYTYsLlXfOFbl7DlP7pCHGFQfDJxH+hFhBSlVkHwoR4h2Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6aKMtHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6aKMtHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02F5C4CED0;
	Thu,  7 Nov 2024 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977477;
	bh=cYWoxbYszxhA6l+wnf7RtGXbHRbIcXVZgl3n2vYKQgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6aKMtHodiXmhDfUFXGQ88AnAuWa5z78rQWpAXIsWHl5kfNhg8AiBl4NODSs/P6LD
	 Ph0tCwrrmYZ5S1A1SydazLpccRfr2NV7HWJjKnYCgh3h0/L9b5UP1oHgBiF3ax5OK1
	 Zwc/G+HfbjqrpFXuDxK0/MZbi9+I1i0MgoD5NL06Wvh8MfTeN8/XTReY4Xhsr9Dpzr
	 XBfe+CdZH6v7utbekakrOy9ziLEKAwD4ZNt9JgegMRJywrrgEl4iS1eWSMBzEMY9O8
	 uEgB3MH44zFbnLbOGL/h7eTSZDglTuBNIef7BpnyXENWL/Vxgj1hbf0PGC+UlSABTl
	 qWEaBiiDXZmmw==
Date: Thu, 7 Nov 2024 12:04:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: 'Sowon Na' <sowon.na@samsung.com>, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: samsung-ufs: support exynosauto ufs phy driver
Message-ID: <qwlhpilbhwp2umtl4qwjjms2flszpjpojnyduzzg5het5wwiaa@gzbkrvimicwl>
References: <20241107041509.824457-1-sowon.na@samsung.com>
 <CGME20241107041511epcas2p295c24724f736363ef8a765a165979bca@epcas2p2.samsung.com>
 <20241107041509.824457-4-sowon.na@samsung.com>
 <03e501db30fc$916cf390$b446dab0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03e501db30fc$916cf390$b446dab0$@samsung.com>

On Thu, Nov 07, 2024 at 03:35:23PM +0530, Alim Akhtar wrote:
> Hello Sowon
> 
> > -----Original Message-----
> > From: Sowon Na <sowon.na@samsung.com>
> > Sent: Thursday, November 7, 2024 9:45 AM
> > To: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> > vkoul@kernel.org; alim.akhtar@samsung.com; kishon@kernel.org
> > Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> > sowon.na@samsung.com
> > Subject: [PATCH 2/3] phy: samsung-ufs: support exynosauto ufs phy driver
> > 
> s/exynosauto/ exynosautov920
> let's be specific as we have v9 variant as well.
> 
> > Support phy-exynosautov920-ufs driver for ExynosAutov920 series SoCs,
> > using "samsung,exynosautov920-ufs-phy" compatible.
> > 
> s/ ExynosAutov920/ exynosautov920
> May be just: Add support for exynosautov920 ufs phy driver
> 
> using "samsung,exynosautov920-ufs-phy" compatible is obvious
> 
> > Signed-off-by: Sowon Na <sowon.na@samsung.com>
> > ---
> >  drivers/phy/samsung/Makefile                 |   1 +
> >  drivers/phy/samsung/phy-exynosautov920-ufs.c | 159
> > +++++++++++++++++++
> >  drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
> >  drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
> >  4 files changed, 170 insertions(+), 3 deletions(-)  create mode 100644
> > drivers/phy/samsung/phy-exynosautov920-ufs.c
> > 
> > diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
> > index fea1f96d0e43..342682638a87 100644
> > --- a/drivers/phy/samsung/Makefile
> > +++ b/drivers/phy/samsung/Makefile
> > @@ -7,6 +7,7 @@ phy-exynos-ufs-y			+= phy-gs101-ufs.o
> >  phy-exynos-ufs-y			+= phy-samsung-ufs.o
> >  phy-exynos-ufs-y			+= phy-exynos7-ufs.o
> >  phy-exynos-ufs-y			+= phy-exynosautov9-ufs.o
> > +phy-exynos-ufs-y			+= phy-exynosautov920-ufs.o
> >  phy-exynos-ufs-y			+= phy-fsd-ufs.o
> >  obj-$(CONFIG_PHY_SAMSUNG_USB2)		+= phy-exynos-
> > usb2.o
> >  phy-exynos-usb2-y			+= phy-samsung-usb2.o
> > diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c
> > b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> > new file mode 100644
> > index 000000000000..8f4a94e13781
> > --- /dev/null
> > +++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> > @@ -0,0 +1,159 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * UFS PHY driver data for Samsung EXYNOSAUTO v920 SoC
> Let be consistent with the naming, may be EXYNOSAUTOV920

We keep everywhere non-capitalized name, so ExynosAuto

Best regards,
Krzysztof

