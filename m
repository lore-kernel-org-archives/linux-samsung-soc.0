From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH 1/9] phy: core: Change the way of_phy_get is called
Date: Fri, 13 Dec 2013 15:20:59 +0100
Message-ID: <008901cef80e$8cac3650$a604a2f0$%debski@samsung.com>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com>
 <1386246579-25141-2-git-send-email-k.debski@samsung.com>
 <52A16104.3080704@ti.com> <009901cef271$3c40d0b0$b4c27210$%debski@samsung.com>
 <52A56FC0.8020001@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <52A56FC0.8020001@ti.com>
Content-language: pl
Sender: linux-kernel-owner@vger.kernel.org
To: 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi, 

> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
> Sent: Monday, December 09, 2013 8:23 AM
> 
> On Friday 06 December 2013 04:22 PM, Kamil Debski wrote:
> > Hi,
> >
> >> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
> >> Sent: Friday, December 06, 2013 6:31 AM
> >>
> >> Hi,
> >>
> >> On Thursday 05 December 2013 05:59 PM, Kamil Debski wrote:
> >>> Previously the of_phy_get function took a struct device * and was
> >>> declared static. It was impossible to call it from another driver
> >>> and thus it was impossible to get phy defined
> >>
> >> It was never intended to be called from other drivers. What's up
> with
> >> the wrapper of of_phy_get, phy_get()/devm_phy_get()? Why isn't that
> >> enough?
> >
> > Implementing support for multiple phys in the ehci driver is a bit
> tricky.
> > Especially when we want to do it right. Please have a look at this
> > part of the dts file:
> >
> > +    ehci@12580000 {
> > +        compatible = "samsung,exynos4210-ehci";
> > +        reg = <0x12580000 0x20000>;
> > +        interrupts = <0 70 0>;
> > +        clocks = <&clock 304>, <&clock 305>;
> > +        clock-names = "usbhost", "otg";
> > +        status = "disabled";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        port@0 {
> > +            reg = <0>;
> > +            phys = <&usb2phy 1>;
> > +            phy-names = "host";
> > +            status = "disabled";
> > +        };
> > +        port@1 {
> > +            reg = <1>;
> > +            phys = <&usb2phy 2>;
> > +            phy-names = "hsic0";
> > +            status = "disabled";
> > +        };
> > +        port@2 {
> > +            reg = <2>;
> > +            phys = <&usb2phy 3>;
> > +            phy-names = "hsic1";
> > +            status = "disabled";
> > +        };
> > +    };
> >
> > With the above we have a clear specification of ports and their
> > respective phys. But to do this properly the ehci driver has to
> > iterate over port nodes. It is much easier to use devm_of_phy_get by
> > giving the node as its argument.
> 
> I see. There are a couple of more things we do in the wrapper that gets
> missed while exporting of_phy_get (get_device and try_module_get). You
> might want to re-work that one.

Thank you for the review. I have just sent an updated version of the core
patches.

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
