From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [RFC V2 3/3] drm/bridge: ptn3460: support bridge chaining
Date: Tue, 6 May 2014 13:05:25 -0700
Message-ID: <CAOw6vb+J8t3v81xH5yHJtRsQDT0dVW2Aho3HMz6esNYQmxRJRA@mail.gmail.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399319548-16567-4-git-send-email-ajaykumar.rs@samsung.com>
 <CAOw6vbJH7bh7OcN8wN6YTbXrYutYqMPyf3SL63fx6ay9dL8eVQ@mail.gmail.com>
 <CAEC9eQPLzjbvAnK2oO0q5TtqqetGVNCXM6mk50-Hcxfiu5LeoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPLzjbvAnK2oO0q5TtqqetGVNCXM6mk50-Hcxfiu5LeoA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 6, 2014 at 1:03 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> Sean,
>
>
> On Tue, May 6, 2014 at 9:24 PM, Sean Paul <seanpaul@chromium.org> wrote:
>> On Mon, May 5, 2014 at 12:52 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>>> modify the driver to call the bridge->funcs of the next bridge
>>> in the chain.
>>> We assume that the bridge sitting next to ptn3460 is a bridge-panel.
>>>
>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>> ---
>>>  drivers/gpu/drm/bridge/ptn3460.c | 21 +++++++++++++++++----
>>>  1 file changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
>>> index b171901..969869a 100644
>>> --- a/drivers/gpu/drm/bridge/ptn3460.c
>>> +++ b/drivers/gpu/drm/bridge/ptn3460.c
>>> @@ -126,6 +126,8 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>>>                 gpio_set_value(ptn_bridge->gpio_rst_n, 1);
>>>         }
>>>
>>> +       if (bridge->next_bridge)
>>> +               bridge->next_bridge->funcs->pre_enable(bridge->next_bridge);
>>>         /*
>>>          * There's a bug in the PTN chip where it falsely asserts hotplug before
>>>          * it is fully functional. We're forced to wait for the maximum start up
>>> @@ -142,6 +144,8 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>>>
>>>  static void ptn3460_enable(struct drm_bridge *bridge)
>>>  {
>>> +       if (bridge->next_bridge)
>>> +               bridge->next_bridge->funcs->enable(bridge->next_bridge);
>>>  }
>>>
>>>  static void ptn3460_disable(struct drm_bridge *bridge)
>>> @@ -153,6 +157,11 @@ static void ptn3460_disable(struct drm_bridge *bridge)
>>>
>>>         ptn_bridge->enabled = false;
>>>
>>> +       if (bridge->next_bridge) {
>>> +               bridge->next_bridge->funcs->disable(bridge->next_bridge);
>>> +               bridge->next_bridge->funcs->post_disable(bridge->next_bridge);
>>
>> Shouldn't post_disable be called from ptn_3460_post_disable, instead of here?
> Umm, right. But no point in delaying ->post_disable of the panel(which
> switches off power to LCD) since
> backlight would be already down in ->disable call itself. So, I
> thought of calling post_disable here itself.
>
>>> +       }
>>> +
>>>         if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>>>                 gpio_set_value(ptn_bridge->gpio_rst_n, 1);
>>>
>>> @@ -197,7 +206,10 @@ int ptn3460_get_modes(struct drm_connector *connector)
>>>                 return drm_add_edid_modes(connector, ptn_bridge->edid);
>>>
>>>         power_off = !ptn_bridge->enabled;
>>> -       ptn3460_pre_enable(ptn_bridge->bridge);
>>> +       if (power_off) {
>>> +               ptn3460_pre_enable(ptn_bridge->bridge);
>>> +               ptn3460_enable(ptn_bridge->bridge);
>>
>> In this case, I don't think we need to power on the entire bridge
>> chain since we're just reading the edid from the bridge chip itself.
>> So I think I'd prefer to break out the power_on/power_off code from
>> the bridge chain such that we can just power up the bridge chip, check
>> the edid and then turn it off.
> Those extra calls were added to make sure that regulator_enable/disable would
> be in sync for the panel. Check the other patch [2/3].

Sure, but we don't need the panel to read the edid. This bridge in
particular provides the edid itself, so in this case, we should leave
the panel off.

Sean


> Another way of doing this is to just check if the bridge is off  and
> switch it on by
> explicitly setting up the gpios here, instead of just calling
> ptn3460_pre_enable.
>
> Ajay
>> In other bridges, where we're actually reading the edid from a
>> downstream source, this decision might be different.
>>
>>
>>
>>> +       }
>>>
>>>         edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>>>         if (!edid) {
>>> @@ -219,8 +231,10 @@ int ptn3460_get_modes(struct drm_connector *connector)
>>>         num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
>>>
>>>  out:
>>> -       if (power_off)
>>> +       if (power_off) {
>>>                 ptn3460_disable(ptn_bridge->bridge);
>>> +               ptn3460_post_disable(ptn_bridge->bridge);
>>> +       }
>>>
>>>         return num_modes;
>>>  }
>>> @@ -318,14 +332,13 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
>>>                 goto err;
>>>         }
>>>
>>> -       ret = drm_bridge_init(dev, bridge, &ptn3460_bridge_funcs);
>>> +       ret = drm_bridge_init(dev, bridge, encoder, &ptn3460_bridge_funcs);
>>>         if (ret) {
>>>                 DRM_ERROR("Failed to initialize bridge with drm\n");
>>>                 goto err;
>>>         }
>>>
>>>         bridge->driver_private = ptn_bridge;
>>> -       encoder->bridge = bridge;
>>>
>>>         ret = drm_connector_init(dev, &ptn_bridge->connector,
>>>                         &ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
>>> --
>>> 1.8.1.2
>>>
