From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/3] clk: samsung: exynos5420: Add clocks for CMU_CDREX
 domain
Date: Thu, 01 Sep 2016 19:32:18 +0200
Message-ID: <5c3c5a13-ca2b-272d-e137-d7eaaffaafac@samsung.com>
References: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
 <1472108238-24309-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472108238-24309-3-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, tomasz.figa@gmail.com, linux-kernel@vger.kernel.org, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/25/2016 08:57 AM, Chanwoo Choi wrote:
> This patch adds the mux/divider clocks for CMU_CDREX (DRAM Express
> Controller) which generates the clocks for DRAM and NoC (Network on Chip) bus
> clock. But, there is differnet source of MUX_MX_MSPLL_CCORE between exynos5420
> and exynos5422. So, each MUX_MX_MSPLL_CCORE uses the different parent source
> group.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied, thanks,
