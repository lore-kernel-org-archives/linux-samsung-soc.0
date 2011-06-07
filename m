From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 13:31:28 +0530
Message-ID: <BANLkTingtc1yNt_fwCtscnRRwPd8d2ieKQ@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:57128 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712Ab1FGIB3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 04:01:29 -0400
Received: by bwz15 with SMTP id 15so3961125bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 01:01:28 -0700 (PDT)
In-Reply-To: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: root <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Tue, Jun 7, 2011 at 1:18 PM, root <alim.akhtar@samsung.com> wrote:
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

NAK
The drivers/dma/ is place for generic DMA API con formant drivers.
S3C-PL330.c is implementation of Samsung's DMA API.
