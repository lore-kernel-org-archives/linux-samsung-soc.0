From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] regulator: Convert to using %pOFn instead of device_node.name
Date: Wed, 29 Aug 2018 09:47:12 +0200
Message-ID: <CAJKOXPdk9Y3N=_Umy1cpuoEAaMbpZU86tUD7_Qp1APfjitc6Fg@mail.gmail.com>
References: <20180828015252.28511-1-robh@kernel.org> <20180828015252.28511-41-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828015252.28511-41-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, sbkim73@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 28 Aug 2018 at 03:55, Rob Herring <robh@kernel.org> wrote:
>
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/regulator/max8997-regulator.c      |  4 +-
>  drivers/regulator/mc13xxx-regulator-core.c |  2 +-
>  drivers/regulator/of_regulator.c           | 44 +++++++++++-----------
>  drivers/regulator/qcom-rpmh-regulator.c    | 14 +++----
>  drivers/regulator/s5m8767.c                | 12 +++---

For S5M8767:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
