From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 1/9] phy: core: Change the way of_phy_get is called
Date: Fri, 06 Dec 2013 11:52:18 +0100
Message-ID: <009901cef271$3c40d0b0$b4c27210$%debski@samsung.com>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com>
 <1386246579-25141-2-git-send-email-k.debski@samsung.com>
 <52A16104.3080704@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <52A16104.3080704-l0cyMroinI0@public.gmane.org>
Content-language: pl
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

> From: Kishon Vijay Abraham I [mailto:kishon-l0cyMroinI0@public.gmane.org]
> Sent: Friday, December 06, 2013 6:31 AM
> 
> Hi,
> 
> On Thursday 05 December 2013 05:59 PM, Kamil Debski wrote:
> > Previously the of_phy_get function took a struct device * and was
> > declared static. It was impossible to call it from another driver and
> > thus it was impossible to get phy defined
> 
> It was never intended to be called from other drivers. What's up with
> the wrapper of of_phy_get, phy_get()/devm_phy_get()? Why isn't that
> enough?

Implementing support for multiple phys in the ehci driver is a bit tricky.
Especially when we want to do it right. Please have a look at this part of
the dts file:

+    ehci@12580000 {
+        compatible = "samsung,exynos4210-ehci";
+        reg = <0x12580000 0x20000>;
+        interrupts = <0 70 0>;
+        clocks = <&clock 304>, <&clock 305>;
+        clock-names = "usbhost", "otg";
+        status = "disabled";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+            reg = <0>;
+            phys = <&usb2phy 1>;
+            phy-names = "host";
+            status = "disabled";
+        };
+        port@1 {
+            reg = <1>;
+            phys = <&usb2phy 2>;
+            phy-names = "hsic0";
+            status = "disabled";
+        };
+        port@2 {
+            reg = <2>;
+            phys = <&usb2phy 3>;
+            phy-names = "hsic1";
+            status = "disabled";
+        };
+    };

With the above we have a clear specification of ports and their respective
phys. But to do this properly the ehci driver has to iterate over port
nodes. It is much easier to use devm_of_phy_get by giving the node as its
argument.

[snip]

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
