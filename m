From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 3/8] clk: samsung: exynos3250: Add MMC2 clock
Date: Wed, 30 Mar 2016 11:30:56 +0200
Message-ID: <56FB9CD0.5040802@samsung.com>
References: <1458027490-13787-1-git-send-email-cw00.choi@samsung.com>
 <1458027490-13787-4-git-send-email-cw00.choi@samsung.com>
 <56F47ABC.7060006@samsung.com> <56F509E6.7080807@samsung.com>
 <56F87E83.7060100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18943 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746AbcC3JbK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Mar 2016 05:31:10 -0400
In-reply-to: <56F87E83.7060100@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: k.kozlowski@samsung.com, kgene@kernel.org, tomasz.figa@gmail.com, jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 03/28/2016 02:44 AM, Chanwoo Choi wrote:
> You mean that separate patch1 include only the new clock id about both UART2 and MMC2
> and the patch2/patch3 just use the new clock id as following:
> 
> patch1 dt-bindings: Add the clock id of UART2 and MMC2 for Exynos3250
> patch2 clk: samsung: exynos3250: Add UART2 clock
> patch3 clk: samsung: exynos3250: Add MMC2 clock
> 
> As far as I understand it is that right?
> If it is ok, I'll modify it on v4 patchset as you comment.

Yeah, that's what I meant.

-- 
Thanks,
Sylwester
