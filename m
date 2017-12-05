From: Stephan Mueller <smueller@chronox.de>
Subject: Re: [RFC] crypto: exynos - Icrease the priority of the driver
Date: Tue, 05 Dec 2017 14:48:35 +0100
Message-ID: <2500626.C7ppcC6VU6@tauon.chronox.de>
References: <CGME20171205124216eucas1p17f46fc23ea35f7f2fcacc49d88e40a15@eucas1p1.samsung.com> <20171205124214.31263-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:42766 "EHLO mail.eperm.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751255AbdLENsi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 08:48:38 -0500
In-Reply-To: <20171205124214.31263-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Kukjin Kim <kgene@kernel.org>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

Am Dienstag, 5. Dezember 2017, 13:42:14 CET schrieb Łukasz Stelmach:

Hi Łukasz,

> exynos-rng is one of many implementations of stdrng. With priority as
> low as 100 it isn't selected, if software implementations (DRBG) are
> available.

What about using 300? The reason is the following: in the normal case, the 
software PRNGs have 100 (X9.31) and 200 (SP800-90A DRBG). Thus, in normal 
case, the hardware takes precedence.

In FIPS mode, the DRBG prio is increased by 200. As in FIPS mode you must have 
a DRBG and assuming that the hardware does not implement a DRBG, the software 
DRBG should be used as otherwise you have a FIPS-problem.

Ciao
Stephan
