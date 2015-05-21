From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos4412-trats2: set display clock correctly
Date: Thu, 21 May 2015 14:20:33 +0900
Message-ID: <555D6B21.9000406@kernel.org>
References: <1423306148-22212-1-git-send-email-inki.dae@samsung.com> <CAJKOXPd_ON3sYuWCHOWJJEL7E9gzu9eQHf3yqc0cXAX3QoES7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37068 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751186AbbEUFUm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 01:20:42 -0400
In-Reply-To: <CAJKOXPd_ON3sYuWCHOWJJEL7E9gzu9eQHf3yqc0cXAX3QoES7A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 05/20/15 09:12, Krzysztof Kozlowski wrote:
> 2015-02-07 19:49 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
>> This patch sets display clock correctly.
>>
>> If Display clock isn't set correctly then you would find below messages
>> and Display controller doesn't work correctly since a patch[1]
>>
>>    exynos-drm: No connectors reported connected with modes
>>    [drm] Cannot find any crtc or sizes - going 1024x768
>>
>> [1] commit abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Tested on Trats2 board.
> 
> Dear Kukjin,
> 
> Could you pull it to current fixes branch (this RC cycle)? The patch
> fixes display on Trats2 board. Without it (since abc0b1447d49) it
> won't be properly set up and device boots with blank screen and
> mentioned error message in logs.
> 
> I think this actually is a candidate for stable backporting (4.0+)
> because it fixes important functionality of device:
> 
> Fixes: abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")
> Cc: <stable@vger.kernel.org>
> 
Thanks, applied, and will be sent out in a day for v4.1-rc.

- Kukjin
