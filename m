From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Fri, 27 Jun 2014 09:53:23 -0700
Message-ID: <CAOesGMiRqCQjr3_YPCs052ba1QUei2nJdKg6MyL7D4gqFbwy+g@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
	<20140627154608.GI8069@saruman.home>
	<CAD=FV=Xaf-vH79a88q94vOgc+nDhxhtnFdnRMxi1pmLd-mKYBg@mail.gmail.com>
	<20140627155900.GN8069@saruman.home>
	<CAD=FV=WCf1rdLSf91xs6aLPJVeTc1k+P_wcm94zWW04u_hUNVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:50132 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751496AbaF0QxY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 12:53:24 -0400
Received: by mail-vc0-f173.google.com with SMTP id lf12so5301663vcb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 09:53:23 -0700 (PDT)
In-Reply-To: <CAD=FV=WCf1rdLSf91xs6aLPJVeTc1k+P_wcm94zWW04u_hUNVw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Felipe Balbi <balbi@ti.com>, Sachin Kamat <sachin.kamat@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vivek Gautam <gautam.vivek@samsung.com>, Sachin Kamat <spk.linux@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>

On Fri, Jun 27, 2014 at 9:32 AM, Doug Anderson <dianders@chromium.org> wrote:
> Felipe,
>
> On Fri, Jun 27, 2014 at 8:59 AM, Felipe Balbi <balbi@ti.com> wrote:
>>> I'll admit to not having been involved with the previous discussions,
>>> but this seems strange to me.  Are we throwing in the towel and
>>> deciding that it's too hard to get the Kconfigs right and that we'll
>>> just rely on individual users to figure out the right answer for
>>> themselves?
>>
>> no. select prevents a driver from be built as a dynamically linked
>> module and distro-kernels might want to enable everything as modules.
>
> Ah, that's what the problem was!  I wasn't aware of this issue with
> SELECT.  Sorry for the noob-ness.

Select is also fragile, for example if a main subsystem isn't enabled,
the specific option will still be enabled (or there'll be a
warning/error about it). Overall it tends to cause headaches so many
maintainers are starting to push back against it.

> Really we want the PHY to be "=y" if the USB driver is "=y" or "=m" if
> the USB driver is "=m", I think.  You could argue that one might want
> to build the main USB driver into the kernel but have the phy drivers
> as modules, so you could possibly also try to support that...
>
> If there's not a good way to specify that, I guess we'll just have to
> use "default" and rely on the user not to purposely choose the wrong
> thing.  Like the following (untested):
>
> config PHY_SAMSUNG_USB2
>   depends on USB_OHCI_EXYNOS || USB_EHCI_EXYNOS
>   default y if ARCH_EXYNOS=y && (USB_OHCI_EXYNOS=y || USB_EHCI_EXYNOS=y)
>   default m if ARCH_EXYNOS=m && (USB_OHCI_EXYNOS=m || USB_EHCI_EXYNOS=m)
>   ...
>
> I see some syntax like that elsewhere in Kconfig so I assume it's reasonable...

I think you can take out the test for ARCH_EXYNOS here (first of all,
it can never be modular).

I'm not sure it makes sense to work so hard to set the default right
either, as long as the dependencies are correct. I.e. it'll still mess
up randconfig if the combination doesn't build, and distros can still
downgrade to 'm' if they want to. That'll just leave:

config PHY_SAMSUNG_USB2
  tristate "foo"
  depends on USB_OHCI_EXYNOS || USB_EHCI_EXYNOS
  default y     (no need to add an if since it's taken care of by the depends)

> With the above the user could purposely enable the OHCI or EHCI driver
> and disable the PHY driver which is not really sensible.  ...but it
> wouldn't cause a compile failure or crash--USB just won't work.

Just make the sub-drivers silent options with defaults. I.e:

 config PHY_EXYNOS5250_USB2
        bool SOC_EXYNOS5250
        depends on PHY_SAMSUNG_USB2

and so on. Note that it doesn't actually scale to make it depend on a
specific SoC though, so it should probably just be cut down the line
of EXYNOS4/5 and err on the side of including a bit too much code
instead.


-Olof
