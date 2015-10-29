From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v3 3/4] drivers: exynos-srom: Add support for bank
 configuration
Date: Thu, 29 Oct 2015 11:17:21 +0300
Message-ID: <001201d11222$3c69a6c0$b53cf440$@samsung.com>
References: <cover.1446018918.git.p.fedin@samsung.com>
 <048021141f295b0e70c852134d4ac9cc6f7f1da4.1446018918.git.p.fedin@samsung.com>
 <56318175.6000006@samsung.com> <006b01d11216$9831dc40$c89594c0$@samsung.com>
 <5631C3D3.1050309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63085 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbbJ2IRZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 04:17:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWZ004YV30YGT30@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 08:17:22 +0000 (GMT)
In-reply-to: <5631C3D3.1050309@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>

 Hello!

> But the system won't get any information about the failure. Device using
> these banks should not probe in such case.

 In order to achieve this effect, i believe, it's not enough to fail SROMc probe. Peripherials (such as smsc) should then be
declared as subnodes.
 There's one problem with this, however. I could not manage to do it. If i place device's node inside of SROMc node, it does not get
probed at all, and i don't really understand why. I tried to read the code and i suggest that only specific devices (like
compatible="simple-bus") are searched for sub-devices.
 OTOH, this patch (http://www.spinics.net/lists/arm-kernel/msg449703.html) perfectly worked, and generic timer node placed inside of
MCT node was perfectly probed by the kernel. So i still don't understand why i could not place smsc description inside of SROMc.
 May be you can help me with this?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
