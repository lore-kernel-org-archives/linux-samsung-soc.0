From: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Mon, 30 May 2016 19:46:09 +0200
Message-ID: <20160530174609.GB22557@sesse.net>
References: <20160524192424.GA11690@sesse.net>
 <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
 <CAFp+6iGFkquYkHCCJRkQALRZ2g-htiKbrJZbJwMoAMR=+A5u_Q@mail.gmail.com>
 <20160527114641.GA39472@sesse.net>
 <5748480D.8000501@samsung.com>
 <87bn3rprtw.fsf@linux.intel.com>
 <20160527132519.GA5268@sesse.net>
 <877fefpr71.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:53475 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3Rq1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2016 13:46:27 -0400
Content-Disposition: inline
In-Reply-To: <877fefpr71.fsf@linux.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vivek Gautam <gautamvivek1987@gmail.com>, "Steinar H. Gunderson" <sesse@google.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, Linux USB Mailing List <linux-usb@vger.kernel.org>

On Fri, May 27, 2016 at 04:26:42PM +0300, Felipe Balbi wrote:
>> Sent. As a fix, there's a chance it could go into 4.7, right?
> yup, shouldn't be a problem. But only after v4.7-rc1 is tagged.

Seemingly v4.7-rc1 is out today (I was surprised at how quick that was).

/* Steinar */
-- 
Homepage: https://www.sesse.net/
