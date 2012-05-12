From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes for v3.4
Date: Sat, 12 May 2012 15:29:31 -0700
Message-ID: <CAOesGMj8PgGRmdQQSnJmAurL1uYM2exxDaeTTWHVe9JQR0zQ-w@mail.gmail.com>
References: <4FAED92C.4090103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:42939 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066Ab2ELW3c convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 18:29:32 -0400
Received: by obbtb18 with SMTP id tb18so5193761obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 15:29:31 -0700 (PDT)
In-Reply-To: <4FAED92C.4090103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,


Since we are _so_ close to release, I am going to be picky about what
kind of patches we're going to accept for 3.4. See below.

On Sat, May 12, 2012 at 2:42 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:


> Changhwan Youn (1):
> =A0 =A0 =A0ARM: EXYNOS: fix the hotplug for Cortex-A15

This is a feature, not a bug fix -- cpu hotplug has never worked for
A15 based on the patch description. So per definition it's 3.5
material.

Also, I'll send out a comment on the patch itself, it shouldn't check
for SoC version, it should check for core version. See separate email
shortly.

> Jose Miguel Goncalves (1):
> =A0 =A0 =A0ARM: SAMSUNG: Fix for S3C2412 EBI memory mapping

This has been broken since 2.6.32. Please queue it up in a fixes
branch for the 3.5 merge window instead, it doesn't qualify as a
recent regression and thus we shouldn't try to squeeze it in before
the merge window closes.

> Kukjin Kim (1):
> =A0 =A0 =A0ARM: EXYNOS: fix ctrlbit for exynos5_clk_pdma1
>
> Marek Szyprowski (1):
> =A0 =A0 =A0ARM: EXYNOS: use s5p-timer for UniversalC210 board

Those two look appropriate. Please send a new pull request with those t=
wo.


-Olof
