From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] mfd: documentation: dt: Document grounded ACOKB
 pin on S2MPS11
Date: Tue, 13 Oct 2015 11:07:05 +0100
Message-ID: <20151013100705.GY32409@x1>
References: <1439287746-14034-1-git-send-email-k.kozlowski.k@gmail.com>
 <1439287746-14034-2-git-send-email-k.kozlowski.k@gmail.com>
 <02a201d0d676$2fbe73c0$8f3b5b40$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <02a201d0d676$2fbe73c0$8f3b5b40$@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Krzysztof Kozlowski' <k.kozlowski.k@gmail.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Samuel Ortiz' <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Anand Moon' <linux.amoon@gmail.com>, 'Javier Martinez Canillas' <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 14 Aug 2015, Kukjin Kim wrote:

> Krzysztof Kozlowski wrote:
> >=20
> > Document a new Device Tree property 'samsung,s2mps11-acokb-ground'
> > indicating that ACOKB pin of S2MPS11 PMIC is connected to the groun=
d so
> > the PMIC must manually set PWRHOLD bit in CTRL1 register to turn of=
f the
> > power.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> > Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> >=20
> > ---
> >=20
> > Changes since v1:
> > 1. Split bindings documentation to separate patch (suggested by Lee=
).
> > 2. Add Javier's reviewed-by and Lee's acked-by.
> > ---
> >  Documentation/devicetree/bindings/mfd/s2mps11.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> > b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> > index 57a045016fca..90eaef393325 100644
> > --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> > +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> > @@ -15,6 +15,10 @@ Optional properties:
> >  - interrupt-parent: Specifies the phandle of the interrupt control=
ler to which
> >    the interrupts from s2mps11 are delivered to.
> >  - interrupts: Interrupt specifiers for interrupt sources.
> > +- samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS1=
1 PMIC is
> > +  connected to the ground so the PMIC must manually set PWRHOLD bi=
t in CTRL1
> > +  register to turn off the power. Usually the ACOKB is pulled up t=
o VBATT so
> > +  when PWRHOLD pin goes low, the rising ACOKB will trigger power o=
ff.
> >=20
> >  Optional nodes:
> >  - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buf=
fered 32.768
>=20
> Applied 1/3 and 3/3.

Any chance you applied these on their own branch (which can be
tagged)?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
