From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 3/4] [media] exynos-scaler: Add m2m functionality for
 the SCALER driver
Date: Fri, 18 Oct 2013 11:11:36 +0200
Message-ID: <5260FB48.5030306@samsung.com>
References: <1380889594-10448-1-git-send-email-shaik.ameer@samsung.com>
 <1380889594-10448-4-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1380889594-10448-4-git-send-email-shaik.ameer@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Arun Kumar K' <arun.kk@samsung.com>
Cc: posciak@google.com, inki.dae@samsung.com, hverkuil@xs4all.nl
List-Id: linux-samsung-soc@vger.kernel.org

On 04/10/13 14:26, Shaik Ameer Basha wrote:
> This patch adds the Makefile and memory to memory (m2m) interface
> functionality for the SCALER driver.
> 
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>


> +static void scaler_m2m_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct scaler_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	scaler_dbg(ctx->scaler_dev, "ctx: %p, ctx->state: 0x%x",
> +				     ctx, ctx->state);
> +
> +	if (ctx->m2m_ctx)

You can remove this line.

> +		v4l2_m2m_buf_queue(ctx->m2m_ctx, vb);
> +}


Thanks,
Sylwester
