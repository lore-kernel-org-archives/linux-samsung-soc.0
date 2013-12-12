From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH CFT] ARM:S5P64X0: Enable ARM_PATCH_PHYS_VIRT and
 AUTO_ZRELADDR by default
Date: Thu, 12 Dec 2013 22:23:38 +0100
Message-ID: <CACRpkdYpQzue=_di1YhfvmQ47kdg0ydsZhKrWDyk9sJU9u_xHg@mail.gmail.com>
References: <1386825152-398-1-git-send-email-panchaxari.prasannamurthy@linaro.org>
	<26167386.hX5eWUjT6T@flatron>
	<CACRpkdbGSXA8oT8L-0fzJx7esXn7GWQA+Wi7WCQKX9eiy-fYCQ@mail.gmail.com>
	<CA+Ln22EaSpzrSaW-TC1BMhnj8aPZMfK9pCTqBMnGXC3B-06FBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:41589 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751701Ab3LLVXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 16:23:39 -0500
Received: by mail-ob0-f180.google.com with SMTP id wo20so1045730obc.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2013 13:23:38 -0800 (PST)
In-Reply-To: <CA+Ln22EaSpzrSaW-TC1BMhnj8aPZMfK9pCTqBMnGXC3B-06FBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, panchaxari <panchaxari.prasannamurthy@linaro.org>, Kgene Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 12, 2013 at 10:22 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 2013/12/12 Linus Walleij <linus.walleij@linaro.org>:
>> On Thu, Dec 12, 2013 at 10:47 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>
>>> This is actually quite a poor platform choice. As of today, the kernel
>>> is stuck with supporting just SMDK6440/6450 boards, which are proprietary
>>> development boards and it doesn't look like any further boards will show
>>> up in future. Kukjin has actually proposed removing support for this
>>> platform at all and I consider this reasonable.
>>>
>>> Kukjin, should we proceed with removal?
>>
>> Isn't Mark Brown using that platform for some various stuff?
>
> Not as far as I know.
>
> He's using Cragganmore board based on s3c6410, but this is a different
> platform (s3c64xx).

Ahhhh I see it now. So the S3C:s are actually in a lot of use
and the S5P is one of those stepping stones to Exynos that
never really was in any widespread use.

Yeah I'm all for deleteing that :-)

Thanks!
Linus Walleij
