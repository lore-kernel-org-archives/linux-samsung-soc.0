From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH -next] clk: samsung: exynos5433: Remove redundant
 dev_err call in exynos5433_cmu_probe()
Date: Wed, 14 Feb 2018 15:45:05 +0100
Message-ID: <a819f423-a283-b30c-b088-b865cea3e6ec@samsung.com>
References: <1516188387-144930-1-git-send-email-weiyongjun1@huawei.com>
        <CGME20180214144511epcas1p2d950632022f7fbc07151959fc6a43701@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-reply-to: <1516188387-144930-1-git-send-email-weiyongjun1@huawei.com>
Content-language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01/17/2018 12:26 PM, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied, thanks.
