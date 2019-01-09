From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] media: s5p-jpeg: Correct step and max values for
 V4L2_CID_JPEG_RESTART_INTERVAL
Date: Wed, 9 Jan 2019 21:50:45 +0100
Message-ID: <843c632a-0804-8a30-0002-a87b85de1ed3@gmail.com>
References: <20190109180041.31052-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109180041.31052-1-pawel.mikolaj.chmiel@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, andrzej.p@samsung.com
Cc: mchehab@kernel.org, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Paweł,

Thank you for the patch.

On 1/9/19 7:00 PM, Paweł Chmiel wrote:
> This commit corrects max and step values for v4l2 control for
> V4L2_CID_JPEG_RESTART_INTERVAL. Max should be 0xffff and step should be 1.
> It was found by using v4l2-compliance tool and checking result of
> VIDIOC_QUERY_EXT_CTRL/QUERYMENU test.
> Previously it was complaining that step was bigger than difference
> between max and min.
> 
> Fixes: 15f4bc3b1f42 ("[media] s5p-jpeg: Add JPEG controls support")
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>   drivers/media/platform/s5p-jpeg/jpeg-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 3f9000b70385..33e9927db9a0 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -2002,7 +2002,7 @@ static int s5p_jpeg_controls_create(struct s5p_jpeg_ctx *ctx)
>   
>   		v4l2_ctrl_new_std(&ctx->ctrl_handler, &s5p_jpeg_ctrl_ops,
>   				  V4L2_CID_JPEG_RESTART_INTERVAL,
> -				  0, 3, 0xffff, 0);
> +				  0, 0xffff, 1, 0);
>   		if (ctx->jpeg->variant->version == SJPEG_S5P)
>   			mask = ~0x06; /* 422, 420 */
>   	}
> 

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
