From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 15/15] drm/exynos/fimc: fix source buffer registers
Date: Tue, 26 Aug 2014 15:47:45 +0900
Message-ID: <53FC2D91.3020103@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
 <1408693946-15456-16-git-send-email-a.hajda@samsung.com>
 <53FC21DF.1010504@samsung.com> <53FC2AA1.7030605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53FC2AA1.7030605@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/26/2014 03:35 PM, Andrzej Hajda wrote:
> On 08/26/2014 07:57 AM, Joonyoung Shim wrote:
>> Hi Andrzej,
>>
>> On 08/22/2014 04:52 PM, Andrzej Hajda wrote:
>>> FIMC in default mode of operation uses only one input buffer,
>>> but the driver used also second buffer, as a result only the
>>> first frame was processed correctly. The patch fixes it.
>> I can't understand well, then we don't need to distinguish buf_id in
>> fimc_src_set_addr()?
> Yes. FIMC in default operation mode uses only one input buffer pointer
> which should
> be updated when processing of the previous buffer has been finished.
> 
> There exists also ping-pong mode which uses two buffer pointers, as I
> have spotted in
> specs. However I have not seen it was implemented neither in drm,
> neither in camera drivers.
> I will try to implement it later.

OK if operation is no problem, and i think it's better to add comments
about this.

> 
> Regards
> Andrzej
> 
>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_fimc.c | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>>> index b20078e..e985253 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
>>> @@ -720,24 +720,24 @@ static int fimc_src_set_addr(struct device *dev,
>>>  	case IPP_BUF_ENQUEUE:
>>>  		config = &property->config[EXYNOS_DRM_OPS_SRC];
>>>  		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
>>> -			EXYNOS_CIIYSA(buf_id));
>>> +			EXYNOS_CIIYSA0);
>>>  
>>>  		if (config->fmt == DRM_FORMAT_YVU420) {
>>>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
>>> -				EXYNOS_CIICBSA(buf_id));
>>> +				EXYNOS_CIICBSA0);
>>>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
>>> -				EXYNOS_CIICRSA(buf_id));
>>> +				EXYNOS_CIICRSA0);
>>>  		} else {
>>>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
>>> -				EXYNOS_CIICBSA(buf_id));
>>> +				EXYNOS_CIICBSA0);
>>>  			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
>>> -				EXYNOS_CIICRSA(buf_id));
>>> +				EXYNOS_CIICRSA0);
>>>  		}
>>>  		break;
>>>  	case IPP_BUF_DEQUEUE:
>>> -		fimc_write(ctx, 0x0, EXYNOS_CIIYSA(buf_id));
>>> -		fimc_write(ctx, 0x0, EXYNOS_CIICBSA(buf_id));
>>> -		fimc_write(ctx, 0x0, EXYNOS_CIICRSA(buf_id));
>>> +		fimc_write(ctx, 0x0, EXYNOS_CIIYSA0);
>>> +		fimc_write(ctx, 0x0, EXYNOS_CIICBSA0);
>>> +		fimc_write(ctx, 0x0, EXYNOS_CIICRSA0);
>>>  		break;
>>>  	default:
>>>  		/* bypass */
>>>
>>
> 
> 
