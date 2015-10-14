From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v1 1/2] clk: samsung: exynos5250: Add DISP1 clocks
Date: Wed, 14 Oct 2015 11:32:48 -0700
Message-ID: <20151014183248.GG26883@codeaurora.org>
References: <1444819457-27519-1-git-send-email-tomeu.vizoso@collabora.com>
 <1444819457-27519-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444819457-27519-2-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-clk-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/14, Tomeu Vizoso wrote:
> When the DISP1 power domain is powered off, there's two clocks that need
> to be temporarily reparented to OSC, and back to their original parents
> when the domain is powered on again.
> 
> We expose these two clocks in the DT bindings so that the DT node of the
> power domain can reference them.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
