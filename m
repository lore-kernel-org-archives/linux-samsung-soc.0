From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/7] clk: samsung: add plls used in s3c2416 and s3c2443
Date: Tue, 12 Mar 2013 14:17:46 +0100
Message-ID: <513F2AFA.6030804@samsung.com>
References: <201303120141.31262.heiko@sntech.de>
 <201303120142.19842.heiko@sntech.de> <513F1B42.7000201@samsung.com>
 <201303121321.34338.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46869 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755261Ab3CLNRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 09:17:50 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJJ00DVDU8KSJA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 13:17:48 +0000 (GMT)
Received: from [106.116.147.32] by eusync2.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJJ00L8TU9NAOC0@eusync2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Mar 2013 13:17:48 +0000 (GMT)
In-reply-to: <201303121321.34338.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 03/12/2013 01:21 PM, Heiko St=C3=BCbner wrote:
> Thanks for the hint ... this is what I rightfully get for mindlessly =
copying=20
> from the other plls in the file;-) .

:)

> What about the other plls in the pll-file, they should be affected in=
 the same=20
> way, right?

Yes, they're of course also affected. Otherwise we wouldn't know about
the problem;) We are going to submit all fixes we have for the clk driv=
er
shortly. But those are mostly for the Exynos clocks definitions.
