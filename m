From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 06/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos5250
Date: Sun, 3 Apr 2016 13:08:05 +0900
Message-ID: <20160403040805.GC7507@kozik-lap>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
 <1459493874-2366-6-git-send-email-k.kozlowski@samsung.com>
 <56FEAE29.6010405@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <56FEAE29.6010405@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Re-sending because my previous message was not address to all
recipients. Sorry for the noise.


On Fri, Apr 01, 2016 at 01:21:45PM -0400, Javier Martinez Canillas wrote:
> >  
> > -	usb@12000000 {
> > +	usb_dwc3 {
> >  		compatible = "samsung,exynos5250-dwusb3";
> >  		clocks = <&clock CLK_USB3>;
> >  		clock-names = "usbdrd30";
> 
> The ePAPR document says that "The name of a node should be somewhat generic,
> reflecting the function of the device and not its precise programming model"
> 
> So I wonder if this shouldn't be instead:
> 
> usb_dwc3: usb {

There are already nodes with 'usb' name:
	ehci: usb@12110000 {
		compatible = "samsung,exynos4210-ehci";
		...
	}
	ohci: usb@12120000 {
		compatible = "samsung,exynos4210-ohci";
	}
Having nodes with the same name but some with address some not, should
work (none should be overridden)... but looks a little bit weird.

Anyway I am fine with both.


> Although it seems that not all DT bindings follow this convention so probably
> the name in your patch is correct.
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks for review and comments. I already spotted the 'memory' node
issue so I won't be replying to you with acknowledging comments. :)

BR,
Krzysztof
