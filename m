From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 5/5] clk: samsung: exynos5433: add imem clocks
Date: Tue, 04 Dec 2018 10:40:45 -0800
Message-ID: <154394884525.88331.3007383362383800806@swboyd.mtv.corp.google.com>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165318eucas1p2dccd5382ee8b9f4da8c3076fb56607ee@eucas1p2.samsung.com>
 <20181204165248.17572-6-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165248.17572-6-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Kamil Konieczny (2018-12-04 08:52:48)
> +
> +static const unsigned long imem_clk_regs[] __initconst =3D {
> +       ENABLE_ACLK_IMEM,
> +       ENABLE_ACLK_IMEM_INT_MEM,
> +       ENABLE_ACLK_IMEM_SSS,
> +       ENABLE_ACLK_IMEM_SLIMSSS,
> +       ENABLE_ACLK_IMEM_RTIC,
> +       ENABLE_ACLK_IMEM_SMMU_SSS,
> +       ENABLE_ACLK_IMEM_SMMU_SLIMSSS,
> +       ENABLE_ACLK_IMEM_SMMU_RTIC,
> +       ENABLE_ACLK_IMEM_ARBG_TX,
> +       ENABLE_ACLK_IMEM_SMMU_ARBG_TX,
> +       ENABLE_PCLK_IMEM,
> +       ENABLE_PCLK_IMEM_SSS,
> +       ENABLE_PCLK_IMEM_SLIMSSS,
> +       ENABLE_PCLK_IMEM_RTIC,
> +       ENABLE_PCLK_IMEM_SMMU_SSS,
> +       ENABLE_PCLK_IMEM_SMMU_SLIMSSS,
> +       ENABLE_PCLK_IMEM_SMMU_RTIC,
> +       ENABLE_PCLK_IMEM_SMMU_ARGB_TX,
> +};
> +
> +static const struct samsung_gate_clock imem_gate_clks[] __initconst =3D {
> +       /* ENABLE_ACLK_IMEM */
> +       GATE(CLK_ACLK_AXI2AHB_IMEMH, "aclk_axi2ahb_imemh", "aclk_imem_200=
",
> +                       ENABLE_ACLK_IMEM, 24, 0, 0),
> +       GATE(CLK_ACLK_AXIDS_SROMC, "aclk_axids_sromc", "aclk_imem_200",
> +                       ENABLE_ACLK_IMEM, 23, CLK_IGNORE_UNUSED, 0),

Why is there so much use of CLK_IGNORE_UNUSED in this file?

> +       GATE(CLK_ACLK_SROMC, "aclk_sromc", "aclk_imem_200",
