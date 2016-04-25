From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/41] Documentation: dt: display: fix spelling mistake
Date: Mon, 25 Apr 2016 08:49:38 -0500
Message-ID: <20160425134938.GA8194@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-11-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-11-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Chanho Park <chanho61.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:07AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> index 22756b3..a782659 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> @@ -41,7 +41,7 @@ Video interfaces:
>    endpoint node connected from mic node (reg = 0):
>      - remote-endpoint: specifies the endpoint in mic node. This node is required
>  		       for Exynos5433 mipi dsi. So mic can access to panel node
> -		       thoughout this dsi node.
> +		       throughout this dsi node.
>    endpoint node connected to panel node (reg = 1):
>      - remote-endpoint: specifies the endpoint in panel node. This node is
>  		       required in all kinds of exynos mipi dsi to represent
> -- 
> 2.8.0
> 
