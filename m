From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] usb: dwc3: exynos: Handle return value of
 clk_prepare_enable
Date: Mon, 12 Jun 2017 14:04:23 +0200
Message-ID: <20170612120423.GB11300@kozik-book>
References: <3e8b3037c345341c2bda612b6de204f6c83dde38.1497264433.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3e8b3037c345341c2bda612b6de204f6c83dde38.1497264433.git.arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: balbi@kernel.org, kgene@kernel.org, javier@osg.samsung.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 12, 2017 at 04:23:31PM +0530, Arvind Yadav wrote:
> clk_prepare_enable() can fail here and we must check its return value.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
