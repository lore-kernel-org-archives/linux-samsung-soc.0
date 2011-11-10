From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv4 07/13] ARM: s3c64xx: convert to MULTI_IRQ_HANDLER
Date: Thu, 10 Nov 2011 14:53:18 +0000
Message-ID: <20111110145318.GD16018@totoro>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
 <1320369010-23428-8-git-send-email-jamie@jamieiles.com>
 <CAJuYYwRPoFDUhtcVLT_rj4c9whJWVXyQ7tcaK3O_G3X9SYf-cw@mail.gmail.com>
 <20111109115406.GB4253@totoro>
 <CAJuYYwQK-V0AYcayUdXy+SCAyTYbH6vJrn=+m5LGy6PSxP0Vzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:42249 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753979Ab1KJOxX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 09:53:23 -0500
Received: by wyh15 with SMTP id 15so2777603wyh.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2011 06:53:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAJuYYwQK-V0AYcayUdXy+SCAyTYbH6vJrn=+m5LGy6PSxP0Vzg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Jamie Iles <jamie@jamieiles.com>, Rob Herring <robherring2@gmail.com>, linux-arm-kernel@lists.infradead.org, viresh.kumar@st.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, rubini@unipv.it, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wed, Nov 09, 2011 at 06:00:20PM +0530, Thomas Abraham wrote:
> On 9 November 2011 17:24, Jamie Iles <jamie@jamieiles.com> wrote:
> > On Wed, Nov 09, 2011 at 04:55:06PM +0530, Thomas Abraham wrote:
> >> Hi Jamie,
> >>
> >> On 4 November 2011 06:40, Jamie Iles <jamie@jamieiles.com> wrote:
> >> > Now that there is a generic IRQ handler for multiple VIC devices=
 use it
> >> > for s3c64xx to help building multi platform kernels.
> >> >
> >> > Cc: Ben Dooks <ben-linux@fluff.org>
> >> > Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> >> > ---
> >> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> >> > =A0arch/arm/mach-s3c64xx/include/mach/entry-macro.S | =A0 =A07 +=
+++---
> >> > =A0arch/arm/mach-s3c64xx/mach-anw6410.c =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-crag6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-hmt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-mini6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-ncp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-real6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-smartq5.c =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-smartq7.c =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-smdk6400.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
> >> > =A0arch/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
> >> > =A012 files changed, 25 insertions(+), 3 deletions(-)
> >> >
> >>
> >> I have tested this patch series on smdk6410 board (s3c64xx) using =
the
> >> following repositorty and branch
> >>
> >> https://github.com/jamieiles/linux-2.6-ji.git =A0branch: vic-dt
> >>
> >> There is a crash while booting. Am I using the right tree and bran=
ch?
> >> The following is the boot log. Is there any other config option to=
 be
> >> enabled?
> >
> > Hmm, could you please try with the patch below applied?
[...]
>=20
> This patch solves the issue and both smdk6410 and smdkv210 works fine=
=2E

Brilliant, thanks Thomas.  Mind if I add a Tested-by from you providing=
=20
the fixup patch is applied first?

Jamie
