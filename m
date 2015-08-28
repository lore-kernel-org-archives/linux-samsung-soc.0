From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Add required clock tree for UFS
Date: Fri, 28 Aug 2015 17:40:03 +0530
Message-ID: <55E04F9B.7010507@samsung.com>
References: <1440754083-11829-1-git-send-email-alim.akhtar@samsung.com>
 <CAJKOXPeJLx5dJUW-9ke0PR-ziRykN4ckAwABOQMj--4GajXfMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47589 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751759AbbH1MTR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Aug 2015 08:19:17 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTS02NYGKW3KPB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Aug 2015 21:19:15 +0900 (KST)
In-reply-to: <CAJKOXPeJLx5dJUW-9ke0PR-ziRykN4ckAwABOQMj--4GajXfMQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com

Hi,

On 08/28/2015 03:36 PM, Krzysztof Kozlowski wrote:
> 2015-08-28 18:28 GMT+09:00 Alim Akhtar <alim.akhtar@samsung.com>:
>> Adding required mux/div/gate clocks for UFS controller
>> present on Exynos7.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>> This patch has a dependency on [1]
>> [1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg46122.html
>
> Hi,
>
> I just noticed that you did not send this and previous patches to
> proper mailing list and to all of maintainers. You missed
> linux-clk@vger.kernel.org and Stephen Boyd. Please use
> script/get_maintainers. It will print all necessary addresses.
>
Thanks for pointing this out, I will add them.
> Best regards,
> Krzysztof
>
