From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v10 3/3] ARM: dts: Add initial device tree support for
 EXYNOS5410
Date: Mon, 26 May 2014 05:09:30 +0900
Message-ID: <53824DFA.3020407@samsung.com>
References: <1400841343-6016-1-git-send-email-t.dakhran@samsung.com> <1400841343-6016-4-git-send-email-t.dakhran@samsung.com> <537FBA7A.3000605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <537FBA7A.3000605@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tarek Dakhran <t.dakhran@samsung.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>, Romain Naour <romain.naour@openwide.fr>, Tarek Dakhran <t.dakhran@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/24/14 06:15, Tomasz Figa wrote:
> Hi Tarek,
>
> On 23.05.2014 12:35, Tarek Dakhran wrote:
>> Add initial device tree nodes for EXYNOS5410 SoC and SMDK5410 board.
>>
>> Signed-off-by: Tarek Dakhran<t.dakhran@samsung.com>
>> Signed-off-by: Vyacheslav Tyrtov<v.tyrtov@samsung.com>
>> ---
>>   arch/arm/boot/dts/Makefile                |    1 +
>>   arch/arm/boot/dts/exynos5410-smdk5410.dts |   82 ++++++++++++
>>   arch/arm/boot/dts/exynos5410.dtsi         |  206 +++++++++++++++++++++++++++++
>>   3 files changed, 289 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/exynos5410-smdk5410.dts
>>   create mode 100644 arch/arm/boot/dts/exynos5410.dtsi
>
> Looks good. Hopefully we can have this patch applied soon, so it won't
> get outdated again.
>
Yes.

Tarek, please respin as soon as possible.

> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>

- Kukjin
