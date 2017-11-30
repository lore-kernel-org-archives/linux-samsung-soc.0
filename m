From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2] drm/exynos: mixer: avoid Oops in vp_video_buffer()
Date: Thu, 30 Nov 2017 16:47:45 +0100
Message-ID: <1b6b79a8-b14b-a4cc-08e4-e161667af8a7@math.uni-bielefeld.de>
References: <CGME20171123141915epcas1p10059f0c2cac68466c86617272f441a55@epcas1p1.samsung.com>
 <20171123141900.30196-1-tjakobi@math.uni-bielefeld.de>
 <5A1FC6C5.8090603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:48701 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752367AbdK3Prs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 10:47:48 -0500
In-Reply-To: <5A1FC6C5.8090603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Inki Dae wrote:
> Hi Tobias,
> 
> Thanks for touching this code.
> 
> But I think below changes chould be explained exactly. Anyway, below are my comments,
> 
> 2017년 11월 23일 23:19에 Tobias Jakobi 이(가) 쓴 글:
>> If an interlaced video mode is selected, a IOMMU pagefault is
>> triggered by vp_video_buffer().
>>
>> Fix the most apparent bugs:
>> - pitch value for chroma plane
>> - divide by two of height and vpos
>>
>> This is more like a band-aid at this point. The VP plane is
>> still corrupted, but at least there are no more pagefaults.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 21 +++++++++++----------
>>  1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index dc5d79465f9b..a18426379e57 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -485,7 +485,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
>>  			chroma_addr[1] = chroma_addr[0] + 0x40;
>>  		} else {
>>  			luma_addr[1] = luma_addr[0] + fb->pitches[0];
>> -			chroma_addr[1] = chroma_addr[0] + fb->pitches[0];
>> +			chroma_addr[1] = chroma_addr[0] + fb->pitches[1];
> 
> chroma_addr[1] is set to VP_BOT_C_PTR register and datasheet says about this register,
> "specifies base address for Chrominance of bottom field"
> 
> Before that, we would need to look into NV12 pixel format and its video signal mode - interlaced or progressive.
You're mixing something up here. The buffer is (progressive) NV12, but the video
mode is interlaced.


> NV12 interfaced
> YYYYYYYYYY
> YYYYYYYYYY
> UVUVUVUVUV
> YYYYYYYYYY
> YYYYYYYYYY
> UVUVUVUVUV
> 
> NV12 progressive
> YYYYYYYYYY
> YYYYYYYYYY
> YYYYYYYYYY
> YYYYYYYYYY
> UVUVUVUVUV
> UVUVUVUVUV
> 
> As you can see above, the offset of the gem buffer should be decided according to video signal mode, and 'base address + the offset' should be set to chroma_addr[1] register properly. 
> 
> And also there would be one thing more we have to consider,
> User space can make two separated gem buffers - one is for luminance pixel data and other is for chrominance pixel data - and send them to KMS driver, or he can make one contiguous gem buffer which contains two kinds of pixel data and send it to KMS driver.
> 
> I guess now vp side of mixer driver didn't manage these buffers properly so page fault happened. So I think a good way for it would be to handle two kinds of buffers properly - one continuous buffer or two separated buffers - through exynos_drm_gem_fb_dma_addr function, and calculate the offset properly according to video signal mode - interfaced or progressive.
> 
> Regarding this, we had posted one patch and it had been merged to mainline. This patch added two new pixel formats, DRM_FORMAT_NV12M and DRM_FORMAT_YUV420M to judge how KMS driver should handle these gem buffers. 
> However, this patch had been reverted[1] by Ville due to breaking the ABI. So the only way to identify buffer type would be to check how many buffers are set to exynos_drm_fb object.
That's not related. In fact the second part (div by 2) is what actually removes
the pagefaults.

- Tobias



> [1] https://lists.freedesktop.org/archives/dri-devel/2012-April/021812.html
> 
> Thanks,
> Inki Dae
> 
>>  		}
>>  	} else {
>>  		luma_addr[1] = 0;
>> @@ -507,25 +507,26 @@ static void vp_video_buffer(struct mixer_context *ctx,
>>  	vp_reg_write(ctx, VP_IMG_SIZE_Y, VP_IMG_HSIZE(fb->pitches[0]) |
>>  		VP_IMG_VSIZE(fb->height));
>>  	/* chroma plane for NV12/NV21 is half the height of the luma plane */
>> -	vp_reg_write(ctx, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
>> +	vp_reg_write(ctx, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[1]) |
>>  		VP_IMG_VSIZE(fb->height / 2));
>>  
>>  	vp_reg_write(ctx, VP_SRC_WIDTH, state->src.w);
>> -	vp_reg_write(ctx, VP_SRC_HEIGHT, state->src.h);
>>  	vp_reg_write(ctx, VP_SRC_H_POSITION,
>>  			VP_SRC_H_POSITION_VAL(state->src.x));
>> -	vp_reg_write(ctx, VP_SRC_V_POSITION, state->src.y);
>>  
>> -	vp_reg_write(ctx, VP_DST_WIDTH, state->crtc.w);
>> -	vp_reg_write(ctx, VP_DST_H_POSITION, state->crtc.x);
>>  	if (test_bit(MXR_BIT_INTERLACE, &ctx->flags)) {
>> -		vp_reg_write(ctx, VP_DST_HEIGHT, state->crtc.h / 2);
>> -		vp_reg_write(ctx, VP_DST_V_POSITION, state->crtc.y / 2);
>> +		vp_reg_write(ctx, VP_SRC_HEIGHT, state->src.h / 2);
>> +		vp_reg_write(ctx, VP_SRC_V_POSITION, state->src.y / 2);
>>  	} else {
>> -		vp_reg_write(ctx, VP_DST_HEIGHT, state->crtc.h);
>> -		vp_reg_write(ctx, VP_DST_V_POSITION, state->crtc.y);
>> +		vp_reg_write(ctx, VP_SRC_HEIGHT, state->src.h);
>> +		vp_reg_write(ctx, VP_SRC_V_POSITION, state->src.y);
>>  	}
>>  
>> +	vp_reg_write(ctx, VP_DST_WIDTH, state->crtc.w);
>> +	vp_reg_write(ctx, VP_DST_H_POSITION, state->crtc.x);
>> +	vp_reg_write(ctx, VP_DST_HEIGHT, state->crtc.h);
>> +	vp_reg_write(ctx, VP_DST_V_POSITION, state->crtc.y);
>> +
>>  	vp_reg_write(ctx, VP_H_RATIO, state->h_ratio);
>>  	vp_reg_write(ctx, VP_V_RATIO, state->v_ratio);
>>  
>>
