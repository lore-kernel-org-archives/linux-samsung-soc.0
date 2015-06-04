From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 09/11] dma: pl330: fix wording in mcbufsz message
Date: Thu, 04 Jun 2015 11:10:06 +0900
Message-ID: <556FB37E.3000800__16338.8143679642$1433383836$gmane$org@samsung.com>
References: <cover.1433364398.git.hramrach@gmail.com>
 <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30213 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbbFDCKN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 22:10:13 -0400
In-reply-to: <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>, =?UTF-8?B?IkJlYW4gSHVvIOmcjeaWjOaWjCAoYmVhbmh1byki?= <beanhuo@micron.c>

On 04.06.2015 06:26, Michal Suchanek wrote:
> The kernel is not trying to increase mcbufsz. It suggests you should try
> doing so. Also print the calculated required size of mcbufsz.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>

Looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
