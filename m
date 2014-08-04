From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dma: pl08x: Use correct specifier for size_t values
Date: Mon, 4 Aug 2014 13:45:49 +0530
Message-ID: <20140804081549.GN8181@intel.com>
References: <1406912988-13562-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:13993 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751440AbaHDIZl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Aug 2014 04:25:41 -0400
Content-Disposition: inline
In-Reply-To: <1406912988-13562-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Fri, Aug 01, 2014 at 06:09:48PM +0100, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> When printing size_t values we should use the %zd or %zx format specifier
> in order to ensure the value is displayed correctly and avoid warnings from
> sparse.

Applied, thanks

-- 
~Vinod
