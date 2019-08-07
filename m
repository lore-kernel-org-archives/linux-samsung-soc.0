From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: Odroid-XU4 sound issue after suspend-resume
Date: Wed, 7 Aug 2019 10:22:14 +0200
Message-ID: <24165241-1f65-fafa-0c59-b85cf89bc5bb@samsung.com>
References: <CGME20190805133249epcas2p3aea30967f18f03f7fc1ed9dc7cbcb1d5@epcas2p3.samsung.com>
        <CAF-0O_4xOQNkX5ZyyVz7zZDAP9XBeUKv65T0cd+oAAV1ahLQ9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF-0O_4xOQNkX5ZyyVz7zZDAP9XBeUKv65T0cd+oAAV1ahLQ9Q@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Jaafar Ali <jaafarkhalaf@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, sam@ravnborg.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaafar, 

On 8/5/19 15:27, Jaafar Ali wrote:
> Dear All,
> Kernel 5.3-rc1
> OS: ubuntu 18.04
> Hardware: Odroid-XU4
> The sound of Odroid-XU4 after suspend/resume cycle is choppy and slow. 
> I have found a workaround, the I2SMOD register value should be set to 
> zero after resume to force using internal codec clock (cdclkcon bit = 0),
> also the rclk_srcrate which is obtained from the function 
> *clk_get_rate(rclksrc) *inside *hw_params* function is not correct and 
> must be divided by 2 to obtain proper value, i2s_resume function 
> is modified to:
> 
> static int i2s_resume(struct snd_soc_dai *dai)
> {
>         struct samsung_i2s_priv *priv = dev_get_drvdata(dai->dev);
>         priv->suspend_i2smod = 0;//workaround-1 ,
>         return pm_runtime_force_resume(dai->dev);
> 
> }
> 
> inside hw_params function, the rclk_srcrate must be halved to solve 
> unknown problem of clock shift, so before return from hw_params we 
> must insert:
> if(mod == 0){
> 	priv->rclk_srcrate = priv->rclk_srcrate / 2; //workaround-2, 
> }
> 
> With these two workaround sound issue was solved, but I hope we can 
> get concrete fix.
Thank you for the bug report. I spent some time on debugging this and
it turned out that there is a clock mux between EPLL and the audio 
subsystem which looses its configuration during suspend/resume cycle.
So we end up with the I2S controller clocked from the main oscillator
clock (24 MHz) rather than the EPLL (196.608 MHz) after system suspend/
resume. I will post a patch for clk-exynos5420 driver shortly.

-- 
Regards,
Sylwester
