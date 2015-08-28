From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Add required clock tree for UFS
Date: Fri, 28 Aug 2015 19:06:33 +0900
Message-ID: <CAJKOXPeJLx5dJUW-9ke0PR-ziRykN4ckAwABOQMj--4GajXfMQ@mail.gmail.com>
References: <1440754083-11829-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:33618 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070AbbH1KGe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Aug 2015 06:06:34 -0400
Received: by qgeh99 with SMTP id h99so28120799qge.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2015 03:06:34 -0700 (PDT)
In-Reply-To: <1440754083-11829-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, tomasz.figa@gmail.com, kgene@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com

2015-08-28 18:28 GMT+09:00 Alim Akhtar <alim.akhtar@samsung.com>:
> Adding required mux/div/gate clocks for UFS controller
> present on Exynos7.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> This patch has a dependency on [1]
> [1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg46122.html

Hi,

I just noticed that you did not send this and previous patches to
proper mailing list and to all of maintainers. You missed
linux-clk@vger.kernel.org and Stephen Boyd. Please use
script/get_maintainers. It will print all necessary addresses.

Best regards,
Krzysztof
