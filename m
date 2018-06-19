From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Remove unneeded DSI and DECON
 address/size cells in Exynos5433
Date: Tue, 19 Jun 2018 09:59:04 +0200
Message-ID: <CAJKOXPeCT3CkqqNowEZaeTw7goJd6=Nbd2S61QzTFW-nGr5AKg@mail.gmail.com>
References: <20180618174216.24801-1-krzk@kernel.org> <CGME20180618174316epcas1p397b66c8e4e8479fce8655941a4d4279f@epcas1p3.samsung.com>
 <20180618174216.24801-2-krzk@kernel.org> <20180619072652eucas1p1943deb1b158eda52980448e41f83e5e9~5fwX6lI2o2633926339eucas1p1Q@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619072652eucas1p1943deb1b158eda52980448e41f83e5e9~5fwX6lI2o2633926339eucas1p1Q@eucas1p1.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 19 June 2018 at 09:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Hi Krzysztof,
>
> On 2018-06-18 19:42, Krzysztof Kozlowski wrote:
>> The decon, decon_tv and dsi nodes have only one child port so
>> address/size mappings are not necessary.  This fixes DTC warnings like:
>>
>>      Warning (graph_child_address): /soc/decon@13800000/ports:
>>          graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Works fine with current Exynos DRM Decon/MIC/DSI drivers.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for review and testing!

Best regards,
Krzysztof
