From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: s3c64xx: Select GPIO_GENERIC_PLATFORM for
 Cragganmore
Date: Tue, 26 Jan 2016 15:10:14 +0000
Message-ID: <20160126151014.GL1490@localhost.localdomain>
References: <1453400718-26720-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:37655 "EHLO
	mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932442AbcAZPLK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 10:11:10 -0500
Content-Disposition: inline
In-Reply-To: <1453400718-26720-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsnmicro.com

On Thu, Jan 21, 2016 at 06:25:18PM +0000, Mark Brown wrote:
> The Cragganmore machine driver provides platform data for the generic GPIO
> platform driver which uses structures only defined if the driver is
> enabled. Since there is little reason to use the platform without the GPIOs
> add a select to avoid build failures.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

All looks good to me and doesn't cause any issues on my Speyside.

Tested-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
