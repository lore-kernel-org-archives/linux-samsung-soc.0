From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/7] clk: exynos: prepare for multiplatform
Date: Mon, 15 Apr 2013 10:35:09 +0200
Message-ID: <201304151035.09583.arnd@arndb.de>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de> <1365775405-115297-2-git-send-email-arnd@arndb.de> <CAJuYYwRfoU1y_3qbZtdhdyRugPD_QCYWr_LuesOXzq+-jmxouw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:56190 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933813Ab3DOIfN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 04:35:13 -0400
In-Reply-To: <CAJuYYwRfoU1y_3qbZtdhdyRugPD_QCYWr_LuesOXzq+-jmxouw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mike Turquette <mturquette@linaro.org>

On Monday 15 April 2013, Thomas Abraham wrote:
> On 12 April 2013 19:33, Arnd Bergmann <arnd@arndb.de> wrote:
> > The new common clock drivers for exynos are using compile
> > time constants and soc_is_exynos* macros to provide backwards
> > compatibility for pre-DT systems, which is not possible with
> > multiplatform kernels. This moves all the necessary
> > information back into platform code and removes the mach/*
> > header inclusions.
> 
> 
> Since kgene has submitted a patch to remove pre-dt Exynos support
> which looks like it will be accepted, we could just remove the use of
> soc_is_xyz() instead of continuing to support non-dt Exynos.

I think based on the most recent discussion, we are not actually doing
that for 3.10, since there are still people that require ATAGS support.

	Arnd
