From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Thu, 26 Nov 2015 12:49:20 +0900
Message-ID: <56568140.3060302@samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
 <56428F34.7060003@samsung.com> <56531B1F.9050502@osg.samsung.com>
 <5653DEA2.6060802@samsung.com> <5653E851.4070608@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29691 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbbKZDtX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 22:49:23 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYE00EESLA80AA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 03:49:20 +0000 (GMT)
In-reply-to: <5653E851.4070608@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, j.anaszewski@samsung.com, Andrzej Hajda <a.hajda@samsung.com>

On 24.11.2015 13:32, Javier Martinez Canillas wrote:
> 
>> least some frame buffer console on DP or HDMI (or whatever output could
>> be generated... Xorg/Wayland would be better of course). You need it
> 
> Yes, as I mentioned in the previous email, I tested display (with X) on an
> Exynos5800 Peach Pi. I don't have a rootfs with wayland/weston handy but I
> could prepare one tomorrow to give a try.

I think one X-window system is sufficient. More important would be to
test different drivers.

> 
>> because display and camera (including complementary modules like JPEG,
>> MFC etc) are actually the only users of Exynos IOMMU in mainline.
>>
> 
> Do you have some test cases for MFC? I know that Gstreamer has support
> for it but I don't know what Gst pipelines I can use to test if all is
> working correctly.

Yes, I think we have. I think Jacek Anaszewski or Andrzej Hajda (both
Cc-ed) were developing MFC drivers and testing it.

Jacek, Andrzej, Marek,

Do you have test cases for Exynos MFC drivers? Is it possible to share them?

Best regards,
Krzysztof
