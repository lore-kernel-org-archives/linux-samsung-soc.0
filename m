From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v9 0/3] Exynos 5410 support
Date: Mon, 19 May 2014 12:51:36 +0200
Message-ID: <5379E238.1080803@gmail.com>
References: <1400470640-30611-1-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400470640-30611-1-git-send-email-t.dakhran@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tarek,

On 19.05.2014 05:37, Tarek Dakhran wrote:
> The series of patches represent support of Exynos 5410 SoC
> 
> The Exynos 5410 is the first Samsung SoC based on big.LITTLE architecture
> 
> Patches add new platform description, support of clock controller and device
> tree for Exynos 5410.
> 
> Has been build on Samsung Linux Kernel
>   (branch: for-next, commit: ccf5511 ARM: EXYNOS: Add MCPM call-back functions)

This doesn't look like an up-to-date tip of that branch. There was a lot
of changes merged 2 days ago, especially from samsung-clk tree and your
patches won't apply and/or compile (at least patch 2/3). Are you sure
you didn't have a git fetch error?

Moreover I can still see the dts using full-path syntax, instead of
reference-based one and also no soc node, as I pointed in v8. [1]

[1] https://lkml.org/lkml/2014/4/26/59

Another thing is that I still see a custom fixed clock binding being
used for oscclk in the clock driver, while I believe I pointed in some
of the previous versions that generic fixed clock should be used.

Best regards,
Tomasz
