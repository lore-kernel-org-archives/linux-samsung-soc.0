From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Fri, 27 May 2016 15:13:49 +0200
Message-ID: <5748480D.8000501@samsung.com>
References: <20160524192424.GA11690@sesse.net>
 <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
 <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com>
 <20160527114641.GA39472@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:12603 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753872AbcE0NNy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2016 09:13:54 -0400
In-reply-to: <20160527114641.GA39472@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>, Vivek Gautam <gautamvivek1987@gmail.com>
Cc: "Steinar H. Gunderson" <sesse@google.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, balbi@kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

On 05/27/2016 01:46 PM, Steinar H. Gunderson wrote:
> On Fri, May 27, 2016 at 03:23:35PM +0530, Vivek Gautam wrote:
>> I don't have any concerns with the patch apart from the ones
>> Krzysztof has already pointed out.
>> LGTM.
> 
> Should I repost the patch, or will people just make these commit message
> changes for me? I guess balbi@ is the right person to review and merge,
> since he maintains the driver.

Although resend is not strictly needed because maintainer might do the
changes by himself... but he might just miss the comments as well (and
e.g. use patchwork to apply the patch).

I think it would be useful if you send a v2 with fixes pointed by me and
accumulated review-tags (mine and Vivek's Reviewed-by).

Best regards,
Krzysztof
