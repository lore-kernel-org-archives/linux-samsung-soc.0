From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Tue, 03 Nov 2015 09:58:02 +0300
Message-ID: <004d01d11604$fc7a2a80$f56e7f80$@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <f1fbd1a7877090f4318705f0fccbf4d96c0ebc9c.1446122247.git.p.fedin@samsung.com>
 <56330E6E.50003@samsung.com> <00d401d112ff$c426e9a0$4c74bce0$@samsung.com>
 <5635D1EE.5010604@samsung.com> <012101d11540$8c280be0$a47823a0$@samsung.com>
 <5637FCCB.1060007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <5637FCCB.1060007@samsung.com>
Content-language: ru
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Mark Rutland' <mark.rutland@arm.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, k.kozlowski.k@gmail.com, 'Rob Herring' <robh+dt@kernel.org>, 'Kukjin Kim' <kgene@kernel.org>, 'Kumar Gala' <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

 Hello!

> >>> --- cut exynos5410.dtsi ---
> >>> 		sromc: sromc@12250000 {
> >>> 			#address-cells = <2>;
> >>> 			#size-cells = <1>;
> >>> 			ranges = <0 0 0x04000000 0x20000
> >>> 				  1 0 0x05000000 0x20000
> >>> 				  2 0 0x06000000 0x20000
> >>> 				  3 0 0x07000000 0x20000>;
> >>
> >> Do you have to use 2 cells for address? Cannot it be:
> >>  			ranges = <0 0x04000000 0x20000
> >>  				  1 0x05000000 0x20000
> >>  				  2 0x06000000 0x20000
> >>  				  3 0x07000000 0x20000>;
> >
> >  I tried this first, but it didn't work, and ranges translation
> > gave me something really weird (like addr = 0x80 and
> > size = 0x04000004).
> 
> Did you change the address-cells to <1>?

 Of course i did.

 I don't quote the rest because i simply agree to what you've said. Will respin with these changes.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
