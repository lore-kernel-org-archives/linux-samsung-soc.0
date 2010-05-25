From: Maulik Mankad <mankad.maulik@gmail.com>
Subject: Re: [PATCH 3/6] USB: s3c-hsotg: Ensure TX FIFO addresses setup when
	initialising FIFOs
Date: Tue, 25 May 2010 11:00:39 +0530
Message-ID: <AANLkTin6EEiXOGyZjmOEd39g_eUxGBJEV2yMdnwtAQbh@mail.gmail.com>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
	 <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:62757 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754745Ab0EYFak convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 01:30:40 -0400
In-Reply-To: <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

On Tue, May 25, 2010 at 10:06 AM, Ben Dooks <ben-linux@fluff.org> wrote=
:
> Some versions of the S3C HS OtG block startup with overlapping TX FIF=
O
> information, so change the fifo_init code to ensure that known values
> are set into the FIFO registers at initialisation/reset time.
>
> This also ensures that the FIFO RAM pointers are in a known state
> before use.
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
> =A0drivers/usb/gadget/s3c-hsotg.c | =A0 25 +++++++++++++++++++++++++
> =A01 files changed, 25 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-=
hsotg.c
> index dce9366..2ee75a7 100644
> --- a/drivers/usb/gadget/s3c-hsotg.c
> +++ b/drivers/usb/gadget/s3c-hsotg.c
> @@ -298,6 +298,11 @@ static void s3c_hsotg_ctrl_epint(struct s3c_hsot=
g *hsotg,
> =A0*/
> =A0static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
> =A0{
> + =A0 =A0 =A0 unsigned int ep;
> + =A0 =A0 =A0 unsigned int addr;
> + =A0 =A0 =A0 unsigned int size;
> + =A0 =A0 =A0 u32 val;
> +
> =A0 =A0 =A0 =A0/* the ryu 2.6.24 release ahs
> =A0 =A0 =A0 =A0 =A0 writel(0x1C0, hsotg->regs + S3C_GRXFSIZ);
> =A0 =A0 =A0 =A0 =A0 writel(S3C_GNPTXFSIZ_NPTxFStAddr(0x200) |
> @@ -311,6 +316,26 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg=
 *hsotg)
> =A0 =A0 =A0 =A0writel(S3C_GNPTXFSIZ_NPTxFStAddr(2048) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_GNPTXFSIZ_NPTxFDep(0x1C0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 hsotg->regs + S3C_GNPTXFSIZ);
> +
> + =A0 =A0 =A0 /* arange all the rest of the TX FIFOs, as some version=
s of this
> + =A0 =A0 =A0 =A0* block have overlapping default addresses. This als=
o ensures
> + =A0 =A0 =A0 =A0* that if the settings have been changed, then they =
are set to
> + =A0 =A0 =A0 =A0* known values. */

Please see Documentation/CodingStyle for multi-line comments.

> +
> + =A0 =A0 =A0 /* start at the end of the GNPTXFSIZ, rounded up */
> + =A0 =A0 =A0 addr =3D 2048 + 1024;
> + =A0 =A0 =A0 size =3D 768;
> +
> + =A0 =A0 =A0 /* currently we allocate TX FIFOs for all possible endp=
oints,
> + =A0 =A0 =A0 =A0* and assume that they are all the same size. */

Same here.

> +
> + =A0 =A0 =A0 for (ep =3D 0; ep <=3D 15; ep++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D addr;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D size << S3C_DPTXFSIZn_DPTxFSiz=
e_SHIFT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr +=3D size;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, hsotg->regs + S3C_DPTXFSIZn=
(ep));
> + =A0 =A0 =A0 }
> =A0}

Regards,
Maulik
