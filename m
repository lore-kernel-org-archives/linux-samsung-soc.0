From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] clk: s2mps11: Use existing defines from bindings for clock
 IDs
Date: Mon, 27 Aug 2018 14:18:07 -0700
Message-ID: <153540468738.129321.10833887031441726352@swboyd.mtv.corp.google.com>
References: <20180807161713.28073-1-krzk@kernel.org>
 <20180807161713.28073-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161713.28073-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2018-08-07 09:17:13)
> The clock IDs must match between DeviceTree bindings and the driver.
> There is already a header file used by DeviceTree sources so include it
> in the driver to remove duplicated symbols.
> =

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next
