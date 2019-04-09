From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Remove console argument from
 bootargs
Date: Tue, 9 Apr 2019 18:09:29 +0200
Message-ID: <fb27dff4-7b1f-3010-2f04-8c0a3f8d8de6@samsung.com>
References: <20190408051926.462-1-krzk@kernel.org>
        <20190408051926.462-2-krzk@kernel.org>
        <CGME20190409160931eucas1p23ee0ca79d00f9c72a7a2d3e07a6c8703@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408051926.462-2-krzk@kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 4/8/19 07:19, Krzysztof Kozlowski wrote:
> Remove the "console=ttySAC..." argument from DTSes having a proper
> stdout-path property.  To make the code functionally equivalent, add the
> serial port baud rate and parity.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
