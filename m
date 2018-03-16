From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/5] ASoC: samsung: odroid: Drop sample
 rates that cannot be supported from hw_params()
Date: Fri, 16 Mar 2018 08:30:06 +0100
Message-ID: <CAJKOXPcvj2hOUPMzZz+rOFm0QiQJ+m9cE=ZvxfFRn0GzfVOQ_w@mail.gmail.com>
References: <CGME20180314164137epcas2p336d64724b044d14aa920d611b6483593@epcas2p3.samsung.com>
 <20180314164115.22736-1-s.nawrocki@samsung.com>
 <20180314164115.22736-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164115.22736-2-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 14, 2018 at 5:41 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> The I2S controller can handle sample rates only up to 96000 and the CPU DAI
> has already related constraint set so drop the impossible 176400, 192000
> switch cases.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/odroid.c | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
