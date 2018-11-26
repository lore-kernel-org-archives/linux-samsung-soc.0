From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH 4/4] clk: samsung: exynos5433: add imem clock
Date: Mon, 26 Nov 2018 16:16:37 +0100
Message-ID: <d4dd53a5-fb87-34db-e3b6-2d8d05feb261@partner.samsung.com>
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <CGME20181121120524eucas1p166a26857df78947c9e08f0fb8dbf75e4@eucas1p1.samsung.com>
        <20181121120509.18892-5-k.konieczny@partner.samsung.com>
        <5BF5520A.5050500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BF5520A.5050500@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

> On 2018년 11월 21일 21:05, Kamil Konieczny wrote:
>> Add imem clock for exynos5433.
> 
> It is diffcult to understand the meaning of 'imem' without the description.
> Please add more detailed description as the patch2 description.
> [...]

Thank you for review, will this be enough for description:

Add imem clock for exynos5433. This will enable to use crypto Security
SubSystem (in short SSS) and SlimSSS IP blocks.

In documentation there is no description of "imem" name origin. I can guess
"mem" stand for "memory", and 'i' ? internal ?

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
