From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] mfd: sec-core: Cleanup formatting to a consistent style
Date: Mon, 11 Feb 2019 14:14:32 +0100
Message-ID: <CAJKOXPc_aXh4r7h41dMZLe-zzpxbf3LQr4AixFSQZUxpjhVASw@mail.gmail.com>
References: <1548761153-28114-1-git-send-email-krzk@kernel.org> <20190201092114.GE783@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201092114.GE783@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 1 Feb 2019 at 10:21, Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 29 Jan 2019, Krzysztof Kozlowski wrote:
>
> > Cleanup the formatting to have consistent style across the file (only
> > white-space issues).  No expected difference in code.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/mfd/sec-core.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> > index e0835c9df7a1..c3bb53f79e63 100644
> > --- a/drivers/mfd/sec-core.c
> > +++ b/drivers/mfd/sec-core.c
> > @@ -70,9 +70,11 @@ static const struct mfd_cell s2mps11_devs[] = {
> >  };
> >
> >  static const struct mfd_cell s2mps13_devs[] = {
> > -     { .name = "s2mps13-regulator", },
> > -     { .name = "s2mps13-rtc", },
>
> I prefer one liners to remain on one line.

OK

>
> >       {
> > +             .name = "s2mps13-regulator",
> > +     }, {
> > +             .name = "s2mps13-rtc",
> > +     }, {
> >               .name = "s2mps13-clk",
> >               .of_compatible = "samsung,s2mps13-clk",
> >       },
> > @@ -114,7 +116,8 @@ static const struct mfd_cell s2mpu02_devs[] = {
> >
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id sec_dt_match[] = {
> > -     {       .compatible = "samsung,s5m8767-pmic",
> > +     {
> > +             .compatible = "samsung,s5m8767-pmic",
> >               .data = (void *)S5M8767X,
>
> All of the other changes are fine.

OK, let me send v2.

Best regards,
Krzysztof
