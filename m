From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/2] dwc2/s3c-hsotg: Initial steps to combine the 2 driver
Date: Tue, 14 Jan 2014 05:01:00 -0600
Message-ID: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>, Luis Ortega Perez de Villar <luiorpe1-qHq8kIZmbuA@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Hi,

I'm starting work downstream on combining the DWC2 host driver and the s3c-hsotg
gadget driver into a dual-role OTG driver. Before I go further, I was hoping to
solicit comments on whether or not my initial approach is correct? I know there
are plans to combine the 2, so would like to solicit comments/suggestions so
that I can also upstream it as well.

These 2 patches:

* Moves the DWC2 driver out of drivers/staging into drivers/usb/dwc2/
* Moves the s3c-hsotg driver into drivers/usb/dwc2/
* Delete s3c-hsotg.h 
* Make the s3c-hsotg.c file use the defines in hw.h from the DWC2 driver.

This initial patch has been tested on the SOCFPGA platform only in Host-only
and Gadget-only mode.

The next step would be to do the combining of the driver into a dual-role OTG
driver.

Patchset is base on Felipe Balbi's usb-next tree.

Thanks, in advance for any comments and suggestions.
Dinh

Dinh Nguyen (2):
  staging: dwc2: Move DWC2 usb driver out of staging
  usb: gadget: s3c-hsotg: move s3c-hsotg driver into dwc2

 drivers/staging/Kconfig          |    2 -
 drivers/staging/dwc2/Kconfig     |   53 -
 drivers/staging/dwc2/Makefile    |   25 -
 drivers/staging/dwc2/core.c      | 2853 ----------------------------
 drivers/staging/dwc2/core.h      |  768 --------
 drivers/staging/dwc2/core_intr.c |  498 -----
 drivers/staging/dwc2/hcd.c       | 2976 ------------------------------
 drivers/staging/dwc2/hcd.h       |  769 --------
 drivers/staging/dwc2/hcd_ddma.c  | 1210 ------------
 drivers/staging/dwc2/hcd_intr.c  | 2119 ---------------------
 drivers/staging/dwc2/hcd_queue.c |  862 ---------
 drivers/staging/dwc2/hw.h        |  809 --------
 drivers/staging/dwc2/pci.c       |  178 --
 drivers/staging/dwc2/platform.c  |  149 --
 drivers/usb/Kconfig              |    2 +
 drivers/usb/Makefile             |    1 +
 drivers/usb/dwc2/Kconfig         |   82 +
 drivers/usb/dwc2/Makefile        |   25 +
 drivers/usb/dwc2/core.c          | 2853 ++++++++++++++++++++++++++++
 drivers/usb/dwc2/core.h          |  768 ++++++++
 drivers/usb/dwc2/core_intr.c     |  498 +++++
 drivers/usb/dwc2/hcd.c           | 2976 ++++++++++++++++++++++++++++++
 drivers/usb/dwc2/hcd.h           |  769 ++++++++
 drivers/usb/dwc2/hcd_ddma.c      | 1210 ++++++++++++
 drivers/usb/dwc2/hcd_intr.c      | 2119 +++++++++++++++++++++
 drivers/usb/dwc2/hcd_queue.c     |  862 +++++++++
 drivers/usb/dwc2/hw.h            |  814 ++++++++
 drivers/usb/dwc2/pci.c           |  178 ++
 drivers/usb/dwc2/platform.c      |  149 ++
 drivers/usb/dwc2/s3c-hsotg.c     | 3794 +++++++++++++++++++++++++++++++++++++
 drivers/usb/gadget/Makefile      |    1 -
 drivers/usb/gadget/s3c-hsotg.c   | 3795 --------------------------------------
 drivers/usb/gadget/s3c-hsotg.h   |  378 ----
 33 files changed, 17100 insertions(+), 17445 deletions(-)
 delete mode 100644 drivers/staging/dwc2/Kconfig
 delete mode 100644 drivers/staging/dwc2/Makefile
 delete mode 100644 drivers/staging/dwc2/core.c
 delete mode 100644 drivers/staging/dwc2/core.h
 delete mode 100644 drivers/staging/dwc2/core_intr.c
 delete mode 100644 drivers/staging/dwc2/hcd.c
 delete mode 100644 drivers/staging/dwc2/hcd.h
 delete mode 100644 drivers/staging/dwc2/hcd_ddma.c
 delete mode 100644 drivers/staging/dwc2/hcd_intr.c
 delete mode 100644 drivers/staging/dwc2/hcd_queue.c
 delete mode 100644 drivers/staging/dwc2/hw.h
 delete mode 100644 drivers/staging/dwc2/pci.c
 delete mode 100644 drivers/staging/dwc2/platform.c
 create mode 100644 drivers/usb/dwc2/Kconfig
 create mode 100644 drivers/usb/dwc2/Makefile
 create mode 100644 drivers/usb/dwc2/core.c
 create mode 100644 drivers/usb/dwc2/core.h
 create mode 100644 drivers/usb/dwc2/core_intr.c
 create mode 100644 drivers/usb/dwc2/hcd.c
 create mode 100644 drivers/usb/dwc2/hcd.h
 create mode 100644 drivers/usb/dwc2/hcd_ddma.c
 create mode 100644 drivers/usb/dwc2/hcd_intr.c
 create mode 100644 drivers/usb/dwc2/hcd_queue.c
 create mode 100644 drivers/usb/dwc2/hw.h
 create mode 100644 drivers/usb/dwc2/pci.c
 create mode 100644 drivers/usb/dwc2/platform.c
 create mode 100644 drivers/usb/dwc2/s3c-hsotg.c
 delete mode 100644 drivers/usb/gadget/s3c-hsotg.c
 delete mode 100644 drivers/usb/gadget/s3c-hsotg.h
---
Cc: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>
Cc: Luis Ortega Perez de Villar <luiorpe1-qHq8kIZmbuA@public.gmane.org>
Cc: Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
