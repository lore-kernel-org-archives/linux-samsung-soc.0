From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Tue, 22 Jan 2013 14:04:56 -0800
Message-ID: <063e01cdf8ec$85e637c0$91b2a740$@samsung.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
 <20121215072014.2E05E3E0AE3@localhost>
 <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
 <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
 <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
 <016901cde163$6be034c0$43a09e40$@samsung.com>
 <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
 <50DB811A.8010408@gmail.com> <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
 <CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
 <20130122084817.GC16143@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20130122084817.GC16143-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Content-language: en-us
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, 'Vivek Gautam' <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Doug Anderson' <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Felipe Balbi wrote:
> Hi,
> 
Hi Felipe,

[...]

> > Right, DWC has version number, but that being the kind of USB controller
> > (USB 2.0 and USB 3.0)
> >
> > DWC2: USB High Speed controller (as also indicated in the patch from
> > Paul: [RFC PATCH 0/6] DWC2 DesignWare HS OTG driver)
> > DWC3: USB Super Speed controller
> >
> > Is it fine if we use something like shown below, as suggested by you
earlier ?
> >
> > -     { .compatible = "samsung,exynos-dwc3" },
> > +     { .compatible = "samsung,synopsis-dwc3" }
> 
> You're both missing a point here. The synopsys IP driver is called
> dwc3.ko and that's compatible with synopsys,dwc3. Your glue layer driver
> (dwc3-exynos.ko) is compatible with your platform, so
> samsung,exynos-dwc3 sounds correct to me.
> 
Hmm...yeah, you're right and agreed.

However, we need to use more clear name there like "samsung,exynos-dwusb3"
in compatible, because you know there are lots of other IPs in Synopsis
Design Ware brand. So we have to include usb in compatible for that.

> The glue layer is just to "abstract" away the integration details of the
> IP core into a specific platform.
> 
Right.

Thanks.

- Kukjin

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
