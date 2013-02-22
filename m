From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Keep USB related LDOs always active on Origen
Date: Fri, 22 Feb 2013 09:25:41 -0800
Message-ID: <5127AA15.9030900@linaro.org>
References: <51271673.9090003@linaro.org> <1361515707-8571-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361515707-8571-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/21/2013 10:48 PM, Tushar Behera wrote:
> LDO3 and LDO8 are used for powering both device and host phy controllers.
> These regulators are not handled in USB host driver. Hence we get
> unexpected behaviour when the regulators are disabled elsewhere.
>
> It would be best to keep these regulators always on.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>
> Based on v3.8.

This works great for me! Thanks so much Tushar!

Tested-by: John Stultz <john.stultz@linaro.org>
