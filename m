From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: exynos: Add AUDIO pin controller for exynos7
Date: Wed, 14 Jan 2015 23:27:44 +0900
Message-ID: <CA+Ln22GhnW5jcXdQfYaJ_aM4Wq9OHXvShHHaxLKjJi+dp6Afcg@mail.gmail.com>
References: <1418994659-5222-1-git-send-email-padma.v@samsung.com>
	<1418994659-5222-2-git-send-email-padma.v@samsung.com>
	<CACRpkdZopjCN_GMEPQFd_NWa0Ddocqt3aViLrZ7Yh3ui_YcBAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:59097 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbbANO1o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 09:27:44 -0500
In-Reply-To: <CACRpkdZopjCN_GMEPQFd_NWa0Ddocqt3aViLrZ7Yh3ui_YcBAg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Linus,

2015-01-14 20:40 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Dec 19, 2014 at 2:10 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
>
>> Audio IPs on Exynos7 require gpios available in AUDIO
>> pin controller block. So adding the AUDIO pinctrl support.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> (...)
>> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> @@ -181,6 +181,7 @@ Aliases for controllers compatible with "samsung,exynos7-pinctrl":
>>  - pinctrl6: pin controller of FSYS0 block,
>>  - pinctrl7: pin controller of FSYS1 block,
>>  - pinctrl8: pin controller of BUS1 block,
>> +- pinctrl9: pin controller of AUDIO block,
>
> This doesn't apply at all, the list has never been in the document merged
> upstream.

I believe this patch depends on patch [1], which was mentioned in
cover letter and which you seem to have applied two days ago. If it
still doesn't apply, please let me know if I should collect the
patches myself and prepare a pull request for you.

[1] https://patchwork.kernel.org/patch/5467321/

Best regards,
Tomasz
