From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 1/7] mfd: max77686/802: Remove support for board files
Date: Thu, 27 Nov 2014 14:08:43 +0100
Message-ID: <1417093723.32141.1.camel@AMDC1943>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
 <1417087253-12306-2-git-send-email-k.kozlowski@samsung.com>
 <20141127130301.GX7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13267 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbaK0NIs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 08:08:48 -0500
In-reply-to: <20141127130301.GX7712@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On czw, 2014-11-27 at 13:03 +0000, Mark Brown wrote:
> On Thu, Nov 27, 2014 at 12:20:47PM +0100, Krzysztof Kozlowski wrote:
> > The driver is used only on Exynos based boards with DTS support.
> > After removal of board file support from max77686 and max77802 regulator
> > drivers, the MFD driver can be converted to DTS-only version. This
> > simplifies a little the code:
> 
> Why is this a dependency for new features in the regulator core?
My mistake, I based this patchset on regulator cleanup but this MFD
change is not needed for it. It can be skipped here. Sorry for the
noise.

Best regards,
Krzysztof
