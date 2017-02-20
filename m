From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 08/15] media: s5p-mfc: Move firmware allocation to DMA
 configure function
Date: Mon, 20 Feb 2017 10:49:20 -0300
Message-ID: <c1f92e80-5fd8-27af-c1c6-5160b81688b8@osg.samsung.com>
References: <1487597944-2000-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170220133914eucas1p1ed7898e67e5d580742875aceaac278e6@eucas1p1.samsung.com>
 <1487597944-2000-9-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1487597944-2000-9-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 02/20/2017 10:38 AM, Marek Szyprowski wrote:
> To complete DMA memory configuration for MFC device, allocation of the
> firmware buffer is needed, because some parameters are dependant on its base
> address. Till now, this has been handled in the s5p_mfc_alloc_firmware()
> function. This patch moves that logic to s5p_mfc_configure_dma_memory() to
> keep DMA memory related operations in a single place. This way
> s5p_mfc_alloc_firmware() is simplified and does what it name says. The
> other consequence of this change is moving s5p_mfc_alloc_firmware() call
> from the s5p_mfc_probe() function to the s5p_mfc_configure_dma_memory().
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
