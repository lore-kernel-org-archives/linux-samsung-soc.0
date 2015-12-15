From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/7] media: vb2-dma-contig: add helper for setting dma
 max seg size
Date: Tue, 15 Dec 2015 09:40:47 +0100
Message-ID: <566FD20F.9080605@samsung.com>
References: <1449669502-24601-1-git-send-email-m.szyprowski@samsung.com>
 <3238962.HlGfVT9mcy@avalon> <566E89D6.40603@samsung.com>
 <1604824.dB2dzDMl5I@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1604824.dB2dzDMl5I@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Laurent,

On 2015-12-14 16:50, Laurent Pinchart wrote:
> Hi Marek,
>
> On Monday 14 December 2015 10:20:22 Marek Szyprowski wrote:
>> On 2015-12-13 20:57, Laurent Pinchart wrote:
>>> On Wednesday 09 December 2015 14:58:19 Marek Szyprowski wrote:
>>>> Add a helper function for device drivers to set DMA's max_seg_size.
>>>> Setting it to largest possible value lets DMA-mapping API always create
>>>> contiguous mappings in DMA address space. This is essential for all
>>>> devices, which use dma-contig videobuf2 memory allocator and shared
>>>> buffers.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>> ---
>>>>
>>>>    drivers/media/v4l2-core/videobuf2-dma-contig.c | 15 +++++++++++++++
>>>>    include/media/videobuf2-dma-contig.h           |  1 +
>>>>    2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/videobuf2-dma-contig.c
>>>> b/drivers/media/v4l2-core/videobuf2-dma-contig.c index c331272..628518d
>>>> 100644
>>>> --- a/drivers/media/v4l2-core/videobuf2-dma-contig.c
>>>> +++ b/drivers/media/v4l2-core/videobuf2-dma-contig.c
>>>> @@ -742,6 +742,21 @@ void vb2_dma_contig_cleanup_ctx(void *alloc_ctx)
>>>>
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(vb2_dma_contig_cleanup_ctx);
>>>>
>>>> +int vb2_dma_contig_set_max_seg_size(struct device *dev, unsigned int
>>>> size)
>>>> +{
>>>> +	if (!dev->dma_parms) {
>>> When can this function be called with dev->dma_parms not NULL ?
>> When one loads a module with multimedia driver (which calls this
>> function), then unloads and loads it again. It is rather safe to have this
>> check.
> Don't you have a much bigger problem in that case ? When you unload the module
> the device will be unbound from the driver, causing the memory allocated by
> devm_kzalloc to be freed. dev->dma_parms will then point to freed memory,
> which will get reused by all subsequent calls to dma_get_max_seg_size(),
> dma_get_max_seg_size() & co (including the ones in this function).

You are right. I've thought that devm resources are freed on device 
release not
driver remove. Then probably the safest fix is to change devm_kzalloc 
back to
kzalloc.

>>>> +		dev->dma_parms = devm_kzalloc(dev, sizeof(dev->dma_parms),
>>>> +					      GFP_KERNEL);
>>>> +		if (!dev->dma_parms)
>>>> +			return -ENOMEM;
>>>> +	}
>>>> +	if (dma_get_max_seg_size(dev) < size)
>>>> +		return dma_set_max_seg_size(dev, size);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
>>>> +
>>>>    MODULE_DESCRIPTION("DMA-contig memory handling routines for
>>>>    videobuf2");
>>>>    MODULE_AUTHOR("Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>");
>>>>    MODULE_LICENSE("GPL");
>>>> diff --git a/include/media/videobuf2-dma-contig.h
>>>> b/include/media/videobuf2-dma-contig.h index c33dfa6..0e6ba64 100644
>>>> --- a/include/media/videobuf2-dma-contig.h
>>>> +++ b/include/media/videobuf2-dma-contig.h
>>>> @@ -26,6 +26,7 @@ vb2_dma_contig_plane_dma_addr(struct vb2_buffer *vb,
>>>> unsigned int plane_no)
>>>>   void *vb2_dma_contig_init_ctx(struct device *dev);
>>>>   void vb2_dma_contig_cleanup_ctx(void *alloc_ctx);
>>>> +int vb2_dma_contig_set_max_seg_size(struct device *dev, unsigned int
>>>> size);
>>>>   extern const struct vb2_mem_ops vb2_dma_contig_memops;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
