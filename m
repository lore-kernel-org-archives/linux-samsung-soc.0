From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Tue, 21 Jun 2011 10:36:40 +0100
Message-ID: <20110621093640.GB23234@n2100.arm.linux.org.uk>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com> <1308639827-2121-5-git-send-email-p.paneri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1308639827-2121-5-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 21, 2011 at 12:33:46PM +0530, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org wrote:
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <mach/regs-clock.h>
> +#include <mach/gpio.h>

linux/gpio.h please.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
