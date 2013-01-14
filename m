From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/2] Adding USB 3.0 DRD-phy support for exynos5250
Date: Mon, 14 Jan 2013 18:29:35 +0530
Message-ID: <1358168377-22919-1-git-send-email-gautam.vivek@samsung.com>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Changes from v2:
 - Renaming 'samsung-usbphy.c' driver to 'samsung-usb2.c' indicating
   usb 2.0 phy controller's driver for Samsung's SoCs.
 - Moving the register definitions and strcuture definitions to
   common header file 'samsung-usbphy.h' to be used across
   usb 2.0 and usb 3.0 phy.
 - Keeping common exported function definitions in samsung-usbphy.c
   which can be used across usb 2.0 and usb 3.0 phy.
 - Writting separate driver file for Samsung's USB 3.0 phy controller.
   and making it dependent on USB_DWC3.

Rebased on top of usb-next followed by following patches/patch-threads:
	-- [PATCH v9 1/2] usb: phy: samsung: Introducing usb phy driver for hsotg
	-- [PATCH] usb: phy: samsung: Add support to set pmu isolation (version 6)
	-- [PATCH v6 0/4] Adding usb2.0 host-phy support for exynos5250

Changes form v1:
 - Moved architecture related patch out of this patch-set.
 - Replaced unnecessary multi-line macro definitions by
   single line definitions.
 - Creating new data structure for USB 3.0 phy type and embedding
   it in 'samsung_usbphy' structure.
 - Adding a flag in 'samsung_usbphy' structure to check if device
   has usb 3.0 type phy or not.
 - Restructuring probe sequence for USB 3.0 phy, such that we are
   initializing only when device has usb3.0 type phy.

Vivek Gautam (2):
  usb: phy: samsung: Common out the generic stuff
  usb: phy: samsung: Add PHY support for USB 3.0 controller

 drivers/usb/phy/Kconfig          |    8 +
 drivers/usb/phy/Makefile         |    3 +-
 drivers/usb/phy/samsung-usb2.c   |  511 +++++++++++++++++++++++++++
 drivers/usb/phy/samsung-usb3.c   |  349 +++++++++++++++++++
 drivers/usb/phy/samsung-usbphy.c |  713 +-------------------------------------
 drivers/usb/phy/samsung-usbphy.h |  328 +++++++++++++++++
 6 files changed, 1205 insertions(+), 707 deletions(-)
 create mode 100644 drivers/usb/phy/samsung-usb2.c
 create mode 100644 drivers/usb/phy/samsung-usb3.c
 create mode 100644 drivers/usb/phy/samsung-usbphy.h

-- 
1.7.6.5
