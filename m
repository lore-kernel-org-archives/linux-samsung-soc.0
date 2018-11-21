From: Minas Harutyunyan <minas.harutyunyan@synopsys.com>
Subject: Re: [PATCH] usb: dwc2: Disable power down feature on Samsung SoCs
Date: Wed, 21 Nov 2018 07:16:02 +0000
Message-ID: <410670D7E743164D87FA6160E7907A56013A7A95F0@am04wembxa.internal.synopsys.com>
References: <CGME20181120153828eucas1p206d442b12c16588662c0e3f731ba58c3@eucas1p2.samsung.com>
 <20181120153815.31897-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <minas.harutyunyan@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 11/20/2018 7:38 PM, Marek Szyprowski wrote:=0A=
> Power down feature of DWC2 module integrated in Samsung SoCs doesn't work=
=0A=
> properly or needs some additional handling in PHY or SoC glue layer, so=
=0A=
> disable it for now. Without disabling power down, DWC2 causes random memo=
ry=0A=
> trashes and fails enumeration if there is no USB link to host on driver=
=0A=
> probe.=0A=
> =0A=
> Fixes: 03ea6d6e9e1ff1 ("usb: dwc2: Enable power down")=0A=
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>=0A=
=0A=
Acked-by: Minas Harutyunyan <hminas@synopsys.com>=0A=
=0A=
> ---=0A=
>   drivers/usb/dwc2/params.c | 10 +++++++++-=0A=
>   1 file changed, 9 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c=0A=
> index 7c1b6938f212..266157ae179a 100644=0A=
> --- a/drivers/usb/dwc2/params.c=0A=
> +++ b/drivers/usb/dwc2/params.c=0A=
> @@ -71,6 +71,13 @@ static void dwc2_set_his_params(struct dwc2_hsotg *hso=
tg)=0A=
>   	p->power_down =3D false;=0A=
>   }=0A=
>   =0A=
> +static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)=0A=
> +{=0A=
> +	struct dwc2_core_params *p =3D &hsotg->params;=0A=
> +=0A=
> +	p->power_down =3D 0;=0A=
> +}=0A=
> +=0A=
>   static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)=0A=
>   {=0A=
>   	struct dwc2_core_params *p =3D &hsotg->params;=0A=
> @@ -151,7 +158,8 @@ const struct of_device_id dwc2_of_match_table[] =3D {=
=0A=
>   	{ .compatible =3D "lantiq,arx100-usb", .data =3D dwc2_set_ltq_params }=
,=0A=
>   	{ .compatible =3D "lantiq,xrx200-usb", .data =3D dwc2_set_ltq_params }=
,=0A=
>   	{ .compatible =3D "snps,dwc2" },=0A=
> -	{ .compatible =3D "samsung,s3c6400-hsotg" },=0A=
> +	{ .compatible =3D "samsung,s3c6400-hsotg",=0A=
> +	  .data =3D dwc2_set_s3c6400_params },=0A=
>   	{ .compatible =3D "amlogic,meson8-usb",=0A=
>   	  .data =3D dwc2_set_amlogic_params },=0A=
>   	{ .compatible =3D "amlogic,meson8b-usb",=0A=
> =0A=
=0A=
