From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH] ASoC: samsung: Rename DMA platform
	registration functions
Date: Tue, 20 Aug 2013 08:15:38 +0900
Message-ID: <053501ce9d32$044fb020$0cef1060$@samsung.com>
References: <1376949597-28470-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11216 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501Ab3HSXQA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Aug 2013 19:16:00 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRS00LF4WLT9V60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Aug 2013 08:15:39 +0900 (KST)
In-reply-to: <1376949597-28470-1-git-send-email-broonie@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'Liam Girdwood' <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, 'Mark Brown' <broonie@linaro.org>

On Tuesday, August 20, 2013 7:00 AM, Mark Brown wrote:

> Subject: [alsa-devel] [PATCH] ASoC: samsung: Rename DMA platform registration functions
> 
> From: Mark Brown <broonie@linaro.org>
> 
> The current naming with a simple asoc_ prefix is too generic for use in multiplatform kernels.

Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom.
