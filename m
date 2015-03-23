From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Tue, 24 Mar 2015 02:22:57 +0900
Message-ID: <CA+Ln22Fq6Z6vSy2zCsx61j-JVe_x=yAjkySXy_Lit0tBbPmo9Q@mail.gmail.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
	<1426456834-6308-4-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:32942 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460AbbCWRW5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 13:22:57 -0400
In-Reply-To: <1426456834-6308-4-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Andreas, Hakjoo,

Thanks for the patch.

2015-03-16 7:00 GMT+09:00 Andreas F=C3=A4rber <afaerber@suse.de>:
> From: Hakjoo Kim <ruppi.kim@hardkernel.com>
>
> Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
> support for all platforms based on EXYNOS5410.
>
> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
> [AF: Rebased onto Exynos5260, irq_chip consolidation, const'ification=
]
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2 -> v3:
>  * Rebased (.svc, .{g,w}eint_{con,mask,pend} fields dropped)
>
>  v1 -> v2:
>  * Filled in Sob from Hakjoo Kim
>
>  .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
>  drivers/pinctrl/samsung/pinctrl-exynos.c           | 103 +++++++++++=
++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
>  4 files changed, 107 insertions(+)
>

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
