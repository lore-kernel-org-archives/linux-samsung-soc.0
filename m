From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] spi/s3c64x: Ensure runtime PM is enabled prior to
 registration
Date: Fri, 27 Sep 2013 13:05:16 +0200
Message-ID: <5245666C.1010605@samsung.com>
References: <1380279185-10354-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49833 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106Ab3I0LFU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 07:05:20 -0400
In-reply-to: <1380279185-10354-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 27/09/13 12:53, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Otherwise we may try to start transfers immediately and then fail to
> runtime resume the device causing us not to have clocks enabled.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

There is only a small typo in the subject line, thanks.
