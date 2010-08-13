From: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] USB: s3c-hsotg: Remove DEBUG define
Date: Fri, 13 Aug 2010 21:29:30 +0200
Message-ID: <4c659d1c.487e0e0a.037b.ffffcf6a@mx.google.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

DEBUG is defined unconditionally, remove it as this clutters the message log.

Signed-off-by: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 521ebed..a229744 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -12,8 +12,6 @@
  * published by the Free Software Foundation.
 */
 
-#define DEBUG
