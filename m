From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V6 3/3] ARM: dts: Add pcie controller node for Samsung
 EXYNOS5440 SoC
Date: Thu, 20 Jun 2013 20:04:47 +0900
Message-ID: <00d801ce6da5$fa792d80$ef6b8880$@samsung.com>
References: <00c201ce6d85$83b072a0$8b1157e0$@samsung.com>
 <3250954.dVh4O1LchK@flatron> <00c501ce6d8f$af1bf900$0d53eb00$@samsung.com>
 <201306201216.37248.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <201306201216.37248.arnd@arndb.de>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Andrew Murray' <andrew.murray@arm.com>, 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, 'Thierry Reding' <thierry.reding@avionic-design.de>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, June 20, 2013 7:17 PM, Arnd Bergmann wrote:
> On Thursday 20 June 2013, Jingoo Han wrote:
> > 2. patch adding label to the pinctrl node (which is a prerequisite) and
> >     board-specific properties of PCIe nodes.
> >    [PATCH] ARM: dts: Add pcie controller node for exynos5440-ssdk5440
> >
> > arch/arm/boot/dts/exynos5440-ssdk5440.dts
> > +
> > +       pcie0@290000 {
> > +               reset-gpio = <&pin_ctrl 5 0>;
> > +       };
> > +
> > +       pcie1@2a0000 {
> > +               reset-gpio = <&pin_ctrl 22 0>;
> > +       };
> >
> > arch/arm/boot/dts/exynos5440.dtsi
> > -       pinctrl {
> > +       pin_ctrl: pinctrl {
> >
> 
> Note that you don't really have to use a label, you can also refer
> to the pinctrl node by its full path, which is just "/pinctrl"
> or "/pinctrl@e0000".

I see.

But, I have a question.
Using phandle has been the usual way to referring to a node. 
Why do you want to do it differently?

Best regards,
Jingoo Han

> 
> 	Arnd
