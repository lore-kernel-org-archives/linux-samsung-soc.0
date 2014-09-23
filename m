From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 09:24:12 +0200
Message-ID: <5421201C.6000509@samsung.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23918 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753534AbaIWHYU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 03:24:20 -0400
In-reply-to: <20140923060452.GD30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

Hi Thierry, Tomi,

On 09/23/2014 08:04 AM, Thierry Reding wrote:
> On Mon, Sep 22, 2014 at 05:23:25PM +0300, Tomi Valkeinen wrote:
>> On 22/09/14 11:06, Thierry Reding wrote:
>>
>>>>> Why do we need a complex graph when it can be handled using a simple phandle?
>>>>
>>>> Maybe in your case you can handle it with simple phandle. Can you
>>>> guarantee that it's enough for everyone, on all platforms?
>>>
>>> Nobody can guarantee that. An interesting effect that DT ABI stability
>>> has had is that people now try to come up with overly generic concepts
>>> to describe devices in an attempt to make them more future-proof. I
>>> don't think we're doing ourselves a favour with that approach.
>>
>> I kind of agree. However, there are boards that need a more complex
>> approach than just a simple phandle. They are nothing new.
>>
>> So while it may be true that this specific encoder has never been used
>> in such a complex way, and there's a chance that it never will, my
>> comments are not really about this particular encoder.
>>
>> What I want is a standard way to describe the video components. If we
>> have a standard complex one (video graphs) and a standard simple one
>> (simple phandles), it's ok for me.
> 
> I certainly agree that it's useful to have standard ways to describe at
> least various aspects. For example I think it would be useful to add
> standard properties for a bridge's connections, such as "bridge" or
> "panel" to allow bridge chaining and attaching them to panels.
> 
> But I think that should be the end of it. Mandating anything other than
> that will just complicate things and limit what people can do in the
> binding.
> 
> One of the disadvantages of the video graph bindings is that they are
> overly vague in that they don't carry information about what type a
> device is. Bindings then have to require additional meta-data, at which
> point it's become far easier to describe things with a custom property
> that already provides context.

I think it is opposite, graph bindings should describe only the link and
certainly not what type of device is behind the endpoint. The fact we
may need that information is a disadvantage of Linux frameworks and
should be corrected in Linux, not by adding Linux specific properties to
DT. For example display controller should not care where its output goes
to: panel, encoder, bridge, whatever. It should care only if the
parameters of the link are agreed with the receiver.

On the other side I agree graph bindings are bloated and it should be
possible to simplify them to single phandle if we do not need extra
parameters.

Regards
Andrzej

> 
>>>> The point of the ports/endpoint graph is to also support more
>>>> complicated scenarios.
>>>
>>> But the scenario will always remain the same for this bridge. There will
>>> always be an input signal and a translation to some output signal along
>>> with some parameters to control how that translation happens. More
>>> complicated scenarios will likely need to be represented differently at
>>> a higher level than the bridge.
>>
>> Yes, there's always one active input and one output for this bridge.
>> What the video graphs would bring is to have the possibility to have
>> multiple inputs and outputs, of which a single ones could be active at a
>> time. The different inputs and outputs could even have different
>> settings required (say, first output requires this bit set, but when
>> using second output that bit must be cleared).
> 
> As discussed elsewhere this should be handled at a different level then.
> DT should describe the hardware and this particular bridge device simply
> doesn't have a means to connect more than a single input or more than a
> single output.
> 
> Thierry
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
