From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: initial board support for exynos5260
 SoC
Date: Thu, 08 May 2014 19:37:24 +0200
Message-ID: <536BC0D4.3000302@samsung.com>
References: <1397620738-14431-1-git-send-email-rahul.sharma@samsung.com>
 <1397620738-14431-2-git-send-email-rahul.sharma@samsung.com>
 <534E3803.5010404@gmail.com>
 <CAK9yfHztqGWhUJ=PNc7L-epu48PkEM6=v6JFDZ1n52NBeOUB8w@mail.gmail.com>
 <534E3AE7.10907@gmail.com> <00eb01cf5e7b$4eb9edf0$ec2dc9d0$@samsung.com>
 <CAPdUM4O3imVNv3A3K1uEkfohc-r668SC6mVZQRCO8N+waxyb4w@mail.gmail.com>
 <0b4101cf613e$eb2d87d0$c1889770$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46955 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753348AbaEHRh3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 13:37:29 -0400
In-reply-to: <0b4101cf613e$eb2d87d0$c1889770$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Rahul Sharma' <r.sh.open@gmail.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'sunil joshi' <joshi@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>

Hi Kukjin,

On 26.04.2014 13:01, Kukjin Kim wrote:
> Rahul Sharma wrote:
>>
>> Hi Kukjin,
>>
> Hi,
> 
>> Need this macro to enable build for clock driver.
>>
> I found it in your patch, "clk/exynos5260: add clock file for exynos5260".
> For consistency, I'm fine on this, if Tomasz has no objection me to pick
> this into samsung tree for the 5260 clock stuff
> "drivers/clk/samsung/Makefile".

Yes, this should go through Samsung tree, but let me prepare a branch
for you to pull from with all the necessary dependencies.

Best regards,
Tomasz
