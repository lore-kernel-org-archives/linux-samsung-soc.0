From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH RESEND v9 1/5] rtc: max77686: Allow the max77686 rtc to
 wakeup the system
Date: Fri, 12 Sep 2014 17:54:34 +0200
Message-ID: <5413173A.9070705@collabora.co.uk>
References: <1410509864-10019-1-git-send-email-javier.martinez@collabora.co.uk>	<1410509864-10019-2-git-send-email-javier.martinez@collabora.co.uk> <CAD=FV=Vu3u=KfUNUpL6qcr0Fp42WbY8AqfOXyWr-D3KW1PucxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:37220 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751587AbaILPyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 11:54:39 -0400
In-Reply-To: <CAD=FV=Vu3u=KfUNUpL6qcr0Fp42WbY8AqfOXyWr-D3KW1PucxA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello Doug,

On 09/12/2014 05:12 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Sep 12, 2014 at 1:17 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> From: Doug Anderson <dianders@chromium.org>
>>
>> The max77686 includes an RTC that keeps power during suspend.  It's
>> convenient to be able to use it as a wakeup source.
>>
>> NOTE: due to wakeup ordering problems this patch alone doesn't work so
>> well on exynos5250-snow.  You also need something that brings the i2c
>> bus up before the max77686 wakeup runs.
> 
> This note made sense when the patch was first submitted, but no longer
> does since the i2c change landed.  See:
> 
> b19c195 i2c: s3c2410: resume the I2C controller earlier
> 

You are right, I completely forgot to check if that actually landed and to
remove the note in that case...

Maybe when the set is applied the note can be removed from this patch or do
you think that I should re-spin the series for that?

Best regards,
Javier
