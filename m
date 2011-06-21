From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Tue, 21 Jun 2011 13:39:48 +0100
Message-ID: <20110621123948.GF23234@n2100.arm.linux.org.uk>
References: <0LN4003P2ZGJSGU0@mailout4.samsung.com> <BANLkTim+idO=XDtcvYZdfUToROnb8ju+kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTim+idO=XDtcvYZdfUToROnb8ju+kQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 21, 2011 at 05:56:05PM +0530, Praveen Paneri wrote:
> Hi,
> 
> On Tue, Jun 21, 2011 at 4:20 PM, PRAVEEN PANERI <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

Err, that attributation is wrong.

> > On Tue, Jun 21, 2011 at 12:33:46PM +0530, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org wrote:
> > > +#include
> > > +#include
> > > +#include
> > > +#include
> > > +#include
> > > +#include
> > > +#include
> >
> > linux/gpio.h please.
> will change it

You should question why your mailer decided to remove the contents after
the "#include" when quoting.  Maybe you need to get a better mailer, fix
some configuration setting, or complain to google that gmail is messing
with emails in ways it shouldn't.

However, I doubt that gmail itself is as broken as it appears to be
above... but whatever it is, it needs fixing.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
