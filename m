From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 0/6] pinctrl: samsung: Convert the driver to use
 per-bank GPIO and interrupt specifiers
Date: Mon, 24 Sep 2012 22:03:20 +0200
Message-ID: <CACRpkdb4Hp+zXKfufR0aJcJFvcNH=JYQeTUzaZEafxSVN5f3-g@mail.gmail.com>
References: <1348237377-21299-1-git-send-email-t.figa@samsung.com>
	<CACRpkdaqaaNf=S9CMzYE3zpji0pCK1MLKeBm3uH7-18HHwPV3w@mail.gmail.com>
	<CAH9JG2V+Ju0wFCJZZieNpK+1pDJ1zGwNSS=j4dV0hVtHXQmb5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:63830 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757761Ab2IXUDV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 16:03:21 -0400
Received: by vcbfo13 with SMTP id fo13so6772168vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Sep 2012 13:03:20 -0700 (PDT)
In-Reply-To: <CAH9JG2V+Ju0wFCJZZieNpK+1pDJ1zGwNSS=j4dV0hVtHXQmb5w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Sep 24, 2012 at 12:45 PM, Kyungmin Park
<kyungmin.park@samsung.com> wrote:
> On 9/24/12, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Sep 21, 2012 at 4:22 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>>
>>> This is a continuation of work focused on improving the pinctrl-samsung
>>> driver.
>>
>> All look good to me, I guess these will go through the Samsung tree?
>> Acked-by: Linus Walleij <linus.walleij@linaro.org> for all.
>
> Now samsung tree is merged so if you don't mind, can you merge it by
> pinctl tree?

Yes but not until after the merge window... I have closed my
tree.

I think all dependencies are in the ARM SoC tree now, so I
suspect it wouldn't apply anyway?

Tomasz can you repost this after the merge window so I don't
forget about applying it?

Yours,
Linus Walleij
