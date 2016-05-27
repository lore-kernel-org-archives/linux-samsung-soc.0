From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Fri, 27 May 2016 13:46:41 +0200
Message-ID: <20160527114641.GA39472@sesse.net>
References: <20160524192424.GA11690@sesse.net>
 <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
 <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:43746 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbcE0LrC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2016 07:47:02 -0400
Content-Disposition: inline
In-Reply-To: <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: "Steinar H. Gunderson" <sesse@google.com>, Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, balbi@kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

On Fri, May 27, 2016 at 03:23:35PM +0530, Vivek Gautam wrote:
> I don't have any concerns with the patch apart from the ones
> Krzysztof has already pointed out.
> LGTM.

Should I repost the patch, or will people just make these commit message
changes for me? I guess balbi@ is the right person to review and merge,
since he maintains the driver.

/* Steinar */
-- 
Homepage: https://www.sesse.net/
