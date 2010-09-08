From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] regulators: add support max8952 regulator
Date: Wed, 08 Sep 2010 21:28:45 +0900
Message-ID: <004001cb4f51$63ea5d00$2bbf1700$%kim@samsung.com>
References: <1283901976-32588-1-git-send-email-kgene.kim@samsung.com>
 <01a401cb4f01$73d60ac0$5b822040$%park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33955 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751Ab0IHM2e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 08:28:34 -0400
In-reply-to: <01a401cb4f01$73d60ac0$5b822040$%park@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: lrg@slimlogic.co.uk, 'Changhwan Youn' <chaos.youn@samsung.com>, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Kyungmin Park wrote:
> 
> Do you check the DVS feature?
> It can support the DVS by GPIOs and platform can set the each voltages at
> each mode.
> 
Ok...I agree about the feature's necessity that you said.

However, we don't need separate driver which has same/similar functionality.
So...would be better that could implement it in max8649...

Could you please do it based on this?...in fact, can't test it on SMDK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> As quick review of max8649. It can't support it.
> 
> Thank you,
> Kyungmin Park
> 
> -----Original Message-----
> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
> Sent: Wednesday, September 08, 2010 8:26 AM
> To: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org
> Cc: lrg@slimlogic.co.uk; Changhwan Youn; Kukjin Kim; MyungJoo Ham;
Kyungmin
> Park
> Subject: [PATCH v3] regulators: add support max8952 regulator
> 
> From: Changhwan Youn <chaos.youn@samsung.com>
> 
> The operation of max8952 is almost similar to max8649 except the output
> voltage range. This patch adds support the max8952 regulator using
> current max8649 implementation. And removes separate max8952.[ch] files
> since the functionality is now merged into this driver.
> 
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> Following is as per Mark Brown's suggestion.
> Changes since v2:
> - Removed separate max8952.[ch] files
> 
> Changes since v1:
> - Added returning fail when detected wrong ID
> - Added matching the ID from the chip in case the user got things wrong
> - Added enum chip ID instead of 0, 1
> 
(snip)
