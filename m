From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Fri, 27 Jun 2014 09:32:25 -0700
Message-ID: <CAD=FV=WCf1rdLSf91xs6aLPJVeTc1k+P_wcm94zWW04u_hUNVw@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
	<20140627154608.GI8069@saruman.home>
	<CAD=FV=Xaf-vH79a88q94vOgc+nDhxhtnFdnRMxi1pmLd-mKYBg@mail.gmail.com>
	<20140627155900.GN8069@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140627155900.GN8069-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Felipe,

On Fri, Jun 27, 2014 at 8:59 AM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
>> I'll admit to not having been involved with the previous discussions,
>> but this seems strange to me.  Are we throwing in the towel and
>> deciding that it's too hard to get the Kconfigs right and that we'll
>> just rely on individual users to figure out the right answer for
>> themselves?
>
> no. select prevents a driver from be built as a dynamically linked
> module and distro-kernels might want to enable everything as modules.

Ah, that's what the problem was!  I wasn't aware of this issue with
SELECT.  Sorry for the noob-ness.

Really we want the PHY to be "=y" if the USB driver is "=y" or "=m" if
the USB driver is "=m", I think.  You could argue that one might want
to build the main USB driver into the kernel but have the phy drivers
as modules, so you could possibly also try to support that...

If there's not a good way to specify that, I guess we'll just have to
use "default" and rely on the user not to purposely choose the wrong
thing.  Like the following (untested):

config PHY_SAMSUNG_USB2
  depends on USB_OHCI_EXYNOS || USB_EHCI_EXYNOS
  default y if ARCH_EXYNOS=y && (USB_OHCI_EXYNOS=y || USB_EHCI_EXYNOS=y)
  default m if ARCH_EXYNOS=m && (USB_OHCI_EXYNOS=m || USB_EHCI_EXYNOS=m)
  ...

I see some syntax like that elsewhere in Kconfig so I assume it's reasonable...

With the above the user could purposely enable the OHCI or EHCI driver
and disable the PHY driver which is not really sensible.  ...but it
wouldn't cause a compile failure or crash--USB just won't work.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
