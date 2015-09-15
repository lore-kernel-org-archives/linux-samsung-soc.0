From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] platform/chrome: Support reading/writing the
 vboot context
Date: Tue, 15 Sep 2015 13:22:18 -0700
Message-ID: <20150915202218.GA25914@kroah.com>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442234049-18637-3-git-send-email-emilio.lopez@collabora.co.uk>
 <CABxcv=m23sfK=jOCswirQRB1SbP70VnomKp6hhwFhRLHiabq4w@mail.gmail.com>
 <55F86E74.9010907@collabora.co.uk>
 <CABxcv=mnCNQPtVBU4tPOWD237_-RojoW+RVLTj+F=3PHbUHfQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38999 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558AbbIOUWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 16:22:19 -0400
Content-Disposition: inline
In-Reply-To: <CABxcv=mnCNQPtVBU4tPOWD237_-RojoW+RVLTj+F=3PHbUHfQQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tue, Sep 15, 2015 at 09:43:35PM +0200, Javier Martinez Canillas wrot=
e:
> Hello Emilio,
>=20
> On Tue, Sep 15, 2015 at 9:16 PM, Emilio L=F3pez
> <emilio.lopez@collabora.co.uk> wrote:
>=20
> [snip]
>=20
> >>>
> >>>   obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
> >>>   obj-$(CONFIG_CHROMEOS_PSTORE)  +=3D chromeos_pstore.o
> >>> -cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs=
=2Eo
> >>> cros_ec_lightbar.o
> >>> +cros_ec_devs-objs               :=3D cros_ec_dev.o
> >>> +cros_ec_devs-objs               +=3D cros_ec_lightbar.o
> >>> +cros_ec_devs-objs               +=3D cros_ec_sysfs.o
> >>> +cros_ec_devs-objs               +=3D cros_ec_vbc.o
> >>
> >>
> >> Why are you changing the Makefile? AFAIK +=3D is usually used when=
 the
> >> compilation is conditional based on a Kconfig symbol but since the=
se
> >> are build unconditionally, I'll just keep it as foo :=3D bar baz
> >
> >
> > As far as I'm aware, +=3D is append[0]. It's used for stuff like
> > obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
> > because the left part will resolve to "obj-y" or similar, and you w=
ant to
> > add to it, not replace it. I only changed the Makefile here because=
 the line
> > was growing too long, and I thought it looked neater this way; it s=
houldn't
> > cause any functional change apart from the intended one.
> >
> > [0] https://www.gnu.org/software/make/manual/html_node/Appending.ht=
ml
> >
>=20
> Yes, I know how Kbuild works. What I tried to say is that you usually
> append based on a Kconfig symbol. In fact even you are mentioning suc=
h
> an example.
> So appending unconditionally like you are doing makes the Makefile
> harder to read IMHO. If the line grows to long you can use a backlash
> (\) char to split the line.

Either format is just fine, don't get too picky here please.
