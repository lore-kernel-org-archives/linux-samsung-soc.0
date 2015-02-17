From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] Revert "drm/exynos: IOMMU support should not be
 selectable by user"
Date: Tue, 17 Feb 2015 21:18:28 +0100
Message-ID: <CABxcv=kdHsmQ1sjD8Ty6pjdH3HXeV+wjSRNBQC+7BM+EnaJbQg@mail.gmail.com>
References: <1424192294-16897-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424192294-16897-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, sw0312.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Charles,

On Tue, Feb 17, 2015 at 5:58 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> This reverts commit 8dcc14f82f06fce997e35f4c77ced9d4ed192f31.
>
> This patch causes this error on Arndale:

IMHO the commit you are referring is correct so it should not be
reverted but I also had the same error on different boards (Exynos5250
Snow, Exynos5420 Peach Pit and Exynos5800 Peach Pi).

So I posted a patch [0] today to disable Exnos IOMMU support in
exynos_defconfig until these issues gets fixed.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/17/163
