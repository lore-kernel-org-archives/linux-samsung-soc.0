From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos4412-odroidu3: Enable SPI1.
Date: Thu, 13 Aug 2015 19:14:51 +0900
Message-ID: <55CC6E1B.2050707@samsung.com>
References: <1439456813-4918-1-git-send-email-aballier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439456813-4918-1-git-send-email-aballier@gentoo.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexis Ballier <aballier@gentoo.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 13.08.2015 o 18:06, Alexis Ballier pisze:
> SPI1 is available on IO Port #2 (as depicted on their website) in
> PCB Revision 0.5 of Hardkernel Odroid U3 board.
> The shield connects a 256KiB spi-nor flash on that bus.
> 
> Signed-off-by: Alexis Ballier <aballier@gentoo.org>
> 
> ---
> 
> Changes in v2: Use GPIO_ACTIVE_HIGH (Krzysztof Kozlowski)
> 
>  arch/arm/boot/dts/exynos4412-odroidu3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)

Thanks for fixing, looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
