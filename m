From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Thu, 26 Nov 2015 12:49:42 +0100
Message-ID: <5656F1D6.2070409@samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
 <56428F34.7060003@samsung.com> <56531B1F.9050502@osg.samsung.com>
 <5653DEA2.6060802@samsung.com> <5653E851.4070608@osg.samsung.com>
 <56568140.3060302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52821 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbbKZLu2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 06:50:28 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYF00GE87K1SP90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 11:50:25 +0000 (GMT)
In-reply-to: <56568140.3060302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, j.anaszewski@samsung.com

Hi Javier, Krzysztof,

On 11/26/2015 04:49 AM, Krzysztof Kozlowski wrote:
...
> Do you have some test cases for MFC? I know that Gstreamer has support
> for it but I don't know what Gst pipelines I can use to test if all is
> working correctly.
> Yes, I think we have. I think Jacek Anaszewski or Andrzej Hajda (both
> Cc-ed) were developing MFC drivers and testing it.
>
> Jacek, Andrzej, Marek,
>
> Do you have test cases for Exynos MFC drivers? Is it possible to share them?

There are test apps at:
http://git.linuxtv.org/cgit.cgi/snawrocki/samsung-utils.git/
v4l2-mfc-example - MFC decoder,
v4l2-mfc-encoder - MFC encoder,


Regards
Andrzej
