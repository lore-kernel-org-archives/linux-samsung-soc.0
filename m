From: Dongjin Kim <tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] USB: ehci-s5p: Add to get interrupt from DT
Date: Thu, 27 Dec 2012 20:58:10 +0900
Message-ID: <CADoNuNeku+CzZdiaiCw4uoS4aQEAyzNBS427asv2BvyhFmRj=Q@mail.gmail.com>
References: <1356547341-23620-1-git-send-email-tobetter@gmail.com>
	<1356547341-23620-3-git-send-email-tobetter@gmail.com>
	<50DB5B80.50801@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50DB5B80.50801-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sergei,

Yes, you are right.
I made this patch to read its interrupt number from dtb directly. But
now platform_get_irq() returns correct irq since "OF_DEV_AUXDATA(...)"
is added as my first patch.

This patch is useless.

Thanks and best regards,
Dongjin.

On Thu, Dec 27, 2012 at 5:18 AM, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hello.
>
> On 12/26/2012 09:42 PM, Dongjin Kim wrote:
>
> > This patch support to get interrupt resource from device tree as well as
> > platform device if ehci node is defined in device tree and it's irq is
> > described.
>
> > Signed-off-by: Dongjin Kim <tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/usb/host/ehci-s5p.c |    8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
>
> > diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
> > index 319dcfa..0fc5e5e 100644
> > --- a/drivers/usb/host/ehci-s5p.c
> > +++ b/drivers/usb/host/ehci-s5p.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/of_gpio.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/platform_data/usb-ehci-s5p.h>
> >  #include <plat/usb-phy.h>
> >
> > @@ -156,7 +157,12 @@ static int s5p_ehci_probe(struct platform_device
> > *pdev)
> >               goto fail_io;
> >       }
> >
> > -     irq = platform_get_irq(pdev, 0);
> > +     if (pdev->dev.of_node)
> > +             irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>
>    platform_get_irq() should still work for device tree based platform
> devices.
> I don't see the point on the patch?
>
> > +     else {
> > +             irq = platform_get_irq(pdev, 0);
> > +     }
>
>    Hm, why {} out of the blue? Both arms of *if* are single-stratement.
>
> > +
>
>    No need for empty line here.
>
> >       if (!irq) {
> >               dev_err(&pdev->dev, "Failed to get IRQ\n");
> >               err = -ENODEV;
>
> WBR, Sergei
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
