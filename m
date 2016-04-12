From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Enable clocks for CMU_CCORE and
 CMU_FSYS0 blocks
Date: Tue, 12 Apr 2016 13:37:19 +0200
Message-ID: <570CDDEF.8090401@samsung.com>
References: <1460459243-27120-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65467 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247AbcDLLhl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 07:37:41 -0400
In-reply-to: <1460459243-27120-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, thomas.ab@samsung.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, tomasz.figa@gmail.com

On 04/12/2016 01:07 PM, Alim Akhtar wrote:
> This patch enables clocks for CMU_CCORE and CMU_FSYS0 blocks. This is
> required before accessing registers of these blocks.

Patch applied, thanks!
