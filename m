From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: mach-s3c24xx: Fix boolean expressions in
 osiris_dvs_notify
Date: Mon, 7 Jan 2019 20:43:24 +0100
Message-ID: <20190107194324.GC3313@kozik-lap>
References: <20190103201408.GA27754@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190103201408.GA27754@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 03, 2019 at 02:14:08PM -0600, Gustavo A. R. Silva wrote:
> Fix boolean expressions by using logical AND operator '&&'
> instead of bitwise operator '&'.
> 
> This issue was detected with the help of Coccinelle.
> 
> Fixes: 4fa084af28ca ("ARM: OSIRIS: DVS (Dynamic Voltage Scaling) supoort.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 8 ++++----

Thanks, applied with fixing up -Wparentheses warning. I think you should
update your GCC.

Best regards,
Krzysztof
