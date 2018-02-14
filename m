From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH -next] clk: samsung: exynos-audss: Remove redundant
 dev_err call in exynos_audss_clk_probe()
Date: Wed, 14 Feb 2018 15:43:34 +0100
Message-ID: <240b9be5-429c-ca34-63c6-bdd260970ca8@samsung.com>
References: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
        <CGME20180214144350epcas1p1d66e605e6d68de23661f51ced410d72e@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58154 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030772AbeBNOny (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 09:43:54 -0500
In-reply-to: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org

On 01/17/2018 12:26 PM, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied, thanks.
