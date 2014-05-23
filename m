From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v10 3/3] ARM: dts: Add initial device tree support for
 EXYNOS5410
Date: Fri, 23 May 2014 23:15:38 +0200
Message-ID: <537FBA7A.3000605@gmail.com>
References: <1400841343-6016-1-git-send-email-t.dakhran@samsung.com> <1400841343-6016-4-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400841343-6016-4-git-send-email-t.dakhran@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tarek,

On 23.05.2014 12:35, Tarek Dakhran wrote:
> Add initial device tree nodes for EXYNOS5410 SoC and SMDK5410 board.
> 
> Signed-off-by: Tarek Dakhran <t.dakhran@samsung.com>
> Signed-off-by: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
> ---
>  arch/arm/boot/dts/Makefile                |    1 +
>  arch/arm/boot/dts/exynos5410-smdk5410.dts |   82 ++++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi         |  206 +++++++++++++++++++++++++++++
>  3 files changed, 289 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5410-smdk5410.dts
>  create mode 100644 arch/arm/boot/dts/exynos5410.dtsi

Looks good. Hopefully we can have this patch applied soon, so it won't
get outdated again.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
