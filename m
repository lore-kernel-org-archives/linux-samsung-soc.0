From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND] ARM: dts: Move display-timings node from fimd to
 dp
Date: Mon, 28 Sep 2015 18:17:36 +0900
Message-ID: <560905B0.1090708@samsung.com>
References: <1442494120-463-1-git-send-email-tomeu.vizoso@collabora.com>
 <CAAObsKDqpBnggX7sHCgQ5d7ZxYumh_ga8kbLQc4bQ=N+M6BoCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34099 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756857AbbI1JRy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Sep 2015 05:17:54 -0400
In-Reply-To: <CAAObsKDqpBnggX7sHCgQ5d7ZxYumh_ga8kbLQc4bQ=N+M6BoCg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

W dniu 28.09.2015 o 17:56, Tomeu Vizoso pisze:
> Hi Kukjin and Krzysztof,
> 
> could you take a look at this?

Of course, but please be patient. It waits on my todo list. I have just
returned from holidays.

Best regards,
Krzysztof

> 
> Thanks,
> 
> Tomeu
> 
> On 17 September 2015 at 14:48, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>> From: Sean Paul <seanpaul@chromium.org>
>>
>> This patch moves the display-timings node from fimd to dp to reflect the
>> device tree bindings change.
>>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> [tomeu.vizoso@collabora.com: Rebased]
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>
>> ---
>>
>> Hi,
>>
>> looks like a long time ago the bindings were changed and the DTs for
>> these boards weren't updated.
>>
>> I have retaken Sean's forgotten patch and rebased it, but I have only
>> tested on an Arndale that exynos-drm doesn't complain about missing
>> timings.
>>
>> Regards,
>>
