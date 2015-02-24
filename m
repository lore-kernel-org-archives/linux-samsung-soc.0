From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/8] arm64: dts: exynos: Add dts files for 64-bit Exynos5433 SoC
Date: Tue, 24 Feb 2015 09:35:26 +0100
Message-ID: <7139111.LGA4lhSjob@wuerfel>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com> <1424755011-15999-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424755011-15999-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kgene@kernel.org, mark.rutland@arm.com, marc.zyngier@arm.com, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 24 February 2015 14:16:45 Chanwoo Choi wrote:
> +       aliases {
> +               pinctrl0 = &pinctrl_alive;
> +               pinctrl1 = &pinctrl_aud;
> +               pinctrl2 = &pinctrl_cpif;
> +               pinctrl3 = &pinctrl_ese;
> +               pinctrl4 = &pinctrl_finger;
> +               pinctrl5 = &pinctrl_fsys;
> +               pinctrl6 = &pinctrl_imem;
> +               pinctrl7 = &pinctrl_nfc;
> +               pinctrl8 = &pinctrl_peric;
> +               pinctrl9 = &pinctrl_touch;
> +               serial0 = &serial_0;
> +               serial1 = &serial_1;
> +               serial2 = &serial_2;
> +               i2c0 = &hsi2c_0;
> +               i2c1 = &hsi2c_1;
> +               i2c2 = &hsi2c_2;
> +               i2c3 = &hsi2c_3;
> +               i2c4 = &hsi2c_4;
> +               i2c5 = &hsi2c_5;
> +               i2c6 = &hsi2c_6;
> +               i2c7 = &hsi2c_7;
> +               i2c8 = &hsi2c_8;
> +               i2c9 = &hsi2c_9;
> +               i2c10 = &hsi2c_10;
> +               i2c11 = &hsi2c_11;
> +       };
> +
> 

Can you put the aliases into the per-board files? There might be boards that
do not support all the uarts and all the i2c controllers but only want to
provide aliases for a subset of them, without holes in the numbering.

	Arnd
