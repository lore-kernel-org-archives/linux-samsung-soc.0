From: Federico Vaga <federico.vaga@gmail.com>
Subject: Re: [PATCH v5 1/3] videobuf2-dma-contig: user can specify GFP flags
Date: Thu, 10 Jan 2013 15:32:37 +0100
Message-ID: <2134637.remWHy6RQA@harkonnen>
References: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
 <1357822010-30419-2-git-send-email-federico.vaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1357822010-30419-2-git-send-email-federico.vaga@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Kamil Debski <k.debski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Pawel Osciak <pawel@osciak.com>, davinci-linux-open-source@linux.davincidsp.com, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm
List-Id: linux-samsung-soc@vger.kernel.org


>  struct vb2_dc_buf {
> @@ -165,7 +166,8 @@ static void *vb2_dc_alloc(void *alloc_ctx, unsigned long
> size) /* align image size to PAGE_SIZE */
>  	size = PAGE_ALIGN(size);
> 
> -	buf->vaddr = dma_alloc_coherent(dev, size, &buf->dma_addr, 
GFP_KERNEL);
> +	buf->vaddr = dma_alloc_coherent(dev, size, &buf->dma_addr,
> +									
GFP_KERNEL | conf->mem_flags);

Unfortunately, I forgot to remove this from Patch v4 series. I did not see it 
while re-reading the first time. I'll send a new patch series (v6). It should 
be:

buf->vaddr = dma_alloc_coherent(dev, size, &buf->dma_addr, conf->mem_flags);


I'm terribly sorry

-- 
Federico Vaga
