From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung devel-1 for v3.5
Date: Sat, 12 May 2012 22:27:17 -0700
Message-ID: <CAOesGMhwEpQstrM5Zc4ie=CX2BAoSsfAvJbZYxUpg66NUnxrjw@mail.gmail.com>
References: <4FAF0156.5080306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:56521 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750742Ab2EMF1R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 May 2012 01:27:17 -0400
Received: by dady13 with SMTP id y13so4634274dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 22:27:17 -0700 (PDT)
In-Reply-To: <4FAF0156.5080306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, May 12, 2012 at 5:33 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof
>
> Please pull Samsung devel for v3.5
>
> This is including exynos/iommu, platform of drm and fimc-lite, dma for
> exynos5250 and s3c24xx-hsspi.
>
> Note, the exynos/iommu patch got the ack from Joerg and this should be sent
> to upstream via arm tree and since it depends on cleanup-samsung-iommu, the
> cleanup branch is included(merged) in here.
>
> If any problems, please let me know.

Same here, I'll hold off pulling this until we've sorted out the
cleanup-samsung-iommu request.

Thanks,

-Olof
