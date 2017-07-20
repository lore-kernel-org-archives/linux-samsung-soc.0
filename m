From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 10/12] [v2] ARM: s3c24xx: make H1940BT depend on RFKILL
Date: Thu, 20 Jul 2017 21:30:38 +0200
Message-ID: <20170720193038.GA16488@kozik-book>
References: <20170720154616.3250481-1-arnd@arndb.de>
 <20170720155410.3251043-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170720155410.3251043-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jul 20, 2017 at 05:53:43PM +0200, Arnd Bergmann wrote:
> Bluetooth is only supported when network support is part of the kernel,
> so it is a bit pointless to build the hi1940-bt support without networking.
> If we try anyway, we get a Kconfig warning:
> 
> warning: (TOSA_BT && H1940BT) selects RFKILL which has unmet direct dependencies (NET)
> 
> This turns the 'select' into 'depends on' as Krzysztof suggested when
> I first sent a fix.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Link: https://patchwork.kernel.org/patch/8164161/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v1 was sent in Jan 2016, and instead added a dependency on CONFIG_NET
> ---
>  arch/arm/mach-s3c24xx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof
