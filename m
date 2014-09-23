From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 11:43:47 +0200
Message-ID: <542140D3.8080806@samsung.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140923083514.GM30514@ulmo>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/23/2014 10:35 AM, Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 09:24:12AM +0200, Andrzej Hajda wrote:
>> Hi Thierry, Tomi,
>>
>> On 09/23/2014 08:04 AM, Thierry Reding wrote:
>>> On Mon, Sep 22, 2014 at 05:23:25PM +0300, Tomi Valkeinen wrote:
>>>> On 22/09/14 11:06, Thierry Reding wrote:
>>>>
>>>>>>> Why do we need a complex graph when it can be handled using a simple phandle?
>>>>>> Maybe in your case you can handle it with simple phandle. Can you
>>>>>> guarantee that it's enough for everyone, on all platforms?
>>>>> Nobody can guarantee that. An interesting effect that DT ABI stability
>>>>> has had is that people now try to come up with overly generic concepts
>>>>> to describe devices in an attempt to make them more future-proof. I
>>>>> don't think we're doing ourselves a favour with that approach.
>>>> I kind of agree. However, there are boards that need a more complex
>>>> approach than just a simple phandle. They are nothing new.
>>>>
>>>> So while it may be true that this specific encoder has never been used
>>>> in such a complex way, and there's a chance that it never will, my
>>>> comments are not really about this particular encoder.
>>>>
>>>> What I want is a standard way to describe the video components. If we
>>>> have a standard complex one (video graphs) and a standard simple one
>>>> (simple phandles), it's ok for me.
>>> I certainly agree that it's useful to have standard ways to describe at
>>> least various aspects. For example I think it would be useful to add
>>> standard properties for a bridge's connections, such as "bridge" or
>>> "panel" to allow bridge chaining and attaching them to panels.
>>>
>>> But I think that should be the end of it. Mandating anything other than
>>> that will just complicate things and limit what people can do in the
>>> binding.
>>>
>>> One of the disadvantages of the video graph bindings is that they are
>>> overly vague in that they don't carry information about what type a
>>> device is. Bindings then have to require additional meta-data, at which
>>> point it's become far easier to describe things with a custom property
>>> that already provides context.
>> I think it is opposite, graph bindings should describe only the link and
>> certainly not what type of device is behind the endpoint. The fact we
>> may need that information is a disadvantage of Linux frameworks and
>> should be corrected in Linux, not by adding Linux specific properties to
>> DT. For example display controller should not care where its output goes
>> to: panel, encoder, bridge, whatever. It should care only if the
>> parameters of the link are agreed with the receiver.
> Well, a display controller is never going to attach to a panel directly.

Yes it is. For example Exynos Display Controller uses parallel RGB as its
output format, so in case of DPI panels it is connected directly to the
panel.
I guess it is similar with other SoCs.

> But I agree that it would be nice to unify bridges and encoders more. It
> should be possible to make encoder always a bridge (or perhaps even
> replace encoders with bridges altogether). Then once you're out of the
> DRM device everything would be a bridge until you get to a panel.

I agree that some sort of unification of bridges, (slave) encoders is a good
thing, this way we stay only with bridges and panels as receivers.
But we will still have to deal with the code like:
    if (on the other end of the link is panel)
        do panel framework specific things
    else
        do bridge framework specific things

The code in both branches usually does similar things but due to framework
differences it is difficult to merge.

Ideally it would be best to get rid of such constructs. For example by
trying to
make frameworks per interface type exposed by device (eg. video_sink) and
not by device type (drm_bridge, drm_panel).

I have proposed it is possible by (ab)using drm_panel framework for
DSI/LVDS bridge [1].

[1]:
http://lists.freedesktop.org/archives/dri-devel/2014-February/053705.html

Regards
Andrzej

>
> I think we discussed this a while back in the context of bridge
> chaining.
>
> Thierry
