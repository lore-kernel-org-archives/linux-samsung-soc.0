From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: Fix style in s3c-hsotg.c
Date: Wed, 04 Sep 2013 10:33:52 +0900
Message-ID: <000701cea90e$cff0e3b0$6fd2ab10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16921 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755007Ab3IDBdy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 21:33:54 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pavel Machek' <pavel@ucw.cz>
Cc: linux-usb@vger.kernel.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Felipe Balbi' <balbi@ti.com>, 'Jingoo Han' <jg1.han@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kukjin Kim' <kgene.kim@samsung.com>

On 09/02/2013 05:58 PM, Pavel Machek wrote:
> Hi!
>
> checkpatch.pl has some valid complaints about style in s3c-hsotg.c :
> macro with if should be really enclosed in do {} while, and puts is
> going to be slightly faster.
>
> Here's suggested patch. I don't have the hardware, so it is completely
> untested.

CC'ed linux-samsung-soc@vger.kernel.org, Kukjin Kim

Hi Pavel Machek,

I have the hardware. :-)
Also, I am developing USB stuff of Samsung SoCs.


>
> Signed-off-by: Pavel Machek, <pavel@ucw.cz>
>
> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
> index af22f24..f8e762a 100644
> --- a/drivers/usb/gadget/s3c-hsotg.c
> +++ b/drivers/usb/gadget/s3c-hsotg.c
> @@ -2091,12 +2091,14 @@ static void kill_all_requests(struct s3c_hsotg *hsotg,
>  }
>  
>  #define call_gadget(_hs, _entry) \
> +do { \
>  	if ((_hs)->gadget.speed != USB_SPEED_UNKNOWN &&	\
>  	    (_hs)->driver && (_hs)->driver->_entry) { \
>  		spin_unlock(&_hs->lock); \
>  		(_hs)->driver->_entry(&(_hs)->gadget); \
>  		spin_lock(&_hs->lock); \
>  		}
> +} while (0)

It makes build error.
Thus, it should be fixed as below:

	} \
} while(0)

Other things look good.
Thank you for sending the patch. :)

Best regards,
Jingoo Han
