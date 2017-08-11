From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 4/8] drm/exynos: mixer: remove src offset from
 mixer_graph_buffer()
Date: Fri, 11 Aug 2017 13:43:46 +0200
Message-ID: <a392e63d-10d6-6ac0-dab7-b16d2f86b03f@math.uni-bielefeld.de>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
 <CGME20170809115026epcas2p4ea35e8ab1206b0f5ebbddf48d9855132@epcas2p4.samsung.com>
 <20170809114857.4945-5-tjakobi@math.uni-bielefeld.de>
 <598D66DE.2090006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59186 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752877AbdHKLns (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 07:43:48 -0400
In-Reply-To: <598D66DE.2090006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Inki Dae wrote:
> 
> 
> 2017년 08월 09일 20:48에 Tobias Jakobi 이(가) 쓴 글:
>> We always translate the dma address such that the offsets of
>> the source image are zero. Hence we can remove manipulation of
>> the MXR_GRAPHIC_SXY(win) register.
>>
>> We leave the register defines (in regs_mixer.h) in place, since
>> they document the hardware.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 11 ++---------
>>  1 file changed, 2 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index 8d68de85bada..28fbe79befff 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -584,7 +584,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>>  	unsigned long flags;
>>  	unsigned int win =lane->index;
>>  	unsigned int x_ratio =, y_ratio = 0;
>> -	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
>> +	unsigned int dst_x_offset, dst_y_offset;
>>  	dma_addr_t dma_addr;
>>  	unsigned int fmt;
>>  	u32 val;
>> @@ -618,12 +618,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>>  	dst_x_offset =tate->crtc.x;
>>  	dst_y_offset =tate->crtc.y;
>>  
>> -	/* converting dma address base and source offset */
>> +	/* translate dma address base s.t. the source image offset is zero */
>>  	dma_addr =xynos_drm_fb_dma_addr(fb, 0)
>>  		+ (state->src.x * fb->format->cpp[0])
>>  		+ (state->src.y * fb->pitches[0]);
>> -	src_x_offset =;
>> -	src_y_offset =;
>>  
>>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>  		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
>> @@ -654,11 +652,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>>  	val |=XR_GRP_WH_V_SCALE(y_ratio);
>>  	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
>>  
>> -	/* setup offsets in source image */
>> -	val  =XR_GRP_SXY_SX(src_x_offset);
>> -	val |=XR_GRP_SXY_SY(src_y_offset);
>> -	mixer_reg_write(res, MXR_GRAPHIC_SXY(win), val);
> 
> The offset of source buffer can be set at bootloader so previous value can be keeped. I think MXR_GRAPHIC_SXY register should be cleared at mixer_win_reset function if you want to remove above lines.
> 
Good idea, will do so.

- Tobias


>> -
>>  	/* setup offsets in display image */
>>  	val  =XR_GRP_DXY_DX(dst_x_offset);
>>  	val |=XR_GRP_DXY_DY(dst_y_offset);
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
