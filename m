From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 8/8] ASoC: samsung,tm2-audio DT binding documentation update
Date: Tue, 6 Feb 2018 14:05:04 +0100
Message-ID: <CAJKOXPeRFgJQpUTeJeYYo+qqAxkT1iZczSJQzRzn3O3bXmvOZA@mail.gmail.com>
References: <CGME20180205154537epcas1p10a9a30a574e3f472358e7dacf3cb0489@epcas1p1.samsung.com>
 <20180205154403.13520-1-s.nawrocki@samsung.com> <20180205154403.13520-9-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752403AbeBFNFH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:05:07 -0500
In-Reply-To: <20180205154403.13520-9-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Feb 5, 2018 at 4:44 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This patch documents additional entries of the audio-codec and
> i2s-controller properties required for the HDMI audio support.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../devicetree/bindings/sound/samsung,tm2-audio.txt        | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> index 94442e5673b3..f5ccc12ddc00 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> @@ -4,9 +4,13 @@ Required properties:
>
>   - compatible           : "samsung,tm2-audio"
>   - model                : the user-visible name of this sound complex
> - - audio-codec          : the phandle of the wm5110 audio codec node,
> -                          as described in ../mfd/arizona.txt
> - - i2s-controller       : the phandle of the I2S controller
> + - audio-codec          : the first entry should be phandle of the wm5110 audio
> +                          codec node, as described in ../mfd/arizona.txt;
> +                          the second entry should be phandle of the HDMI

AFAIU, this property is still optional so the wording should be
different. Maybe just add "optional properties" paragraph?

Best regards,
Krzysztof

> +                          transmitter node
> + - i2s-controller       : the list of phandle and argument tuples pointing to
> +                          I2S controllers, the first entry should be I2S0 and
> +                          the second one I2S1
>   - audio-amplifier      : the phandle of the MAX98504 amplifier
>   - samsung,audio-routing : a list of the connections between audio components;
>                            each entry is a pair of strings, the first being the
> @@ -22,8 +26,8 @@ Example:
>
>  sound {
>         compatible = "samsung,tm2-audio";
> -       audio-codec = <&wm5110>;
> -       i2s-controller = <&i2s0>;
> +       audio-codec = <&wm5110>, <&hdmi>;
> +       i2s-controller = <&i2s0 0>, <&i2s1 0>;
>         audio-amplifier = <&max98504>;
>         mic-bias-gpios = <&gpr3 2 0>;
>         model = "wm5110";
> --
> 2.14.2
>
