From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 0/3] thermal: Add support for interrupt based
 notification to thermal layer
Date: Mon, 21 Jan 2013 17:32:58 -0800
Message-ID: <04d101cdf840$6a547e10$3efd7a30$@samsung.com>
References: <1353937640-9939-1-git-send-email-amit.kachhap@linaro.org>
 <CADGdYn7SpsaJ54OoxuUw3XnEpdi+qReEHw2wX=3rTQ-f2edNUg@mail.gmail.com>
 <CADGdYn6UqNhBmZxcU9k+=K5zZV8rBa6LtJJF0kNzd=RpzJ8B9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24301 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635Ab3AVBdQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 20:33:16 -0500
In-reply-to: <CADGdYn6UqNhBmZxcU9k+=K5zZV8rBa6LtJJF0kNzd=RpzJ8B9g@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'amit daniel kachhap' <amit.daniel@samsung.com>, 'Zhang Rui' <rui.zhang@intel.com>
Cc: linux-pm@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jonghwa3.lee@samsung.com

Amit Daniel Kachhap wrote:

> > On Mon, Nov 26, 2012 at 5:47 AM, Amit Daniel Kachhap
> > <amit.kachhap@linaro.org> wrote:
> >> Changes since V1: Used the new thermal trend type macro
> >>
> >> The patch submitted by Jonghwa Lee
> (https://patchwork.kernel.org/patch/1683441/)
> >> adds support for interrupt based notification to thermal layer. This is
a
> good
> >> feature but the current code need more fixes to support that feature so
> using 2 new thermal
> >> trend type to implement this feature and some falling interrupt fixes.
> >>
> >> All these patches are based on thermal maintainer thermal branch.
> >> git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git thermal
> >>
> >> Amit Daniel Kachhap (2):
> >>   thermal: exynos: Miscellaneous fixes to support falling threshold
> >>     interrupt
> >>   thermal: exynos: Use the new thermal trend type for quick cooling
> >>     action.
> >>
> >> Jonghwa Lee (1):
> >>   Thermal: exynos: Add support for temperature falling interrupt.
> >>
> >>  drivers/thermal/exynos_thermal.c             |  108
+++++++++++++++--------
> ---
> >>  include/linux/platform_data/exynos_thermal.h |    3 +
> >>  2 files changed, 67 insertions(+), 44 deletions(-)

This whole series looks good to me. And if you want to add my ack as a
maintainer of EXYNOS SoCs, feel free.

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin
