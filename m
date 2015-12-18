From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v3 2/7] drm/exynos: make zpos property configurable
Date: Fri, 18 Dec 2015 09:22:05 +0900
Message-ID: <567351AD.4000908@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-3-git-send-email-m.szyprowski@samsung.com>
 <5672242F.4070801@samsung.com> <5672B323.1000207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33863 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752424AbbLRAWM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Dec 2015 19:22:12 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZJ00IB82CYS420@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Dec 2015 09:22:10 +0900 (KST)
In-reply-to: <5672B323.1000207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, =?UTF-8?B?67CV67O0656M?= <boram1288.park@samsung.com>

On 12/17/2015 10:05 PM, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-12-17 03:55, Joonyoung Shim wrote:
>> +Cc: Boram Park,
>>
>> Hi Marek,
>>
>> On 12/16/2015 09:21 PM, Marek Szyprowski wrote:
>>> This patch adds all infrastructure to make zpos plane property
>>> configurable from userspace.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_drv.h   |  4 ++-
>>>   drivers/gpu/drm/exynos/exynos_drm_plane.c | 51 ++++++++++++++++++++++++++++---
>>>   2 files changed, 49 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> index 588b6763f9c7..f0827dbebb7d 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> @@ -64,6 +64,7 @@ struct exynos_drm_plane_state {
>>>       struct exynos_drm_rect src;
>>>       unsigned int h_ratio;
>>>       unsigned int v_ratio;
>>> +    unsigned int zpos;
>>>   };
>>>     static inline struct exynos_drm_plane_state *
>>> @@ -91,11 +92,12 @@ struct exynos_drm_plane {
>>>     #define EXYNOS_DRM_PLANE_CAP_DOUBLE    (1 << 0)
>>>   #define EXYNOS_DRM_PLANE_CAP_SCALE    (1 << 1)
>>> +#define EXYNOS_DRM_PLANE_CAP_ZPOS    (1 << 2)
>>>     /*
>>>    * Exynos DRM plane configuration structure.
>>>    *
>>> - * @zpos: z-position of the plane.
>>> + * @zpos: initial z-position of the plane.
>>>    * @type: type of the plane (primary, cursor or overlay).
>>>    * @pixel_formats: supported pixel formats.
>>>    * @num_pixel_formats: number of elements in 'pixel_formats'.
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> index fd6cb4cee01a..a2bdab836b50 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> @@ -124,6 +124,7 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
>>>     static void exynos_drm_plane_reset(struct drm_plane *plane)
>>>   {
>>> +    struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
>>>       struct exynos_drm_plane_state *exynos_state;
>>>         if (plane->state) {
>>> @@ -136,6 +137,7 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
>>>         exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
>>>       if (exynos_state) {
>>> +        exynos_state->zpos = exynos_plane->config->zpos;
>>>           plane->state = &exynos_state->base;
>>>           plane->state->plane = plane;
>>>       }
>>> @@ -153,6 +155,7 @@ exynos_drm_plane_duplicate_state(struct drm_plane *plane)
>>>           return NULL;
>>>         __drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
>>> +    copy->zpos = exynos_state->zpos;
>>>       return &copy->base;
>>>   }
>>>   @@ -165,13 +168,53 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
>>>       kfree(old_exynos_state);
>>>   }
>>>   +static int exynos_drm_plane_atomic_set_property(struct drm_plane *plane,
>>> +                        struct drm_plane_state *state,
>>> +                        struct drm_property *property,
>>> +                        uint64_t val)
>>> +{
>>> +    struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
>>> +    struct exynos_drm_plane_state *exynos_state =
>>> +                    to_exynos_plane_state(state);
>>> +    struct exynos_drm_private *dev_priv = plane->dev->dev_private;
>>> +    const struct exynos_drm_plane_config *config = exynos_plane->config;
>>> +
>>> +    if (property == dev_priv->plane_zpos_property &&
>>> +        (config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS))
>>> +        exynos_state->zpos = val;
>>> +    else
>>> +        return -EINVAL;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int exynos_drm_plane_atomic_get_property(struct drm_plane *plane,
>>> +                      const struct drm_plane_state *state,
>>> +                      struct drm_property *property,
>>> +                      uint64_t *val)
>>> +{
>>> +    const struct exynos_drm_plane_state *exynos_state =
>>> +        container_of(state, const struct exynos_drm_plane_state, base);
>>> +    struct exynos_drm_private *dev_priv = plane->dev->dev_private;
>>> +
>>> +    if (property == dev_priv->plane_zpos_property)
>>> +        *val = exynos_state->zpos;
>>> +    else
>>> +        return -EINVAL;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static struct drm_plane_funcs exynos_plane_funcs = {
>>>       .update_plane    = drm_atomic_helper_update_plane,
>>>       .disable_plane    = drm_atomic_helper_disable_plane,
>>>       .destroy    = drm_plane_cleanup,
>>> +    .set_property    = drm_atomic_helper_plane_set_property,
>>>       .reset        = exynos_drm_plane_reset,
>>>       .atomic_duplicate_state = exynos_drm_plane_duplicate_state,
>>>       .atomic_destroy_state = exynos_drm_plane_destroy_state,
>>> +    .atomic_set_property = exynos_drm_plane_atomic_set_property,
>>> +    .atomic_get_property = exynos_drm_plane_atomic_get_property,
>>>   };
>>>     static int
>>> @@ -267,8 +310,8 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
>>>         prop = dev_priv->plane_zpos_property;
>>>       if (!prop) {
>>> -        prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
>>> -                         "zpos", 0, MAX_PLANE - 1);
>>> +        prop = drm_property_create_range(dev, 0, "zpos",
>>> +                         0, MAX_PLANE - 1);
>> User are using zpos property as index now, if we make zpos property
>> configurable, i think we need a property immutable like index or a
>> property like type or name that can know this plane is which plane
>> (e.g. video plane or graphic plane).
> 
> I don't get this. zpos property is attached only to OVERLAY planes, PRIMARY and CURSOR don't have it, so userspace cannot rely on this property. In my patch the initial zpos value is same as before, so if application doesn't relies on zpos values, it will get the same values as now. Application can also check the plane type by reading 'type' property (PRIMARY, OVERLAY or CURSOR). However after my patch application will get the possibility to rearrange plane order for the given crtc by chaning zpos values. That's especially useful to configure 2 typical use cases: PRIMARY plane over OVERLAY plane (PRIMARY is used as typical on-screen-display) or OVERLAY plane over PRIMARY (OVERLAY is used as a window for displaying video data).
> 
>> Another way, user may be possible to check plane index as order of
>> plane object id.
> 
> Application can easily find all the planes, which belongs to given crtc by checking 'possible crtcs' plane parameter, I see no additional need for 'index' property in such case. Please note that the initial plane configuration in case of atomic api will be always the same for all application (determined by exynos_drm_plane_reset function) and it will match the current setup.
> 

Thing i want to say is user needs to know which plane is for grahpic0,
grahpic1 and video if they belong to mixer but it seems to be enough
as the information that user decides to use which plane, possible crtcs,
type property, pixel formats supported and zpos.

Thanks.
