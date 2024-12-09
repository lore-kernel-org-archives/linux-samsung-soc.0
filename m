Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9B2156F3;
	Mon,  9 Dec 2024 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733002; cv=none; b=YKpxNn88GyZ0WmUEVXsFF/s3xjY+pguJn9giImv4Ck68M+/D5eD2cLYhEmoeWbYBuvflF1jqjJuwdNvyZSSkZ9Mv91Gi2w3jdzt7JRPWKlUuXsuq8TTe+GEmnhJm6ZKFDhc2IQn5fFR8hppavspUIsse2AVXU3rZ+ASLy4Bp4lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733002; c=relaxed/simple;
	bh=hefcKfevFSAoEM61KtOENmpzPHMyrIir5nAPgdsgUUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEe2+Jvd4zkwU5pYj+//KQzvSJSW7YGaq348dMR148oXCVYhKE9RljQNXxwEUAQThg0EEpDWgRc24mGOGuyjwQwql0F6vawxVFJCVHOEBKCMBGKLBxrkPO0AUgSdrNlUDSmzA0PrdBI8Y2BoBc8Gp9v3HRS900FZw90IPysCh+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4qev80Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4qev80Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAC0C4CED1;
	Mon,  9 Dec 2024 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733733002;
	bh=hefcKfevFSAoEM61KtOENmpzPHMyrIir5nAPgdsgUUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4qev80ZqVUxrGI/ByF3mlXqjOKaEr1fR9eE4OFZKnGQGbFBxFTdRXD/bo3oEqw3h
	 3szdQa5l8oF0epWqAgq2vhdoP/gahZ+jeZDGUyPAjs50bqP74JEdGz82qWiGdwa9NA
	 GL4gE/t9WU+AWxNr4zkHVEejbO8oTPCxl8H63ZlnknrUV4TXUbxnVfsHTRLm6A3Cne
	 RVHMU3DWI2di8PHY/T7uZLByn/jLyW+d7jkiWimsAoFzKD+67e9olj5WuGDX/opxr6
	 H5o0XX9z6ZSiB6EgaDaKVuYZfE1Jss+P/Gc92dj5cjgc/0YU1kkeUK2o/WeDpx4KVu
	 QACsk5uUYtg8w==
Date: Mon, 9 Dec 2024 09:29:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org, 
	javierm@redhat.com, tzimmermann@suse.de, vincent.guittot@linaro.org, 
	ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Message-ID: <faghtvhan6xmhoezeaocmdusxkmy4g3vrldzn7mlukbh33isr6@c27o6p7a6a6f>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
 <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
 <0ba62a72-8247-447f-b710-234385a29d14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0ba62a72-8247-447f-b710-234385a29d14@gmail.com>

On Sun, Dec 08, 2024 at 06:38:50PM +0200, Markuss Broks wrote:
>=20
> On 12/6/24 9:50 PM, Daniel Lezcano wrote:
> > On 12/6/24 14:28, Krzysztof Kozlowski wrote:
> > > On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
> > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > +
> > > > > +config EXYNOS_ACPM_PROTOCOL
> > > > > +=C2=A0=C2=A0=C2=A0 tristate "Exynos Alive Clock and Power Manage=
r (ACPM)
> > > > > Message Protocol"
> > > >=20
> > > > Given the importance of this driver where a lot of PM services
> > > > rely on, does
> > > > it really make sense to allow it as a module ?
> > > >=20
> > > > Some PM services may be needed very early in the boot process
> > > >=20
> > >=20
> > > If it works as module e.g. on Android, it is beneficial. I think the
> > > platform was booting fine without it, at least to some shell, so I can
> > > imagine this can be loaded a bit later.
> >=20
> > Usually the firmware sets the frequency to the maximum in order to boot
> > the kernel as fast as possible. That may lead to thermal issues at boot
> > time where the thermal framework won't be able to kick in as some
> > components will depends on ACPM while the system stays at its highest
> > performance state.

I disagree with the first assumption: usually firmware selects high, but
safe frequency. Otherwise you would not be able to wait in bootloader
prompt.

> Also, as far as I understand, ACPM is used here as an interface to the PM=
IC,
> so every driver which would need power management from the main SoC PMIC
> would get deferred until the ACPM module has been loaded. This would make=
 it

It was an issue 10 years ago, not anymore. Drivers handle deferred
probe.

> impossible to e.g. initialize the UFS or the MMC card before initramfs.

Which is not a problem, because you are supposed to have initramfs. This
is preferred way. Being this a module does not force you to use it as a
module, e.g. if in your setup you do not have initramfs (although it is
unlikely for arm64 platforms...).

Best regards,
Krzysztof

