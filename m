From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix booting on Rinato market device
Date: Fri, 07 Nov 2014 12:59:24 +0100
Message-ID: <1415361564.31102.2.camel@AMDC1943>
References: <1415360662-30390-1-git-send-email-k.kozlowski@samsung.com>
 <545CB220.9030007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <545CB220.9030007@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, BartlomiejZolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-11-07 at 20:50 +0900, Chanwoo Choi wrote:
> Hi Krzysztof,
>=20
> On 11/07/2014 08:44 PM, Krzysztof Kozlowski wrote:
> > The bootloader on market Rinato (Gear 2) device checks for revision=
 in
> > compatible field of DTB. If it is not present or lower than require=
d
> > then booting fails with: "Could not do normal boot. (no DTB found)"=
=2E
> >=20
> > Log of bootloader in case of failure:
> > h/w: revision  =3D 0x06
> > h/w: schematic =3D SM-R380_Rev0.5_Final_0205
> > date =3D 2000/01/01 12:00:21 (UTC)
> > cmu_div:4, div:5, src_clk:800000000, pixel_clk:31860720
> > load_kernel: loading boot image from 57344.. (BOOT)
> > load_kernel: found zImage, size: 0x3267e8
> > 0xbc Error!
> > Verify_Binary_Signature: failed.
> > pit_check_signature (BOOT) invalid.
> > load_kernel: found custom kernel (ret:-2147483647)
> >  No need to update kernel type.
> > Detected board: samsung,rinato-rev06
> > Could not do normal boot. (no DTB found)
> > : Entering usb mode for SM-R380_EUR_XX (65535)..
> >=20
> > Add a "rev06" suffix to compatible to satisfy the bootloader.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boo=
t/dts/exynos3250-rinato.dts
> > index 84380fa13e37..f72ba0a1d915 100644
> > --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> > +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> > @@ -18,7 +18,8 @@
> > =20
> >  / {
> >  	model =3D "Samsung Rinato board";
> > -	compatible =3D "samsung,rinato", "samsung,exynos3250", "samsung,e=
xynos3";
> > +	compatible =3D "samsung,rinato", "samsung,rinato-rev06",
> > +			"samsung,exynos3250", "samsung,exynos3";
>=20
> I think it is wrong. The released bootloader from Samsung is not u-bo=
ot.
> Instead, you have to update u-boot to support Exynos3250-basd Rinato =
board.

The bootloader on device also was not a u-boot. So the fix is for nativ=
e
bootloader delivered on device.

I do not insist that this is proper fix. It was just needed to boot the
device with custom kernel.

Anyway, thanks for comments!

Best regards,
Krzysztof
