From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: Use proper DT compatible string for
 Hardkernel Odroid boards
Date: Thu, 8 Mar 2018 12:24:34 +0100
Message-ID: <CAJKOXPf0KwotgJ=6SeoX9dXSqe6cpX1ajsYpjTjkTmWyLq8djg@mail.gmail.com>
References: <CGME20180307174638epcas2p33f071928807ccaa40ad07922c15be31c@epcas2p3.samsung.com>
 <20180307174625.16597-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180307174625.16597-1-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 7, 2018 at 6:46 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> The Odroid boards are manufactured by Hardkernel, not Samsung. New compatible
> string entries are added, with "hardkernel," instead of "samsung," vendor
> prefix. Support for the old compatible strings is going to be removed after
> some time.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  Documentation/devicetree/bindings/sound/samsung,odroid.txt | 6 +++---
>  sound/soc/samsung/odroid.c                                 | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
