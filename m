From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: exynos-audss: Fix memory leak on driver unbind
 or probe failure
Date: Thu, 08 Jan 2015 13:23:13 -0800
Message-ID: <54AEF541.1090700@codeaurora.org>
References: <1420451561-12360-1-git-send-email-k.kozlowski@samsung.com> <1420451561-12360-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420451561-12360-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01/05/2015 01:52 AM, Krzysztof Kozlowski wrote:
> The memory allocated by basic clock divider/gate/mux (struct clk_gate,
> clk_divider and clk_mux) was leaking. During driver unbind or probe
> failure the driver only unregistered the clocks.
>
> Use clk_unregister_{gate,divider,mux} to release all resources.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
