From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: Fix the inverted clocks handling for pcm
 driver
Date: Mon, 11 Apr 2011 13:15:29 -0700
Message-ID: <20110411201529.GB29405@opensource.wolfsonmicro.com>
References: <1302314038-11398-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44704 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755956Ab1DKUPU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 16:15:20 -0400
Content-Disposition: inline
In-Reply-To: <1302314038-11398-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, kgene.kim@samsung.com, ben-linux@fluff.org

On Sat, Apr 09, 2011 at 10:53:58AM +0900, Sangbeom Kim wrote:
> Fix the inverted clocks handling for pcm cpu driver.
> By using SND_SOC_DAIFMT_NB_NF, Audio noise can be generated on SMDK.
> 
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>

Applied, thanks.
