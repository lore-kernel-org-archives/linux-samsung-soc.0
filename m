From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCHv1] usb: dwc2: Combine dwc2/s3c-hsotg into a single DRD
Date: Tue, 4 Feb 2014 15:45:40 -0600
Message-ID: <1391550341-32509-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Julien Delacou <julien.delacou-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kisho
List-Id: linux-samsung-soc@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Hello,

This patch is my first attempt in combining the Synopsys DWC2 host and the
s3c-hsotg peripheral into a single dual-role driver.

The patch:

* Moves the s3c-hsotg driver into the dwc2 folder.
* Adds the gadget data structure into the dwc2_hsotg data structure.
* Replace the s3c-hsotg.h defines with the hw.h defines in dwc2
* Uses the "otg" clock for both host/peripheral.
* Uses the dwc2_handle_common_intr() IRQ handler for both modes.

I have only been able to test the driver on the SOCFPGA platform, which has
v2.93a of the dual-role core.

Any comments and testing would be greatly appreciated.

Thanks,

Dinh Nguyen (1):
  usb: dwc2: Combine the dwc2 and s3c_hsotg into a single USB DRD
    driver.

 drivers/usb/dwc2/Kconfig                 |   35 +-
 drivers/usb/dwc2/Makefile                |    2 +
 drivers/usb/dwc2/core.c                  |    1 +
 drivers/usb/dwc2/core.h                  |  173 ++-
 drivers/usb/dwc2/core_intr.c             |  134 ++-
 drivers/usb/dwc2/hcd.c                   |    7 +-
 drivers/usb/dwc2/hcd.h                   |    1 +
 drivers/usb/dwc2/hw.h                    |   23 +-
 drivers/usb/dwc2/platform.c              |   49 +-
 drivers/usb/{gadget => dwc2}/s3c-hsotg.c | 1835 ++++++++++++------------------
 drivers/usb/gadget/Kconfig               |    7 -
 drivers/usb/gadget/Makefile              |    1 -
 drivers/usb/gadget/s3c-hsotg.h           |  378 ------
 13 files changed, 1088 insertions(+), 1558 deletions(-)
 rename drivers/usb/{gadget => dwc2}/s3c-hsotg.c (57%)
 delete mode 100644 drivers/usb/gadget/s3c-hsotg.h
---
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>
Cc: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Julien Delacou <julien.delacou-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
