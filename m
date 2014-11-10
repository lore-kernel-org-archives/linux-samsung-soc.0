From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: disable CONFIG_EXYNOS5420_MCPM; not stable
Date: Mon, 10 Nov 2014 11:35:23 -0800
Message-ID: <7hegtaq26c.fsf@deeprootsystems.com>
References: <1414796382-5447-1-git-send-email-khilman@kernel.org>
	<000e01cffb39$5ef0a2d0$1cd1e870$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:56646 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbaKJTf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Nov 2014 14:35:27 -0500
Received: by mail-pa0-f41.google.com with SMTP id rd3so8960827pab.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2014 11:35:26 -0800 (PST)
In-Reply-To: <000e01cffb39$5ef0a2d0$1cd1e870$@kernel.org> (Kukjin Kim's
	message of "Sat, 08 Nov 2014 18:50:04 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Sachin Kamat' <sachin.kamat@samsung.com>, 'Doug Anderson' <dianders@chromium.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>

Kukjin Kim <kgene@kernel.org> writes:

> Kevin Hilman wrote:
>> 
>> From: Kevin Hilman <khilman@linaro.org>
>> 
>> The option CONFIG_EXYNOS5420_MCPM is causing imprecise external aborts
>> during boot testing, causing various userspace startup failures.
>> 
>> Disable until it has gotten more testing.
>> 
>> Cc: Kukjin Kim <kgene.kim@samsung.com>,
>> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
>> Cc: Sachin Kamat <sachin.kamat@samsung.com>,
>> Cc: Doug Anderson <dianders@chromium.org>,
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
>> Cc: Tushar Behera <tushar.behera@linaro.org>,
>> Cc: stable@vger.kernel.org # v3.17+
>> Signed-off-by: Kevin Hilman <khilman@linaro.org>
>> ---
>> This has been reported by a few people[1], but not investigated or fixed, so it's
>> time to disable this feature until it can be fixed.
>> 
> Hi Kevin,
>
> Yeah I agree with your opinion.
>
> But as you can see my tree, I've queued regarding mcpm patches for 3.19 will
> be shown in -next in this weekend. 

Which of the recently queued patches are expected to address the
imprecise abort issue?  I'd be happy to test them out.  

> Anyway let me apply this into -fixes and
> then let's enable after test its functionality in -next in a couple of days.

Yes, I think this needs to be applied until these aborts are understood
and fixed.

Thanks,

Kevin
