From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/5] ASoC: samsung: Use
 snd_soc_of_put_dai_link_codecs() in odroid.c
Date: Fri, 16 Mar 2018 08:33:14 +0100
Message-ID: <CAJKOXPeZkv06PiB4uc8ShsneNxDxyxT5+nssR3zxpAv21_sJEA@mail.gmail.com>
References: <CGME20180314164141epcas1p43edb2d21ad8818f744b2e11009322996@epcas1p4.samsung.com>
 <20180314164115.22736-1-s.nawrocki@samsung.com>
 <20180314164115.22736-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164115.22736-3-s.nawrocki@samsung.com>
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
> Now when a helper for unreferencing device nodes is available
> we can get rid of the local implementation.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/odroid.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
