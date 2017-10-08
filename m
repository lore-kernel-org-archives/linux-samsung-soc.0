From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 2/2] phy: exynos5-usbdrd: remove disable and enable of phy
 clk
Date: Sun, 8 Oct 2017 17:50:15 +0200
Message-ID: <20171008155015.252gefhsc4tks7k6@kozik-lap>
References: <1507264595-3565-1-git-send-email-linux.amoon@gmail.com>
 <1507264595-3565-2-git-send-email-linux.amoon@gmail.com>
 <CAJKOXPe9FCKqrvsgdohTAN9tXXwbMOuyaDiHPxZ1Ym1LLPD41w@mail.gmail.com>
 <CANAwSgSbHR+e_2wX3i3VoVxPe10mUOoS94uRpvebfUfybaNQ+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANAwSgSbHR+e_2wX3i3VoVxPe10mUOoS94uRpvebfUfybaNQ+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Oct 08, 2017 at 06:11:12PM +0530, Anand Moon wrote:
> Hi Krzysztof,
> 
> On 6 October 2017 at 12:12, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Fri, Oct 6, 2017 at 6:36 AM, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> remove the disable and enable of phy clk.
> >> phy clk is needed to tune the phy controller.
> >
> > Drivers should in general enable and disable the clocks they use. Just
> > like in patch #1 please describe why you are doing this, what kind of
> > problem are you trying to solve and what exactly are you trying to do
> > here.
> >
> > BR,
> > Krzysztof
> >
> 
> [snip]
> 
> Usually we would disable the clk on error patch and return with failed.
> but in the current code we disable the clk in init routine and
> enable the clk in disable routine which seem incorrect.

No. For example for exynos5_usbdrd_phy_exit() the driver enables the
clock only for the access to PHY block (PHY registers).

> 
> [0] https://github.com/torvalds/linux/blob/master/drivers/phy/samsung/phy-exynos5-usbdrd.c#L362-L412
> [1] https://github.com/torvalds/linux/blob/master/drivers/phy/samsung/phy-exynos5-usbdrd.c#L424-L446
> 
> On 3.10.x kernel clk_summary all the clk are enables.
> 
>     mout_usbdrd300              3           3            24000000
>        dout_usbdrd300           2           2            24000000
>           sclk_usbdrd300        1           1            24000000
>        dout_usbphy300           2           2            24000000
>           sclk_usbphy300        1           1            24000000
>     mout_usbdrd301              3           3            24000000
>        dout_usbdrd301           2           2            24000000
>           sclk_usbdrd301        1           1            24000000
>        dout_usbphy301           2           2            24000000
>           sclk_usbphy301        1           1            24000000
> 
> Some more changes in clk driver might be required to stabilize the usb module.

Please describe the issues with stability first.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
