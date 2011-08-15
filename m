From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 07/15] ARM: EXYNOS4: Use generic DMA PL330 driver
Date: Mon, 15 Aug 2011 19:45:48 +0530
Message-ID: <CAJuYYwT0R+VXWvWuV6KK=m_knoxBnBf=GLVimPoe002mcvqqeA@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
	<1311744697-10264-8-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:62153 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753141Ab1HOOPt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2011 10:15:49 -0400
Received: by gwaa12 with SMTP id a12so3174518gwa.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Aug 2011 07:15:49 -0700 (PDT)
In-Reply-To: <1311744697-10264-8-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

Hi Boojin,

On 27 July 2011 11:01, Boojin Kim <boojin.kim@samsung.com> wrote:
> This patch makes Samsung EXYNOS4 to use DMA PL330 driver
> on DMADEVICE. The EXYNOS4 uses DMA generic APIs instead of
> SAMSUNG specific S3C-PL330 APIs.
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Kconfig | =A0 =A02 +-
> =A0arch/arm/mach-exynos4/clock.c | =A0 16 ++-
> =A0arch/arm/mach-exynos4/dma.c =A0 | =A0299 +++++++++++++++++++++++++=
+---------------
> =A03 files changed, 198 insertions(+), 119 deletions(-)
>

[...]

> diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-exynos4/dma.=
c
> index 564bb53..d57d662 100644

[...]

> +struct dma_pl330_peri pdma0_peri[28] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .peri_id =3D (u8)DMACH_PCM0_RX,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .rqtype =3D DEVTOMEM,
> + =A0 =A0 =A0 }, {

The client driver specifies the direction of the transfer
(DMA_TO_DEVICE or DMA_FROM_DEVICE) when requesting for a dma channel.
So, is the rqtype parameter required in the platform data for the dma
driver?

Thanks,
Thomas.
