From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Wed, 30 Jul 2014 20:01:44 +0530
Message-ID: <CAEC9eQPv-D2ThnHR=FZiXJJisMf9NRqS-TJQKdZRjV45Y0Mjsw@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
 <20140730111931.GI29590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140730111931.GI29590@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 30, 2014 at 4:49 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sat, Jul 26, 2014 at 12:52:08AM +0530, Ajay Kumar wrote:
>> This patch tries to seperate drm_bridge implementation
>> into 2 parts, a drm part and a non_drm part.
>>
>> A set of helper functions are defined in this patch to make
>> bridge driver probe independent of the drm flow.
>>
>> The bridge devices register themselves on a lookup table
>> when they get probed by calling "drm_bridge_add_for_lookup".
>>
>> The parent encoder driver waits till the bridge is available in the
>> lookup table(by calling "of_drm_find_bridge") and then continues with
>> its initialization.
>>
>> The encoder driver should call "drm_bridge_attach_encoder" to pass on
>> the drm_device and the encoder pointers to the bridge object.
>>
>> Now that the drm_device pointer is available, the encoder then calls
>> "bridge->funcs->post_encoder_init" to allow the bridge to continue
>> registering itself with the drm core.
>>
>> Also, non driver model based ptn3460 driver is removed in this patch.
>
> Why is it removed in this patch? Can't you do this incrementally rather
> than remove the driver in this patch and add it again later? If you do
> it this way then we'll always have this one commit where devices that
> have a ptn3460 don't work, so it becomes impossible to bisect across
> this commit.
Ok. I will try to modify ptn3460 to support driver model in this patch itself.
And then, adding panel support, converting it to gpiod interface and other
cleanups should follow.

>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> [...]
>> +int drm_bridge_add_for_lookup(struct drm_bridge *bridge)
>> +{
>> +     mutex_lock(&bridge_lock);
>> +     list_add_tail(&bridge->head, &bridge_lookup);
>> +     mutex_unlock(&bridge_lock);
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_bridge_add_for_lookup);
>> +
>> +void drm_bridge_remove_from_lookup(struct drm_bridge *bridge)
>> +{
>> +     mutex_lock(&bridge_lock);
>> +     list_del_init(&bridge->head);
>> +     mutex_unlock(&bridge_lock);
>> +}
>> +EXPORT_SYMBOL(drm_bridge_remove_from_lookup);
>
> The "_for_lookup" and "_from_lookup" suffixes aren't useful in my
> opinion.
Ok. I will just remove the suffix.

>> +int drm_bridge_attach_encoder(struct drm_bridge *bridge,
>> +                             struct drm_encoder *encoder)
>
> And this could simply be "drm_bridge_attach()" since we'll only ever
> want to attach it to encoders.
Right.

>> +{
>> +     if (!bridge || !encoder)
>> +             return -EINVAL;
>> +
>> +     if (bridge->encoder)
>> +             return -EBUSY;
>> +
>> +     encoder->bridge = bridge;
>> +     bridge->encoder = encoder;
>> +     bridge->drm_dev = encoder->dev;
>
> Should this function perhaps call the bridge's ->post_encoder_init()?
> And it should probably call drm_bridge_init() too, since the DRM device
> is now available.
This will cleanup some code in both the drivers. I will change it.

>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> [...]
>
> Maybe since you're introducing a new drm_bridge.c file above already it
> would make sense to move out existing drm_bridge related code in a
> preparatory patch?
>
> Maybe Sean or Rob can comment on whether there was a specific reason to
> include it in drm_crtc.c in the first place.
>
>> @@ -1012,8 +1010,7 @@ int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
>>       if (ret)
>>               goto out;
>>
>> -     bridge->dev = dev;
>> -     bridge->funcs = funcs;
>> +     bridge->drm_dev = dev;
>
> This sets ->drm_dev, but it was already set in drm_bridge_attach(), so I
> think that's one more argument to call this function when attaching.
Point accepted.

>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> [...]
>> @@ -1370,7 +1361,7 @@ static const struct component_ops exynos_dp_ops = {
>>  static int exynos_dp_probe(struct platform_device *pdev)
>>  {
>>       struct device *dev = &pdev->dev;
>> -     struct device_node *panel_node;
>> +     struct device_node *panel_node, *bridge_node;
>
> Nit: I don't think you'll need two variables here, since once you've
> obtained the real panel or bridge objects you no longer need the OF
> nodes.
Right.

>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index e529b68..e5a41ad 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -619,6 +619,7 @@ struct drm_plane {
>>
>>  /**
>>   * drm_bridge_funcs - drm_bridge control functions
>> + * @post_encoder_init: called by the parent encoder
>
> Maybe rename this to "attach" to make it more obvious when exactly it's
> called?
"post_encoder_attach"?

>>   * @mode_fixup: Try to fixup (or reject entirely) proposed mode for this bridge
>>   * @disable: Called right before encoder prepare, disables the bridge
>>   * @post_disable: Called right after encoder prepare, for lockstepped disable
>> @@ -628,6 +629,7 @@ struct drm_plane {
>>   * @destroy: make object go away
>>   */
>>  struct drm_bridge_funcs {
>> +     int (*post_encoder_init)(struct drm_bridge *bridge);
>>       bool (*mode_fixup)(struct drm_bridge *bridge,
>>                          const struct drm_display_mode *mode,
>>                          struct drm_display_mode *adjusted_mode);
>> @@ -648,15 +650,19 @@ struct drm_bridge_funcs {
>>   * @base: base mode object
>>   * @funcs: control functions
>>   * @driver_private: pointer to the bridge driver's internal context
>> + * @connector_polled: polled flag needed for registering connector
>
> Can you explain why this new field is needed? It seems like a completely
> unrelated change.
How do I select this flag for the bridge chip?
Assume if I did select DRM_CONNECTOR_POLL_HPD, where to call
drm_helper_hpd_irq_event in the driver? Is post_encoder_init a right place?

Without the polled flag, I get display very late.
Please throw some light on this!

Ajay
