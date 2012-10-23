From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] gpio: samsung: Fix input mode setting function for
 GPIO int
Date: Tue, 23 Oct 2012 23:16:46 +0900
Message-ID: <021201cdb129$08cd7330$1a685990$%kim@samsung.com>
References: <000101cd9c63$ecb606a0$c62213e0$@com>
 <CACRpkdZuED59F2FfewXNxBeYauZEaXUxUiY5GHJDxdQvzxGtZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32861 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273Ab2JWOQr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:16:47 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00LJDNNYLEA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:16:46 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC00AZDNNYOY10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:16:46 +0900 (KST)
In-reply-to: <CACRpkdZuED59F2FfewXNxBeYauZEaXUxUiY5GHJDxdQvzxGtZA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Eunki Kim' <eunki_kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca

Linus Walleij wrote:
> 
> On Thu, Sep 27, 2012 at 5:55 AM, Eunki Kim <eunki_kim@samsung.com> wrote:
> 
> > This patch makes GPIO pin to INTERRUPT mode or INPUT mode according
> > to bitmap_gpio_int. When the related bit of bitmap_gpio_int is set,
> > it makes GPIO pin to INTERRUPT mode instrad of INPUT mode in the
> > samsung_gpiolib_4bit_input function.
> >
> > Signed-off-by: Eunki Kim <eunki_kim@samsung.com>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Are you taking this into the Samsung tree or shall I merge it
> into my GPIO tree? In the latter case I need an ACK from
> some Samsung maintainer.
> 
Hi, Linus

Let me pick this into Samsung tree with your ack :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
