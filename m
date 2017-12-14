From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/4] ARM: dts: split trats2 dts in preparation for
 midas boards
Date: Thu, 14 Dec 2017 14:48:35 +0100
Message-ID: <CAJKOXPe1T=pkE16rCm3drx8Jeak_cavQJaXRshq+rV2JEi=TxA@mail.gmail.com>
References: <20171214125015.2611-1-simon@lineageos.org> <20171214125015.2611-3-simon@lineageos.org>
 <CAJKOXPfcUkF=b27OF4zmj7K0KQfBHbY-QwOUKU6RHy+4gBu1Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751029AbdLNNsi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 08:48:38 -0500
In-Reply-To: <CAJKOXPfcUkF=b27OF4zmj7K0KQfBHbY-QwOUKU6RHy+4gBu1Zg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Thu, Dec 14, 2017 at 2:44 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Dec 14, 2017 at 1:50 PM, Simon Shields <simon@lineageos.org> wrote:
>> The midas boards share a lot with trats2. Split the common parts
>> out of trats2 into a common midas dtsi and a common "galaxy s3" dts.
>>
>> Signed-off-by: Simon Shields <simon@lineageos.org>
>> ---
>>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi |  144 +++
>>  arch/arm/boot/dts/exynos4412-midas.dtsi     | 1291 +++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos4412-trats2.dts     | 1364 +--------------------------
>
> Manual review whether you copied the contents directly or with any
> errors would be a quite big task. Run format-patch with -B30% or try
> to experiment with other options (most important is -B, but also you
> can play with -M and -C).
>

BTW, you have some whitespace errors:
150: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Krzysztof
