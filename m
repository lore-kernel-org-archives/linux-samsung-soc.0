From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: Add regulator suspend
 configuration to Odroid XU3/XU4/HC1 family
Date: Mon, 24 Jun 2019 09:20:38 +0200
Message-ID: <d94a2f99-fb99-c238-7011-9bbb4c0cd90f@samsung.com>
References: <20190621155845.7079-1-krzk@kernel.org>
        <20190621155845.7079-3-krzk@kernel.org>
        <CGME20190623160226epcas2p3449814deb1faf7bf939481e6d4da2b86@epcas2p3.samsung.com>
        <CANAwSgTFQo8wL5s-djwPXFFOLtTHvRQif6234kFC=23PwMhuEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgTFQo8wL5s-djwPXFFOLtTHvRQif6234kFC=23PwMhuEQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Anand,

On 2019-06-23 18:02, Anand Moon wrote:
> Thanks for this patch. Please add my
>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
>
> [snip]
>
> Could you integrate below small changes into this patch.
> with these below changes suspend and resume work correctly at my end.
>
> [1] XU4_suspendresume.patch
>
> As per S2MPS11B PMIC 1.2.1 Regulator (Features)
> Fix the min max value for *Buck7* and *Buck8*
>
> -- Buck7 (VDD_1.0V_LDO) 1.5 A (1.2 V to 1.5 V, 12.5 mV step, default on 1.35 V)
> -- Buck8 (VDD_1.8V_LDO) 2.5 A (1.8 V to 2.1 V, 12.5 mV step, default on 2.0 V)

Could you elaborate why such change for Buck7 and Buck8 is needed?

> Also add suspend-off for *Buck9*
> Buck9 internally controls the power of USB hub.
> Adding suspend the this node help proper reset of USB hub on Odroid
> XU4 / HC1/ XU3
> during suspend and resume. Below it the logs from my testing.

Disabling Buck9 in suspend indeed reduces the power consumed by the 
board during suspend-to-ram from about 80mA to as little as 7-10mA, what 
matches the results of OdroidXU3. Thanks for the hint!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
