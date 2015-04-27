From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 1/2] drm/exynos: mixer: cleanup pixelformat handling
Date: Mon, 27 Apr 2015 14:06:10 +0200
Message-ID: <19c49fecc6ad402231725b2e718699fb@math.uni-bielefeld.de>
References: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1429791146-4410-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <5539A0EB.6060706@samsung.com>
 <aae08db4a8603a5109e5e3946e30e770@math.uni-bielefeld.de>
 <553DD843.9080209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:48597 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932517AbbD0MGN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 08:06:13 -0400
In-Reply-To: <553DD843.9080209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

On 2015-04-27 08:33, Joonyoung Shim wrote:
> Hi Tobias,
> 
> On 04/24/2015 05:10 PM, Tobias Jakobi wrote:
>> On 2015-04-24 03:48, Joonyoung Shim wrote:
>>> Hi Tobias,
>>> 
>>> On 04/23/2015 09:12 PM, Tobias Jakobi wrote:
>>>> Move the defines for the pixelformats that the mixer supports out
>>>> of mixer_graph_buffer() to the top of the source.
>>>> Then select the mixer pixelformat (pf) in mixer_graph_buffer() based 
>>>> on
>>>> the plane's pf (and not bpp).
>>>> Also add handling of RGB565 and XRGB1555 to the switch statement and
>>>> exit early if the plane has an unsupported pf.
>>>> 
>>>> Partially based on 'drm/exynos: enable/disable blend based on pixel
>>>> format' by Gustavo Padovan <gustavo.padovan@collabora.co.uk>.
>>>> 
>>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_mixer.c | 32 
>>>> ++++++++++++++++++++++----------
>>>>  1 file changed, 22 insertions(+), 10 deletions(-)
>>>> 
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c 
>>>> b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> index fbec750..1bd23ee 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> @@ -44,6 +44,12 @@
>>>>  #define MIXER_WIN_NR        3
>>>>  #define MIXER_DEFAULT_WIN    0
>>>> 
>>>> +/* The pixelformats that are natively supported by the mixer. */
>>>> +#define MIXER_PIXELFORMAT_RGB565 4
>>>> +#define MIXER_PIXELFORMAT_ARGB1555 5
>>>> +#define MIXER_PIXELFORMAT_ARGB4444 6
>>>> +#define MIXER_PIXELFORMAT_ARGB8888 7
>>>> +
>>> 
>>> Seems be long, how about s/PIXELFORMAT/FORMAT or just MIXER_RGB565 
>>> ... ?
>>> Please use tab between define name and value.
>> How about MXR_FORMAT_XYZ, to stay consistent with the regs-mixer 
>> header?
>> 
>> 
>>>>  struct mixer_resources {
>>>>      int            irq;
>>>>      void __iomem        *mixer_regs;
>>>> @@ -531,20 +537,26 @@ static void mixer_graph_buffer(struct 
>>>> mixer_context *ctx, int win)
>>>> 
>>>>      plane = &ctx->planes[win];
>>>> 
>>>> -    #define RGB565 4
>>>> -    #define ARGB1555 5
>>>> -    #define ARGB4444 6
>>>> -    #define ARGB8888 7
>>>> +    switch (plane->pixel_format) {
>>>> +    case DRM_FORMAT_XRGB4444:
>>>> +        fmt = MIXER_PIXELFORMAT_ARGB4444;
>>>> +        break;
>>>> +
>>>> +    case DRM_FORMAT_XRGB1555:
>>>> +        fmt = MIXER_PIXELFORMAT_ARGB1555;
>>>> +        break;
>>>> 
>>>> -    switch (plane->bpp) {
>>>> -    case 16:
>>>> -        fmt = ARGB4444;
>>>> +    case DRM_FORMAT_RGB565:
>>>> +        fmt = MIXER_PIXELFORMAT_RGB565;
>>>>          break;
>>>> -    case 32:
>>>> -        fmt = ARGB8888;
>>>> +
>>>> +    case DRM_FORMAT_XRGB8888:
>>>> +        fmt = MIXER_PIXELFORMAT_ARGB8888;
>>>>          break;
>>>> +
>>>>      default:
>>>> -        fmt = ARGB8888;
>>>> +        DRM_DEBUG_KMS("pixelformat unsupported by mixer\n");
>>>> +        return;
>>>>      }
>>>> 
>>>>      /* check if mixer supports requested scaling setup */
>>>> 
>>> 
>>> Hmm missing formats having alpha?
>>> DRM_FORMAT_ARGB4444
>>> DRM_FORMAT_ARGB1555
>>> DRM_FORMAT_ARGB8888
>> Should be obvious from my other mail. Blending/alpha is currently 
>> screwed up, so we shouldn't add these formats at this point. At least 
>> not before figuring out how to properly solve the issue.
>> 
> 
> It shouldn't mean to remove current supported feature(alpha pixel 
> format
> plane support of mixer driver).
Ah, I see what you mean! Going to send an updated version later this 
day.


With best wishes,
Tobias


> 
> Thanks.
