From: Kamil Konieczny <k.konieczny@samsung.com>
Subject: Re: Devfreq looks for unsupported frequencies on Exynos
Date: Fri, 4 Oct 2019 14:46:43 +0200
Message-ID: <e68cb899-b207-a674-e7b0-fa5f8cbb6a1b@samsung.com>
References: <CGME20191004103109epcas5p23221e4098d5d62faaf5d8db871ac3770@epcas5p2.samsung.com>
        <20191004103101.GA9176@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004103101.GA9176@pi3>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04.10.2019 12:31, Krzysztof Kozlowski wrote:
> 
> Hi All,
> 
> I noticed recently error logs when booting Odroid HC1 (Exynos5422) on
> exynos_defconfig, 5.4.0-rc1-next-20191004:
> [...]
> [    5.225222] exynos-bus soc:bus_wcore: dev_pm_opp_set_rate: failed to find current OPP for freq 532000000 (-34)
> [    5.225975] exynos-bus: new bus device registered: soc:bus_peri ( 67000 KHz ~  67000 KHz)
> [    5.238824] exynos-bus soc:bus_noc: dev_pm_opp_set_rate: failed to find current OPP for freq 111000000 (-34)
> [    5.245719] exynos-bus: new bus device registered: soc:bus_g2d ( 84000 KHz ~ 333000 KHz)
> [    5.252653] exynos-bus soc:bus_fsys_apb: dev_pm_opp_set_rate: failed to find current OPP for freq 222000000 (-34)
> [...]
> You can see that Exynos devfreq was trying to set 532000000 Hz for
> wcore, 111000000 for noc and 222000000 for fsys_apb. These are higher
> frequencies than we have in DTSI.
> 
> Any ideas why? It does not look normal...

Thank you for report. This is known issue, clocks left by u-boot are too
high and they are not present in opp tables. Lukasz Luba sended patchset
"[PATCH v1 00/50] Exynos5x clocks and buses changes" but it should first
be made in u-boot.

I have idea for a fix and will send it soon after weekend.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
