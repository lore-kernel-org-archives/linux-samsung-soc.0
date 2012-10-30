From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: samsung: Add support for Exynos4x12
Date: Tue, 30 Oct 2012 10:29:02 +0100
Message-ID: <CACRpkdb2i7Pv27oNg1wu6B8GzYb6j4XRU=LgnmMzSewscfxvPA@mail.gmail.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
	<CACRpkdaoQP2jat_mr2wr30M39eogKAq77Gw2VoNPWbgHjgW+zw@mail.gmail.com>
	<CAH9JG2V2UjuvjK2_sjLQsEt21duCqyoQuAi0KsMfB+CjRrh8KQ@mail.gmail.com>
	<2350814.8tYbDqrzVz@amdc1227>
	<508E683C.6040807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:52620 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756558Ab2J3J3E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Oct 2012 05:29:04 -0400
Received: by mail-ee0-f46.google.com with SMTP id b15so29805eek.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Oct 2012 02:29:02 -0700 (PDT)
In-Reply-To: <508E683C.6040807@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On Mon, Oct 29, 2012 at 12:27 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> On 10/29/12 19:28, Tomasz Figa wrote:
>> On Monday 29 of October 2012 09:30:26 Kyungmin Park wrote:

>> Since this depends on the patch adding Exynos4x12 dts files
>> ([PATCH] ARM: dts: exynos4: Add support for Exynos4x12 SoCs),
>> which will be going through Kgene's tree and this patch series contains
>> mostly SoC-specific code, maybe this should rather go through Kgene's
>> tree? Or this is not a problem?
>>
> Yeah, I agree with Tomasz's opinion and let me pick this into Samsung tree
> with Linus's ack.

Seems to have worked out well, just one minor conflict in -next
so let's go for this...

Yours,
Linus Walleij
