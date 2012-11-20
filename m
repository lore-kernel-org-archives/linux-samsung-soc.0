From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Remove unused variables
Date: Tue, 20 Nov 2012 10:58:02 +0530
Message-ID: <50AB14E2.7060506@linaro.org>
References: <1353387812-20001-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:51523 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770Ab2KTF1d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 00:27:33 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so985149pad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Nov 2012 21:27:32 -0800 (PST)
In-Reply-To: <1353387812-20001-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

On 11/20/2012 10:33 AM, Tushar Behera wrote:
> Fixes following compilation warnings.
>=20
> arch/arm/mach-exynos/common.c: In function =91exynos5_init_irq=92:
> arch/arm/mach-exynos/common.c:661:6: warning: unused variable
> =91irq=92 [-Wunused-variable]
> arch/arm/mach-exynos/common.c: In function =91exynos_init_irq_eint=92=
:
> arch/arm/mach-exynos/common.c:1046:15: warning: unused variable
> =91paddr=92 [-Wunused-variable]
>=20
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos/common.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>=20
Please ignore this patch. It was based on some other patchset which is
not yet in mainline.

Apologies.

--=20
Tushar Behera
