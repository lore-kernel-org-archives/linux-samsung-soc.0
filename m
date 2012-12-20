From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration implementation
Date: Thu, 20 Dec 2012 00:58:05 +0000
Message-ID: <CACxGe6vyK80pvV1CE=zu7LNEmeKDZg3cpQ5PKZjaVjvL+gc2yg@mail.gmail.com>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com> <20121219123201.B636A3E0AD7@localhost>
 <20121219171423.GW4985@opensource.wolfsonmicro.com> <CAPnjgZ30MQS1OT3GOFLG9HntoD8NrzNw6bB_d1fiJEgHcMDGUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ30MQS1OT3GOFLG9HntoD8NrzNw6bB_d1fiJEgHcMDGUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lk <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naveen Krishna <naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 20, 2012 at 12:17 AM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Wed, Dec 19, 2012 at 9:14 AM, Mark Brown
> <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
>> On Wed, Dec 19, 2012 at 12:32:01PM +0000, Grant Likely wrote:
>>
>>> I'm not convinced on the design of this protocol. It won't scale beyond
>>> 2 bus masters and it seems very specific to the design of a specific
>>> piece of hardware. I don't think it is mature enough to bake into the
>>
>> I ought to point out that the original patch would've baked this into
>> the Samsung I2C driver but I asked for it to be split out as it's
>> nothing to do with the controller really and I'm sure I've seen it
>> before.
>
> Grant your idea looks nice to me. I only worry if we should wait until
> we have a second user before going so far with it. But it is certainly
> a nice general solution.
>
> The scaling beyond two bus masters would require the code to be
> changed to check more input lines from other masters. Best avoided for
> now I think until we have a use for it.

There is two parts to this; the design of the binding, and the
implementation. Of the two, the binding is the most difficult to
change, so it is important to get something we can live with long term
sorted out now. The implementation can start somewhat naive, with a
plan for how to extend it.

Regarding the scaling to multiple devices, it is a much smaller issue
(if an issue at all) if the arbitration back end is pluggable. Then it
becomes easy to support hardware with a different arbitration
protocol. If it gets baked into the core i2c code, then we've got a
problem and a lot more scrutiny needs to be put into this specific
protocol.

g.
