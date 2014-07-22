From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RESEND PATCH V5 08/12] drm/bridge: ptn3460: Support bridge chaining
Date: Tue, 22 Jul 2014 11:51:55 +0530
Message-ID: <CAEC9eQP3U=brHP12ekO-n4GTUnsvQGWWd29HWZJXyxsHtNXDtw@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
	<1405629839-12086-9-git-send-email-ajaykumar.rs@samsung.com>
	<20140721082223.GF8843@ulmo>
	<CAEC9eQO8yTwYd08_8Cu_o4VSLPZXMrmYPmszap_gcN_bvBVz3A@mail.gmail.com>
	<20140721124053.GC15238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:63762 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbaGVGV4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 02:21:56 -0400
Received: by mail-vc0-f169.google.com with SMTP id hu12so14116805vcb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 23:21:55 -0700 (PDT)
In-Reply-To: <20140721124053.GC15238@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

On Mon, Jul 21, 2014 at 6:10 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Mon, Jul 21, 2014 at 05:28:13PM +0530, Ajay kumar wrote:
>> Hi Thierry,
>>
>> On Mon, Jul 21, 2014 at 1:52 PM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Fri, Jul 18, 2014 at 02:13:54AM +0530, Ajay Kumar wrote:
>> > [...]
>> >> Also, remove the drm_connector implementation from ptn3460,
>> >> since the same is implemented using panel_binder.
>> >
>> > I think that's a step backwards. In fact I think the panel-bridge binder
>> > driver shouldn't be needed at all. At least not for now. We have a very
>> > limited number of bridge drivers, so it shouldn't hurt at this stage to
>> > implement the connector instantiation within each driver. Once we have
>> > more bridge drivers, and therefore a better understanding of what they
>> > need, we can always add something like the panel-binder (though I think
>> > it should be library code, similar to the drm_encoder_helper_add() API,
>> > rather than this kind of self-contained object).
>> panel_binder was needed to wrap around panel as a bridge, and this was in turn
>> needed because people wanted to represent a bridge+panel combo as a chain
>> of bridges.
>> So, if we choose to drop panel_binder, we choose to drop the idea of chaining
>> the bridges, and end up calling drm_panel functions directly from
>> individual bridges.
>> And, the bridge will implement the connector functions as you suggested.
>> I am okay with this, if Daniel/Rob don't have an issue with this.
>
> I think bridge chaining and panel handling are separate issues. That's
> why I think we shouldn't mix them like this. From earlier discussion[0]
> the conclusion was that the final element in the chain should implement
> a connector (with the appropriate type). Often that last element would
> be an encoder (when there are no bridges). Sometimes the last element
> would be a bridge. It's logical for that same element to also implement
> the panel integration since it's closely tied to the connector.
>
> Thierry
>
> [0]: http://lists.freedesktop.org/archives/dri-devel/2014-May/059685.html
Going with Thierry's opinion, if the bridge is allowed to do panel integration,
there is no need for a bridge_chain. I mean a bridge_chain doesn't exist in
my case at all. I have just one bridge which integrates a panel.
Is it really necessary to keep next_bridge pointer and other helpers?

Ajay
