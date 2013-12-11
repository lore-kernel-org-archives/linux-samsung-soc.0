From: Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] USB: core: Add warm reset while reset-resuming
 SuperSpeed HUBs
Date: Wed, 11 Dec 2013 11:36:47 -0800
Message-ID: <20131211193647.GA25483@xanatos>
References: <CAGm_ybgC6Ca0qz6zJL0PkEUiyUi=Ct0L5t2GJOt9ZU-buP+wBQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1312111204220.1531-100000@iolanthe.rowland.org>
 <CAODwPW_ZUgHWymOF7Fzxh7sbhrvV0-g-pMXWQm=eSz2U8EBRtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAODwPW_ZUgHWymOF7Fzxh7sbhrvV0-g-pMXWQm=eSz2U8EBRtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Vikas Sajjan <sajjan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lan Tianyu <tianyu.lan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, burzalodowa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 11, 2013 at 11:00:13AM -0800, Julius Werner wrote:
> > I don't know what you mean by "fails".  The system goes to sleep and
> > then later on wakes up, doesn't it?
> >
> > Do you mean that the Jetflash device gets disconnected when the system
> > wakes up?  That's _supposed_ to happen under those circumstances.
> > When hub_activate() sees HUB_RESET_RESUME, all child devices get
> > disconnected except those where udev->persist_enabled is set.
> 
> This patch was written in response to the same bug as my "usb: hub:
> Use correct reset for wedged USB3 devices that are NOTATTACHED"
> submission. My patch only helps when the port gets stuck in Compliance
> Mode, but Vikas reports that he can sometimes see it stuck in Polling
> or Recovery states as well.
> 
> The underlying issue is a deadlock in the USB 3.0 link training state
> machine when the host controller is unilaterally reset on resume
> (without driving a reset on the bus).

The xHCI spec requires that when the xHCI host is reset, a USB reset is
driven down the USB 3.0 ports.  If hot reset fails, the port may migrate
to warm reset.  See table 32 in the xHCI spec, in the definition of
HCRST.  It sounds like this host doesn't drive a USB reset down USB 3.0
ports at all on host controller reset?

> The host port starts out back in
> Rx.Detect without remembering anything about its previous state, but
> the device is still in U3. The host detects Rx terminations, moves to
> Polling and starts sending LFPS link training packets, but the device
> doesn't expect those and interprets them as link problems (moving to
> Recovery). What happens next seems to be device specific, but
> apparently the device can end up in SS.Inactive while the host port
> gets stuck in Polling or Recovery (or some kind of livelock between
> those).
> 
> This patch tries to warm reset all USB 3.0 ports on reset-resume
> (after xhci_reset() was called) that had devices connected to them
> before suspend. This seems to be the only way to ensure the devices'
> state machines get back to a well-defined state that the host can work
> with. I don't think this is a specific hardware bug, it's just an
> unfortunate design flaw that the USB 3.0 spec doesn't account for a
> root hub port being reset independently of its connected device. I
> think Sarah is correct that it could be limited to root hubs, though.

Sarah Sharp
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
