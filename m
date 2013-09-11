From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 13/13] V4L: Add driver for s5k4e5 image sensor
Date: Wed, 11 Sep 2013 12:16:16 +0200
Message-ID: <523042F0.8030603@samsung.com>
References: <1377066881-5423-1-git-send-email-arun.kk@samsung.com>
 <1377066881-5423-14-git-send-email-arun.kk@samsung.com>
 <5228E34B.307@gmail.com>
 <CALt3h78uVgjBKuc-++HVajwTKekFTPinAZ14BMKJmEGrg6OUyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <CALt3h78uVgjBKuc-++HVajwTKekFTPinAZ14BMKJmEGrg6OUyQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Arun Kumar K <arunkk.samsung@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, LMML <linux-media@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <Pawel.Moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Shaik Ameer Basha <shaik.ameer@samsung.com>, kilyeon.im@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arun,

On 09/11/2013 07:10 AM, Arun Kumar K wrote:
> If I name it to reset-gpios, the function of_get_gpio_flags() in the driver
> fails. This function searches for the entry with name "gpios". Is it still
> recommended to use a custom name and parse it explicitly?

I guess so, you could just use of_get_named_gpio_flags().

Regards,
Sylwester
