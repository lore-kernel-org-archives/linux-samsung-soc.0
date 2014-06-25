From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/4 v2] devicetree: bindings: Document murata vendor prefix
Date: Wed, 25 Jun 2014 11:59:30 +0530
Message-ID: <1403677773-21141-2-git-send-email-ch.naveen@samsung.com>
References: <1403677773-21141-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1403677773-21141-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add Murata Manufacturing Co., Ltd. to the list of device tree
vendor prefixes.

Murata manufactures NTC (Negative Temperature Coefficient) based
Thermistors for small scale applications like Mobiles and PDAs.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
Changes since v1:
1. Rearranged vendor-prefix alphabetically
2. Added Acked-by from Mark Rutland

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4d7f375..46a311e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -83,6 +83,7 @@ mosaixtech	Mosaix Technologies, Inc.
 moxa	Moxa
 mpl	MPL AG
 mundoreader	Mundo Reader S.L.
+murata	Murata Manufacturing Co., Ltd.
 mxicy	Macronix International Co., Ltd.
 national	National Semiconductor
 neonode		Neonode Inc.
-- 
1.7.9.5
