From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3] ARM: gic: allow GIC to support non-banked setups
Date: Thu, 17 Nov 2011 10:22:28 +0530
Message-ID: <CAJuYYwReJq8M+Q-K8hNo4zLJ_JDhnQjw2tbbj4ELc=oJ4vrnSQ@mail.gmail.com>
References: <1321359452-22821-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:45902 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755842Ab1KQEw2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 23:52:28 -0500
Received: by ggnb2 with SMTP id b2so583785ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2011 20:52:28 -0800 (PST)
In-Reply-To: <1321359452-22821-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robherring2@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 15 November 2011 17:47, Marc Zyngier <marc.zyngier@arm.com> wrote:
> The GIC support code is heavily using the fact that hardware
> implementations are exposing banked registers. Unfortunately, it
> looks like at least one GIC implementation (EXYNOS) offers both
> the distributor and the CPU interfaces at different addresses,
> depending on the CPU.
>
> This problem is solved by allowing the distributor and CPU interface
> addresses to be per-cpu variables for the platforms that require it.
> The EXYNOS code is updated not to mess with the GIC internals while
> handling interrupts, and struct gic_chip_data is back to being privat=
e.
> The DT binding for the gic is updated to allow an optional "cpu-offse=
t"
> value, which is used to compute the various base addresses.
>
> Finally, a new config option (GIC_NON_BANKED) is used to control this
> feature, so the overhead is only present on kernels compiled with
> support for EXYNOS.
>
> Tested on Origen (EXYNOS4) and Panda (OMAP4).
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Rob Herring <robherring2@gmail.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> This is a minor update on the previous version, simply adding a
> config option so that normal platforms don't have to pay the
> price of the get_base() indirection.
>
> Any comment is welcome, specially on the DT binding update.
>
> =A0Documentation/devicetree/bindings/arm/gic.txt | =A0 =A04 +
> =A0arch/arm/common/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A03 +
> =A0arch/arm/common/gic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0133 +++++++++++++++++++++----
> =A0arch/arm/include/asm/hardware/gic.h =A0 =A0 =A0 =A0 =A0 | =A0 24 +=
+---
> =A0arch/arm/mach-exynos/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 16 +---
> =A0arch/arm/mach-exynos/platsmp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 28 +-----
> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A01 +
> =A07 files changed, 132 insertions(+), 77 deletions(-)
>

Tested on Exynos4210 based Origen board with 'cpu-offset =3D <0x8000>'
property in GIC device node and device tree enabled kernel. Thanks for
this patch.

Tested-by: Thomas Abraham <thomas.abraham@linaro.org>
