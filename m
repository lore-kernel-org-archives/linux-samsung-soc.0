From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 3/4] clk: samsung: exynos7: add clocks for audio block
Date: Tue, 13 Jan 2015 11:46:39 +0530
Message-ID: <CAAgF-BdUwuCSGG1cnALdQ+j3b+EWAGyS2F5-2a0D1kvBwhCLog@mail.gmail.com>
References: <1418995427-7712-1-git-send-email-padma.v@samsung.com>
	<1418995427-7712-4-git-send-email-padma.v@samsung.com>
	<549833EA.8040506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:62040 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbAMGQk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 01:16:40 -0500
In-Reply-To: <549833EA.8040506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, tomasz.figa@gmail.com

Hi Sylwester,

On 12/22/14, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 19/12/14 14:23, Padmavathi Venna wrote:
>> Add required clk support for I2S,PCM amd SPDIF
>
> There is a non-trivial conflict with the MSCL CMU patch, could you
> please resend rebased onto my exynos7 branch:

Ok. I willl rebase the patch on your tree.

>
> git://linuxtv.org/snawrocki/samsung.git for-v3.20/clk/exynos7 ?
>
> Is exynos7420 documentation applicable to this ?

This is applicable only for exynos7.

> Would be nice to have someone else who has access to the SoC
> documentation replied with a Reviewed-by tag.
>
> --
> Thanks,
> Sylwester

Thanks
Padma
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
