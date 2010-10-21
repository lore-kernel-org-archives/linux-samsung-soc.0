From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 0/4] USB: gadget: Add Samsung S3C24xx USB HS controller
 driver
Date: Thu, 21 Oct 2010 23:37:56 +0100
Message-ID: <4CC0C0C4.8050308@fluff.org>
References: <1286928627-22824-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:57597 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751806Ab0JUWh6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 18:37:58 -0400
In-Reply-To: <1286928627-22824-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On 13/10/10 01:10, Sangbeom Kim wrote:
> The Samsung's S3C2416, S3C2443 and S3C2450 includes a USB High-Speed
> device controller module. This driver enables support for USB high-speed
> gadget functionality for the Samsung S3C24xx SoC's that include this
> controller.
> 
> The patch series contains:
> [PATCH 1/4] ARM: S3C2416: Add USB Phy register definitions
> [PATCH 2/4] ARM: S3C24XX: Add plaform device definition for USB High-Speed gadget controller.
> [PATCH 3/4] USB: Gadget: Add Samsung S3C24XX USB High-Speed controller driver
> [PATCH 4/4] ARM: S3C2416: Add support for USB 2.0 High-Speed gadget controller

patch 3/4 needs a bit of work, otherwise looks ok.

I'll look at applying the s3c24xx items in the next day or so.

-- 
Ben
