From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [RFC PATCHv1] usb: dwc2: Combine the dwc2 and s3c_hsotg into a
 single USB DRD driver.
Date: Wed, 12 Feb 2014 14:56:16 +0900
Message-ID: <000401cf27b7$25114160$6f33c420$%han@samsung.com>
References: <1391550341-32509-1-git-send-email-dinguyen@altera.com>
 <1391550341-32509-2-git-send-email-dinguyen@altera.com>
 <52FB07CE.6060601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33763 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbaBLF4U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 00:56:20 -0500
In-reply-to: <52FB07CE.6060601@wwwdotorg.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Stephen Warren' <swarren@wwwdotorg.org>, dinguyen@altera.com, linux-usb@vger.kernel.org
Cc: dinh.linux@gmail.com, linux-samsung-soc@vger.kernel.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Paul Zimmerman' <paulz@synopsys.com>, 'Felipe Balbi' <balbi@ti.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Matt Porter' <mporter@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Matthijs Kooijman' <matthijs@stdin.nl>, 'Fengguang Wu' <fengguang.wu@intel.com>, 'Dan Carpenter' <dan.carpenter@oracle.com>, 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>, 'Wolfram Sang' <wsa@the-dreams.de>, 'Yijing Wang' <wangyijing@huawei.com>, 'Ray Jui' <rjui@broadcom.com>, 'Julien Delacou' <julien.delacou@stericsson.com>, 'Dom Cobley' <popcornmix@gmail.com>, 'Rashika Kheria' <rashika.kheria@gmail.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Robert Baldyga' <r.baldyga@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, February 12, 2014 2:34 PM, Stephen Warren wrote:
> On 02/04/2014 02:45 PM, dinguyen@altera.com wrote:
> > From: Dinh Nguyen <dinguyen@altera.com>
> >
> > This means that the driver can be in host or peripheral mode when the appropriate
> > connector is used. When an A-cable is plugged in, the driver behaves in host
> > mode, and when a B-cable is used, the driver will be in peripheral mode.
> 
> Sorry for the slow response. When building ARCH=arm bcm2835_defconfig, I
> get build errors:
> 
> > drivers/built-in.o: In function `dwc2_gadget_init':
> > drivers/usb/dwc2/s3c-hsotg.c:3335: undefined reference to `usb_add_gadget_udc'
> > drivers/built-in.o: In function `s3c_hsotg_remove':
> > drivers/usb/dwc2/s3c-hsotg.c:3358: undefined reference to `usb_del_gadget_udc'
> > drivers/usb/dwc2/s3c-hsotg.c:3364: undefined reference to `usb_gadget_unregister_driver'

These errors happen when CONFIG_USB_GADGET=n. 's3c-hsotg.c'
supports only gadget mode. In the case of USB_DWC2_HOST mode,
CONFIG_USB_GADGET is NOT enabled. I don't know how to solve it.

Best regards,
Jingoo Han
