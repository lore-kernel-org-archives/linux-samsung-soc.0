From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH 0/4] USB: gadget: Add Samsung S3C24xx USB HS controller driver
Date: Fri, 22 Oct 2010 11:45:09 +0530
Message-ID: <AANLkTimmFWNzWRQ8AYmS5tzzF9+gZYspwyJgm5rXP-zR@mail.gmail.com>
References: <1286928627-22824-1-git-send-email-sbkim73@samsung.com>
	<4CC0C0C4.8050308@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:47139 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751594Ab0JVGPL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Oct 2010 02:15:11 -0400
In-Reply-To: <4CC0C0C4.8050308@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On Fri, Oct 22, 2010 at 4:07 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> On 13/10/10 01:10, Sangbeom Kim wrote:
>> The Samsung's S3C2416, S3C2443 and S3C2450 includes a USB High-Speed
>> device controller module. This driver enables support for USB high-speed
>> gadget functionality for the Samsung S3C24xx SoC's that include this
>> controller.
>>
>> The patch series contains:
>> [PATCH 1/4] ARM: S3C2416: Add USB Phy register definitions
>> [PATCH 2/4] ARM: S3C24XX: Add plaform device definition for USB High-Speed gadget controller.
>> [PATCH 3/4] USB: Gadget: Add Samsung S3C24XX USB High-Speed controller driver
>> [PATCH 4/4] ARM: S3C2416: Add support for USB 2.0 High-Speed gadget controller
>
> patch 3/4 needs a bit of work, otherwise looks ok.
>
> I'll look at applying the s3c24xx items in the next day or so.

Hi Ben,

Thanks for your review. I will update patch 3/4 as per your comments.

Regards,
Thomas.

>
> --
> Ben
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
