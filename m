From: Maulik Mankad <mankad.maulik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] USB: s3c-hsotg: Ensure FIFOs are fully flushed after
	layout
Date: Tue, 25 May 2010 11:02:31 +0530
Message-ID: <AANLkTilUDC37-PJOL5vuM-sd6QTOQNyBFIkkrAUp0RtX@mail.gmail.com>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-5-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-6-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1274762213-3404-6-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 25, 2010 at 10:06 AM, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> wrote=
:
> According to the design guide, if the FIFO layout is changed, then th=
e
> FIFOs must be flushed to ensure all FIFO pointers are correct.
>
> Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
> ---
> =A0drivers/usb/gadget/s3c-hsotg.c | =A0 26 ++++++++++++++++++++++++++
> =A01 files changed, 26 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-=
hsotg.c
> index 8ed4f8a..0cb0462 100644
> --- a/drivers/usb/gadget/s3c-hsotg.c
> +++ b/drivers/usb/gadget/s3c-hsotg.c
> @@ -301,6 +301,7 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg =
*hsotg)
> =A0 =A0 =A0 =A0unsigned int ep;
> =A0 =A0 =A0 =A0unsigned int addr;
> =A0 =A0 =A0 =A0unsigned int size;
> + =A0 =A0 =A0 int timeout;
> =A0 =A0 =A0 =A0u32 val;
>
> =A0 =A0 =A0 =A0/* the ryu 2.6.24 release ahs
> @@ -336,6 +337,31 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg=
 *hsotg)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writel(val, hsotg->regs + S3C_DPTXFSIZ=
n(ep));
> =A0 =A0 =A0 =A0}
> +
> + =A0 =A0 =A0 /* according to p428 of the design guide, we need to en=
sure that
> + =A0 =A0 =A0 =A0* all fifos are flushed before continuing */

Please see Documentation/CodingStyle for multi-line comments.

> +
> + =A0 =A0 =A0 writel(S3C_GRSTCTL_TxFNum(0x10) | S3C_GRSTCTL_TxFFlsh |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_GRSTCTL_RxFFlsh, hsotg->regs + S3C_G=
RSTCTL);
> +
> + =A0 =A0 =A0 /* wait until the fifos are both flushed */
> + =A0 =A0 =A0 timeout =3D 100;
> + =A0 =A0 =A0 while (1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(hsotg->regs + S3C_GRSTCTL=
);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((val & (S3C_GRSTCTL_TxFFlsh | S3C_G=
RSTCTL_RxFFlsh)) =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (--timeout =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(hsotg->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "%s: ti=
meout flushing fifos (GRSTCTL=3D%08x)\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func_=
_, val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(1);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dev_dbg(hsotg->dev, "FIFOs reset, timeout at %d\n", tim=
eout);
> =A0}

Regards,
Maulik
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
