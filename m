From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 03/15] drm/exynos/ipp: move file reference from memory to
 command node
Date: Tue, 26 Aug 2014 11:55:23 +0900
Message-ID: <53FBF71B.7070107@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
 <1408693946-15456-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408693946-15456-4-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On 08/22/2014 04:52 PM, Andrzej Hajda wrote:
> Command node should contain file reference to distinguish commands
> created by different processes.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.h | 2 ++
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> index 9770966..bbe9968 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -75,7 +75,6 @@ struct drm_exynos_ipp_mem_node {
>  	u32	prop_id;
>  	u32	buf_id;
>  	struct drm_exynos_ipp_buf_info	buf_info;
> -	struct drm_file		*filp;
>  };
>  
>  /*
> @@ -448,6 +447,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
>  	c_node->dev = dev;
>  	c_node->property = *property;
>  	c_node->state = IPP_STATE_IDLE;
> +	c_node->filp = file;
>  
>  	c_node->start_work = ipp_create_cmd_work();
>  	if (IS_ERR(c_node->start_work)) {
> @@ -645,7 +645,6 @@ static struct drm_exynos_ipp_mem_node
>  		}
>  	}
>  
> -	m_node->filp = file;
>  	mutex_lock(&c_node->mem_lock);
>  	list_add_tail(&m_node->list, &c_node->mem_list[qbuf->ops_id]);
>  	mutex_unlock(&c_node->mem_lock);
> @@ -677,7 +676,7 @@ static int ipp_put_mem_node(struct drm_device *drm_dev,

Then, could you remove file argument from exynos_drm_ipp_queue_buf() and
ipp_get_event()?

>  		unsigned long handle = m_node->buf_info.handles[i];
>  		if (handle)
>  			exynos_drm_gem_put_dma_addr(drm_dev, handle,
> -							m_node->filp);
> +							c_node->filp);
>  	}
>  
>  	/* delete list in queue */
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
> index 6f48d62..0311035 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
> @@ -62,6 +62,7 @@ struct drm_exynos_ipp_cmd_work {
>   * @stop_work: stop command work structure.
>   * @event_work: event work structure.
>   * @state: state of command node.
> + * @filp: associated file pointer.
>   */
>  struct drm_exynos_ipp_cmd_node {
>  	struct device		*dev;
> @@ -78,6 +79,7 @@ struct drm_exynos_ipp_cmd_node {
>  	struct drm_exynos_ipp_cmd_work *stop_work;
>  	struct drm_exynos_ipp_event_work *event_work;
>  	enum drm_exynos_ipp_state	state;
> +	struct drm_file	*filp;
>  };
>  
>  /*
> 
