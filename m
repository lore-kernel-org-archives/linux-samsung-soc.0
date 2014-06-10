From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 3/6] ARM: EXYNOS: Remove soc_is_exynos4/5 from exynos.c
Date: Tue, 10 Jun 2014 16:04:47 +0200
Message-ID: <4504625.aXgUF2A4Cb@wuerfel>
References: <1399706287-13919-1-git-send-email-y@samsung.com> <1399706419-13976-4-git-send-email-pankaj.dubey@samsung.com> <53970E3D.9080501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:61133 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752142AbaFJOFW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 10:05:22 -0400
In-Reply-To: <53970E3D.9080501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tomasz Figa <t.figa@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, kgene.kim@samsung.com, Russell King <linux@arm.linux.org.uk>

On Tuesday 10 June 2014 15:55:09 Tomasz Figa wrote:
> On 10.05.2014 09:20, Pankaj Dubey wrote:
> > This patch removes usage of soc_is_exynos4/5 from exynos.c.
> > For this we need to separate machine descriptors for exynos4
> > and exynos5. While doing this patch does some consolidation also.
> > 
> > CC: Russell King <linux@arm.linux.org.uk>
> > CC: Thomas Abraham <thomas.abraham@linaro.org>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
> >  arch/arm/mach-exynos/exynos.c            |   52 +++++++++++++++++++-----------
> >  arch/arm/plat-samsung/include/plat/cpu.h |    3 --
> >  2 files changed, 33 insertions(+), 22 deletions(-)
> > 
> 
> I don't think this is needed. All those static mappings should just go
> away, which will also eliminate the need to have separate machine
> descriptor or soc_is_exynos{4,5}() macros.

I think I suggested doing this patch as an intermediate step to
get rid of the macros first, so we don't get any new users.
I agree that we should also remove the static mappings eventually,
and once we do that, the machine descriptors can be unified again.

I have not checked which of the map_desc entries are currently used
at all, or what it would take to remove them.

	Arnd
