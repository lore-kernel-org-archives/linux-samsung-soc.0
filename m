From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 5/9] dt-bindings: arm: samsung: Convert Exynos PMU bindings
 to json-schema
Date: Sat, 7 Sep 2019 11:22:03 +0200
Message-ID: <CAJKOXPfg4p1CAbXeF1++b7+OaR99RdeJGrkbusisNKNywoNHHg@mail.gmail.com>
References: <20190823145356.6341-1-krzk@kernel.org> <20190823145356.6341-5-krzk@kernel.org>
 <CAL_JsqJybT41cEqiTriLMywUQj1BtAG_9muJ4=84OkF23y53CA@mail.gmail.com>
 <CAJKOXPc0SY_8BHMsWLN=1M3VQh41+bdBiH21L4KQPA+iLPYy+A@mail.gmail.com>
 <CAL_JsqKdsABWK9Og_f38T9zf3SCFFdhU8WOJ4uJjREantoYvYQ@mail.gmail.com>
 <CAJKOXPfnvu=c5f6AcOSiQ_9E-C2fMf9qbEpy1Tr3QvH8LgAtpQ@mail.gmail.com> <CAL_JsqKyj3s-Mn3q_Lna0w38K3DJzvKN5d72WHzqt4CUVf5X4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKyj3s-Mn3q_Lna0w38K3DJzvKN5d72WHzqt4CUVf5X4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, notify@kernel.orgArnd Bergmann <ar>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 6 Sep 2019 at 17:49, Rob Herring <robh+dt@kernel.org> wrote:
> >
> > The bindings never required any specific ordering. Also the driver
> > just go through all indices and parses them.
> >
> > Your second syntax fails:
> > Documentation/devicetree/bindings/arm/samsung/pmu.yaml:
> > properties:clock-names:items: {'enum': ['clkout0', 'clkout1',
> > 'clkout2', 'clkout3', 'clkout4', 'clkout5', 'clkout6', 'clkout7',
> > 'clkout8', 'clkout9', 'clkout10', 'clkout11', 'clkout12', 'clkout13',
> > 'clkout14', 'clkout15', 'clkout16']} is not of type 'array'
>
> Update dt-schema and try again. It should be allowed now. You'll also
> need to define minItems and maxItems though.

Thanks, works!

Best regards,
Krzysztof
