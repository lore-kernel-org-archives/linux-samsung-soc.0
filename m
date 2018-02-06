From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/8] ASoC: samsung: Add support for HDMI
	audio on TM2 board
Date: Tue, 6 Feb 2018 13:57:21 +0100
Message-ID: <CAJKOXPeASCZ-jRcVmftoFZhnhMCmxsELXgKpYmjidtHomQ1sMQ@mail.gmail.com>
References: <CGME20180205154524epcas1p35874552d9056837a162dc59d847d1930@epcas1p3.samsung.com>
 <20180205154403.13520-1-s.nawrocki@samsung.com>
 <20180205154403.13520-6-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180205154403.13520-6-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, jcsing.lee@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 5, 2018 at 4:44 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This patch defines I2S1 - HDMI DAI link and implements related
> hw_params callback. The AUD PLL frequency is configured through
> the CLK_SCLK_I2S1 leaf clock, the exynos5433 clock tree
> definitions are updated in a separate patch.
>
> The device tree parsing part is changed is a way it supports older
> DTBs with just a single CPU DAI specified, without the HDMI link.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 180 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 157 insertions(+), 23 deletions(-)
>

Looks okay for me but the bindings should be also updated.

Best regards,
Krzysztof
