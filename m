From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RESEND PATCH v3 2/5] charger: tps65090: Allow charger module to
 be used when no irq
Date: Tue, 29 Apr 2014 09:39:46 -0700
Message-ID: <CAD=FV=W=Ffye5wp0PhJ2uX4jhEQkTKA4VTT4LyX2ZdByfE4UaQ@mail.gmail.com>
References: <1398268565-4789-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398268565-4789-3-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <anton@enomsg.org>
Cc: Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Anton,

On Wed, Apr 23, 2014 at 8:56 AM, Doug Anderson <dianders@chromium.org> wrote:
> On the ARM Chromebook tps65090 has two masters: the AP (the main
> processor running linux) and the EC (the embedded controller).  The AP
> is allowed to mess with FETs but the EC is in charge of charge control.
>
> The tps65090 interupt line is routed to both the AP and the EC, which
> can cause quite a headache.  Having two people adjusting masks and
> acking interrupts is a recipe for disaster.
>
> In the shipping kernel we had a hack to have the AP pay attention to
> the IRQ but not to ack it.  It also wasn't supposed to configure the
> IRQ in any way.  That hack allowed us to detect when the device was
> charging without messing with the EC's state.
>
> The current tps65090 infrastructure makes the above difficult, and it
> was a bit of a hack to begin with.  Rather than uglify the driver to
> support it, just extend the driver's existing notion of "no irq" to
> the charger.  This makes the charger code poll every 2 seconds for AC
> detect, which is sufficient.
>
> For proper functioning, requires (mfd: tps65090: Don't tell child
> devices we have an IRQ if we don't).  If we don't have that patch
> we'll simply fail to probe on devices without an interrupt (just like
> we did before this patch).
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v3: None
> Changes in v2:
> - Split noirq (polling mode) changes into MFD and charger
>
>  drivers/power/tps65090-charger.c | 76 +++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 17 deletions(-)

All the rest of this series has been acked and applied.  Do you have
time to review this patch?

Thanks!  :)

-Doug
