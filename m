From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 0/3] regulator: s2mps11: Add support for S2MPS14
 regulators
Date: Tue, 18 Mar 2014 18:34:12 +0100
Message-ID: <1395164052.24909.11.camel@AMDC1943>
References: <1394187052-591-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45450 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756673AbaCRReQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:34:16 -0400
In-reply-to: <1394187052-591-1-git-send-email-k.kozlowski@samsung.com>
References: <1394187052-591-1-git-send-email-k.kozlowski@samsung.com>
In-reply-to: <1394187052-591-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

Hi Mark,

Lee Jones in his pull request [1] put also my changes for S2MPS14
support in MFD sec-core driver. They are needed by this patchset for adding
suppt for regulators on S2MPS14.

Do you have time to look at these patches and apply them if they're OK (or ACK them)?

Best regards,
Krzysztof

[1] mfd: regulator: S2MPA01 device support IB for Mark Brown



On Fri, 2014-03-07 at 11:10 +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> This patchset adds support for the S2MPS14 device to the s2mps11 regulator
> driver. It's a subset of previously sent patches for S2MPS14 device:
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27194/focus=1649217
> along with one new patch:
>  - PATCH 2/3: regulator: s2mps11: Add set_suspend_disable for S2MPS14
> which replaces previous "opmode" idea.
> 
> 
> These patches are rebased against linux-next tree (next-20140305) because
> they depend on changes in main MFD sec-core and s2mps11 regulator driver.
> 
> 
> Changes since v1
> ================
> 1. Patch 2/3: Store information that regulator was suspended.
> 
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (3):
>   regulator: s2mps11: Add support for S2MPS14 regulators
>   regulator: s2mps11: Add set_suspend_disable for S2MPS14
>   Documentation: mfd: s2mps11: Document support for S2MPS14
> 
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |   12 +-
>  drivers/regulator/Kconfig                         |    9 +-
>  drivers/regulator/s2mps11.c                       |  301 ++++++++++++++++-----
>  include/linux/mfd/samsung/s2mps14.h               |    2 +
>  4 files changed, 255 insertions(+), 69 deletions(-)
> 
