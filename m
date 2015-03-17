From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: Add CLKOUT driver support for Exynos3250
 SoC.
Date: Tue, 17 Mar 2015 11:54:26 +0100
Message-ID: <550807E2.8060205@samsung.com>
References: <1425262500-27456-1-git-send-email-ideal.song@samsung.com>
 <5500D11A.6010200@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5500D11A.6010200@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Inha Song <ideal.song@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, mturquette@linaro.org, tomasz.figa@gmail.com, cw00.choi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 12/03/15 00:34, Stephen Boyd wrote:
> On 03/01/15 18:15, Inha Song wrote:
>> > This patch add CLKOUT driver support for Exynos3250 SoC.
>> >
>> > Exynos3250 SoC PMU_DEBUG is the same with Exynos4's PMU_DEBUG
>> > including CLKOUT mux. So, We can use the exynos4's clkout init
>> > function for Exynos3250 without the need to add new function.
>> >
>> > Signed-off-by: Inha Song <ideal.song@samsung.com>
>
> Do you want to take this through some SoC tree? If so:
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Thanks, I added this patch to my tree.
