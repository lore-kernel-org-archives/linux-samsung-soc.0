From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] regulators: add support max8952 regulator
Date: Wed, 08 Sep 2010 08:41:20 +0900
Message-ID: <003901cb4ee6$2f22de50$8d689af0$%kim@samsung.com>
References: <1283844202-4158-1-git-send-email-kgene.kim@samsung.com>
 <20100907100442.GD7886@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16300 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755991Ab0IGXlJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:41:09 -0400
In-reply-to: <20100907100442.GD7886@rakim.wolfsonmicro.main>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, 'Changhwan Youn' <chaos.youn@samsung.com>

Mark Brown wrote:
> 
> On Tue, Sep 07, 2010 at 04:23:22PM +0900, Kukjin Kim wrote:
> > From: Changhwan Youn <chaos.youn@samsung.com>
> >
> > The operation of max8952 is almost similar to max8649 except
> > the output voltage range. This patch adds support the max8952
> > regulator using current max8649 implementation.
> >
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> 
> This is OK but it should also include removal of the separate max8952
> driver since the functionality is now merged into this driver.  With
> that
> 
Sure, just now submitted updated patch.

> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Thanks for your review and ack ;-)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
