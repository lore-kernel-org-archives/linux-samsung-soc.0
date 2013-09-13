From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v8 12/12] V4L: Add driver for s5k4e5 image sensor
Date: Fri, 13 Sep 2013 10:14:07 -0600
Message-ID: <523339CF.9070604@wwwdotorg.org>
References: <1378987669-10870-1-git-send-email-arun.kk@samsung.com>  <1378987669-10870-13-git-send-email-arun.kk@samsung.com> <1379076935.4396.13.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1379076935.4396.13.camel@pizza.hi.pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, s.nawrocki@samsung.com, hverkuil@xs4all.nl, mark.rutland@arm.com, Pawel.Moll@arm.com, galak@codeaurora.org, a.hajda@samsung.com, sachin.kamat@linaro.org, shaik.ameer@samsung.com, kilyeon.im@samsung.com, arunkk.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 09/13/2013 06:55 AM, Philipp Zabel wrote:
> Hi Arun,
> 
> Am Donnerstag, den 12.09.2013, 17:37 +0530 schrieb Arun Kumar K:
>> This patch adds subdev driver for Samsung S5K4E5 raw image sensor.
>> Like s5k6a3, it is also another fimc-is firmware controlled
>> sensor. This minimal sensor driver doesn't do any I2C communications
>> as its done by ISP firmware. It can be updated if needed to a
>> regular sensor driver by adding the I2C communication.
... [untrimmed patch] ...
>> +Example:
>> +
>> +	i2c-isp@13130000 {
>> +		s5k4e5@20 {
>> +			compatible = "samsung,s5k4e5";
>> +			reg = <0x20>;
>> +			gpios = <&gpx1 2 1>;
> 
> This probably should be 'reset-gpios', too.
... [untrimmed patch] ...
> 
> regards
> Philipp

Please delete unnecessary context when replying so that people don't
have to scroll through hundreds of lines of patch to see a 1-line comment.
