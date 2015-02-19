From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 1/1] ARM: dts: Add mclk entry for Snow and Peach Pit/Pi
 boards
Date: Thu, 19 Feb 2015 14:31:26 +0100
Message-ID: <54E5E5AE.3080001@collabora.co.uk>
References: <1423245171-25485-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:37507 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753005AbbBSNbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Feb 2015 08:31:31 -0500
In-Reply-To: <1423245171-25485-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Tushar Behera <tushar.b@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Kukjin,

On 02/06/2015 06:52 PM, Javier Martinez Canillas wrote:
> From: Tushar Behera <tushar.b@samsung.com>
> 
> On Snow, Peach Pit and Peach Pi boards, the Exynos SoC XCLKOUT output pin
> provides the master clock (mclk) to codecs. So make them a clock consumer.
> 
> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
> 

Please drop this patch since I took it from [0] but that patch was when
the master clock was grabbed in the ASoC machine driver but the final
version that got merged grabs the master clock in the codec driver so
it has to be in the codec device node too.

I'll send the correct version soon.

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/5/20/4
