From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] pinctrl or i2c-s3c2410: fix pinctrl NULL return values in stubs
Date: Sat, 23 Feb 2013 18:55:47 +0100
Message-ID: <201302231855.47560.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

while implementing devicetree support for the s3c2416 I noticed a fault
in the i2c-s3c2410 driver. The s3c2416 does not support pinctrl at the
moment (and will probably for a while), so the fallback functions in
pinctrl/consumer.h were used. These functions fail silently and the
relevant pinctrl_get only returns NULL but the i2c driver only checked
for real error-pointers. This resulted in the i2c gpios not getting
configured at all.

There are of course two possible solutions. Check for NULL pinctrl
handles in the driver or return meaningful error codes in the pinctrl
stubs. All other pinctrl drivers also only seem to handle real error
codes and would gladly accept NULL handles, so I'm not sure which is
the correct fix to not break to much existing code.

Therefore I implemented both variants and you get to pick :-) .
This of course means from the following patches only one is necessary.


Heiko
