From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 00/12] clk: samsung: exynos7: Cleanup of clock file
Date: Tue, 15 Sep 2015 11:25:54 +0200
Message-ID: <55F7E422.4080203@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43660 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751659AbbIOJ0g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 05:26:36 -0400
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

On 10/09/15 10:44, Alim Akhtar wrote:
> Currently there are lots of ambiguity between clock names in clock file
> and in user manual, which leads to lots of confusion for the reviewers.
> This series attempts to cleanup the exynos7 clock file as per
> user manual naming convention.
> This also adds some of the missing Gate clocks which are needed
> to complete the clock tree.

The whole series applied, thanks.
