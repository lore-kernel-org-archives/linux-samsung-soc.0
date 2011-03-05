From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: S5PC210: add support for i2c PMICs on
	Universal_C210 board
Date: Sat, 5 Mar 2011 11:21:38 +0000
Message-ID: <20110305112138.GB27468@n2100.arm.linux.org.uk>
References: <1297767555-13326-1-git-send-email-m.szyprowski@samsung.com> <20110215113504.GF4152@n2100.arm.linux.org.uk> <AANLkTimHPzbWpqFMXr2D46VXxLeHaAVTtpeCSaByweu8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51279 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553Ab1CELVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Mar 2011 06:21:54 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTimHPzbWpqFMXr2D46VXxLeHaAVTtpeCSaByweu8@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com

On Thu, Mar 03, 2011 at 11:40:26AM +0900, Kyungmin Park wrote:
> On Tue, Feb 15, 2011 at 8:35 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Tue, Feb 15, 2011 at 11:59:15AM +0100, Marek Szyprowski wrote:
> >> =A0#include <mach/map.h>
> >> +#include <mach/gpio.h>
> >
> > Need I say anything about this?
>=20
> Hi Russell,
>=20
> How about to prevent it as compiler error? It's frequent mistake.
>=20
> At each mach/gpio.h
>=20
> #ifndef __LINUX_GPIO_H
> #error "You should include <linux/gpio.h> instead of <mach/gpio.h>."
> #endif

It doesn't stop people including linux/gpio.h and then mach/gpio.h,
which is also a common mistake.  Besides, it's easy to catch when you
have a regexp setup in your mail reader to find them...
