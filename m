From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/5] ASoC: samsung: Document compatible
 strings for Odroid X/X2, Odroid XU3
Date: Fri, 16 Mar 2018 08:37:28 +0100
Message-ID: <CAJKOXPdxSULHestFBc2YmtVzEpu422VdqtKMmy9FoCOjGV3wgw@mail.gmail.com>
References: <CGME20180314164301epcas1p105f42730914735774284892b71839572@epcas1p1.samsung.com>
 <20180314164242.22927-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164242.22927-1-s.nawrocki@samsung.com>
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

On Wed, Mar 14, 2018 at 5:42 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> There are no significant differences across Odroid X, Odroid-X2, Odroid-U3
> and Odroid-XU3 with regards to the audio subsystem so add more entries
> to the compatible strings list.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  Documentation/devicetree/bindings/sound/samsung,odroid.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
> index f35a2694eb04..a50a0c6a354b 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
> +++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
> @@ -1,8 +1,10 @@
> -Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
> +Hardkernel Odroid X/X2/U3/XU3/XU4 audio complex with MAX98090 codec
>
>  Required properties:
>
> - - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
> + - compatible - "hardkernel,odroid-u3-audio" - for Odroid U3 board,
> +               "hardkernel,odroid-x-audio" - for Odroid X, Odroid X2 boards,
> +               "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
>                 "hardkernel,odroid-xu4-audio" - for Odroid XU4 board

These are the same so I think they should not get separate
compatibles. By definition [2] the compatible expresses the
compatibility with family of devices. In this case - these belong to
the same family.

The same applies to patch 5/5 (implementation of this).

Best regards,
Krzysztof

[1] DeviceTree specification v0.2: "They allow a device to express its
compatibility with a family of similar devices, potentially allowing a
single device driver to match against several devices."
