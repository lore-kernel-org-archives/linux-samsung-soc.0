From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] regulator: s2mps11: Use local variable for number of
 regulators
Date: Thu, 18 Feb 2016 15:15:03 +0900
Message-ID: <20160218061503.GA26957@samsunx.samsung>
References: <1455775023-16396-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39820 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424396AbcBRGPF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 01:15:05 -0500
Content-disposition: inline
In-reply-to: <1455775023-16396-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Thanks,

> Remove the s2mps11_info.rdev_num because it is not used outside of
> probe.
> 
> Suggested-by: Andi Shyti <andi.shyti@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Andi
