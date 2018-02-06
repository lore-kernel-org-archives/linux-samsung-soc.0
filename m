From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] ASoC: samsung: i2s: Ensure the RCLK rate is properly determined
Date: Tue, 6 Feb 2018 13:15:38 +0100
Message-ID: <CAJKOXPcd_-kGyVvetUXdeKwv8em7sWW5TeRR0jqwHyTV+YQWzg@mail.gmail.com>
References: <CGME20180205154453epcas1p10046e1103497692c86c0899a5ef11781@epcas1p1.samsung.com>
 <20180205154403.13520-1-s.nawrocki@samsung.com> <20180205154403.13520-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205154403.13520-2-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 5, 2018 at 4:43 PM, Sylwester Nawrocki
<s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> If the RCLK mux clock configuration is specified in DT and no set_sysclk()
> callback is used in the sound card driver the sclk_srcrate field will remain
> set to 0, leading to an incorrect PSR divider setting.
> To fix this the frequency value is retrieved from the CLK_I2S_RCLK_SRC clock,
> so the actual RCLK mux selection is taken into account.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  sound/soc/samsung/i2s.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
