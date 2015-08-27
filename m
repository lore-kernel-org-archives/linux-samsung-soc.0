From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH RESEND] clk: s5pv210: add missing call to
 samsung_clk_of_add_provider()
Date: Thu, 27 Aug 2015 15:50:27 -0700
Message-ID: <20150827225027.30921.88982@quantum>
References: <1439369908-17665-1-git-send-email-m.szyprowski@samsung.com>
 <CA+Ln22HnquKYKfY2cJBnFpn4zVO1pbkE5w1RtpmDEcNOQBnYpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+Ln22HnquKYKfY2cJBnFpn4zVO1pbkE5w1RtpmDEcNOQBnYpg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Tomasz Figa (2015-08-12 02:00:17)
> 2015-08-12 17:58 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> > Commit d5e136a21b2028fb1f45143ea7112d5869bfc6c7 ("clk: samsung: Register
> > clk provider only after registering its all clocks", merged to v3.17-rc1)
> > modified a way that driver registers registers to core framework. This
> > change has not been applied to s5pv210 clocks driver, which has been
> > merged in parallel to that commit. This patch adds a missing call to
> > samsung_clk_of_add_provider(), so the driver is operational again.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > CC: stable@vger.kernel.org  # v3.17+
> > ---
> >  drivers/clk/samsung/clk-s5pv210.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> 
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

The original mail slipped past my filter. Sorry about that. Also please
address all clk driver patches to linux-clk@vger.kernel.org (I see that
this one is not).

I've applied to clk-next towards 4.3.

Regards,
Mike

> 
> Best regards,
> Tomasz
