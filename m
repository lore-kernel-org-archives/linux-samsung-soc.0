From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: 24-bit audio playback on Exynos4210
Date: Thu, 14 Jul 2011 08:26:09 +0900
Message-ID: <20110713232607.GD9770@opensource.wolfsonmicro.com>
References: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48920 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752530Ab1GMX0P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 19:26:15 -0400
Content-Disposition: inline
In-Reply-To: <1310556126-13784-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Cc: naveenkrishna.ch@gmail.com, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, dp@opensource.wolfsonmicro.com, Kyung-Kwee.Ryu@wolfsonmicro.com

On Wed, Jul 13, 2011 at 04:52:06PM +0530, Giridhar Maruthy wrote:
> Using 256fs or 512fs will result in distortion of 24-bit
> audio samples. This is because the lrclk generated is not
> proper. Using 384 fs generates proper output.

Applied, thanks.
