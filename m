From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Fri, 30 Oct 2015 09:58:03 +0300
Message-ID: <00a101d112e0$537a18e0$fa6e4aa0$@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <f1fbd1a7877090f4318705f0fccbf4d96c0ebc9c.1446122247.git.p.fedin@samsung.com>
 <56330E6E.50003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42178 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757901AbbJ3G6I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 02:58:08 -0400
In-reply-to: <56330E6E.50003@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Kukjin Kim' <kgene@kernel.org>

 Hello!

> > Add documentation for new subnode properties, allowing bank configuration.
> > Based on u-boot implementation, but heavily reworked.
> 
> Please, carefully look at:
> Documentation/devicetree/bindings/net/gpmc-eth.txt
> Documentation/devicetree/bindings/bus/ti-gpmc.txt

 Thank you very much. Indeed, this looks very similar. By the way, should i document smsc over sromc in the same manner, writing
devicetree/bindings/net/sromc-eth.txt?

 This is a short reply for now, i'll make longer one (or just a new version) after studying these existing bindings and trying to
apply them.

 Pankaj:

> > +&sromc {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&srom_ctl>, <&srom_ebi>;
> > +
> > +       ethernet@07000000 {
> > +               compatible = "smsc,lan9115";
> > +               reg = <0x07000000 0x10000>;
> > +               phy-mode = "mii";
> > +               interrupt-parent = <&gpx0>;
> > +               interrupts = <5 8>;
> > +               reg-io-width = <2>;
> > +               smsc,irq-push-pull;
> > +               smsc,force-internal-phy;
> > +
> > +               samsung,srom-bank = <3>;
> > +               samsung,srom-data-width = <2>;
> > +               samsung,srom-timing = <1 9 12 1 9 1 1>;
> 
> I think this is not correct. We can't change binding of "smsc,lan9115"
> which is already documented here [1]. These samsung specific srom
> properties should be in srom node or its subnode, but not in this way.

 So, if you look at gpmc-eth.txt, you'll see that this approach is perfectly valid (this is a reply to another msg, just don't want
to post one more single-line reply).

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
