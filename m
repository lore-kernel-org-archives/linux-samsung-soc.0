From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/2] ARM: S5PV310: Update CPU hotplug implementation
Date: Thu, 30 Sep 2010 22:21:01 +0100
Message-ID: <20100930212101.GC11660@n2100.arm.linux.org.uk>
References: <1284700388-9394-1-git-send-email-kgene.kim@samsung.com> <1284700388-9394-3-git-send-email-kgene.kim@samsung.com> <001901cb5fcd$a0a5b5a0$e1f120e0$%kim@samsung.com> <AANLkTinaGsnZg-nTGvXS4xw-_8e8+pLpL4hYN-HMNYfh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44922 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932447Ab0I3VVX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Sep 2010 17:21:23 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTinaGsnZg-nTGvXS4xw-_8e8+pLpL4hYN-HMNYfh@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Tony Lindgren <tony@atomide.com>, Erik Gilling <konkers@android.com>, Olof Johansson <olof@lixom.net>

On Thu, Sep 30, 2010 at 10:02:37AM -0700, Colin Cross wrote:
> On Wed, Sep 29, 2010 at 4:58 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Kukjin Kim wrote:
> >>
> >> From: Changhwan Youn <chaos.youn@samsung.com>
> >>
> >> This patch updates CPU hotplug implementation to reduce CPU power
> >> consumption
> >> and will turn off the CPU power when CPU1 is unplugged while previ=
ous CPU
> >> hotplug
> >> used CPU idle.
> >> This patch removes init memory freeing code to use CPU boot code w=
hen CPU1
> > is
> >> plugged-in again and adds vfp_enable() call to allow to access CP1=
0 and
> > CP11.
> >>
> >> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> Cc: Russell King <rmk@arm.linux.org.uk>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Colin Cross <ccross@android.com>
> > Cc: Erik Gilling <konkers@android.com>
> > Cc: Olof Johansson <olof@lixom.net>
> >
>=20
> snip
>=20
> >> +#ifndef CONFIG_HOTPLUG_CPU
> >> =A0 =A0 =A0 if (!machine_is_integrator() && !machine_is_cintegrato=
r())
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 totalram_pages +=3D
> > free_area(__phys_to_pfn(__pa(__init_begin)),
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 __phys_to_pfn(__pa(__init_end)),
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 "init");
> >> +#endif
> >> =A0}
> >>
> >> =A0#ifdef CONFIG_BLK_DEV_INITRD
>=20
> I don't think this is necessary.  Any symbol that is necessary for CP=
U
> hotplug should be marked with __cpuinit instead of __init.  The linke=
r
> script will put __cpuinit symbols outside the __init_begin -
> __init_end section if CONFIG_HOTPLUG_CPU is enabled.

That's the theory, but not everything required for a complete restart o=
f
a secondary CPU (iow, if it's powered off) is in the right section yet.
I'll have patches hopefully tomorrow to address this.
