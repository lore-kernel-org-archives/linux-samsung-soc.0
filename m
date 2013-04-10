From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v4 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Wed, 10 Apr 2013 19:31:29 +0900
Message-ID: <310001ce35d6$901546b0$b03fd410$%kim@samsung.com>
References: <1363334171-21812-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1363334171-21812-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Vivek Gautam wrote:
> 
> Based on 'for-next' of linux-samsung tree with following patches
> from Doug on top:
> usb: Document clocks in samsung, exynos4210-ehci/ohci bindings
> ARM: dts: add usb 2.0 clock references to exynos5250 device tree
> 
> Also depending upon following patch-series for Samsung-usb-phy driver:
> [PATCH v7 0/2] Adding USB 3.0 DRD-phy support for exynos5250
> 
> Changes from v3:
> Added 'clocks' and 'clock-names' entry also in device nodes, aligning
> with common clock framework for Samsung's SoCs.
> 
> Vivek Gautam (2):
>   ARM: Exynos5250: Enabling samsung-usb2phy driver
>   ARM: Exynos5250: Enabling samsung-usb3phy driver
> 
>  arch/arm/boot/dts/exynos5250.dtsi |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
> 
> --
> 1.7.6.5

OK, applied, thanks.

- Kukjin
