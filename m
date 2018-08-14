From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] regulator: maxim: Add SPDX license identifiers
Date: Tue, 14 Aug 2018 14:39:27 -0600
Message-ID: <20180814203927.GA31064@rob-hp-laptop>
References: <20180807161826.2222-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807161826.2222-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, Sangbeom Kim <sbkim73@samsung.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue,  7 Aug 2018 18:18:25 +0200, Krzysztof Kozlowski wrote:
> Replace GPL v2.0 and v2.0+ license statements with SPDX license
> identifiers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/regulator/max14577-regulator.c         | 22 +++++------------
>  drivers/regulator/max77686-regulator.c         | 32 +++++++-----------------
>  drivers/regulator/max77693-regulator.c         | 32 +++++++-----------------
>  drivers/regulator/max77802-regulator.c         | 34 +++++++++-----------------
>  drivers/regulator/max8997-regulator.c          | 30 ++++++-----------------
>  drivers/regulator/max8998.c                    | 28 ++++++---------------
>  include/dt-bindings/regulator/maxim,max77802.h |  5 +---
>  7 files changed, 52 insertions(+), 131 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
