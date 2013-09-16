From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: core: Add
 devm_snd_soc_register_card()
Date: Mon, 16 Sep 2013 18:48:50 +0100
Message-ID: <1379353730.3215.59.camel@loki>
References: <1379351023-28996-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:10470 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751579Ab3IPRsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Sep 2013 13:48:53 -0400
In-Reply-To: <1379351023-28996-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Mon, 2013-09-16 at 18:03 +0100, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Simplify error handling and remove repetitive (and rarely executed) code
> for unregistration by providing a devm_snd_soc_register() card.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>

Acked-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
