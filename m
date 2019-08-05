From: Jaafar Ali <jaafarkhalaf@gmail.com>
Subject: Odroid-XU$ sound issue after suspend-resume
Date: Mon, 5 Aug 2019 16:34:19 +0300
Message-ID: <CAF-0O_6zDyWTFenFX49DVeSyB=p59BFVCc71oPVarOtDPh2LFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Dear All,
Kernel 5.3-rc1
OS: ubuntu 18.04
Hardware: Odroid-XU4
The sound of Odroid-XU4 after suspend/resume cycle is choppy and slow.
I have found a workaround, the I2SMOD register value should be set to
zero after resume to force using internal codec clock (cdclkcon bit =
0),  also the rclk_srcrate which is obtained from the function
clk_get_rate(rclksrc) inside hw_params function is not correct and
must be divided by 2 to obtain proper value, i2s_resume function is
modified to:

static int i2s_resume(struct snd_soc_dai *dai)
{
        struct samsung_i2s_priv *priv = dev_get_drvdata(dai->dev);
        priv->suspend_i2smod = 0;//workaround-1 ,
        return pm_runtime_force_resume(dai->dev);

}

 inside hw_params function, the rclk_srcrate must be halved to solve
unknown problem of clock shift, so before return from hw_params we
must insert:
if(mod == 0){
priv->rclk_srcrate = priv->rclk_srcrate / 2; //workaround-2,
}
return 0;

With these two workaround sound issue was solved, but I hope we can
get concrete fix.

Best Regards


Jaafar
