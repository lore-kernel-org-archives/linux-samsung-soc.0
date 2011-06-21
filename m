From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2 5/5] ARM: EXYNOS4: Add platform data for EXYNOS4 FIMD
 and LTE480WV platform-lcd
Date: Tue, 21 Jun 2011 13:43:49 +0530
Message-ID: <4E0052BD.5080807@linaro.org>
References: <6930554.67931308629310902.JavaMail.weblogic@epml09>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:44326 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752978Ab1FUIN6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 04:13:58 -0400
Received: by qyk29 with SMTP id 29so1935757qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2011 01:13:57 -0700 (PDT)
In-Reply-To: <6930554.67931308629310902.JavaMail.weblogic@epml09>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Hi Jingoo Han,
On Tuesday 21 June 2011 09:38 AM, JinGoo Han wrote:
> Hi, Tushar Behera.
> 
>> -----Original Message-----
>> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
>> owner@vger.kernel.org] On Behalf Of Tushar Behera
>> Sent: Tuesday, June 21, 2011 12:47 PM
>> To: Jingoo Han
>> Cc: Kukjin Kim; Paul Mundt; linux-samsung-soc@vger.kernel.org; Jonghun Han;
>> Anand Kumar N; Thomas Abraham; Sylwester Nawrocki; Marek Szyprowski;
>> Kyungmin Park; Inki Dae; ARM Linux; Ben Dooks
>> Subject: Re: [PATCH v2 5/5] ARM: EXYNOS4: Add platform data for EXYNOS4
>> FIMD and LTE480WV platform-lcd
>>
>> Hi,
>>
>> On Friday 17 June 2011 06:32 PM, Jingoo Han wrote:
>>> From: Jonghun Han<jonghun.han@samsung.com>
>>>
>>> This patch adds support EXYNOS4 FIMD0 and LTE480WV LCD pannel.
>>>
>>> Signed-off-by: Jonghun Han<jonghun.han@samsung.com>
>>> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
>>> ---
>>>    arch/arm/mach-exynos4/mach-smdkc210.c |   74
>> +++++++++++++++++++++++++++++++++
>>>    arch/arm/mach-exynos4/mach-smdkv310.c |   74
>> +++++++++++++++++++++++++++++++++
>>>    2 files changed, 148 insertions(+), 0 deletions(-)
>>>
>>
>> There are variants of SMDKV310 boards that don't use LTE480WV LCD panel.
>> Won't it be better to provide an option of selecting the LCD panel
>> through config file and adding the panel code accordingly?
>>
>> Also, the panel code can be consolidated at a single location and used
>> in appropriate machine files.
>>
> Do you have a patch about that?
As of now, I don't have any patch for this.
> If you make a patch about your suggestion, please submit it.
I don't have a SMDKV310 with LTE480WV LCD panel, so I might still not be
able to test that patch.

-- 
Tushar Behera
