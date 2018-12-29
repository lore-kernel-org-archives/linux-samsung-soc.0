From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] media: s5p-jpeg: Check for fmt_ver_flag when doing fmt
 enumeration
Date: Sat, 29 Dec 2018 17:11:42 +0100
Message-ID: <e6a63771-8238-1822-d7bb-960649e8e359@gmail.com>
References: <20181229154602.25693-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229154602.25693-1-pawel.mikolaj.chmiel@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, andrzej.p@samsung.com
Cc: mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Paweł,

Thank you for the patch.

On 12/29/18 4:46 PM, Paweł Chmiel wrote:
> Previously when doing format enumeration, it was returning all
>   formats supported by driver, even if they're not supported by hw.
> Add missing check for fmt_ver_flag, so it'll be fixed and only those
>   supported by hw will be returned. Similar thing is already done
>   in s5p_jpeg_find_format.
> 
> It was found by using v4l2-compliance tool and checking result
>   of VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS test
> and using v4l2-ctl to get list of all supported formats.
> 
> Tested on s5pv210-galaxys (Samsung i9000 phone).
> 
> Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>   drivers/media/platform/s5p-jpeg/jpeg-core.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 3f9000b70385..232b75cf209f 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -1293,13 +1293,16 @@ static int s5p_jpeg_querycap(struct file *file, void *priv,
>   	return 0;
>   }
>   
> -static int enum_fmt(struct s5p_jpeg_fmt *sjpeg_formats, int n,
> +static int enum_fmt(struct s5p_jpeg_ctx *ctx,
> +		    struct s5p_jpeg_fmt *sjpeg_formats, int n,
>   		    struct v4l2_fmtdesc *f, u32 type)
>   {
>   	int i, num = 0;
> +	unsigned int fmt_ver_flag = ctx->jpeg->variant->fmt_ver_flag;
>   
>   	for (i = 0; i < n; ++i) {
> -		if (sjpeg_formats[i].flags & type) {
> +		if (sjpeg_formats[i].flags & type &&
> +			sjpeg_formats[i].flags & fmt_ver_flag) {
>   			/* index-th format of type type found ? */
>   			if (num == f->index)
>   				break;
> @@ -1326,10 +1329,10 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>   	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE)
> -		return enum_fmt(sjpeg_formats, SJPEG_NUM_FORMATS, f,
> +		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
>   				SJPEG_FMT_FLAG_ENC_CAPTURE);
>   
> -	return enum_fmt(sjpeg_formats, SJPEG_NUM_FORMATS, f,
> +	return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
>   					SJPEG_FMT_FLAG_DEC_CAPTURE);
>   }
>   
> @@ -1339,10 +1342,10 @@ static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
>   	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE)
> -		return enum_fmt(sjpeg_formats, SJPEG_NUM_FORMATS, f,
> +		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
>   				SJPEG_FMT_FLAG_ENC_OUTPUT);
>   
> -	return enum_fmt(sjpeg_formats, SJPEG_NUM_FORMATS, f,
> +	return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
>   					SJPEG_FMT_FLAG_DEC_OUTPUT);
>   }
>   
> 

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
