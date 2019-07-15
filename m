From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 15/24] media: exynos4-is: Remove call to memset after
 dma_alloc_coherent
Date: Mon, 15 Jul 2019 11:01:21 +0200
Message-ID: <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
References: <20190715031851.6890-1-huangfq.daxian@gmail.com>
        <CGME20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715031851.6890-1-huangfq.daxian@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 7/15/19 05:18, Fuqian Huang wrote:
> In commit 518a2f1925c3
> ("dma-mapping: zero memory returned from dma_alloc_*"),
> dma_alloc_coherent has already zeroed the memory.
> So memset is not needed

I can't see any changes in the above mentioned commit that would
make dma_alloc_coherent() (arm_coherent_dma_alloc()) zeroing its
returned memory. Maybe you need to add a reference to some other
instead?

> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

>  drivers/media/platform/exynos4-is/fimc-is.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
> index e043d55133a3..77633e356305 100644
> --- a/drivers/media/platform/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> @@ -341,7 +341,6 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
>  		return -ENOMEM;
>  
>  	is->memory.size = FIMC_IS_CPU_MEM_SIZE;
> -	memset(is->memory.vaddr, 0, is->memory.size);
--
Thanks, 
Sylwester
