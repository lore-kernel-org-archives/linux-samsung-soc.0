From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v3] reset: Add a defer reset object to send board
 specific reset
Date: Tue, 8 Jul 2014 09:52:03 +0200
Message-ID: <CACRpkdYfu8HmVCkn9JFh+YP5OPdr8o9nTfoCnkJ7SSpGoenQUg@mail.gmail.com>
References: <1403098673-3058-1-git-send-email-houcheng@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403098673-3058-1-git-send-email-houcheng@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Houcheng Lin <houcheng@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Gallimore <stephen.gallimore@st.com>, Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Ulf Hansson <ulf.hansson@linaro.org>, sre@kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Vikas Sajjan <vikas.sajjan@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 18, 2014 at 3:37 PM, Houcheng Lin <houcheng@gmail.com> wrote:

> The Problem
> -----------
> The reset signal on a hardware board is send either:
>     - during machine initialization
>     - during bus master's initialization

I just thought about this a bit, since there isn't already a generic GPIO
reset driver, just call this drivers/reset/reset-gpio.c and make the
ability to deferral just a configuration detail of the GPIO reset driver.

Yours,
Linus Walleij
