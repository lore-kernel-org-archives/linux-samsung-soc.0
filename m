From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 04/22] ASoC: samsung: i2s: Fix prescaler
 setting for the secondary DAI
Date: Mon, 11 Feb 2019 16:03:21 +0100
Message-ID: <CAJKOXPfYxbAKCBOXTmsGnprksSGrZGyHGrtn75rO46QMLZDzrw@mail.gmail.com>
References: <CGME20190207170058epcas1p4e2fadf4aae2ece3c47c0750a094a4fbb@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com>
 <20190207170028.720-5-s.nawrocki@samsung.com>
 <CAJKOXPdar1q8oz4KHEVoQ6_NbD+hUYfFE3u97VLGUV7azEnZwA@mail.gmail.com>
 <62ea88ed-6916-f7a5-6806-6b9c5ba08f13@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <62ea88ed-6916-f7a5-6806-6b9c5ba08f13@samsung.com>
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
Cc: alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 11 Feb 2019 at 15:32, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 2/11/19 14:37, Krzysztof Kozlowski wrote:
> >> @@ -784,6 +787,9 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
> >>         i2s->frmclk = params_rate(params);
> >>
> >>         rclksrc = i2s->clk_table[CLK_I2S_RCLK_SRC];
> >> +       if (!rclksrc || IS_ERR(rclksrc))
>
> > IS_ERR_OR_NULL
>
> Thanks for your review! That line will be removed by subsequent patch
> (7/22) so I'd say such a change wouldn't make a difference anyway.

Then let's skip it:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
