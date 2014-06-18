From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 06/10] mfd: Add driver for Maxim 77802 Power Management
 IC
Date: Wed, 18 Jun 2014 11:50:08 +0200
Message-ID: <53A160D0.6010306@collabora.co.uk>
References: <1402941758-11216-1-git-send-email-javier.martinez@collabora.co.uk> <1402941758-11216-7-git-send-email-javier.martinez@collabora.co.uk> <20140616192720.GK5099@sirena.org.uk> <53A01F09.5070106@collabora.co.uk> <20140618083204.GP21030@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140618083204.GP21030@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On 06/18/2014 10:32 AM, Lee Jones wrote:
>> >> +config MFD_MAX77802
>> >> +	tristate "Maxim Integrated MAX77802 PMIC Support"
>> >> +	depends on I2C=y
>> >> +	select MFD_CORE
>> >> +	select REGMAP_I2C
>> >> +	select REGMAP_IRQ
>> >> +	select IRQ_DOMAIN
>> >> +	help
>> >> +	  Say yes here to support for Maxim Integrated MAX77802.
>> >> +	  This is a Power Management IC with RTC on chip.
>> >> +	  This driver provides common support for accessing the device;
>> >> +	  additional drivers must be enabled in order to use the functionality
>> >> +	  of the device.
>> >> +
>> > 
>> > It is a bit unorthodox to put the build infrastructure in the same patch
>> > as the DT binding...
>> > 
>> 
>> I thought it was the opposite. That a DT binding document has to be added along
>> with the first user of the binding but I'll separate the DT doc in another patch
>> then if that is the right thing to do.
> 
> This was the 'old' method, but changed a little over a year ago.
> 
>> Thanks a lot for all your suggestions, I'll wait a little to see if there is
>> more feedback and repost a v3 addressing all the issues you pointed out.
> 
> Just re-post it.  I'll review the next version.
> 

Ok, will do. I was waiting for Krzysztof's feedback but he can review v3 as well.

Thanks a lot and best regards,
Javier
