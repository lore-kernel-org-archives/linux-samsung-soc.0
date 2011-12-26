From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/4] ARM: S5PV210: Enable FIMC on SMDKV210
Date: Mon, 26 Dec 2011 11:54:11 +0000
Message-ID: <20111226115411.GA17760@sirena.org.uk>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
 <1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54670 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754885Ab1LZLyO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 06:54:14 -0500
Content-Disposition: inline
In-Reply-To: <1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On Mon, Dec 26, 2011 at 03:30:12PM +0530, Sachin Kamat wrote:
> This patch adds support for FIMC 0, 1 and 2 on SMDKV210 board.

Why does this not also apply to the Aquilla, Gony and Torbreck machines?  

>  	&s3c_device_wdt,
> +	&s5p_device_fimc0,
> +	&s5p_device_fimc1,
> +	&s5p_device_fimc2,
>  	&s5p_device_mfc,

The support consists solely of adding them to the lists of devices,
there's no visible per board hookup here.
