From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC v4 0/7] extcon: usb-gpio: fixes and improvements
Date: Thu, 09 Jun 2016 10:39:38 +0200
Message-ID: <57592B4A.4000407@samsung.com>
References: <CGME20160608134820epcas1p4ee75a89888f2ae2adb733124a330bd2c@epcas1p4.samsung.com>
 <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
 <57592A40.9080608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50860 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932332AbcFIIjn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 04:39:43 -0400
In-reply-to: <57592A40.9080608@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rogerq@ti.com, Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, balbi@ti.com, kishon@ti.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


Hi,


On 06/09/2016 10:35 AM, Chanwoo Choi wrote:
> Hi,
> 
> It is good to support USB_ID and USB_VBUS by extcon.
> 
> But,
> there is some issue about adding the new cable type for
> both EXTCON_USB_ID and EXTCON_USB_VBUS
> 
> I think that the ID and VBUS state are not cable type
> Instead, ID and VBUS state are the property of USB cable.
> 
> So, I'd like to add the following function to support
> the property of each cable as following:
> The client driver can get the state of property by using
> the extcon_get_cable_property_state().
> 
> - int extcon_get_cable_property_state(struct extcon_dev *edev,
> 				unsigned int id,
> 				enum extcon_property property);
> - int extcon_set_cable_property_state(struct extcon_dev *edev,
> 				unsigned int id,
> 				enum extcon_property property,
> 				unsigned int state);
> 
> For example,
> In extcon-usb-gpio.c, set state of property as follwoing:
> 	extcon_set_cable_property_state(edev, EXTCON_USB, EXTCON_USB_PROP_ID, 1);
> 	extcon_set_cable_property_state(edev, EXTCON_USB, EXTCON_USB_PROP_VBUS, 1);
> 
> 
> In the extcon client driver, get state of property as following:
> 	id_state = extcon_get_cable_property_state(edev, EXTCON_USB, EXTCON_USB_PROP_ID);
> 	vbus_state = extcon_get_cable_property_state(edev, EXTCON_USB, EXTCON_USB_PROP_VUBS);

How one can receive notifications with this API?

Last time you wrote, at the end of discussion:
http://thread.gmane.org/gmane.linux.kernel/1923192/focus=1923193
> IMO, if some usb driver check both id and vbus pin at the same time,
> the usb driver can know the both id and vbus pin state through only
one notifier event.
>
> Also,
> If some usb driver want to know the state of id pin except of vbus state,
> when receiving following events, id pin is low.
> 	#define EXTCON_USB_ID_L_VBUS_L0
> 	#define EXTCON_USB_ID_L_VBUS_H1
> when receiving following events, id pin is high.
> 	#define EXTCON_USB_ID_H_VBUS_L2
> 	#define EXTCON_USB_ID_H_VBUS_H3
> Also, some usb driver would catch the vbus pin state with same method.
>
> But, it is just my opinion. We may use following notifier events for
each pin.
> We need to discuss it.
> 	#define EXTCON_USB_ID_LOW
> 	#define EXTCON_USB_ID_HIGH	
> 	#define EXTCON_USB_VBUS_LOW
> 	#define EXTCON_USB_VBUS_HIGH

... all other participants agreed on that conclusion. So why change of
view point now?

Best regards,
Krzysztof
