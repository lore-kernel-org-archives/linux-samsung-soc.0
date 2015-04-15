From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [RFC 3/6] drm/exynos: introduce struct exynos_drm_plane_config
Date: Wed, 15 Apr 2015 22:23:21 +0200
Message-ID: <552EC8B9.40405@math.uni-bielefeld.de>
References: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1429110120-7043-4-git-send-email-tjakobi@math.uni-bielefeld.de> <20150415201451.GC29804@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57143 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754913AbbDOUX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 16:23:27 -0400
In-Reply-To: <20150415201451.GC29804@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello Gustavo!

Gustavo Padovan wrote:
> Hi Tobias,
> 
> 2015-04-15 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
> 
>> This struct encapsulates the configuration for a plane
>> object. The pixel format config is currently unused.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 17 ++++++++++-------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h    | 19 +++++++++++++++++++
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 17 ++++++++++-------
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c  | 14 +++++++-------
>>  drivers/gpu/drm/exynos/exynos_drm_plane.h  |  3 +--
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 17 ++++++++++-------
>>  drivers/gpu/drm/exynos/exynos_mixer.c      | 17 ++++++++++-------
>>  7 files changed, 67 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> index 84a3638..ca70599 100644
>> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> @@ -756,8 +756,8 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>>  	struct decon_context *ctx = dev_get_drvdata(dev);
>>  	struct drm_device *drm_dev = data;
>>  	struct exynos_drm_plane *exynos_plane;
>> -	enum drm_plane_type type;
>> -	unsigned int zpos;
>> +	struct exynos_drm_plane_config plane_config = { 0 };
>> +	unsigned int i;
>>  	int ret;
>>  
>>  	ret = decon_ctx_initialize(ctx, drm_dev);
>> @@ -766,11 +766,14 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>>  		return ret;
>>  	}
>>  
>> -	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
>> -		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
>> -						DRM_PLANE_TYPE_OVERLAY;
>> -		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
>> -					1 << ctx->pipe, type, zpos);
>> +	plane_config.possible_crtcs = 1 << ctx->pipe;
>> +
>> +	for (i = 0; i < WINDOWS_NR; i++) {
>> +		plane_config.type = (i == ctx->default_win) ?
>> +			DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
>> +		plane_config.zpos = i;
>> +
>> +		ret = exynos_plane_init(drm_dev, &ctx->planes[i], &plane_config);
>>  		if (ret)
>>  			return ret;
>>  	}
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index 4c14a89..35698f3 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -116,6 +116,25 @@ struct exynos_drm_plane {
>>  };
>>  
>>  /*
>> + * Exynos DRM plane configuration structure.
>> + *
>> + * @possible_crtcs: bitfield describing the valid CRTCs
>> + *			for this plane.
>> + * @type: plane type (primary, overlay, etc.)
>> + * @zpos: z-position of the plane.
>> + * @pixel_formats: supported pixel formats.
>> + * @num_pixel_formats: number of elements in 'pixel_formats'.
>> + */
>> +
>> +struct exynos_drm_plane_config {
>> +	unsigned long possible_crtcs;
>> +	enum drm_plane_type type;
>> +	unsigned int zpos;
>> +	const uint32_t *pixel_formats;
>> +	unsigned int num_pixel_formats;
>> +};
> 
> As a follow up of my atomic series I started cleaning up exynos drm a bit more
> and right now I'm removing most of struct exynos_drm_plane. Most of the plane
> information there is also present in plane->state thus I'm basically removing
> all the duplicated information there.
Sounds like a good plan.


> That said, I think we avoid creating exynos_drm_plane_config and stuff
> everything directly in struct exynos_drm_plane, it will be quite small and
> easier to manipulate.
So that would imply that we then just have:
int exynos_plane_init(struct drm_device *dev, struct exynos_drm_plane
*exynos_plane);

Correct?

Anyway, I'm going to wait then until the cleanups are posted and rebase
this series onto it.

With best wishes,
Tobias
