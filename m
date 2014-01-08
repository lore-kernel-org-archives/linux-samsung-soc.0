From: m silverstri <michael.j.silverstri@gmail.com>
Subject: Question about samsung exynos driver
Date: Wed, 8 Jan 2014 14:12:34 -0800
Message-ID: <CABMudhSzr0wCi8_aAtLP4tQGy6aaMxu2cQXCSdi0Myka=2PjdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:51713 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932450AbaAHWMf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jan 2014 17:12:35 -0500
Received: by mail-oa0-f47.google.com with SMTP id i7so2521206oag.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jan 2014 14:12:34 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I am looking at the source code for samsung exynos driver in here:

https://android.googlesource.com/kernel/exynos/+/android-exynos-3.4/drivers/media/video/exynos/jpeg/jpeg_enc.c#

What I don't understand it while it advertise it can support multiple
plane format (set V4L2_CAP_VIDEO_OUTPUT_MPLANE in querycap():

        cap->capabilities = V4L2_CAP_STREAMING |
                V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT |
                V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_OUTPUT_MPLANE;

but all the formats in struct jpeg_fmt formats[]  has memplanes equals 1.

My question when will be the multiple plane functionality being utilized?

Thank you.
