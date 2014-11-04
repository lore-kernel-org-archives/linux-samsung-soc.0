From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 02/14] mfd/regulator: dt-bindings: max77686: Document
 of_compatible for regulator
Date: Tue, 04 Nov 2014 08:53:13 +0100
Message-ID: <1415087593.2389.6.camel@AMDC1943>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
 <1414668053-31370-3-git-send-email-k.kozlowski@samsung.com>
 <20141103170042.GC12011@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32209 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752205AbaKDHxQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 02:53:16 -0500
In-reply-to: <20141103170042.GC12011@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>

On pon, 2014-11-03 at 17:00 +0000, Lee Jones wrote:
> On Thu, 30 Oct 2014, Krzysztof Kozlowski wrote:
> 
> > Document new required property for regulator driver: of_compatible. The
> > property allows MFD core to bind the driver to node with regulators and
> > this simplifies parsing regulators init data from DTS
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/max77686.txt | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> I want a thumbs-up from Mark on this before applying.

I'll be resending new version, without the compatible property.

Best regards,
Krzysztof

> 
> > diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
> > index 75fdfaf41831..f4010a9f66eb 100644
> > --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> > +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> > @@ -18,8 +18,11 @@ Required properties:
> >  
> >  Optional node:
> >  - voltage-regulators : The regulators of max77686 have to be instantiated
> > -  under subnode named "voltage-regulators" using the following format.
> > +  under subnode named "voltage-regulators".
> > +  Required property:
> > +  - compatible : Must be "maxim,max77686-pmic"
> >  
> > +  Optional properties: For each regulator use following format:
> >  	regulator_name {
> >  		regulator-compatible = LDOn/BUCKn
> >  		standard regulator constraints....
> > @@ -49,6 +52,8 @@ Example:
> >  		reg = <0x09>;
> >  
> >  		voltage-regulators {
> > +			compatible = "maxim,max77686-pmic";
> > +
> >  			ldo11_reg {
> >  				regulator-compatible = "LDO11";
> >  				regulator-name = "vdd_ldo11";
> 
