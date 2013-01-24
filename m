From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V2 0/4] i2c: s3c2410: Add devm_* apis and cleanup
Date: Thu, 24 Jan 2013 08:26:47 +0100
Message-ID: <20130124072647.GF8364@nekote.pengutronix.de>
References: <1353660115-9710-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353660115-9710-1-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 23, 2012 at 02:11:51PM +0530, Tushar Behera wrote:
> This patchset cleans up the probe function of i2c-s3c2410 driver.
> These have been tested on Exynos4210 based Origen board.
> 
> Changes since V1:
>   * devm_request_mem_region and devm_ioremap calls were replaced by
> devm_request_and_ioremap() call.
>   * All devm_* related modifications (earlier patches 2-5) were merged
> to a single patch.
> 

Patch series looks good. Can you rebase to 3.8-rc4?
