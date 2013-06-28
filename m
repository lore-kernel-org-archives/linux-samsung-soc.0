From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] mfd: sec: Remove fields not used since regmap conversion
Date: Fri, 28 Jun 2013 17:35:48 +0200
Message-ID: <20130628153548.GB13700@zurbaran>
References: <1372428743-31687-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1372428743-31687-1-git-send-email-broonie@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On Fri, Jun 28, 2013 at 03:12:23PM +0100, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> These were all used by the open coded I/O and IRQ implementations and are
> no longer referenced now that the regmap core variants are used instead.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  include/linux/mfd/samsung/core.h | 6 ------
>  1 file changed, 6 deletions(-)
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
