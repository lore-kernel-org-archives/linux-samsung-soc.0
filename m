From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable
 operation for PLL36XX clocks
Date: Mon, 24 Apr 2017 13:18:44 +0200
Message-ID: <CAJKOXPdKRzC+f4mLCPhHKNuGS4=K-9CC_AKor0Etfu7Bxp-+iw@mail.gmail.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
 <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
 <20170422152236.tbf4iuoadqrvoc2n@kozik-lap>
 <017b3ec8-c185-c29a-2944-12f519b461fe@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <017b3ec8-c185-c29a-2944-12f519b461fe@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, broonie@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 24, 2017 at 1:12 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 04/22/2017 05:22 PM, Krzysztof Kozlowski wrote:
>>> @@ -354,10 +359,12 @@ static int samsung_pll36xx_set_rate(struct clk_hw
>>> *hw, unsigned long drate,
>>>         writel_relaxed(pll_con1, pll->con_reg + 4);
>>>
>>>         /* wait_lock_time */
>>> -       do {
>>> -               cpu_relax();
>>> -               tmp = readl_relaxed(pll->con_reg);
>>> -       } while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));
>
>
> I will add a comment here like:
> /* Wait until the PLL is locked if it is enabled. */
>
>>> +       if (pll_con0 & BIT(pll->enable_offs)) {
>>
>>
>> Why this additional if() is needed?
>
>
> The PLL will never transition to a locked state if it is disabled, without
> this test we would end up with an indefinite loop below.

Hmmm... shouldn't this be split from this change? Or maybe this is
needed only because you added enable/disable for pl36xx and previously
this was not existing?

Best regards,
Krzysztof
