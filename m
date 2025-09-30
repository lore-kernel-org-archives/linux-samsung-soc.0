Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C962C030E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759273574; cv=none; b=SJ9hYrqVpceHZQnQ8X+S6xDrzq7GIm2ZJEOT+huQWo1xL0h/3o8ElGE21EIitxImRmRYBBmB4km1ccLQt5j/ksZwjAZT5fF18tDCUwRyk2JfavWUXTX5WIR1V0XJyPPPObwlb9864I7rC5r8zK9+wQer1f5PIjdGPD1A0rkERTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759273574; c=relaxed/simple;
	bh=mFz+L72B9DjiruUWCPt3+uUkwCHLqPB81lzn9f7L9es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtrHDqul8P+lpED0lp+jir+NVJO+KOPiZ63DoxSZDF+YTBRlMvyLBtnwyVOjtsSSAD2e6AvgjOr5ZSZY8aX3W/og5+CT4zraTD0piNSAYSmlG0Niwi7KTVgCgtxBVqGmjE5As7VmTE/M8SxukwIxx/xn0kC3EKG7RpLjeVLTNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auLtIQtg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auLtIQtg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23303C19421
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759273574;
	bh=mFz+L72B9DjiruUWCPt3+uUkwCHLqPB81lzn9f7L9es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=auLtIQtg+7Qh8LXidT5CDm43U1rsefTB+8QhjQUEzb/gDsFZsAkhHwQdBFo0LV7Qg
	 yNtfOBWGDPd0vFX3lLAypHw4AVW5CfgjYHW3BCjhS6QtM707BBBp3waJ+GR5FWg7lY
	 vQYUdkNBxmX6bCF+3A6jEjJplwkuWjNINAV3H6mpek1t0SofEu+LQ//qQbgGqGY89W
	 JRBaAsR9GPrCY4DK3Qjhv48z9gYHb/yP2/o1swTYuUbU3oOW064RqBAgQhb+Tpm55P
	 CqpmFPGVu01CuYqzbYfL9mwUUNmbvBMKwKNN9jWHYzV2KudMBeWq+OIuCIMR/OaC+K
	 ViGi85uuRAq3g==
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-28832ad6f64so35847655ad.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 16:06:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeTisaZgFFR6ZuVfQYK72T4vpYMKzyI5kuoBmZpk0XzqQVzvlIIYF1ZoHvXtGuHUkPDtlUGRBLx6ANJwbTJY/U+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAOp1bl5wnXU77vzx76RYsclhyehkoB9N0bw6RrOsSGv2hAk4
	1BORtEdR5bkCsevsii/etg7JGSE84RD/aELFnudPCK9FtAq94bz5wWu9hvpO1rAxuzfDXTDiNFT
	vVHs/XAJeYVNzBYG3D7jBiNn4mlMjsrY=
X-Google-Smtp-Source: AGHT+IEtVABxEKyxN7a+U3Kp2sBw7bT8AmKlK9sbcU4p8q7V3u9HMuNYcQ/g3mBtE/Xshs31HBFf6QR4rED4d0MupEk=
X-Received: by 2002:a17:903:4b48:b0:275:2aac:fef8 with SMTP id
 d9443c01a7336-28e7f33067fmr14927905ad.38.1759273573411; Tue, 30 Sep 2025
 16:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-9-h.dewangan@samsung.com>
 <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
 <75d06769-4896-4095-9969-03a517705196@samsung.com> <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
In-Reply-To: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 1 Oct 2025 08:06:01 +0900
X-Gmail-Original-Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
X-Gm-Features: AS18NWB-7qq3WRSu2_4sN54O9Pq__ESSuLB-fBN1o7du1U_PSVDKaJXEOusJU-4
Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
	=?UTF-8?Q?r_probe_support?=
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, alim.akhtar@samsung.com, manjun@samsung.com, 
	nagaraju.s@samsung.com, ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Oct 2025 at 07:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 1 Oct 2025 at 00:46, Marek Szyprowski <m.szyprowski@samsung.com> =
wrote:
> >
> > Hi Krzysztof,
> >
> > On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> > > On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.=
com> wrote:
> > >> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
> > >>
> > >> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> > >> Exynos MFC driver that supports firmware version=E2=80=AF13 and late=
r.
> > >> Extend the top=E2=80=91level Samsung platform Kconfig to disable the=
 legacy
> > >> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 an=
d to select the
> > >> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not=
 enabled.
> > >>
> > >> Add exynos-mfc Kconfig and Makefile for probe functionality and crea=
tion
> > >> of decoder and encoder device files by registering the driver object
> > >> exynos_mfc.o and other relevant source files.
> > >>
> > >> Provide header files mfc_core_ops.h and mfc_rm.h containing core
> > >>    operation prototypes, resource=E2=80=91manager helpers,
> > >>    and core=E2=80=91selection utilities.
> > >>
> > >> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91du=
mp
> > >> support for debugging MFC errors.
> > >>
> > >> These changes bring support for newer Exynos=E2=80=91based MFC hardw=
are,
> > >> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay =
the
> > >> groundwork for future feature development and debugging.
> > >>
> > > No, NAK. Existing driver is well tested and already used on newest
> > > Exynos SoC, so all this new driver is exactly how you should not work
> > > in upstream. You need to integrate into existing driver.
> > >
> > > Samsung received this review multiple times already.
> >
> > Please don't be so categorical. The MFC hardware evolved quite a bit
> > from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed=
.
> > The feature list of the new hardware hardly matches those and I really
> > don't see the reason for forcing support for so different hardware in a
> > single driver. Sometimes it is easier just to have 2 separate drivers i=
f
> > the common part is just the acronym in the hardware block name...
> >
>
> I know it is easier for Samsung to write new driver, but this should
> answer to - why the maintainers and the community would like to
> maintain two drivers. Sure, make a case why we would like to take this
> code.
>
> The easiest argument here why we wouldn't is: new vendor downstream
> code means replicating all known issues, old coding style, everything
> which we already fixed and changed.

And 15 second look at one of the patches already confirmed this:
replicating downstream issue - undocumented DT ABI not following
current style, code relying on some other downstream drivers. 15
seconds was enough to find it.
