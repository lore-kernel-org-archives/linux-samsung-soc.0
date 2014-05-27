From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] regulator: s2mps11: Refactor setting ramp delay
Date: Tue, 27 May 2014 08:57:18 +0200
Message-ID: <1401173838.8073.4.camel@AMDC1943>
References: <1401110423-5647-1-git-send-email-k.kozlowski@samsung.com>
 <1401110423-5647-2-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eV63jkFtpeaHGj4c5fUq0jZYFNzvf_W-fOrtJ5opnadyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAKew6eV63jkFtpeaHGj4c5fUq0jZYFNzvf_W-fOrtJ5opnadyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, devicetree <devicetree@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On wto, 2014-05-27 at 11:56 +0530, Yadwinder Singh Brar wrote:
> Hi Krzysztof,
> 
> 
> On Mon, May 26, 2014 at 6:50 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
> > Prepare for merging the s2mpa01 regulator driver into s2mps11 by:
> > 1. Adding common id for buck regulators.
> > 2. Splitting shared ramp delay settings to match S2MPA01.
> > 3. Adding a configuration of registers for setting ramp delay for each
> >    buck regulator.
> >
> > The functionality of the driver should not change as this patch only
> > prepares for supporting S2MPA01 device.
> >
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  drivers/regulator/s2mps11.c | 210 ++++++++++++++++++++++++++++++--------------
> >  1 file changed, 144 insertions(+), 66 deletions(-)
> >
> 
> [snip]
> 
> >
> > -               if (ramp_delay > s2mps11->ramp_delay34)
> > -                       s2mps11->ramp_delay34 = ramp_delay;
> > +               if (ramp_delay > s2mps11->ramp_delay3)
> > +                       s2mps11->ramp_delay3 = ramp_delay;
> >                 else
> > -                       ramp_delay = s2mps11->ramp_delay34;
> > -
> > -               ramp_shift = S2MPS11_BUCK34_RAMP_SHIFT;
> > -               ramp_reg = S2MPS11_REG_RAMP;
> > +                       ramp_delay = s2mps11->ramp_delay3;
> >                 break;
> >         case S2MPS11_BUCK4:
> > -               enable_shift = S2MPS11_BUCK4_RAMP_EN_SHIFT;
> >                 if (!ramp_delay) {
> >                         ramp_enable = 0;
> >                         break;
> >                 }
> >
> > -               if (ramp_delay > s2mps11->ramp_delay34)
> > -                       s2mps11->ramp_delay34 = ramp_delay;
> > +               if (ramp_delay > s2mps11->ramp_delay4)
> > +                       s2mps11->ramp_delay4 = ramp_delay;
> >                 else
> > -                       ramp_delay = s2mps11->ramp_delay34;
> > -
> > -               ramp_shift = S2MPS11_BUCK34_RAMP_SHIFT;
> > -               ramp_reg = S2MPS11_REG_RAMP;
> > +                       ramp_delay = s2mps11->ramp_delay4;
> 
> Main rationale behind shared value is completely omitted here, in
> other cases also,
> after just giving a NOTE in documentation asking user to make sure to
> pass same value.
> It doesn't seem safe, simply leaving a scope of stability issue (in
> case ramp_delay3 > ramp_delay4).

The documentation already states that these bucks (e.g. 3 and 4) share
the ramp delay setting and 'regulator-ramp-delay' should be the same.
However you're right that patch is not safe against changing shared ramp
delays to different values. Previously the code was safe so this is not
entirely "non-functional" change. I'll fix it to retain the same
behavior.

Best regards,
Krzysztof
