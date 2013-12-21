From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] ARM: dts: Rename Exynos5250 ChromeOS common file to
 have exynos prefix
Date: Fri, 20 Dec 2013 16:57:28 -0800
Message-ID: <CAD=FV=UBsmW9V=487F0MvXfTDDmWMRPwK=ZRbgwuQkE-FuJ_xA@mail.gmail.com>
References: <1385381710-5212-1-git-send-email-broonie@kernel.org>
	<1385381710-5212-3-git-send-email-broonie@kernel.org>
	<52B4CE30.6030205@samsung.com>
	<52B4D4AC.10109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f43.google.com ([209.85.212.43]:42240 "EHLO
	mail-vb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab3LUA53 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 19:57:29 -0500
Received: by mail-vb0-f43.google.com with SMTP id p6so1863734vbe.30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 16:57:28 -0800 (PST)
In-Reply-To: <52B4D4AC.10109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@linaro.org>, Olof Johansson <olof@lixom.net>

Kukjin,

On Fri, Dec 20, 2013 at 3:37 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 12/21/13 08:09, Kukjin Kim wrote:
>>
>> On 11/25/13 21:15, Mark Brown wrote:
>>>
>>> From: Mark Brown<broonie@linaro.org>
>>>
>>> Make it easier to notice the common file for ChromeOS devices based on
>>> the Exynos5250 by giving it the exynos5250 prefix that the boards have.
>>>
>>> Signed-off-by: Mark Brown<broonie@linaro.org>
>>> Acked-by: Tomasz Figa<t.figa@samsung.com>

The rename makes a lot of sense to me.

Reviewed-by: Doug Anderson <dianders@chromium.org>
