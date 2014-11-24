From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: disable CONFIG_EXYNOS5420_MCPM;
 not stable
Date: Mon, 24 Nov 2014 11:51:05 -0800
Message-ID: <CAMAWPa-mLAFL7v8hHA5R-eBzpMFK-E-xcvjoV8Bn6tTwgP53Uw@mail.gmail.com>
References: <1414796382-5447-1-git-send-email-khilman@kernel.org>
	<000e01cffb39$5ef0a2d0$1cd1e870$@kernel.org>
	<7hegtaq26c.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:36696 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751587AbaKXTvJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 14:51:09 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id C5690204A0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 19:51:08 +0000 (UTC)
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3C6C420489
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 19:51:07 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so13370685wgg.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 11:51:05 -0800 (PST)
In-Reply-To: <7hegtaq26c.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Kukjin,

On Mon, Nov 10, 2014 at 11:35 AM, Kevin Hilman <khilman@kernel.org> wrote:
> Kukjin Kim <kgene@kernel.org> writes:
>
>> Kevin Hilman wrote:
>>>
>>> From: Kevin Hilman <khilman@linaro.org>
>>>
>>> The option CONFIG_EXYNOS5420_MCPM is causing imprecise external aborts
>>> during boot testing, causing various userspace startup failures.
>>>
>>> Disable until it has gotten more testing.
>>>
>>> Cc: Kukjin Kim <kgene.kim@samsung.com>,
>>> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
>>> Cc: Sachin Kamat <sachin.kamat@samsung.com>,
>>> Cc: Doug Anderson <dianders@chromium.org>,
>>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
>>> Cc: Tushar Behera <tushar.behera@linaro.org>,
>>> Cc: stable@vger.kernel.org # v3.17+
>>> Signed-off-by: Kevin Hilman <khilman@linaro.org>
>>> ---
>>> This has been reported by a few people[1], but not investigated or fixed, so it's
>>> time to disable this feature until it can be fixed.
>>>
>> Hi Kevin,
>>
>> Yeah I agree with your opinion.
>>
>> But as you can see my tree, I've queued regarding mcpm patches for 3.19 will
>> be shown in -next in this weekend.
>
> Which of the recently queued patches are expected to address the
> imprecise abort issue?  I'd be happy to test them out.

Exynos5 MCPM is still broken in linux-next and still causing an imprecise abort.

What is the status of $SUBJECT patch?

>> Anyway let me apply this into -fixes and
>> then let's enable after test its functionality in -next in a couple of days.
>
> Yes, I think this needs to be applied until these aborts are understood
> and fixed.

Is anyone at Samsung actually looking into these MCPM issues?

Kevin
