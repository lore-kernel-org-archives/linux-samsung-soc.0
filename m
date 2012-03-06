From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung fixes-4 for v3.3
Date: Tue, 06 Mar 2012 02:47:08 -0800
Message-ID: <4F55EB2C.6090807@samsung.com>
References: <4F55E6D1.4080703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:54224 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758949Ab2CFKrM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 05:47:12 -0500
Received: by pbcun15 with SMTP id un15so3932446pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 02:47:12 -0800 (PST)
In-Reply-To: <4F55E6D1.4080703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 03/06/12 02:28, Kukjin Kim wrote:
> Hi Arnd, Olof
>
> Please pull Samsung fixes for v3.3.
>
> If any problems, please kindly let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit
> 6b21d18ed50c7d145220b0724ea7f2613abf0f95:
>
> Linux 3.3-rc5 (2012-02-25 12:18:16 -0800)
>
> are available in the git repository at:
>
> ssh://gitolite@ra.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.3-samsung-fixes-4

Oops, should be...
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

>
> Bartlomiej Zolnierkiewicz (1):
> ARM: EXYNOS: fix touchscreen IRQ setup on Universal C210 board
>
> Gusakov Andrey (1):
> ARM: S3C24XX: DMA resume regression fix
>
> Heiko Stuebner (1):
> ARM: S3C24XX: Fix restart on S3C2442
>
> Joonyoung Shim (1):
> ARM: SAMSUNG: Fix memory size for hsotg
>
> arch/arm/mach-exynos/mach-universal_c210.c | 2 ++
> arch/arm/mach-s3c2440/common.h | 2 +-
> arch/arm/mach-s3c2440/mach-anubis.c | 2 +-
> arch/arm/mach-s3c2440/mach-at2440evb.c | 2 +-
> arch/arm/mach-s3c2440/mach-gta02.c | 2 +-
> arch/arm/mach-s3c2440/mach-mini2440.c | 2 +-
> arch/arm/mach-s3c2440/mach-nexcoder.c | 2 +-
> arch/arm/mach-s3c2440/mach-osiris.c | 2 +-
> arch/arm/mach-s3c2440/mach-rx1950.c | 2 +-
> arch/arm/mach-s3c2440/mach-rx3715.c | 2 +-
> arch/arm/mach-s3c2440/mach-smdk2440.c | 2 +-
> arch/arm/mach-s3c2440/s3c2440.c | 13 -------------
> arch/arm/mach-s3c2440/s3c244x.c | 11 +++++++++++
> arch/arm/plat-s3c24xx/dma.c | 2 +-
> arch/arm/plat-samsung/devs.c | 2 +-
> 15 files changed, 25 insertions(+), 25 deletions(-)

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
