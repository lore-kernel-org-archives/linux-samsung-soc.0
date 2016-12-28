From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] of: reserved_mem: set dma_ops for devices using reserved
 mem
Date: Wed, 28 Dec 2016 11:55:05 +0100
Message-ID: <bf678798-e0f2-7688-7759-6b853289f6af@samsung.com>
References: <CGME20161221054333epcas5p1e27800790de041d997b4fb297cb759c3@epcas5p1.samsung.com>
 <1482299071-22637-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1482299071-22637-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pankaj,


On 2016-12-21 06:44, Pankaj Dubey wrote:
> From: Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> For some IPs, there may be virtual child devices created and for them its
> necessary to set the dma_ops if it's using reserved memory else it will call
> the dummy dma_ops during buffer operations for the child devices which will
> lead to memory mapping failure.
>
> Signed-off-by: Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> ---
>   drivers/of/of_reserved_mem.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 366d8c3..d507c35 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -354,6 +354,10 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
>   		mutex_lock(&of_rmem_assigned_device_mutex);
>   		list_add(&rd->list, &of_rmem_assigned_device_list);
>   		mutex_unlock(&of_rmem_assigned_device_mutex);
> +		/* ensure that dma_ops is set for virtual devices
> +		 * using reserved memory
> +		 */
> +		of_dma_configure(dev, np);
>   
>   		dev_info(dev, "assigned reserved memory node %s\n", rmem->name);
>   	} else {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
