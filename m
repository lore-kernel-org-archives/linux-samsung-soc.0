From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [GIT PULL 4/5] Samsung arm64 DT updates for v4.1
Date: Sat, 16 May 2015 12:39:21 +0900
Message-ID: <5556BBE9.6030007@kernel.org>
References: <555248E5.6010709@kernel.org> <CAGTfZH3bzjvVLH2HALDTLUf0MzibeH7sfFJh1n=dyuitYmUw_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40376 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S2992648AbbEPDj2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 23:39:28 -0400
In-Reply-To: <CAGTfZH3bzjvVLH2HALDTLUf0MzibeH7sfFJh1n=dyuitYmUw_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cw00.choi@samsung.com
Cc: Chanwoo Choi <cwchoi00@gmail.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 05/14/15 22:56, Chanwoo Choi wrote:
> Hi Kukjin,

[...]

>> As you know, the arm64-exynos5433 couldn't be sent to upstream during
>> previous merge window because it cannot be built without other stuff
>> such as board DT file. I think, you need to post its regarding board DT
>> file, I could test the exynos5433 series in my side with smdk5433 dt
>> file though. Maybe as you know, I have no plan to upstream the smdk5433
>> DT file because it will not be used outside of Samsung S.LSI.
> 
> Thanks for your test about Exynos5433 patch-set.
> But, I cannot send the DTS file for Exynos5433 right now.
> On the next, I'll send the Exynos5433's patchset and board dts file.
> 
OK, I see. I think, maybe you can make a patch for board DT file based
on v4.2-next/dt64-samsung branch in samsung tree.

Thanks,
Kukjin
