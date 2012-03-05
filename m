From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/3] video: s3c-fb: Rearrange the elements in platform data
Date: Mon, 5 Mar 2012 13:42:42 +0530
Message-ID: <CAJuYYwS0RMhx-YSip+-yZcw9H0bDPHMufhdCbUROAW3mQBiCgg@mail.gmail.com>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
	<006f01ccfaa1$b6ff11f0$24fd35d0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:35336 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755989Ab2CEIMn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Mar 2012 03:12:43 -0500
Received: by vcqp1 with SMTP id p1so3145226vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Mar 2012 00:12:42 -0800 (PST)
In-Reply-To: <006f01ccfaa1$b6ff11f0$24fd35d0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org

On 5 March 2012 12:59, Jingoo Han <jg1.han@samsung.com> wrote:
>
>
>> -----Original Message-----
>> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
>> Sent: Sunday, March 04, 2012 12:50 AM
>> To: linux-fbdev@vger.kernel.org
>> Cc: FlorianSchandinat@gmx.de; linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
>> jg1.han@samsung.com; ben-linux@fluff.org; patches@linaro.org
>> Subject: [PATCH 0/3] video: s3c-fb: Rearrange the elements in platform data
>>
>> This patchset rearranges the elements in the platform data of the s3c-fb
>> driver with the intent of adding device tree support to the driver in
>> subsequent patches.
>>
>> The first patch moves the video timing information from the individual window
>> setup data into the platform specific configuration section in the platform
>> data. The video timing is independent of the window setup. The resolution of
>> the window could be smaller than that of the lcd panel attached. So the video
>> timing data is removed from window configuration data.
>
> Hi, Thomas.
>
> OK, I know what you have done.
> Actually, it was my long concern.
>
> Current s3c-fb driver needs lcd panel resolutions, since each window's
> xres, yres values can be changed by fb driver or user application.
> Therefore, additional 'costant' lcd panel resolutions are necessary in order to
> set timing values.
>
> I'll review your patch.
> Thank you.

Thanks. Please let me know if you have any comments.

Regards,
Thomas.

[...]
