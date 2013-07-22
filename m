From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: Enable COMPILE_TEST builds
Date: Mon, 22 Jul 2013 18:31:43 +0200
Message-ID: <1777239.X51REAvKl1@amdc1227>
References: <1373908284-14305-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15097 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755194Ab3GVQbt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 12:31:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC00KKSJ1OJU60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 17:31:47 +0100 (BST)
In-reply-to: <1373908284-14305-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Monday 15 of July 2013 18:11:24 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Platform using OF and some others don't have any dependencies on arch/arm
> so can be built on any platform. Enable that for better compile coverage
> when COMPILE_TEST is enabled.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  sound/soc/samsung/Kconfig | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
