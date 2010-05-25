From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 3/6] USB: s3c-hsotg: Ensure TX FIFO addresses setup
	when initialising FIFOs
Date: Tue, 25 May 2010 09:20:06 +0100
Message-ID: <20100525082006.GA4720@trinity.fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org> <1274762213-3404-2-git-send-email-ben-linux@fluff.org> <1274762213-3404-3-git-send-email-ben-linux@fluff.org> <1274762213-3404-4-git-send-email-ben-linux@fluff.org> <AANLkTin6EEiXOGyZjmOEd39g_eUxGBJEV2yMdnwtAQbh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTin6EEiXOGyZjmOEd39g_eUxGBJEV2yMdnwtAQbh-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maulik Mankad <mankad.maulik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 25, 2010 at 11:00:39AM +0530, Maulik Mankad wrote:
> On Tue, May 25, 2010 at 10:06 AM, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> wro=
te:
> > Some versions of the S3C HS OtG block startup with overlapping TX F=
IFO
> > information, so change the fifo_init code to ensure that known valu=
es
> > are set into the FIFO registers at initialisation/reset time.
> >
> > This also ensures that the FIFO RAM pointers are in a known state
> > before use.
> >
> > Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
> > ---
> > =A0drivers/usb/gadget/s3c-hsotg.c | =A0 25 ++++++++++++++++++++++++=
+
> > =A01 files changed, 25 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3=
c-hsotg.c
> > index dce9366..2ee75a7 100644
> > --- a/drivers/usb/gadget/s3c-hsotg.c
> > +++ b/drivers/usb/gadget/s3c-hsotg.c
> > @@ -298,6 +298,11 @@ static void s3c_hsotg_ctrl_epint(struct s3c_hs=
otg *hsotg,
> > =A0*/
> > =A0static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
> > =A0{
> > + =A0 =A0 =A0 unsigned int ep;
> > + =A0 =A0 =A0 unsigned int addr;
> > + =A0 =A0 =A0 unsigned int size;
> > + =A0 =A0 =A0 u32 val;
> > +
> > =A0 =A0 =A0 =A0/* the ryu 2.6.24 release ahs
> > =A0 =A0 =A0 =A0 =A0 writel(0x1C0, hsotg->regs + S3C_GRXFSIZ);
> > =A0 =A0 =A0 =A0 =A0 writel(S3C_GNPTXFSIZ_NPTxFStAddr(0x200) |
> > @@ -311,6 +316,26 @@ static void s3c_hsotg_init_fifo(struct s3c_hso=
tg *hsotg)
> > =A0 =A0 =A0 =A0writel(S3C_GNPTXFSIZ_NPTxFStAddr(2048) |
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_GNPTXFSIZ_NPTxFDep(0x1C0),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 hsotg->regs + S3C_GNPTXFSIZ);
> > +
> > + =A0 =A0 =A0 /* arange all the rest of the TX FIFOs, as some versi=
ons of this
> > + =A0 =A0 =A0 =A0* block have overlapping default addresses. This a=
lso ensures
> > + =A0 =A0 =A0 =A0* that if the settings have been changed, then the=
y are set to
> > + =A0 =A0 =A0 =A0* known values. */
>=20
> Please see Documentation/CodingStyle for multi-line comments.
>=20
> > +
> > + =A0 =A0 =A0 /* start at the end of the GNPTXFSIZ, rounded up */
> > + =A0 =A0 =A0 addr =3D 2048 + 1024;
> > + =A0 =A0 =A0 size =3D 768;
> > +
> > + =A0 =A0 =A0 /* currently we allocate TX FIFOs for all possible en=
dpoints,
> > + =A0 =A0 =A0 =A0* and assume that they are all the same size. */
>=20
> Same here.
>=20
> > +
> > + =A0 =A0 =A0 for (ep =3D 0; ep <=3D 15; ep++) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D addr;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D size << S3C_DPTXFSIZn_DPTxFS=
ize_SHIFT;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr +=3D size;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, hsotg->regs + S3C_DPTXFSI=
Zn(ep));
> > + =A0 =A0 =A0 }
> > =A0}
>=20
> Regards,
> Maulik

ok, fixed both,

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
