From: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v5 4/4] ARM: dts: Add Ethernet chip to SMDK5410
Date: Thu, 05 Nov 2015 14:14:19 +0300
Message-ID: <004f01d117bb$1e4fbb40$5aef31c0$@samsung.com>
References: <cover.1446542020.git.p.fedin@samsung.com>
 <4568ad982f0af1846994119961cbb798edff311c.1446542020.git.p.fedin@samsung.com>
 <5639C1A5.1040708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <5639C1A5.1040708-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ru
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Krzysztof Kozlowski' <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Kukjin Kim' <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

 Hello!

> > +	ethernet@3 {
> > +		compatible = "smsc,lan9115";
> > +		reg = <3 0 0x10000>;
> > +		phy-mode = "mii";
> > +		interrupt-parent = <&gpx0>;
> > +		interrupts = <5 8>;
> 
> s/8/IRQ_TYPE_LEVEL_LOW/
> (is this really level low interrupt?)

 Yes, according to: https://github.com/AndreiLux/Perseus-S3/blob/master/arch/arm/mach-exynos/mach-smdk5250.c#L133

> Some other DTS include regulators: vddvario-supply and vdd33a-supply. It
> seems that they are not described in SMSC911x bindings but in
> GPMC-eth... but the smsc911x driver is requesting them. Could you
> investigate that? I think these regulators should be provided (and
> SMSC911x bindings should be updated).

 Sorry, i cannot. The board has lots of jumpers, which choose between fixed voltage and regulators for different components,
according to board's manual, but the manual is very poor IMHO, and i don't understand how to use them. And i use default,
fixed-voltage configuration.
 One of my colleagues tried to get it working, but failed. It actually requires more time, and IIRC you need to bring up i2c before
you can drive regulators.
 So can we leave it as it is for now? At least it works, and this is much better than no ethernet support at all.

> I don't have the board schematics so I couldn't verify the GPIOs.

 Me neither, i wrote GPIO settings according to chip datasheet i have. They are actually chip-specific, but i wrote them in board
file because on different boards you may use different banks, and therefore different pins. Or, if you don't use SROMc at all, you
can configure all pins to do something else.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
