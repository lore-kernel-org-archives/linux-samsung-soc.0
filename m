From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 3/5] ARM: EXYNOS: Add support for Exynos secure firmware
Date: Wed, 26 Dec 2012 08:53:50 +0000
Message-ID: <201212260853.50852.arnd@arndb.de>
References: <1353599478-24617-1-git-send-email-t.figa@samsung.com> <1353599478-24617-4-git-send-email-t.figa@samsung.com> <CAGsJ_4yjm-CE6iJC+pAT=aiNAf0dpANH49e2OD+CqBG+JveGfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:54962 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2LZIyL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 03:54:11 -0500
In-Reply-To: <CAGsJ_4yjm-CE6iJC+pAT=aiNAf0dpANH49e2OD+CqBG+JveGfQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, tomasz.figa@gmail.com, kyungmin.park@samsung.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On Wednesday 26 December 2012, Barry Song wrote:
> >       / {
> >               /* ... */
> >
> >               firmware@0203F000 {
> >                       compatible = "samsung,secure-firmware";
> >                       reg = <0x0203F000 0x1000>;
> >               };
> >
> >               /* ... */
> >       };
> 
> well. amazing, dts is used to describle hardware details, here the
> firmware is just a software and reg is the memory the firmware will
> use. is this something againest the dt rule?
> but it is really simple.

We have for a long time had DT bindings to describe firmware, e.g.
on IBM Power systems, I think this is fine.

	Arnd
