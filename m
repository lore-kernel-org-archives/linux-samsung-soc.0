From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] usb: host: ehci-exynos: Handle return value of
 clk_prepare_enable
Date: Mon, 12 Jun 2017 14:02:23 +0200
Message-ID: <20170612120223.GA11300@kozik-book>
References: <3aa745c2cea5b8a91d10f898bc201121001a9a0b.1497265923.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3aa745c2cea5b8a91d10f898bc201121001a9a0b.1497265923.git.arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: stern@rowland.harvard.edu, kgene@kernel.org, javier@osg.samsung.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 12, 2017 at 04:45:14PM +0530, Arvind Yadav wrote:
> clk_prepare_enable() can fail here and we must check its return value.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/usb/host/ehci-exynos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
