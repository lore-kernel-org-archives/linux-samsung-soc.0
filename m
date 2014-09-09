From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung-i2s: Check secondary DAI exists before
 referencing
Date: Tue, 09 Sep 2014 19:08:17 +0200
Message-ID: <540F3401.5090003@samsung.com>
References: <1410277909-27922-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27192 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754742AbaIIRIo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Sep 2014 13:08:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBN0071K938WF20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Sep 2014 18:11:32 +0100 (BST)
In-reply-to: <1410277909-27922-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, broonie@kernel.org
Cc: sbkim73@samsung.com, lgirdwood@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com

On 09/09/14 17:51, Charles Keepax wrote:
> In a couple of places the driver is missing a check to ensure there is a
> secondary DAI before it de-references the pointer to it, causing a null
> pointer de-reference. This patch adds a check to avoid this.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks for the patch. We had one of those occurrences fixed internally
but I missed to submit the patch upstream.
