From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/3]  clk: samsung: Use samsung_cmu_register_one() to
 simplify code
Date: Tue, 23 Dec 2014 14:41:39 +0100
Message-ID: <54997113.2080804@samsung.com>
References: <1419320423-19228-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11144 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755862AbaLWNlr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Dec 2014 08:41:47 -0500
In-reply-to: <1419320423-19228-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Chanwoo,

On 23/12/14 08:40, Chanwoo Choi wrote:
> This patch-set uses the samsung_cmu_register_one() function to simplify the
> clock driver for Exynos3250/Exynos4415 SoC and change return value of
> samsung_cmu_register_one() because some clock driver may need the instance
> of samsung_clk_provider structure.
> 
> Chanwoo Choi (3):
>   clk: samsung: Changes the return value of samsung_cmu_register_one()
>   clk: samsung: exynos3250: Use samsung_cmu_register_one() to simplify code
>   clk: samsung: exynos4415: Use samsung_cmu_register_one() to simplify code
> 
>  drivers/clk/samsung/clk-exynos3250.c | 217 ++++++++---------------------------
>  drivers/clk/samsung/clk-exynos4415.c | 216 ++++++++--------------------------
>  drivers/clk/samsung/clk.c            |  13 ++-
>  drivers/clk/samsung/clk.h            |   3 +-
>  4 files changed, 107 insertions(+), 342 deletions(-)

Thanks for the cleanup, I've queued that for 3.20. And fixed a minor
checkpatch warning when applying:

ERROR: "foo* __init bar" should be "foo * __init bar"
#29: FILE: drivers/clk/samsung/clk.c:377:
+struct samsung_clk_provider* __init samsung_cmu_register_one(

total: 1 errors, 0 warnings, 42 lines checked

0001-clk-samsung-Changes-the-return-value-of-samsung_cmu_.patch has style
problems, please review.

-- 
Thanks,
Sylwester
