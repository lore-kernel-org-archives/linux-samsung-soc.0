From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Thu, 24 Apr 2014 00:32:02 +0530
Message-ID: <CAEC9eQPPoU3wWgzOi6DQP=Lxq8EC-AOpRJS20uTjwZa=vfY_Rw@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
	<CAF6AEGtEa6rBarSXEkmZrreEKGcwTOCWhhx-OT9JmAhBhAk_Zw@mail.gmail.com>
	<CAEC9eQPiUdR_0gKVxmA8KhHD7z2AehRGOUU25e5zQz=PQyDqpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:55545 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932516AbaDWTCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 15:02:03 -0400
Received: by mail-vc0-f170.google.com with SMTP id hr9so1731389vcb.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 12:02:03 -0700 (PDT)
In-Reply-To: <CAEC9eQPiUdR_0gKVxmA8KhHD7z2AehRGOUU25e5zQz=PQyDqpA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Sorry for the previous reply,

Here goes the full explaination:

> Rob,
>
> On Tue, Apr 22, 2014 at 5:04 PM, Rob Clark <robdclark@gmail.com> wrote:
>> So what about, rather than adding drm_panel support to each bridge
>> individually, we introduce a drm_panel_bridge (with a form of
>> chaining).. ie:
>>
>>   struct drm_panel_bridge {
>>     struct drm_bridge base;
>>     struct drm_panel *panel;
>>     struct drm_bridge *bridge; /* optional */
>>   };
>>
>>   static void drm_panel_bridge_enable(struct drm_bridge *bridge)
>>   {
>>     struct drm_panel_bridge *pb = to_panel_bridge(bridge);
>>     if (pb->bridge)
>>       pb->bridge->funcs->enable(pb->bridge);
>>     pb->panel->funcs->enable(pb->panel);
>>   }
>>
We cannot call them like this from crtc helpers in the order you mentioned,
since each individual bridge chip expects the panel controls at
different places.
I mean,
-- sometimes panel controls needs to be done before bridge
controls(ptn3460: before RST_N and PD_N)
-- sometimes in between the bridge controls (ps8622: one panel control
before SLP_N and one after SLP_N)
-- sometimes panel controls needs to be done after bridge controls.

So, putting these drm_panel controls inside individual bridge drivers will work,
but keeping them in crtc_helpers might break stuff.

Thanks and regards,
Ajay Kumar
