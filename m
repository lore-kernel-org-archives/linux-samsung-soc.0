From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 15/24] media: exynos4-is: Remove call to memset after
 dma_alloc_coherent
Date: Mon, 15 Jul 2019 13:44:16 +0200
Message-ID: <189ad2a0-c8ba-54f5-af34-5a0e8efee8fe@samsung.com>
References: <CGME20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd@eucas1p2.samsung.com>
        <20190715031851.6890-1-huangfq.daxian@gmail.com>
        <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
        <CABXRUiQ_N=N=weMnRea4d6PXjfghta=U1xhdv-tZpSvaGBnXGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABXRUiQ_N=N=weMnRea4d6PXjfghta=U1xhdv-tZpSvaGBnXGg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 7/15/19 11:43, Fuqian Huang wrote:
> Should I rewrite the commit log? Just mention that dma_alloc_coherent
> has already zeroed the memory and not to reference the commit?

I don't think it is really needed, since at hash 518a2f1925c3 dma_alloc_coherent() 
already zeroes the memory, so in fact all statements in your current commit 
message are true. 

-- 
Regards,
Sylwester
