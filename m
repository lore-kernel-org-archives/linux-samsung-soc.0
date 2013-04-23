From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [PATCH v5 3/6] gpio: samsung: Skip legacy GPIO registration if
 pinctrl-s3c64xx is present
Date: Tue, 23 Apr 2013 23:33:38 +0900
Message-ID: <51769BC2.9010507@gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <1366060483-20342-4-git-send-email-tomasz.figa@gmail.com> <20130416162750.GO26958@opensource.wolfsonmicro.com> <22399020.Z89v9QS8su@flatron> <20130417130609.GA13687@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:32816 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755794Ab3DWOdp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 10:33:45 -0400
Received: by mail-pa0-f50.google.com with SMTP id bg4so524196pad.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 07:33:44 -0700 (PDT)
In-Reply-To: <20130417130609.GA13687@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>

On 04/17/13 22:06, Mark Brown wrote:
> On Wed, Apr 17, 2013 at 12:35:58AM +0200, Tomasz Figa wrote:
>> On Tuesday 16 of April 2013 17:27:50 Mark Brown wrote:
>
>>> Strictly speaking this is a separate bug fix (though I see that's
>>> already in -next separately anyway so whatever).
>
I agree with this.

>> Right. But this fix is so small that I thought it would be a major waste
>> of mail server processing power to send it as a separate patch.
>
But the fix would be value...

> There's reviewer bandwidth too - one of the things people check for is
> that the change is doing what it's supposed to do, extra stuff in there
> is usually a red flag.

Thanks.

- Kukjin
