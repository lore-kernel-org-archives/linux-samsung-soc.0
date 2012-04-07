From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] of/irq: add empty irq_of_parse_and_map() for non-dt
 builds
Date: Fri, 06 Apr 2012 20:57:48 -0700
Message-ID: <20120407035748.F261E3E24EC@localhost>
References: <1332687769-3127-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1332687769-3127-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 25 Mar 2012 20:32:49 +0530, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Add a empty irq_of_parse_and_map() function that returns 0 for non-dt
> builds and avoid having #ifdef CONFIG_OF around all calls to
> irq_of_parse_and_map(). In addition to that, the irq_of_parse_and_map()
> function declaration is made available only if CONFIG_OF_IRQ is defined,
> which is the same config option that makes the irq_of_parse_and_map()
> function definition available. While at it, fix a typo as well.
> 
> Suggested-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Oops, I applied the wrong one.  I've applied this one now instead.

> ---
> Changes since v1:
> - Moved irq_of_parse_and_map() function declaration under CONFIG_OF_IRQ.
> - Fix a minor typo in comments.

BTW; For patches submitted to me, keep the changelog above the s-o-b lines
so it gets included in the commit.

g.

> 
>  include/linux/of_irq.h |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index d229ad3..11d57e4 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -10,14 +10,14 @@ struct of_irq;
>  #include <linux/ioport.h>
>  #include <linux/of.h>
>  
> +#if defined(CONFIG_OF_IRQ)
>  /*
> - * irq_of_parse_and_map() is used ba all OF enabled platforms; but SPARC
> + * irq_of_parse_and_map() is used by all OF enabled platforms; but SPARC
>   * implements it differently.  However, the prototype is the same for all,
>   * so declare it here regardless of the CONFIG_OF_IRQ setting.
>   */
>  extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
>  
> -#if defined(CONFIG_OF_IRQ)
>  /**
>   * of_irq - container for device_node/irq_specifier pair for an irq controller
>   * @controller: pointer to interrupt controller device tree node
> @@ -76,5 +76,11 @@ extern struct device_node *of_irq_find_parent(struct device_node *child);
>  extern void of_irq_init(const struct of_device_id *matches);
>  
>  #endif /* CONFIG_OF_IRQ */
> +#else /* CONFIG_OF */
> +static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
> +						int index)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_OF */
>  #endif /* __OF_IRQ_H */
> -- 
> 1.6.6.rc2
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
