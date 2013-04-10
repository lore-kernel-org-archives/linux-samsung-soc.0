From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Wed, 10 Apr 2013 14:59:07 +0200
Message-ID: <201304101459.07263.arnd@arndb.de>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com> <310101ce35d7$00e7e000$02b7a000$%kim@samsung.com> <516541EB.8080404@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:65212 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975Ab3DJM7Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 08:59:16 -0400
In-Reply-To: <516541EB.8080404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On Wednesday 10 April 2013, Sylwester Nawrocki wrote:
> On 04/10/2013 12:34 PM, Kukjin Kim wrote:
> > Kukjin Kim wrote:
> >>
> >> From: Kukjin Kim <kgene.kim@samsung.com>
> >>
> >> As we discussed in mailing list, non-DT for EXYNOS SoCs will not be
> >> supported from v3.10. This patch removes regarding files for non-DT
> >> including board files.
> >>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> It looks OK to me.

Ok. I am currently rebuilding my exynos multiplatform series on top of the
branches merged yesterday, but keeping ATAGS support alive there.

Should I rebase on top of this patch instead?

	Arnd
