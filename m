From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/19] pinctrl: exynos: Add support for Exynos5433
Date: Thu, 27 Nov 2014 13:36:36 +0100
Message-ID: <4132795.KBVIQFTevx@wuerfel>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com> <3904347.Bp2gmpYM49@wuerfel> <CA+Ln22FtvUD1HqH9PCGPCRu8Cyc6u4oNnsrEWyKYODtCT8wKHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+Ln22FtvUD1HqH9PCGPCRu8Cyc6u4oNnsrEWyKYODtCT8wKHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, InKi Dae <inki.dae@samsung.com>, Chanho Park <chanho61.park@samsung.com>, geunsik.lim@samsung.com, "sw0312.kim" <sw0312.kim@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 27 November 2014 21:14:59 Tomasz Figa wrote:
> > my impression is that with the
> > move to arm64, you should come up with a new binding that can fully
> > describe each controller so you don't have to add new code and bindings
> > for each future SoC that uses the same scheme.
> 
> Still, this is exactly the same thing I thought when initially refactoring this
> driver 2 years ago and what was dismissed at that time due to people
> supposedly not wanting that much data in DT. If this point of view has changed,
> then I fully support your view, though.

I guess people were at the time underestimating the rate at which Samsung
comes out with new SoC variants that are all slightly different.

	Arnd
