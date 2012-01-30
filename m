From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/3] ARM: EXYNOS/S5PV210: Add missing FIMC media device
Date: Mon, 30 Jan 2012 10:48:49 +0530
Message-ID: <CAK9yfHwNrSLJYmWdoUaRzPqMAue_wSL428_pJZLj5WkOcCqUrA@mail.gmail.com>
References: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:55042 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab2A3FSu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jan 2012 00:18:50 -0500
Received: by qafk1 with SMTP id k1so1550685qaf.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2012 21:18:49 -0800 (PST)
In-Reply-To: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

Please let me know your comments about this series as well as other
=46IMC and G2D enablement patches submitted by me.

Regards
Sachin

On 29 December 2011 11:59, Sachin Kamat <sachin.kamat@linaro.org> wrote=
:
> FIMC media device (md) registers all required video nodes.
> This is required for functioning of FIMC devices.
>
> Thanks to Sylwester Nawrocki for pointing this out.
>
> This patchset is based on the latest for-next branch of Kukjin Kim's =
tree.
>
> Sachin Kamat (3):
> =A0ARM: S5PV210: Add missing FIMC media device to Aquila
> =A0ARM: EXYNOS: Add missing FIMC media device to SMDKV310
> =A0ARM: EXYNOS: Add missing FIMC media device to Origen
>
> =A0arch/arm/mach-exynos/mach-origen.c =A0 | =A0 =A01 +
> =A0arch/arm/mach-exynos/mach-smdkv310.c | =A0 =A01 +
> =A0arch/arm/mach-s5pv210/mach-aquila.c =A0| =A0 =A01 +
> =A03 files changed, 3 insertions(+), 0 deletions(-)
>
> --
> 1.7.4.1
>



--=20
With warm regards,
Sachin
