From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: exynos5250: Add clocks to DISP1 domain
Date: Thu, 15 Oct 2015 10:38:54 +0900
Message-ID: <561F03AE.8020504@samsung.com>
References: <1444819457-27519-1-git-send-email-tomeu.vizoso@collabora.com>
 <1444819457-27519-3-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1444819457-27519-3-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 14.10.2015 19:44, Tomeu Vizoso wrote:
> Adds to the node of the DISP1 power domain the two clocks that need to
> be reparented while the domain is powered off:
> CLK_MOUT_ACLK200_DISP1_SUB and CLK_MOUT_ACLK300_DISP1_SUB.
> 
> Otherwise the state is unknown at power up and the mixer's clocks are
> all messed up.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Link: http://lkml.kernel.org/g/561CDC33.7050103@collabora.com
> ---
> 
>  arch/arm/boot/dts/exynos5250.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Looks good:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
