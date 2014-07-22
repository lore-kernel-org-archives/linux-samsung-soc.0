From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Tue, 22 Jul 2014 09:14:33 -0700
Message-ID: <CAOesGMgA0fc0_8JOOE01y=UKv-eAZuWiAkAKHG5iam0Zkhp9TA@mail.gmail.com>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<20140722075138.GB28538@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:43640 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754402AbaGVQOg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 12:14:36 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so15272856vcb.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jul 2014 09:14:34 -0700 (PDT)
In-Reply-To: <20140722075138.GB28538@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, Russell King <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jul 22, 2014 at 12:51 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello,
>
> who takes care of this series?
>
> In fact they are all orthogonal to each other.
>
> The first patch
>
>         ARM: exynos: remove unused <mach/memory.h>
>
> has been reviewed and tested by Tomasz Figa and Sachin Kamat. Can the
> Samsung people pick it up? Or armsoc?

Kukjin should apply this one.

> Patch 2 (v2!)
>
>         ARM: remove remaining definitions of PLAT_PHYS_OFFSET from <m=
ach/memory.h>
>
> touches several arch/arm/mach-*/include/mach/memory.h and
> arch/arm/Kconfig. armsoc? Russell?

This can go through either, but Russell has already reviewed it once
so send it to his patch tracker.

> Patch 3 fixes a warning regarding nommu and touches the Kconfig entry
> for Integrator and Renesas (non-multiplatform). armsoc?

Don't know without seeing the patch. What's the patch subject so I can =
find it?


-Olof
