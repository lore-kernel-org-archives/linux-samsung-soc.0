From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Tue, 18 Dec 2012 21:09:40 +0530
Message-ID: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch-set enables the samsung-usbphy driver on exynos5250,
which enables the support for USB2 type and USB3 type phys.
The corresponding phy driver patches are available at:
 1) https://lkml.org/lkml/2012/12/18/201
 2) https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December/024559.html

Tested this patch-set on exynos5250 with following patch-sets for
USB 2.0 and USB 3.0:
 - https://patchwork.kernel.org/patch/1794651/
 - https://lkml.org/lkml/2012/12/18/201
 - https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December/024559.html
 - http://comments.gmane.org/gmane.linux.usb.general/76352
 - https://lkml.org/lkml/2012/12/13/492

Vivek Gautam (2):
  ARM: Exynos5250: Enabling samsung-usbphy driver
  ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy driver

 arch/arm/boot/dts/exynos5250.dtsi       |   23 +++++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
 3 files changed, 26 insertions(+), 0 deletions(-)

-- 
1.7.6.5
