From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 21:12:35 +0530
Message-ID: <BANLkTinp_z7OiBPnYvD7NjDYmvfrEV7i+A@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:56147 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752787Ab1FGPmh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 11:42:37 -0400
Received: by fxm17 with SMTP id 17so3182644fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 08:42:36 -0700 (PDT)
In-Reply-To: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: root <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Alim,

On 7 June 2011 13:18, root <alim.akhtar@samsung.com> wrote:
> Signed-off-by: alim.akhtar <alim.akhtar@samsung.com>
> ---
> =C2=A0arch/arm/configs/exynos4_defconfig | =C2=A0 =C2=A01 +
> =C2=A0arch/arm/configs/s5p64x0_defconfig | =C2=A0 =C2=A01 +
> =C2=A0arch/arm/configs/s5pc100_defconfig | =C2=A0 =C2=A01 +
> =C2=A0arch/arm/configs/s5pv210_defconfig | =C2=A0 =C2=A01 +
> =C2=A0arch/arm/plat-samsung/Kconfig =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0=
6 -
> =C2=A0arch/arm/plat-samsung/Makefile =C2=A0 =C2=A0 | =C2=A0 =C2=A02 -
> =C2=A0arch/arm/plat-samsung/s3c-pl330.c =C2=A0| 1244 ----------------=
--------------------
> =C2=A0drivers/dma/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A08 +
> =C2=A0drivers/dma/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0drivers/dma/s3c-pl330.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1244 ++++++++++++++++++++++++++++++++++++
> =C2=A010 files changed, 1258 insertions(+), 1252 deletions(-)
> =C2=A0delete mode 100644 arch/arm/plat-samsung/s3c-pl330.c
> =C2=A0create mode 100644 drivers/dma/s3c-pl330.c
>
If the patch involves file movement or file renaming, then use -M flag
while creating the patch. This would indicate the file movement and
would essentially make the patch smaller.


--=20
Tushar Behera
