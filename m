From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [RFC v3 00/13] Exynos5 IS driver
Date: Sat, 03 Aug 2013 23:40:05 +0200
Message-ID: <51FD78B5.6080507@gmail.com>
References: <1375455762-22071-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1375455762-22071-1-git-send-email-arun.kk@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, s.nawrocki@samsung.com, hverkuil@xs4all.nl, a.hajda@samsung.com, sachin.kamat@linaro.org, shaik.ameer@samsung.com, kilyeon.im@samsung.com, arunkk.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arun,

On 08/02/2013 05:02 PM, Arun Kumar K wrote:
> The patch series add support for Exynos5 camera subsystem. It
> re-uses mipi-csis and fimc-lite from exynos4-is and adds a new
> media device and fimc-is device drivers for exynos5.
> The media device supports asynchronos subdev registration for the
> fimc-is sensors and is based on the patch series from Sylwester
> for exynos4-is [1].
>
> [1]http://www.mail-archive.com/linux-media@vger.kernel.org/msg64653.html
>
> Changes from v2
> ---------------
> - Added exynos5 media device driver from Shaik to this series
> - Added ISP pipeline support in media device driver
> - Based on Sylwester's latest exynos4-is development
> - Asynchronos registration of sensor subdevs
> - Made independent IS-sensor support
> - Add s5k4e5 sensor driver
> - Addressed review comments from Sylwester, Hans, Andrzej, Sachin

This is starting to look pretty good to me, I hope we can merge this
patch set for v3.12. Let use coming two weeks for one or two review/
corrections round.
In the meantime I've done numerous fixes to the patch series [1],
especially the clock provider code was pretty buggy on the clean up
paths. Let's go through the patches and see what can be improved yet.

Thanks,
Sylwester
