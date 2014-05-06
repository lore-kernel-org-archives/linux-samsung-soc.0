From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: dts: exynos4412-trats2: rename alias for i2c_ak8975
 label
Date: Tue, 06 May 2014 11:34:52 +0900
Message-ID: <098d01cf68d3$c2420b10$46c62130$@samsung.com>
References: <534D4143.3050801@samsung.com> <53594496.4010607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53594496.4010607@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Tomasz Stanislawski' <t.stanislaws@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, j.anaszewski@samsung.com, =?UTF-8?B?J+uwleqyveuvvCc=?= <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 
> Hi Tomasz,
> 
> On 15.04.2014 16:25, Tomasz Stanislawski wrote:
> > The i2c_ak8975 controler uses label i2c8.
> > This alias is already used for I2C controller 8 defined
> > in file arch/arm/boot/dts/exynos4.dtsi.
> >
> > This patch renames a label for i2c_ak8975 to i2c9.
> >
> > Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> > ---
> >   arch/arm/boot/dts/exynos4412-trats2.dts |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts
> b/arch/arm/boot/dts/exynos4412-trats2.dts
> > index c16b315..5add765 100644
> > --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> > +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> > @@ -20,7 +20,7 @@
> >   	compatible = "samsung,trats2", "samsung,exynos4412",
> "samsung,exynos4";
> >
> >   	aliases {
> > -		i2c8 = &i2c_ak8975;
> > +		i2c9 = &i2c_ak8975;
> >   	};
> >
> >   	memory {
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> Seems reasonable.
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Applied, thanks.

- Kukjin
