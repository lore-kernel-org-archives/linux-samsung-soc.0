From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: switch Exynos EHCI/OHCI bindings to use
 array of generic PHYs
Date: Fri, 14 Jun 2019 10:30:39 -0600
Message-ID: <20190614163039.GA24384@bogus>
References: <20190521115849.9882-1-m.szyprowski@samsung.com>
 <CGME20190521120107eucas1p1a56efaa0e7f2117063e70683276edc10@eucas1p1.samsung.com>
 <20190521115849.9882-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521115849.9882-2-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 21, 2019 at 01:58:45PM +0200, Marek Szyprowski wrote:
> Commit 69bec7259853 ("USB: core: let USB device know device node") added
> support for attaching devicetree node for USB devices. Those nodes are
> children of their USB host controller. However Exynos EHCI and OHCI
> driver bindings already define child-nodes for each physical root hub
> port and assigns respective PHY controller and parameters to them. This
> leads to the conflict. A workaround for it has been merged as commit
> 01d4071486fe ("usb: exynos: add workaround for the USB device bindings
> conflict"), but it disabled support for USB device binding for Exynos
> EHCI/OHCI controllers.
> 
> To resolve it properly, lets move PHYs from the sub-nodes to a standard
> array under the 'phys' property.
> 
> Suggested-by: Måns Rullgård <mans@mansr.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/usb/exynos-usb.txt    | 41 +++++++------------
>  1 file changed, 14 insertions(+), 27 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

The old way would also conflict with the usb-connector binding as that 
uses the graph binding.

Rob
