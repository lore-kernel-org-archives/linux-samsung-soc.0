From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v4 4/7] media: s5p-mfc: add iommu support
Date: Wed, 25 May 2016 11:55:18 -0400
Message-ID: <c73d0646-0b15-81a7-a2d9-e84da0920167@osg.samsung.com>
References: <1464096690-23605-1-git-send-email-m.szyprowski@samsung.com>
 <1464096690-23605-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1464096690-23605-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Uli Middelberg <uli@middelberg.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 05/24/2016 09:31 AM, Marek Szyprowski wrote:
> This patch adds support for IOMMU to s5p-mfc device driver. MFC firmware
> is limited and it cannot use the default configuration. If IOMMU is
> available, the patch disables the default DMA address space
> configuration and creates a new address space of size limited to 256M
> and base address set to 0x20000000.
> 
> For now the same address space is shared by both 'left' and 'right'
> memory channels, because the DMA/IOMMU frameworks do not support
> configuring them separately. This is not optimal, but besides limiting
> total address space available has no other drawbacks (MFC firmware
> supports 256M of address space per each channel).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
