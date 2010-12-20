From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM: Fix subtle race in CPU pen_release hotplug code
Date: Mon, 20 Dec 2010 16:39:07 +0000
Message-ID: <AANLkTi=vp_jWMn98+cDs=+r9D7Don9iz+NvuOB6iCv42@mail.gmail.com>
References: <E1PTuaP-0000Fl-EF@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:53047 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932292Ab0LTQjI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Dec 2010 11:39:08 -0500
Received: by iwn9 with SMTP id 9so3300149iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2010 08:39:07 -0800 (PST)
In-Reply-To: <E1PTuaP-0000Fl-EF@rmk-PC.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>

On 18 December 2010 11:04, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> There is a subtle race in the CPU hotplug code, where a CPU which has
> been offlined can online itself before being requested, which results
> in things going astray on the next online/offline cycle.
[...]
> --- a/arch/arm/mach-realview/platsmp.c
> +++ b/arch/arm/mach-realview/platsmp.c
> @@ -36,6 +36,19 @@ extern void realview_secondary_startup(void);
> =C2=A0*/
> =C2=A0volatile int __cpuinitdata pen_release =3D -1;
>
> +/*
> + * Write pen_release in a way that is guaranteed to be visible to al=
l
> + * observers, irrespective of whether they're taking part in coheren=
cy
> + * or not. =C2=A0This is necessary for the hotplug code to work reli=
ably.
> + */
> +static void write_pen_release(int val)
> +{
> + =C2=A0 =C2=A0 =C2=A0 pen_release =3D val;
> + =C2=A0 =C2=A0 =C2=A0 smp_wmb();
> + =C2=A0 =C2=A0 =C2=A0 __cpuc_flush_dcache_area((void *)&pen_release,=
 sizeof(pen_release));
> + =C2=A0 =C2=A0 =C2=A0 outer_clean_range(__pa(&pen_release), __pa(&pe=
n_release + 1));
> +}

Just a minor thing - I don't think we need any barrier here. According
to the ARM ARM B2.2.7:

"Any data cache or unified cache maintenance operation by MVA must be
executed in program order
relative to any explicit load or store on the same processor to an
address covered by the MVA of the
cache operation."

We also have a corresponding smp_rmb() in boot_secondary(), I don't
think it has any use either.

--=20
Catalin
