From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 2/2] USB: s3c_hsotg: define USB_GADGET_DUALSPEED in Kconfig
Date: Wed, 19 May 2010 18:51:24 +0200
Message-ID: <4BF4170C.1020305@gmail.com>
References: <4BF1951C.1080108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:4778 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000Ab0ESQv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 May 2010 12:51:29 -0400
In-Reply-To: <4BF1951C.1080108@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>, Greg Kroah-Hartman <gregkh@suse.de>, David Brownell <dbrownell@users.sourceforge.net>

Op 17-05-10 21:12, Maurus Cuelenaere schreef:
> The s3c_hsotg driver sets usb_gadget->is_dualspeed to 1, yet it doesn't define
> USB_GADGET_DUALSPEED in Kconfig. This triggers a NULL pointer dereference in
> the composite driver (which is fixed in another patch).
>
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  drivers/usb/gadget/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>   

I'm unsure whether I should be the one stating this, but Ben acked this
patch:

Acked-by: Ben Dooks <ben-linux@fluff.org>

-- 
Maurus Cuelenaere
