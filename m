From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 11:38:56 +0530
Message-ID: <CAKew6eVWtj_20zKnEVGSugqWY+JCQsE3LmDvVG78QNd1VLtf=w@mail.gmail.com>
References: <y@samsung.com>
	<4fbb2ada.63de440a.589d.78e2@mx.google.com>
	<4FBC3FF0.5080408@samsung.com>
	<CAKew6eW2eGrBnzSGsr3N_dXSixXv-bkBo7xkbC-o9DNnwBhcuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42680 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619Ab2EWGI4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 02:08:56 -0400
In-Reply-To: <CAKew6eW2eGrBnzSGsr3N_dXSixXv-bkBo7xkbC-o9DNnwBhcuw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jonghwa3.lee@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>

On Wed, May 23, 2012 at 9:46 AM, Yadwinder Singh Brar
<yadi.brar01@gmail.com> wrote:
> (adding Kyungmin Park and Samuel Ortiz)
>
> Hi,
>
> Yes, It happened unintentionally. I didn't know about your patch
> before submitting
> the initial version of my patches. I agree with you, I will review
> your patches and
> will try to incorporate extra features from your patches.
>

Now I have seen your patches for mfd and regulator drivers.
Apparently, it seems that mostly we same features in our patches.
Their is no extra feature to be incorporated form your patches.
Rather I found device tree support is additional in our patches
and mainly their are some differences related to DVS_GPIO and
opmode stuff in our patches:
1- Since we are not implementing and using DVS feature
through GPIOs, so all(incomplete) stuff related to dvs_gpio
is not required currently in our mfd driver presently.
2- Since presently, we are not implementing suspend_enable/disable
callbacks in regulator driver, So we don't need opmode related
stuff now because I think regulators should come up in normal mode
only through .enable callback function.

> On Wed, May 23, 2012 at 7:10 AM, =A0<jonghwa3.lee@samsung.com> wrote:
>> Hi, Yadwinder,
>> As you know, both of us, recently, had competition for one driver
>> whether you intend or not. And now, i think it is time to stop this =
and
>> to find appropriate goal. From now on, i won't update this driver no
>> more. I recommend you to review my patch and apply feature that you =
can
>> apply. And also check comments that i wrote below.
>>

Thanks,
Yadwinder.
