From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] [media] s5p-jpeg: Adding Exynos7 Jpeg variant support
Date: Wed, 07 Jan 2015 10:45:23 +0100
Message-ID: <54AD0033.1020103@samsung.com>
References: <1418801229-7532-1-git-send-email-tony.kn@samsung.com>
 <54919010.8020507@samsung.com> <001801d01b3d$2cb181d0$86148570$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <001801d01b3d$2cb181d0$86148570$@samsung.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony K Nadackal <tony.kn-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bhushan.r-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tony,

Sorry for late response, just got back from vacation.

On 12/19/2014 04:37 AM, Tony K Nadackal wrote:
> Hi Jacek,
>
> On Wednesday, December 17, 2014 7:46 PM Jacek Anaszewski wrote,
>> Hi Tony,
>>
>> Thanks for the patches.
>>
>
> Thanks for the review.
>
>> Please process them with scripts/checkpatch.pl as you will be submitting the
> next
>> version - they contain many coding style related issues.
>>
>
> I ran checkpatch before posting. Do you find any checkpatch related issues in
> the patch?

There was a problem on my side, sorry for making confusion.

>> My remaining comments below.
>>
>
> [snip]
>
>>> +		if (ctx->jpeg->variant->version == SJPEG_EXYNOS7) {
>>> +			exynos4_jpeg_set_interrupt(jpeg->regs,
>> SJPEG_EXYNOS7);
>>> +			exynos4_jpeg_set_enc_out_fmt(jpeg->regs,
>>> +					ctx->subsampling,
>> EXYNOS7_ENC_FMT_MASK);
>>> +			exynos4_jpeg_set_img_fmt(jpeg->regs,
>>> +					ctx->out_q.fmt->fourcc,
>>> +					EXYNOS7_SWAP_CHROMA_SHIFT);
>>> +		} else {
>>> +			exynos4_jpeg_set_interrupt(jpeg->regs,
>> SJPEG_EXYNOS4);
>>> +			exynos4_jpeg_set_enc_out_fmt(jpeg->regs,
>>> +					ctx->subsampling,
>> EXYNOS4_ENC_FMT_MASK);
>>> +			exynos4_jpeg_set_img_fmt(jpeg->regs,
>>> +					ctx->out_q.fmt->fourcc,
>>> +					EXYNOS4_SWAP_CHROMA_SHIFT);
>>> +		}
>>> +
>>
>> I'd implement it this way:
>>
>> exynos4_jpeg_set_interrupt(jpeg->regs, ctx->jpeg->variant->version);
>> exynos4_jpeg_set_enc_out_fmt(jpeg->regs, ctx->subsampling,
>> 			(ctx->jpeg->variant->version == SJPEG_EXYNOS4) ?
>> 				EXYNOS4_ENC_FMT_MASK :
>> 				EXYNOS7_ENC_FMT_MASK);
>> exynos4_jpeg_set_img_fmt(jpeg->regs, ctx->out_q.fmt->fourcc,
>> 			(ctx->jpeg->variant->version == SJPEG_EXYNOS4) ?
>> 				EXYNOS4_SWAP_CHROMA_SHIFT :
>> 				EXYNOS7_SWAP_CHROMA_SHIFT);
>>
>
> OK. Looks goods to me. Thanks for the suggestion.
>
>>>    		exynos4_jpeg_set_img_addr(ctx);
>>>    		exynos4_jpeg_set_jpeg_addr(ctx);
>>>    		exynos4_jpeg_set_encode_hoff_cnt(jpeg->regs,
>>>    							ctx->out_q.fmt->fourcc);
>>>    	} else {
>>>    		exynos4_jpeg_sw_reset(jpeg->regs);
>>> -		exynos4_jpeg_set_interrupt(jpeg->regs);
>>>    		exynos4_jpeg_set_img_addr(ctx);
>>>    		exynos4_jpeg_set_jpeg_addr(ctx);
>>> -		exynos4_jpeg_set_img_fmt(jpeg->regs, ctx->cap_q.fmt-
>>> fourcc);
>>>
>>> -		bitstream_size = DIV_ROUND_UP(ctx->out_q.size, 32);
>>> +		if (ctx->jpeg->variant->version == SJPEG_EXYNOS7) {
>>> +			exynos4_jpeg_set_interrupt(jpeg->regs,
>> SJPEG_EXYNOS7);
>>> +			exynos4_jpeg_set_huff_tbl(jpeg->regs);
>>> +			exynos4_jpeg_set_huf_table_enable(jpeg->regs, 1);
>>> +
>>> +			/*
>>> +			 * JPEG IP allows storing 4 quantization tables
>>> +			 * We fill table 0 for luma and table 1 for chroma
>>> +			 */
>>> +			exynos4_jpeg_set_qtbl_lum(jpeg->regs,
>>> +							ctx->compr_quality);
>>> +			exynos4_jpeg_set_qtbl_chr(jpeg->regs,
>>> +							ctx->compr_quality);
>>
>> Is it really required to setup quantization tables for encoding?
>>
>
> Without setting up the quantization tables, encoder is working fine.
> But, as per Exynos7 User Manual setting up the quantization tables are required
> for encoding also.

Actually I intended to ask if setting the quantization tables is
required for *decoding*, as you set it also in decoding path, whereas
for Exynos4 it is not required. I looks strange for me as quantization
tables are usually required only for encoding raw images.
The same is related to huffman tables.

>>> +			exynos4_jpeg_set_stream_size(jpeg->regs, ctx-
>>> cap_q.w,
>>> +					ctx->cap_q.h);
>>
>> For exynos4 this function writes the number of samples per line and number
>> lines of the resulting JPEG image and is used only during encoding. Is the
>> semantics of the related register different in case of Exynos7?
>>
>
> Yes. In case of Exynos7 Encoding, This step is required.

Ack.

> [snip]
>
>>> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.h
>>> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.h
>>> @@ -71,6 +71,7 @@
>>>    #define SJPEG_S5P		1
>>>    #define SJPEG_EXYNOS3250	2
>>>    #define SJPEG_EXYNOS4		3
>>> +#define SJPEG_EXYNOS7		4
>>
>> As you adding a new variant I propose to turn these macros into enum.
>>
>
> Ok. I will make this change in my next version.

Thanks.

> [snip]
>
>>> -void exynos4_jpeg_set_interrupt(void __iomem *base)
>>> +void exynos4_jpeg_set_interrupt(void __iomem *base, unsigned int
>>> +version)
>>>    {
>>> -	writel(EXYNOS4_INT_EN_ALL, base + EXYNOS4_INT_EN_REG);
>>> +	unsigned int reg;
>>> +
>>> +	reg = readl(base + EXYNOS4_INT_EN_REG) &
>> ~EXYNOS4_INT_EN_MASK(version);
>>> +	writel(EXYNOS4_INT_EN_ALL(version), base + EXYNOS4_INT_EN_REG);
>>>    }
>>
>> I believe that adding readl is a fix. I'd enclose it into separate patch and
> explain its
>> merit.
>>
>
> Thanks for the suggestion.  I will make a separate patch for this bug fix.

Great.

-- 
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
