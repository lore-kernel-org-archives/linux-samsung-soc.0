From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] regulator: s5m8767: Constify s5m8767_opmode_reg
Date: Thu, 21 Feb 2019 14:22:28 +0100
Message-ID: <CAJKOXPcfm6Ee0stF1dz0CawNN9Z4UY64Cfaqy-p28+V6e_QTpQ@mail.gmail.com>
References: <20190221131722.12278-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221131722.12278-1-axel.lin@ingics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 21 Feb 2019 at 14:17, Axel Lin <axel.lin@ingics.com> wrote:
>
> The s5m8767_opmode_reg should never change, make it const.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/regulator/s5m8767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
