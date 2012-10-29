From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 3/4] pinctrl: samsung: Add support for Exynos4x12
Date: Mon, 29 Oct 2012 09:30:26 +0900
Message-ID: <CAH9JG2V2UjuvjK2_sjLQsEt21duCqyoQuAi0KsMfB+CjRrh8KQ@mail.gmail.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
	<1351089457-8205-4-git-send-email-t.figa@samsung.com>
	<CACRpkdaoQP2jat_mr2wr30M39eogKAq77Gw2VoNPWbgHjgW+zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:59042 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754273Ab2J2Aa2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Oct 2012 20:30:28 -0400
Received: by mail-ee0-f46.google.com with SMTP id b15so1836024eek.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Oct 2012 17:30:27 -0700 (PDT)
In-Reply-To: <CACRpkdaoQP2jat_mr2wr30M39eogKAq77Gw2VoNPWbgHjgW+zw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On 10/29/12, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Oct 24, 2012 at 4:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>
>> This patch extends the driver with any necessary SoC-specific
>> definitions to support Exynos4x12 SoCs.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I guess you need all of this to go into my Samsung branch?
> I need and ACK from the Samsung maintainer and preferably
> Thomas A as well.

Hi,

Now we're trying to send the standalone patches to avoid the conflict.
and hope to merge patches via proper subsystem. In this case, pinctl.

Thank you,
Kyungmin Park
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
