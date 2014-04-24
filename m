From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Thu, 24 Apr 2014 12:11:47 -0400
Message-ID: <CAF6AEGuL3=bvBPGCDW5_db58ie23enY8VwNG7wCeQTn+JM4-Rw@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
 <CAF6AEGtEa6rBarSXEkmZrreEKGcwTOCWhhx-OT9JmAhBhAk_Zw@mail.gmail.com>
 <CAEC9eQPiUdR_0gKVxmA8KhHD7z2AehRGOUU25e5zQz=PQyDqpA@mail.gmail.com>
 <CAEC9eQPPoU3wWgzOi6DQP=Lxq8EC-AOpRJS20uTjwZa=vfY_Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPPoU3wWgzOi6DQP=Lxq8EC-AOpRJS20uTjwZa=vfY_Rw@mail.gmail.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 23, 2014 at 3:02 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> Sorry for the previous reply,
>
> Here goes the full explaination:
>
>> Rob,
>>
>> On Tue, Apr 22, 2014 at 5:04 PM, Rob Clark <robdclark@gmail.com> wrote:
>>> So what about, rather than adding drm_panel support to each bridge
>>> individually, we introduce a drm_panel_bridge (with a form of
>>> chaining).. ie:
>>>
>>>   struct drm_panel_bridge {
>>>     struct drm_bridge base;
>>>     struct drm_panel *panel;
>>>     struct drm_bridge *bridge; /* optional */
>>>   };
>>>
>>>   static void drm_panel_bridge_enable(struct drm_bridge *bridge)
>>>   {
>>>     struct drm_panel_bridge *pb = to_panel_bridge(bridge);
>>>     if (pb->bridge)
>>>       pb->bridge->funcs->enable(pb->bridge);
>>>     pb->panel->funcs->enable(pb->panel);
>>>   }
>>>
> We cannot call them like this from crtc helpers in the order you mentioned,
> since each individual bridge chip expects the panel controls at
> different places.
> I mean,
> -- sometimes panel controls needs to be done before bridge
> controls(ptn3460: before RST_N and PD_N)

well, this is why bridge has pre-enable/enable/disable/post-disable
hooks, so you can choose before or after..

> -- sometimes in between the bridge controls (ps8622: one panel control
> before SLP_N and one after SLP_N)
> -- sometimes panel controls needs to be done after bridge controls.

I am not convinced that a generic panel/bridge adapter is not
possible.  Maybe we need more fine grained fxn ptr callbacks, although
seems like pre+post should give you enough.  It would certainly be
easier than having to add panel support in each individual bridge
driver (which seems like it will certainly result that only certain
combinations of panel+bridge actually work as intended)

> So, putting these drm_panel controls inside individual bridge drivers will work,
> but keeping them in crtc_helpers might break stuff.

I'm not talking about crtc changing helpers.

BR,
-R

> Thanks and regards,
> Ajay Kumar
