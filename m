Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695E3B7B7F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209474; cv=none; b=aAbPQSDSj/LELhyJhMLlbnxDKeMVh2DOfUKaAqDUnr8dxsoXoRixEZ8y4lcuoSXoTTZQGV37PvzOFVw2KxNGUCLHxkJY8uBQARiqebFSSAqYHo+3H0GzH3VndSIE9hWzUppnnjOK/+hvYgYFLI2mun12HOvKPptdxsce9bJhC2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209474; c=relaxed/simple;
	bh=Cusf2T7B4al32h10rLH42UCGifbkj8cK5s3GiNopXUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBBY9SHNQg+EnJRBw65qnYjcXeQGPRRmI6uRyVaD8VwfOVmcai4DU9TxOLINztuddEkbcDSg7KzjECWgu2J5bsRhMmRmrDWIpDeQgPAjnY236SVlpovgfzvpLRWGwYlpNfpWCVSrQztIc7g0HrWLlz83tpy8EbihYvd6J96tdXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ltu5V+rh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ltu5V+rh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3161F0155B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787209473;
	bh=Cusf2T7B4al32h10rLH42UCGifbkj8cK5s3GiNopXUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ltu5V+rhF+34mxFIWuu5tU/suXKGLd5AhOIPnzPZp9urnSKf9VJ8EIsQW96gIkByQ
	 jKIHe2Mnzdxyr98U6vZQ09qGUeNds3CD384Hn/JB9Z3F4QmW6lVsNIwq6k+b7vC9FT
	 267T7HcoTXxb0qGVxv5IsV62Ctx+v2hK46ga9WWie8l1WQrNz9KP3G4SCZyFsuKnYA
	 cQn8raKsRDRhIaMiDMG6G4KczC1esJDfvkwZn/l0iZe/HIjRXnKwirzM+eZy3NA/xO
	 YVa86yd4qIGEJbrYtkTlW94CQsKDRIDVtI5kTXDMARcpwuc4k4ND1C2c8SIeVm+uaY
	 kDZj7EjcX5R7g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2193507e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 00:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpPg319SeBflmwolOdUdT3Yz265t7d7mD3seqBM9fLscsbQ87cXqszn5Bb5iuwhL6Q3ivi1DVvOALccuXyOw9a4+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAQeFOC85TyVHUZ2Q1rpkSU2FfSkgi46jC3xXecnZ6lcJoaVG
	DIC4ERUwa/5FQC1IGhXNwmbsGQmKaU5psMxoWoXfvMXRbu0XqtV59S9AB5yAaXVWA3R3pmxmPdX
	oADUvKcc79JnprTaxZQXFb8FFhMlGisw=
X-Received: by 2002:a05:6512:3f25:b0:5ae:bf45:e3be with SMTP id
 2adb3069b0e04-5b478cf5425mr3737000e87.21.1787209471579; Thu, 20 Aug 2026
 00:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
 <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com> <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
In-Reply-To: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 09:04:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
X-Gm-Features: AcwNN1WqJo48aeez-Evap8v6fI7Rfgzep_6FDf8AekLbZhIutRdP2zHCmPTfiRA
Message-ID: <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Thu, Aug 20, 2026 at 1:41=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:

> > The calibration business and what it is and where it is stored
> > evades me a bit...
>
> The problem we're facing is _finding_ the UFS node in the bootloader.
>
> The device tree for the board is stored / maintained outside of the
> bootloader codebase. It is compiled and stored on the device. The
> bootloader runs, locates the device tree and then wants to make
> changes to it.
>
> The bootloader needs to _find_ the UFS node in the device tree in
> order to make changes to it.

So, thebootloader needs to make changes to the calibration of
the UFS storage, and it needs to find the right UFS storage
to calibrate, right. I get that part.

But this is what boggles my mind. It is actually a pretty
deep philosophical subject.

A piece of software (the bootloader) want to make changes
to the calibration of a piece of hardware, which it somehow
has the calibration for.

This pretty much means that at some point *some* unit
of software producing that said calibration already had a
handle on the hardware.

So there is a missing piece of the puzzle here.

This is where the imperialistic ambition of device tree
kicks in: the piece of software - be that a manufacturing
run-it-once piece of code - that produced said calibration
should have *also* used device tree to find the thing it
was to calibrate. Supposedly looping over all UFS devices
in the device tree and calibrating them one at a time,
something like this.

Ideally that piece of software should have updated the
device tree too, but OK that is intervening with software
engineering, maybe it does not have the capability to
do that.

But that piece of software *should* have at least encoded
some kind of identifier for the thing it calibrated, like a
unique serial number from the hardware, or in worst case
at least the device tree node name.

So the information to locate the right node in the device
tree *should* have been present inside the calibration
binary blob thingy.

What is controversial with this patch is that an authority
on the side comes in and says with a device tree property:

"I have a random piece of calibration data and only I know
which UFS it is for, so I am going to encode that knowledge
into the device tree as an alias."

The device tree "thinks" that this should already be evident.

The device tree has the underlying assumption that
everything is using it. The kernel, the boot loader, the
secure operating environment, the GPU, accelerators...
also the manufacturing tools.

From the view of the device tree world, a manufacturing
tool not using device tree is a hack, and if it is a hack
then the system can put the information in there using
a hack, and this whole ambition of finding the UFS node
from the top down is moot. It's like polishing dirt.

Now, I know this way of thinking is oddly bureaucratic
and imperialistic, but it is in the core essence of how
device tree was thought out. It wants to be the authoritative
source of all hardware information, any other source
is a hack in the view of the device tree.

I don't know if this solves your problem other than saying
"go with any hack because this takes place in an imperfect
world", but at least it points out how this kind of problems
collide with some of the core philosophy of device tree.

Yours,
Linus Walleij
