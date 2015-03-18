From: Ben Gamari <ben-OfdNVJEh3GKkIYD+M5K+dQ@public.gmane.org>
Subject: [PATCH v2] USB3503: Always respect refclk-frequency
Date: Wed, 18 Mar 2015 14:37:44 -0400
Message-ID: <1426703865-31868-1-git-send-email-ben@smart-cactus.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: afaerber-l3A5Bk7waGM@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

My apologies for the double-post; the previous patch lacked an Acked-by and
several important recipients. Keep me on the CC list as I'm not subscribed to
the linux-usb list.

The USB3503 driver exposes the refclk-frequency DT property to allow users to
specify the rate of the clock provided on the device's REFCLK. This is
necessary for the driver to correctly configure the REF_SEL and INT_N pins.
Currently the driver only pays attention to refclk-frequency if the refclk
property is also provided. The binding documentation stipulates that the user
should omit refclk if the clock can be assumed to be always available.

This patch reworks the initialization codepath such that the driver always
respects the refclk-frequency property, even if refclk is omitted.

Cheers,

 - Ben


[1] https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/drivers/usb/misc/usb3503.c?id=657d898a9320a7cdb9b94565d75ecf75c25cbf0a

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
