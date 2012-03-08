From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Thu, 8 Mar 2012 07:16:59 -0800
Message-ID: <CAOesGMiWOChuMjLQTK1pGys+oXCc4A=HO-2_=37rh3M6pgUP_g@mail.gmail.com>
References: <4F589474.8050609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:36706 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755238Ab2CHPRC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 10:17:02 -0500
Received: by wibhm2 with SMTP id hm2so389320wib.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 07:16:59 -0800 (PST)
In-Reply-To: <4F589474.8050609@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

Hi,

On Thu, Mar 8, 2012 at 3:13 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:

> Kukjin Kim (2):
> =A0 =A0 =A0ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs

This is one large commit that does many things in one change. As the
patch message says:

ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs

- the prefix of clk register replace S5P_ with EXYNOS4_
- move mach-exynos/clock.c to mach-exynos/clock-exynos4.c
- according to moving clock-exynos4.c,
  move <mach/exynos4-clock.h> to "clock-exynos4.h"
- add prefix exynos4_ on clk declaration

It makes it hard to review, especially when you combine a move with
other changes. It's better to do the move in a separate commit that
doesn't change code (or only changes very very little) and then do the
other changes in separate commits later.


-Olof
