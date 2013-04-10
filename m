From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v5 0/3] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Wed, 10 Apr 2013 19:38:39 +0900
Message-ID: <310201ce35d7$90821cd0$b1865670$%kim@samsung.com>
References: <1363334534-21901-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1363334534-21901-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Vivek Gautam wrote:
> 
> This patch-set is in continuation with patch-series:
> [PATCH v4 0/4] Enable ehci, ohci and dwc3 devices on exynos5250
> out of which follwowing patches have been picked up:
> ARM: Exynos5250: Enabling ehci-s5p driver
> ARM: Exynos5250: Enabling ohci-exynos driver
> 
> Based on following patch-set for Samsung's usb PHY enablement:
> [PATCH v4 0/2] ARM: Exynos5250: Enabling samsung usb phy
> 
> and further depends on dwc3-exynos driver patch-set:
> [PATCH 0/2] dwc3: exynos: Device tree fixes
> 
> Changes from v4:
>  - Aligning with the recently merged common clock framework, thereby
>    no place for clock file changes. ;-)
>  - Adding proper binding documentation as per latest bindings changes in
>    dwc3 driver (dwc3/core.c as well as for dwc3-exynos.c change reflected
>    by above patch-set.
>  - Bifurcating the patch to separate our Documentation, arch and dts
> changes.
> 
> Vivek Gautam (3):
>   usb: Add device tree bindings for dwc3-exynos
>   ARM: exynos5250: dts: Enabling dwc3-exynos driver
>   ARM: exynos5: Enable XHCI support on exynos5
> 
>  .../devicetree/bindings/usb/exynos-usb.txt         |   34
> ++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |   20 ++++++++++-
>  arch/arm/mach-exynos/Kconfig                       |    1 +
>  3 files changed, 53 insertions(+), 2 deletions(-)
> 
> --
> 1.7.6.5

Applied this series, thanks.

- Kukjin
