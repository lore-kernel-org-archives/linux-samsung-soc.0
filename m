From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: suspend/Resume Sound issue workaround
Date: Mon, 5 Aug 2019 10:31:27 +0200
Message-ID: <CAJKOXPe9nY4wV+Dj4BHMO6=WmtxjMnSe+z6ZywaokUNPyyvOuA@mail.gmail.com>
References: <CAF-0O_47bLysYD9qn2ekNC7PmNj0LguB6ab_9mdw6NaoGPj4rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF-0O_47bLysYD9qn2ekNC7PmNj0LguB6ab_9mdw6NaoGPj4rw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaafar Ali <jaafarkhalaf@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <snawrocki@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 4 Aug 2019 at 14:36, Jaafar Ali <jaafarkhalaf@gmail.com> wrote:
> Dear Krzysztof,
> The sound of Odroid-XU4 after suspend/resume cycle has an issue. As a workaround, the I2SMOD register value should be set to zero after resume, the i2s_resume function would be:
>
> static int i2s_resume(struct snd_soc_dai *dai)
> {
> struct samsung_i2s_priv *priv = dev_get_drvdata(dai->dev);
> printk(KERN_EMERG "i2s resume of dai !\n");
> priv->suspend_i2smod = 0;//workaround-1 , to force using internal codec clock source (CDCLKCON bit = 0)
> //see another workaround inside hw_param
>
>         return pm_runtime_force_resume(dai->dev);
>
> }
>
> Also, inside hw_params function, the rclk_srcrate must be halved to solve unknown problem of clock shift, so before return from hw_params we must insert:
> if(mod == 0){
> priv->rclk_srcrate = priv->rclk_srcrate / 2; //workaround-2, clock is being halved due to unknwon bug
> printk(KERN_EMERG "i2s hw_param rclk_srcrate after %lu !\n", priv->rclk_srcrate);
> }
> return 0;
>
> With these two workaround sound issue was solved, but I hope we can get concrete fix.

Hi Jaafar,

Thanks for the report. Preferred way to send bug reports is to use the
public channels by sending to Linux kernel mailing lists:
linux-samsung-soc@vger.kernel.org and linux-kernel@vger.kernel.org,
with the Cc of other interested people. The best is to use the
scripts/get_maintainer.pl tool (with -f for example) to get the list
of addresses to Cc.

Best regards,
Krzysztof
