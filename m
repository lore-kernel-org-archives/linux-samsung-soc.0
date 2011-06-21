From: Banajit Goswami <banajit.goswami-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC][PATCH 3/5] ARM: SAMSUNG: Adding IO mapping for OTG PHY.
Date: Tue, 21 Jun 2011 16:48:38 +0530
Message-ID: <BANLkTintiDOi1mtc0M_qKbxYm+YmDU_Ttw@mail.gmail.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
	<1308639827-2121-4-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1308639827-2121-4-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Praveen,

On Tue, Jun 21, 2011 at 12:33 PM, <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Adding virtual addresses for OTG PHY.
>
> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> =C2=A0arch/arm/mach-s5p64x0/cpu.c | =C2=A0 =C2=A05 +++++
> =C2=A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.=
c
> index a5c0095..8dc6f20 100644
> --- a/arch/arm/mach-s5p64x0/cpu.c
> +++ b/arch/arm/mach-s5p64x0/cpu.c
> @@ -57,6 +57,11 @@ static struct map_desc s5p64x0_iodesc[] __initdata=
 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pfn =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P64X0_PA_VIC1),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.length =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D SZ_16K,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 }, {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)S3C_VA_USB_HSPHY,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P64X0_PA_USB_HSPHY),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_1M,

Do we really need 1M for this??

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
